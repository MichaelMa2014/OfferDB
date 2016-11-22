
from flask import request
from flask import Flask
import time
import datetime
from datetime import timedelta
import json
from flask import Flask
from flask import request, make_response, current_app
from functools import update_wrapper
import json
import database as db

import globVar as g
app = Flask(__name__)

basestring = (str, bytes)

# TFscore = []
# GREscore = []
# stdUserName = " "
# stdSchool = " "
# stdName = " "

#db.add_user(1,1,1,1,1)

#print(db.isThere("studentuser","SUserName = 'Minima123' and SUserPassword = '1234'"))


def crossdomain(origin=None, methods=None, headers=None,
                max_age=21600, attach_to_all=True,
                automatic_options=True):
    if methods is not None:
        methods = ', '.join(sorted(x.upper() for x in methods))
    if headers is not None and not isinstance(headers):
        headers = ', '.join(x.upper() for x in headers)
    if not isinstance(origin, basestring):
        origin = ', '.join(origin)
    if isinstance(max_age, timedelta):
        max_age = max_age.total_seconds()

    def get_methods():
        if methods is not None:
            return methods

        options_resp = current_app.make_default_options_response()
        return options_resp.headers['allow']

    def decorator(f):
        def wrapped_function(*args, **kwargs):
            if automatic_options and request.method == 'OPTIONS':
                resp = current_app.make_default_options_response()
            else:
                resp = make_response(f(*args, **kwargs))
            if not attach_to_all and request.method != 'OPTIONS':
                return resp

            h = resp.headers

            h['Access-Control-Allow-Origin'] = origin
            h['Access-Control-Allow-Methods'] = get_methods()
            h['Access-Control-Max-Age'] = str(max_age)
            if headers is not None:
                h['Access-Control-Allow-Headers'] = headers
            return resp

        f.provide_automatic_options = False
        return update_wrapper(wrapped_function, f)

    return decorator


@app.route('/stSignUp', methods=['POST']) #std user signUp
@crossdomain(origin='*')
def stSignUp():
    #return '0'
    print("1")
    if request.method == 'POST':
        print("2")
        name = request.form.get('new-username')
        g.stdUserName = name
        print(name)
        repeat_password = request.form.get('new-password')
        print(repeat_password)
        password = request.form.get('new-repeat-password')
        print(password)
        gender = request.form.get('new-gender')
        print(gender)
        tel = request.form.get('new-tel')
        print(tel)
        if repeat_password == password:
            ret = db.add_std_user(name,password,gender,tel,g.stdName,g.stdSchool)
            '''
            print("***&&&******")
            for it in TFscore:
                print(it)
            for it in GREscore:
                print(it)
            print("***&&&******")
            '''

            db.update_std_grade(name, g.TFscore[0], g.TFscore[1], g.TFscore[2], g.TFscore[3], g.GREscore[0], g.GREscore[1],g.GREscore[2])
        else:
            ret = '-2' # pass not same
        return ret #

@app.route('/puSignUp', methods=['POST'])
@crossdomain(origin='*')
def puSignUp():
    print("a new signer pu")
    tmp = request.form['new-role']
    if tmp[0]=='P':
        role = "professor"
    else:
        role = "school"
    print(role)
    uni = request.form['new-uni']
    print(uni)
    password = request.form['new-password']
    print(password)
    rpt_password = password
    print(rpt_password)
    email = request.form['new-email']
    print(email)
    name = request.form['new-username']

    print(name)
    if password==rpt_password:

        ret = db.add_user(role, name, password, email, uni) #(who_,name,password,email,uni)
    else:
        ret = '-1'
    return ret


@app.route('/stdFront', methods=['POST'])
@crossdomain(origin='*')
def stdFront():
    #return "0"
    if request.method == 'POST':

        a = request.form['TOEFLR']
        if a:
            TFscore=[]
            TFscore.append(a)
            TFscore.append(request.form['TOEFLL'])
            TFscore.append(request.form['TOEFLS'])
            TFscore.append(request.form['TOEFLW'])
        for it in TFscore:
            print(it)

        b = request.form['GREVerbal']
        if b:
            GREscore=[]
            GREscore.append(b)
            GREscore.append(request.form['GREQuantitative'])
            GREscore.append(request.form['GREAW'])
        for it in GREscore:
            print(it)
        #stdUserName = request.form['username']
        g.GREscore = GREscore
        g.TFscore = TFscore
        g.show_grade()
        g.stdName = request.form['name']
        g.stdSchool = request.form['uni']
        print(g.stdUserName)
        print(g.stdSchool)
       # return "0"
    else:
        i=0
    return db.get_randbool()
    # the code below this is executed if the request method
    # was GET or the credentials were invalid

@app.route('/stdLogin', methods=['POST']) #std user signUp
@crossdomain(origin='*')
def stdLogIn():
    name = request.form['username']
    password = request.form['password']
    ret = db.std_log_in(name,password)
    print(name)
    print(type(name))
    print(password)
    print(ret)
    return ret



@app.route('/puLogin', methods=['POST']) #std user signUp
@crossdomain(origin='*')
def puLogin():
    name = request.form['username']
    password = request.form['password']
    print(password)
    print(name)
    ret = db.pu_log_in(name,password)
    print(name)
    print(type(name))
    print(password)
    print(ret)
    return ret


@app.route('/stdCheck', methods=['GET'])
@crossdomain(origin='*')
def stdCheck():
    name = request.args.get('username')
    print(name)
    rest = db.get_stduser_info(name)
    print("**********")
    print(type(rest))
    print(rest)
    dic = {}
    dic["gender"]=rest[0]
    dic["tel"]=rest[1]
    dic["GREQuantitative"]=rest[2]
    dic["GREVerbal"]=rest[3]
    dic["GREAW"]=rest[4]
    dic["TOEFLL"]=rest[5]
    dic["TOEFLR"]=rest[6]
    dic["TOEFLW"] = rest[7]
    dic["TOEFLS"] = rest[8]
    print(dic)
    return json.dumps(dic)


@app.route('/stdUpgrade', methods=['POST'])
@crossdomain(origin='*')
def stdUpgrade():
    print("***&&&")
    name = request.form['username']
    print(name)
    b = request.form['GREVerbal']
    if b:
        GREscore = []
        GREscore.append(b)
        GREscore.append(request.form['GREQuantitative'])
        GREscore.append(request.form['GREAW'])


    a = request.form['TOEFLR']
    if a:
        TFscore = []
        TFscore.append(a)
        TFscore.append(request.form['TOEFLL'])
        TFscore.append(request.form['TOEFLS'])
        TFscore.append(request.form['TOEFLW'])
    # for it in TFscore:
    #     print(it)
    # for it in GREscore:
    #     print(it)
    g.GREscore = GREscore
    g.TFscore = TFscore
    g.show_grade()
    db.update_std_grade(name,g.TFscore[0],g.TFscore[1],g.TFscore[2],g.TFscore[3],g.GREscore[0],g.GREscore[1],g.GREscore[2])
    return '0'

@app.route('/stdUpPass', methods=['POST'])
@crossdomain(origin='*')
def stdUpPass():
    name = request.form['username']
    op = request.form['old-password']
    new_op = request.form['new-password']
    new_rpt_op = request.form['new-repeat-password']
    if new_op==new_rpt_op:
        ret = db.update_std_password(name,op,new_op)
    else:
        ret = '-2'
    return ret


@app.route('/stdCqUni', methods=['POST'])
@crossdomain(origin='*')
def stdCqUni():
    name = request.form['username']
    uniName = db.findIdealSch(name)
    rest = db.UniSchChq(uniName)
    r1 = rest[0]
    r2 = rest[1]
    r3 = rest[2]
    dic={}
    #dic["gender"] = rest[0]
    dic["homepage"]=r1[1]
    dic["rank"]=r1[2]
    dic["salary"]=r1[3]

    dic["school1"]=r1[4]
    dic["school-rank1"]=r1[5]
    dic["school-salary1"]=r1[6]

    dic["school2"] =r2[4]
    dic["school-rank2"] =r2[5]
    dic["school-salary2"] =r2[6]

    dic["school3"] =r3[4]
    dic["school-rank3"] =r3[5]
    dic["school-salary3"] =r3[6]
    score_pre = db.get_stduser_grade(name)
    print("&&&&&&&&&&&&&&&&&&&&&")
    print(score_pre)
    score = [score_pre[4],score_pre[3],score_pre[5],score_pre[6],score_pre[0],score_pre[1],score_pre[2]]
    rest = db.check_chq(uniName,score)
    dic["percent-TOEFLR"]= rest[0]
    dic["percent-TOEFLL"] =rest[1]
    dic["percent-TOEFLS"] =rest[3]
    dic["percent-TOEFLW"] =rest[2]
    dic["percent-GREVerbal"] =rest[5]
    dic["percent-GREQuantitative"] =rest[4]
    dic["percent-GREAW"] =rest[6]
    return json.dumps(dic)



@app.route('/professorInfo', methods=['POST'])
@crossdomain(origin='*')
def professorInfo():
    pname = request.form['username']
    print("in")
    chq = db.isThere("professor","professorName = '{0}'".format(pname))
    chq2 = db.isThere("universityus","uniUName='{0}'".format(pname))
    print("***&&&^^^%%%$$$")
    print(chq)
    print(chq2)
    print("***&&&^^^%%%$$$")
    if chq:
        ret = db.get_graduate_info(pname)
    elif chq2:
        ret = db.get_graduate_info_by_uni(pname)
    return json.dumps(ret)

@app.route('/cuniInfo', methods=['POST'])
@crossdomain(origin='*')
def cuniInfo():
    print("in")
    id = request.form['graduateId']
    ret = db.get_CUni_by(id)
    return json.dumps(ret)


@app.route('/paperInfo', methods=['POST'])
@crossdomain(origin='*')
def paperInfo():
    print("in paper")
    id = request.form['graduateId']
    ret = db.get_paper(id)
    return json.dumps(ret)

@app.route('/generalInfo',methods=['POST'])
@crossdomain(origin='*')
def generalInfo():
    print("in general")

    ret = db.get_gen_info()
    return json.dumps(ret)





if __name__ == '__main__':
    app.run(host='0.0.0.0')

