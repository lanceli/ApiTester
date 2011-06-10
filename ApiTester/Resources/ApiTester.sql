
delete from ZPROVIDER;
delete from ZAPI;
delete from ZAPIPARAMETER;

-- PROVIDERS
INSERT INTO ZPROVIDER (Z_PK,Z_ENT,Z_OPT,ZTITLE,ZCONSUMERKEY,ZCONSUMERSECRET,ZREQUESTURL,ZACCESSURL,ZAUTHORIZEURL,ZLOGO,ZSCRIPT,ZACCESSTOKENKEY,ZACCESSTOKENSECRET)
VALUES ("1","3","1","Sina Weibo","261512368","5884a2b28a9cca42c2df5dfd8b80f0e6","http://api.t.sina.com.cn/oauth/request_token","http://api.t.sina.com.cn/oauth/access_token","http://api.t.sina.com.cn/oauth/authorize","sina","document.getElementsByClassName('fb')[0].innerText","","");
INSERT INTO ZPROVIDER (Z_PK,Z_ENT,Z_OPT,ZTITLE,ZCONSUMERKEY,ZCONSUMERSECRET,ZREQUESTURL,ZACCESSURL,ZAUTHORIZEURL,ZLOGO,ZSCRIPT,ZACCESSTOKENKEY,ZACCESSTOKENSECRET)
VALUES ("2","3","1","Tencent Weibo","9bacf000008941dca9dd50b5e9e8ae06","a3afac95fa82822bef92bbb4b868cfde","https://open.t.qq.com/cgi-bin/request_token","https://open.t.qq.com/cgi-bin/access_token","https://open.t.qq.com/cgi-bin/authorize","tencent","document.getElementById('conter').innerText.replace(/\D*(\d*)\D*/g, '$1')","","");
INSERT INTO ZPROVIDER (Z_PK,Z_ENT,Z_OPT,ZTITLE,ZCONSUMERKEY,ZCONSUMERSECRET,ZREQUESTURL,ZACCESSURL,ZAUTHORIZEURL,ZLOGO,ZSCRIPT,ZACCESSTOKENKEY,ZACCESSTOKENSECRET)
VALUES ("3","3","1","LinkedIn","nFLzPEU1j30gzFopG_HYt02_7UrqKOQqGyMOCPdmhq3RiSJzb22E8KXU4zj_EcUU","4nqOLn5QRhGt_fSUsQmM75hAOy1Yqes6iJtnVE496SVRu2xTwxfHQ2ZreWPI00bm","https://api.linkedin.com/uas/oauth/requestToken","https://api.linkedin.com/uas/oauth/accessToken","https://api.linkedin.com/uas/oauth/authorize","linkedin","document.getElementsByClassName('access-code')[0].innerText","","");
INSERT INTO ZPROVIDER (Z_PK,Z_ENT,Z_OPT,ZTITLE,ZCONSUMERKEY,ZCONSUMERSECRET,ZREQUESTURL,ZACCESSURL,ZAUTHORIZEURL,ZLOGO,ZSCRIPT,ZACCESSTOKENKEY,ZACCESSTOKENSECRET)
VALUES ("4","3","1","Twitter","0Qsk6DfLdI3l4Q2RkAzQ","WibvD7TFhRpJBcifR4wAiPMR0W6YzQxkKouLv8VVR8","https://api.twitter.com/oauth/request_token","https://api.twitter.com/oauth/access_token","https://api.twitter.com/oauth/authorize","twitter","document.getElementsByTagName('code')[0].firstChild.innerText","","");
INSERT INTO ZPROVIDER (Z_PK,Z_ENT,Z_OPT,ZTITLE,ZCONSUMERKEY,ZCONSUMERSECRET,ZREQUESTURL,ZACCESSURL,ZAUTHORIZEURL,ZLOGO,ZSCRIPT,ZACCESSTOKENKEY,ZACCESSTOKENSECRET)
VALUES ("5","3","1","Facebook","","","","","","facebook","","","");
INSERT INTO ZPROVIDER (Z_PK,Z_ENT,Z_OPT,ZTITLE,ZCONSUMERKEY,ZCONSUMERSECRET,ZREQUESTURL,ZACCESSURL,ZAUTHORIZEURL,ZLOGO,ZSCRIPT,ZACCESSTOKENKEY,ZACCESSTOKENSECRET)
VALUES ("6","3","1","Github","","","","","","octocat","","","");

-- APIS
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("1","1","1","1","statuses/public_timeline","获取最新的公共微博消息","http://api.t.sina.com.cn/statuses/public_timeline","http://open.weibo.com/wiki/index.php/Statuses/public_timeline");
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("2","1","1","1","statuses/friends_timeline","获取当前登录用户及其所关注用户的最新微博消息","http://api.t.sina.com.cn/statuses/friends_timeline","http://open.weibo.com/wiki/index.php/Statuses/friends_timeline");
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("3","1","1","1","users/show","根据用户ID获取用户资料（授权用户）","http://api.t.sina.com.cn/users/show","http://open.weibo.com/wiki/index.php/Users/show");

-- API PARAMETERS
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("1","2","1","1","1","count","20","UITextField");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("2","2","1","1","1","base_app","0","UISwitch");

INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("3","2","1","1","2","since_id","0","UITextField");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("4","2","1","1","2","max_id","0","UITextField");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("5","2","1","1","2","count","20","UITextField");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("6","2","1","1","2","page","1","UITextField");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("7","2","1","1","2","base_app","0","UISwitch");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("8","2","1","1","2","feature","0","UITextField");

INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("9","2","1","1","3","user_id","","UITextField");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZVIEWCLASS)
VALUES ("10","2","1","1","3","screen_name","","UITextField");


