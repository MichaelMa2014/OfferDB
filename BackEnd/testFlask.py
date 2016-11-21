

'''

from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

if __name__ == '__main__':
    app.run()


'''

from flask import request
from flask import Flask
import json
app = Flask(__name__)
@app.route('/')
def h():
    return 'hhh'

@app.route('/signUpUser', methods=['POST'])
def login():
    if request.method == 'POST':
        TFscore = []
        a = request.form['TOEFLR']
        if a:
            TFscore.append(a)
            TFscore.append(request.form['TOEFLL'])
            TFscore.append(request.form['TOEFLS'])
            TFscore.append(request.form['TOEFLW'])
        for it in a:
            print(a)
        return 'Ok'
    else:
        return "finish !~"
    # the code below this is executed if the request method
    # was GET or the credentials were invalid

if __name__ == '__main__':
    app.run()

