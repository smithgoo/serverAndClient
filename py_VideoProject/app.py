from flask import Flask,jsonify,request
import requests
import videoInfoReq
app = Flask(__name__)


@app.route('/')
def hello_world():
    xx = videoInfoReq.getVideoCategoryList()
    return jsonify(xx)

@app.route('/searchReq',methods=['GET','Post'])
def searchReq():
    name = request.args.get('kw')
    xx = videoInfoReq.getSraechList(name)
    return jsonify(xx)





if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port='8000')
