import pymysql

conn = pymysql.connect(host='127.0.0.1', port=6666, user='root', passwd='666666',db='test')
cur = conn.cursor()
s = "insert into student (s1,sn)values{0}".format((14231088,'gggg'))
#cur.execute(s)
cur.execute("SELECT * FROM student")
conn.commit()
rest=cur.fetchall();
for r in rest:
           print(r)

           #cur.close()

conn.close()