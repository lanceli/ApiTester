
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
-- Sina
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZHTTPMETHOD,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("1","1","1","1","statuses/public_timeline","GET","获取最新的公共微博消息","http://api.t.sina.com.cn/statuses/public_timeline.json","http://open.weibo.com/wiki/index.php/Statuses/public_timeline");
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZHTTPMETHOD,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("2","1","1","1","statuses/friends_timeline","GET","获取当前登录用户及其所关注用户的最新微博消息","http://api.t.sina.com.cn/statuses/friends_timeline.json","http://open.weibo.com/wiki/index.php/Statuses/friends_timeline");
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZHTTPMETHOD,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("3","1","1","1","users/show","GET","根据用户ID获取用户资料（授权用户）","http://api.t.sina.com.cn/users/show.json","http://open.weibo.com/wiki/index.php/Users/show");

-- Tencent
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZHTTPMETHOD,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("4","1","1","2","statuses/home_timeline","GET","主页时间线","http://open.t.qq.com/api/statuses/home_timeline","http://open.t.qq.com/api_docs/7_14.html");
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZHTTPMETHOD,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("5","1","1","2","statuses/public_timeline","GET","广播大厅时间线","http://open.t.qq.com/api/statuses/public_timeline","http://open.t.qq.com/api_docs/7_15.html");

-- Twitter
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZHTTPMETHOD,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("6","1","1","4","statuses/public_timeline","GET","Returns the 20 most recent statuses, including retweets if they exist, from non-protected users.","http://api.twitter.com/1/statuses/public_timeline.json","http://dev.twitter.com/doc/get/statuses/public_timeline");
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZHTTPMETHOD,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("7","1","1","4","statuses/home_timeline","GET","Returns the 20 most recent statuses,posted by the authenticating user and the user's they follow","http://api.twitter.com/1/statuses/home_timeline.json","http://dev.twitter.com/doc/get/statuses/home_timeline");

-- Linkedin
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZHTTPMETHOD,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("8","1","1","3","people/~","GET","the profile of the current user","http://api.linkedin.com/v1/people/~","http://developer.linkedin.com/docs/DOC-1002");
INSERT INTO ZAPI (Z_PK,Z_ENT,Z_OPT,ZPROVIDER,ZNAME,ZHTTPMETHOD,ZBRIEFING,ZENDPOINTURL,ZDESCRIPTIONURL)
VALUES ("9","1","1","3","people/id","GET","the profile of the member token","http://api.linkedin.com/v1/people/id=@id","http://developer.linkedin.com/docs/DOC-1002");

-- API PARAMETERS
-- Sina
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("1","2","1","1","1","count","20","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("2","2","1","1","1","base_app","0","0");

INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("3","2","1","1","2","since_id","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("4","2","1","1","2","max_id","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("5","2","1","1","2","count","20","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("6","2","1","1","2","page","1","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("7","2","1","1","2","base_app","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("8","2","1","1","2","feature","0","0");

INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("9","2","1","1","3","user_id","","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("10","2","1","1","3","screen_name","","1");

-- Tencent
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("11","2","1","0","4","format","json","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("12","2","1","1","4","pageflag","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("13","2","1","1","4","pagetime","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("14","2","1","1","4","reqnum","20","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("15","2","1","1","4","type","0","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("16","2","1","1","4","contenttype","0","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("17","2","1","1","4","accesslevel","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("18","2","1","0","5","format","json","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("19","2","1","0","5","pos","0","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("20","2","1","1","5","reqnum","20","1");

-- Twitter
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("21","2","1","1","6","trim_user","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("22","2","1","1","6","include_entities","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("23","2","1","1","7","since_id","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("24","2","1","1","7","max_id","0","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("25","2","1","1","7","count","20","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("26","2","1","1","7","page","1","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("27","2","1","1","7","trim_user","1","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("28","2","1","1","7","include_entities","1","0");

-- Linkedin
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("29","2","1","1","8","@selector","","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("30","2","1","1","8","format","json","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("31","2","1","0","9","@id","","1");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("32","2","1","1","9","@selector","","0");
INSERT INTO ZAPIPARAMETER (Z_PK,Z_ENT,Z_OPT,ZOPTIONAL,ZAPI,ZPARAMETERNAME,ZPARAMETERVALUE,ZCHECKED)
VALUES ("33","2","1","1","9","format","json","1");

