
import pymysql
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
#rest=cur.fetchall()
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
    return cur.fetchall()
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
def update_itm(table,col,val,condition):
    t = 1
    if type(val)==type(t):
        s1 = "update {0} set {1}={2} where {3}".format(table,col,val,condition)
    elif type(val)==type("test"):
        s1 = "update {0} set {1}='{2}' where {3}".format(table, col, val, condition)
    cur.execute(s1)
    conn.commit()
def add_user(who_,name,password,email):#professor give id ;school give school name
    id = get_id("user","userId")
    rr = search("user","*","userName = '{0}'".format(name))
    if rr ==():
        #print("adding user!")
        s = "insert into user(userId,userName,userPassword,email)values({0},'{1}','{2}','{3}')".format(id,name,password,email)
        cur.execute(s)
        conn.commit()
    else:
        print("userName used! try another one~")
        return
    if who_=="school":
        update_itm("universityus","userId",id,"uniUName = '{0}'".format(name))
    else:
        update_itm("professor","userId",id,"professorId = {0}".format(who_))
    conn.commit()

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

def add_std_user(name,password,gender):
    rr = search("studentuser","*","SUserName = '{0}'".format(name))
    if rr ==():
        id = get_id("studentuser","SUserId")
        #init grade
        gradeId = get_id("grade","gradeId")
        add_new_itm("grade", "gradeId", gradeId)
        s = "insert into studentuser(SUserId,SUserName,SUserPassword,SUserGender,gradeId)" \
            "values({0},'{1}','{2}','{3}',{4})".format(id, name,password,gender,gradeId)
        cur.execute(s)
        conn.commit()
    else:
        print("user name occupied! try another one!")

add_std_user("jinshenandy","jinshenandy","male")

args = (2,)
cur.callproc("get_grade_by_id",args)
ret = cur.fetchall()
for it in ret:
    print(it)

show("graduate")
show("general_info")
delet_graduate(5)
show("general_info")
show("graduate")

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
