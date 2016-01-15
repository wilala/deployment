#from bottle import route, run, template, request, os
from bottle import *
import time
#import bottle

@route('/deploy')
def index():
    return template('test')

@route('/package')
def package_page():
    with open('package_list.txt','r') as plist_file:
        plist = plist_file.readlines(-100)
    return template('Package',package_list=plist)

@route('/upload', method='POST')
def do_upload():
    upload     = request.files.get('upload')
    name, ext = os.path.splitext(upload.filename)
    if ext not in ('.zip'):
        return 'File extension not allowed.'

    save_path = os.getcwd()+'/file_store'
    upload.save(save_path) # appends upload.filename automatically
    uploadTime = time.localtime()
    newStyleUploadTime = time.strftime("%Y_%m_%d_%H_%M_%S",uploadTime)
    with open ('package_list.txt','a') as plist_file:
        plist_file.writelines(name+ext+'\n')
        plist_file.writelines(newStyleUploadTime+'\n')
    redirect('/package')

@route('/env',method=['GET', 'POST'])
def selectEnvPage():
    package =  request.query.package
    envList = [['Null','Null'],['Null','Null'],['Null','Null']]
    with open('env_list.txt','r') as env_list:
        fileList = env_list.readlines(-100)
        if len(fileList) > 30:
            envList = []
            fileList.reverse()  ##reverse list to read current env info
            n = 0
            for i in fileList:
                if len(envList) >= 3 :
                    break
                else:
                    if i[0]=="[" and i[-2]=="]" and i==fileList[n+9]:
                        listSingleEnv = fileList[n:n+9]
                        x=0
                        for y in listSingleEnv:
                            listSingleEnv[x] = y.strip('\n')
                            x = x+1
                        envList.append(listSingleEnv)
                        del fileList[n+9]
                n = n+1            
    return template('TargetEnv', package=package, envList=envList)
    
@route('/addenv')
def env():
    return template('EnvInfo')

@route('/addenv', method='POST')
def addEnv():
    env_name = request.POST.get('env_name')
    app_ip = request.PSOT.get('app_ip')
    app_user = request.POST.get('app_user')
    app_password = request.POST.get('app_password')
    app_path = request.POST.get('app_path')
    db_ip = request.POST.get('db_ip')
    db_user = request.POST.get('db_user')
    db_password = request.POST.get('db_password')
    db_path = request.POST.get('db_path')

    with open ('env_list.txt','a') as env_list:
        env_list.writelines('['+env_name+']\n')
        env_list.writelines('env_name='+env_name+'\n')
        env_list.writelines('app_ip='+app_ip+'\n')
        env_list.writelines('app_user='+app_user+'\n')
        env_list.writelines('app_path='+app_path+'\n')
        env_list.writelines('db_ip='+db_ip+'\n')
        env_list.writelines('db_user='+db_user+'\n')
        env_list.writelines('db_password='+db_password+'\n')
        env_list.writelines('db_path='+db_path+'\n')
        env_list.writelines('['+env_name+']\n')
@route('/deploy')
def deploy():
   package = request.query.package
   env = request.query.targetenv
   return template('Deploy',package=package,env=env)

add
run(host='172.25.18.107', port=8080, reloader=True, debug=True)
