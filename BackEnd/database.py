
import pymysql
import random
# check data base~ OK
conn = pymysql.connect(host='127.0.0.1', port=6666, user='root', passwd='666666',db='overseasdb')
cur = conn.cursor()
# s = "insert into student (s1,sn)values{0}".format((14231088,'hkhk'))
# cur.execute(s)
#conn.commit
'''
cur.execute("select * from stdwithgrade")
rest = cur.fetchall()
for r in rest:
            print(r)
'''
#apply_h_TFR


#rest=cur.fetchall()

def check_chq(uniName,score):
    args1 = (uniName,)
    rest = []
    cur.callproc("apply_uni", args1)
    tot = cur.fetchall()
    print(tot)

    args = (score[0],uniName)
    cur.callproc("apply_h_TFR", args)
    ret = cur.fetchall()
    print(ret)
    rest.append(100*ret[0][0]/tot[0][0])


    args = (score[1],uniName)
    cur.callproc("apply_h_TFL", args)
    ret = cur.fetchall()
    print(ret)
    rest.append(100*ret[0][0] / tot[0][0])

    args = (score[2],uniName)
    cur.callproc("apply_h_TFW", args)
    ret = cur.fetchall()
    print(ret)
    rest.append(100*ret[0][0] / tot[0][0])

    args = (score[3],uniName)
    cur.callproc("apply_h_TFS", args)
    ret = cur.fetchall()
    print(ret)
    rest.append(100*ret[0][0] / tot[0][0])

    args = (score[4],uniName)
    cur.callproc("apply_h_q", args)
    ret = cur.fetchall()
    print(ret)
    rest.append(100*ret[0][0] / tot[0][0])

    args = (score[5],uniName)
    cur.callproc("apply_h_v", args)
    ret = cur.fetchall()
    print(ret)
    rest.append(100*ret[0][0] / tot[0][0])

    args = (score[6],uniName)
    cur.callproc("apply_h_aw", args)
    ret = cur.fetchall()
    print(ret)
    rest.append(100*ret[0][0] / tot[0][0])
    return rest
#rest = check_chq("Princeton University",[25,25,25,25,170,170,6])
#print(rest)
def get_id(table,col):
    s = "select max({0}) from {1}".format(col,table)
    cur.execute(s)
    res = cur.fetchall()
    print(res)
    if res[0][0]==None:
        ret = 1
    else:
        ret = res[0][0]+1
    return ret
def chq_score(name,score):
    s1 = "select count(*) from grade where {0}>{1}".format(name,score) #'GREQuantitative'
    cur.execute(s1)
    aaa = cur.fetchmany(1)
    print(aaa[0][0])#cur.close()
def search(table,col,condition):
    s = "select {0} from {1} where {2}".format(col,table,condition)
    cur.execute(s)
    ret = cur.fetchall()
    for it in ret:
        print(it)
    return ret
def isThere(table,condition):
    rest = search(table, "*", condition)
    #print(rest==())
    return not (rest==())
def update_professor(name,homepage,major,UnName):
    cur.execute("select count(*) from professor")
    res = cur.fetchall()
    id = get_id("professor","professorId")
    res = search("universityus","uniUid","uniUName='{0}'".format(UnName))
    uniUId = res[0][0]
    s = "insert into professor(professorId,professorName,professorHomepage,professorMajor,uniUId" \
        ")values({0},'{1}','{2}','{3}',{4})".format(id,name,homepage,major,uniUId)
    cur.execute(s)
    conn.commit()
    return 0
def update_graduate(name,gender,gradeid,uniCid):
    id = get_id('graduate','graduateId')
    s1 = "insert into graduate(graduateId,graduateName,gradutateGender,gradeId,uniCId)values({0},{1},{2},{3}" \
         ",{4})".format(id,name,gender,gradeid,uniCid)
    cur.execute(s1)
    conn.commit()
def show(table):
    s = "select * from {0}".format(table)
    cur.execute(s)
    rest = cur.fetchall()
    for r in rest:
        print(r)
    #return rest
def update_itm(table,col,val,condition):
    t = 1
    if type(val)==type(t):
        s1 = "update {0} set {1}={2} where {3}".format(table,col,val,condition)
    elif type(val)==type("test"):
        s1 = "update {0} set {1}='{2}' where {3}".format(table, col, val, condition)
    cur.execute(s1)
    conn.commit()
def add_user(who_,name,password,email,uni):#professor give id ;school give school name
    print("-3")
    id = get_id("user","userId")
    print("-2")
    rr = search("user","*","userName = '{0}'".format(name))
    print("-1")
    if rr ==():

        print("adding user!")
        s = "insert into user(userId,userName,userPassword,email,uni)values({0},'{1}','{2}','{3}','{4}')".format(id,name,password,email,uni)
        cur.execute(s)
        conn.commit()
        print("in 1")
    else:
        print("userName used! try another one~")
        return '-2' #double name
    if who_=="school":
        print("in 2")
        update_itm("universityus","userId",id,"uniUName = '{0}'".format(name))
        print("in 3")
    else:
        check = isThere("professor","email = '{0}'".format(email))
        print("in 4")
        if not check:
            return '-3'
        update_itm("professor","userId",id,"email = '{0}'".format(email))
    conn.commit()
    return '0'

def add_new_itm(table,col,id):
    s = "insert into {0}({1})values({2})".format(table,col,id)
    cur.execute(s)
    conn.commit()


def delet(table,condition):
    s = "delete from {0} where {1}".format(table,condition)
    cur.execute(s)
    conn.commit()
def delet_graduate(id):
    delet("graduate","graduateId = {0}".format(id))

def set_TF(reading,speaking,listening,writing):
    i

def add_std_user(name,password,gender,tel,sname,stdSchool):
    rr = search("studentuser","*","SUserName = '{0}'".format(name))
    if rr ==():
        id = get_id("studentuser","SUserId")
        #init grade
        gradeId = get_id("grade","gradeId")
        add_new_itm("grade", "gradeId", gradeId)
        args = (gradeId,)
        cur.callproc("init_tf_by_gradeId", args)
        # add_new_itm("grade", "GREQuantitative", 0)
        # add_new_itm("grade", "GREVerbal", 0)
        # add_new_itm("grade", "GREAnaliticalWriting", 0)
        # add_new_itm("grade", "TOEFLListening", 0)
        # add_new_itm("grade", "TOEFLReading", 0)
        # add_new_itm("grade", "TOEFLWriting", 0)
        # add_new_itm("grade", "TOEFLSpeaking", 0)
        # add_new_itm("grade", "IELTSListening", 0)
        # add_new_itm("grade", "IELTSReading", 0)
        # add_new_itm("grade", "IELTSWriting", 0)

        s = "insert into studentuser(SUserId,SUserName,SName,SUserPassword,SUserGender,gradeId,tel,idealUni)" \
            "values({0},'{1}','{2}','{3}','{4}',{5},'{6}','{7}')".format(id, name,sname,password,gender,gradeId,tel,stdSchool)
        cur.execute(s)
        conn.commit()
        return '0' # finish successfully
    else:
        print("user name occupied! try another one!")
        return '-1' # double named!

def std_log_in(name,password):
    q = isThere("studentuser","SUserName='{0}' and SUserPassword = '{1}'".format(name,password))
    if q:
        return '0'
    else:
        return '-1'

def pu_log_in(name, password):
    q = isThere("user", "userName='{0}' and userPassword = '{1}'".format(name, password))
    if q:
        return '0'
    else:
        return '-1'

def get_stduser_info(name):
    args = (name,)
    cur.callproc("get_stduser_info_by_name", args)
    ret = cur.fetchall()
    print(name)
    print(ret)
    print("sdfdfsdfsdfsdfsdfsdfsdf")
    r1 = list(ret[0])
    cur.callproc("get_stduser_grade_by_name", args)
    ret = cur.fetchall()
    r2 = list(ret[0])
    r = r1+r2[1:8]
    return r

def get_stduser_grade(name):
    args = (name,)
    cur.callproc("get_stduser_grade_by_name", args)
    ret = cur.fetchall()
    print(ret)
    r = list(ret[0])
    return r[1:8]
#
# ret = get_stduser_grade("yuanmengyang")
# print(ret)
def update_std_grade(name,r,l,s,w,v,q,aw):
    args1=(name,s,r,w,l)
    args2=(name,q,v,aw)
    cur.callproc("std_TF_grade", args1)
    cur.callproc("std_GRE_grade", args2)
    conn.commit()

def update_std_password(name,old_p,new_p):
    chq = std_log_in(name,old_p)
    if chq == '-1':
        return chq
    else:
        update_itm("studentuser","SUserPassword",new_p,"SUserName='{0}'".format(name))
        return '0'

def UniSchChq(name):
    args=(name,)
    cur.callproc("get_uni_sch_by_name", args)
    rest = cur.fetchall()
    print("%%%%%%")
    for it in rest:
        print(it)


    return rest


def findIdealSch(name):
    s = "select idealUni from studentuser where SUserName = '{0}'".format(name)
    cur.execute(s)
    ret = cur.fetchall()
    return ret[0]

def get_graduate_info(pname):
    args = (pname,)
    cur.callproc("p_chq_graduate", args)
    ret = cur.fetchall()
    retdic = {}
    i = 1
    for it in ret:
        dic = {}
        dic["no"] = it[10]
        dic["name"]=it[0]
        dic["gender"]=it[1]


        dic["GREQuantitative"] = it[2]
        dic["GREVerbal"] = it[3]
        dic["GREAW"] = it[4]
        dic["TOEFLL"] = it[5]
        dic["TOEFLR"] = it[6]
        dic["TOEFLW"] = it[7]
        dic["TOEFLS"] = it[8]
        dic["uni"] = it[9]
        graduateId = it[10]
        s1 = "select count(*) from graduate_publish where graduateId = '{0}'".format(graduateId)
        cur.execute(s1)
        result = cur.fetchall()
        print("&&&& {0}  ***".format(result))
        dic["paper"] = result[0]
        retdic["{0}".format(i)]=dic
        i=i+1
    return retdic

def get_paper(gradId):
    print("hhh")
    #get_paper_info
    args = (gradId,)
    cur.callproc("get_paper_info", args)
    ret = cur.fetchall()
    retdic = {}
    i = 1
    for it in ret:
        dic = {}
        dic["no"] = i
        dic["name"] = it[0]
        dic["major"] = it[1]
        dic["citing"] = it[2]
        retdic["{0}".format(i)] = dic
        i = i + 1
        print(ret)
    return retdic


def get_gen_info():
    s = "select * from general_info"
    cur.execute(s)
    rest = cur.fetchall()
    result = list(rest[0])
    dic = {}
    dic["userNo"] = result[3]
    dic["graduateNo"] = result[0]
    dic["professorNo"] = result[1]
    dic["universityNo"] = result[2]
    return dic


def get_graduate_info_by_uni(pname):
    args = (pname,)
    cur.callproc("uni_chq_graduate", args)
    ret = cur.fetchall()
    retdic = {}
    i = 1
    for it in ret:
        dic = {}
        dic["no"] = it[10]
        dic["name"]=it[0]
        dic["gender"]=it[1]


        dic["GREQuantitative"] = it[2]
        dic["GREVerbal"] = it[3]
        dic["GREAW"] = it[4]
        dic["TOEFLL"] = it[5]
        dic["TOEFLR"] = it[6]
        dic["TOEFLW"] = it[7]
        dic["TOEFLS"] = it[8]
        dic["uni"] = it[9]
        graduateId = it[10]
        s1 = "select count(*) from graduate_publish where graduateId = '{0}'".format(graduateId)
        cur.execute(s1)
        result = cur.fetchall()
        print("&&&& {0}  ***".format(result))
        dic["paper"] = result[0]
        retdic["{0}".format(i)]=dic
        i=i+1
    return retdic


def get_CUni_by(id):
    args = (id,)
    print("&&&&***(((*&&^^%%%")
    print(id)
    print("&&&&***(((*&&^^%%%")
    cur.callproc("get_Cuni_info", args)
    rest = cur.fetchall()
    result = list(rest[0])
    dic = {}
    dic["name"] = result[0]
    dic["rank"] = result[1]
    dic["homepage"] = result[2]
    return dic



#UniSchChq("Princeton University")

#get_stduser_info("Minima")
# def check_pass(idnt,name,password):
#     if idnt =="student":
#     elif: idnt =="professor"
#     elif:

#update_graduate("kkk","male",)
# args = (2,)
# cur.callproc("get_grade_by_id",args)
# ret = cur.fetchall()
# for it in ret:
#     print(it)
#
# show("graduate")
# show("general_info")
# delet_graduate(5)
# show("general_info")
# show("graduate")
#add_std_user("jinshenandy","jinshenandy","male")

#delet("user","userId = 1")

#add_user(1,"peter","12dfdf@","PU.163.com")


# r = search("grade","IELTSListening","gradeId = 100")
# print (r==())

'''
#@res = search("universityus","uniUId","uniUName='Harvard University'")
#print(res[0][0])
name = "andyauas"
homepage = "peter.edu.cn"
major = "computer science"
UnName = "Harvard University"
update_professor(name,homepage,major,UnName)
'''

def get_randbool():
    rest = random.uniform(10, 20)
    if rest>15:
        return '0'
    else:
        return '1'


