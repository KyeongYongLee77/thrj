from flask import Flask
from khaiii import KhaiiiApi

app = Flask(__name__)
api = KhaiiiApi()


@app.route('/')
def hello_world():
    for word in api.analyze('카카오에서 만든 형태소 분석기'):
        print (word)
    return 'hello world'


@app.route("/test_json_rspn", methods=["GET"])
def test():
    #from vod_common.ontology_pool import get_random_meta
    ret_json = {'status': False, 'key': []}

    ret_json["status"] = True
    ret_json["value"] = 'Hi' 
    print('json>>>', ret_json)
    return ret_json

# 영화의 메타 데이터를 추출(파라미터 : 선택영화
@app.route("/user_metadata", methods=["GET"])
def user_metadata():
    ret_json = {'status': False, 'key': []}
    return ret_json

# 사용자의 취향 메타데이터 를 입력 받아추천영화  출력
@app.route("/recom_vod", methods=["GET"])
def recom_vod():
    ret_json = {'status': False, 'key': []}
    return ret_json

# 영화 메타데이터 출력
@app.route("/vod_metadata", methods=["GET"])
def vod_metadata():
    ret_json = {'status': False, 'key': []}
    return ret_json

# 입력된 영화에서 유사 영화를 출력
@app.route("/similar_movie", methods=["GET"])
def similar_movie():
    ret_json = {'status': False, 'key': []}
    return ret_json

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8888)
