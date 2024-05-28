import requests
import json
from PySide6.QtCore import QObject, Slot, Signal, Property

url = "http://localhost:8080/"
headers = {"Content-Type": "application/json"} # header for http request




class DatabaseManager(QObject):

    def __init__(self):
        super().__init__()
        self._user = ""

    @Slot(str,str, result=int)
    def sign_in(self, username, password):
        # print(username, password)
        new_url = "http://localhost:8080/createUser"


        data = {
            "username" : username,
            "password" : password
        }
        json_data = json.dumps(data)
        response = None
        try:
            response = requests.post(new_url, data=json_data, headers=headers)
            print(response.text)
        except Exception as e:
            print(e)

        if response.status_code != 201:
            print("HTTP request is failed")
            print(response.status_code)
            print(response.text)
            return 0
        return 1


    # connect to go fetch username info and validate and log in
    @Slot(str,str, result=int)
    def log_in(self, username, password):
        # fetch json from go
        new_url = url + "user?username=" + username
        user_info = dict()
        try:
            response = requests.get(new_url)
            user_info = json.loads(response.text)
        except Exception as e:
            print(e)

        # validate it
        if(password == user_info["password"]):
            self._user = username
            return 1

        else:
            return 0

    # get user for qml
    @Property(str)
    def user(self):
        return self._user

    @Slot(str, str, result=int)
    def create_module(self,username,model_name):
        print(self._user)
        new_url = url + "user?username=" + username # url for getting user info
        user_info = dict() # creting dict for getting user_id
        try:
            response = requests.get(new_url) # get request to http server
            user_info = json.loads(response.text) # loading json to user_info dict
            print(user_info)
        except Exception as e:
            print(e)

        data = {
            "model_name": model_name,
            "user_id": str(user_info['id'])
        } # making a dict for json
        try:
            new_url = url + "createModel"
            response = requests.post(new_url, data=json.dumps(data), headers=headers) # post request to http server
            print(response.text)
        except Exception as e:
            print(e)
        if response.status_code != 201:
            print("HTTP request is failed")
            print(response.status_code, response.text)
            return 0 # if it's failed return 0
        return 1 # if it's done return 1



