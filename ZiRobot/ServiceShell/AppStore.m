//
//  AppStore.m
//  QingLian
//
//  Created by fyh on 14-6-20.
//  Copyright (c) 2014年 lianyou. All rights reserved.
//

#import "AppStore.h"

@implementation AppStore

/**
 * 版本更新
 *
 *  @param callback 更新完毕后的callback
 */
+ (void)checkUpdate:(void (^)(BOOL))callback{
    
}

/**
 *  设置用户ID
 *
 *  @param ID 用户ID
 */
+ (void)setYongHuID:(NSString *)ID{
    strYonghuID = ID;
}
/**
 *  返回用户ID
 *
 *  @return
 */
+ (NSString *)getYongHuID{
    return strYonghuID;
}

+ (void)setGongsiID:(NSString *)ID{
    strGongsiID = ID;
}
+ (NSString *)getGongsiID{
    return strGongsiID;
}

+ (void)setQunzuID:(NSString *)ID{
    strQunzuid = ID;
}
+ (NSString *)getQunzuID{
    return strQunzuid;
}

+ (void)setYonghuImageView:(NSString *)imageView{
    strYonghuImageString = imageView;
}
+ (NSString *)getYonghuImageView{
    return strYonghuImageString;
}
/**
 *  设置用户名
 *
 *  @param yongHuMing 用户名
 */
+ (void)setYongHuMing:(NSString *)yongHuMing{
    strYongHuMing = yongHuMing;
}
+ (NSString *)getYongHuMing{
    return strYongHuMing;
}

+ (void)setYongHuMima:(NSString *)mima{
    strYonghuMima = mima;
}
+ (NSString *)getYongHuMima{
    return strYonghuMima;
}

+ (void)setZhiwei:(NSString *)zhiwei{
    strZhiwei = zhiwei;
}
+ (NSString *)getZhiwei{
    return strZhiwei;
}

+ (void)setDanwei:(NSString *)danwei{
    strDanwei = danwei;
}
+ (NSString *)getDanwei{
    return strDanwei;
}

+ (void)setSessionid:(NSString *)sessionid{
    strSessionid = sessionid;
}
+ (NSString *)getSessionid{
    return strSessionid;
}


+ (void)setYongHuShoujihao:(NSString *)shoujihao{
    strShouJiHao = shoujihao;
}
+ (NSString *)getYongHuShoujihao{
    return strShouJiHao;
}

+ (void)setQunzuMing:(NSString *)qunzuMing{
    strQunzuMing = qunzuMing;
}
+ (NSString *)getQunzuMing{
    return strQunzuMing;
}

+ (void)setToken:(NSString *)token{
    strToken = token;
}
+ (NSString *)getToken{
    return strToken;
}

+(void)setSuperUserToken:(NSString *)token
{
	strToSuperUserToken =token;
}

+ (NSString *)getSuperUserToken
{
	return strToSuperUserToken;
}

+ (void)setFlag:(NSString *)flag{
    strFlag = flag;
}

+ (NSString *)getflag{
    return strFlag;
}

+(void)setBaogaoXaila:(NSString *)baogaoxiala
{
    BaogaoXaila =baogaoxiala;
}

+(NSString *)getBaogaoXaila
{
    return BaogaoXaila;
}

+ (void)setIsHomeToQiYe:(BOOL)toQiYe{
    isHomeToQiYe = toQiYe;
}

+ (BOOL)isHomeToQiYe{
    return isHomeToQiYe;
}

+ (void)setIsAdmin:(BOOL)admin{
    isAdmin = admin;
}

+ (BOOL)isAdmin{
    return isAdmin;
}

+ (void)setXiugai:(BOOL)isXiugai{
    xiugiBiaoti = isXiugai;
}

+ (BOOL)isXiugai{
    return xiugiBiaoti;
}

+ (void)setXiugaiQunming:(BOOL)isXiugaiQunming{
    XiugiQunMing = isXiugaiQunming;
}

+ (BOOL)isXiugaiQunming{
    return XiugiQunMing;
}

+(void)setJobNumber:(NSString*)jobnumber{
    JobNumber = jobnumber;
}
+(NSString*)getJobNumber{
    return JobNumber;
}

+(void)setBackgroundimg:(NSString*)backgroundimg{
    strBackgroundimg = backgroundimg;
}
+(NSString*)getBackgroundimg{
    return strBackgroundimg;
}

+(void)setCompanyname:(NSString*)companyname{
    Companyname = companyname;
}
+(NSString*)getCompanyname{
    return Companyname;
}

+(void)setCorpnums:(BOOL)corpnums{
    strCorpnums = corpnums;
}
+(int)getCorpnums{
    return strCorpnums;
}

+ (void)setDeptid:(NSString *)deptid{
    strDetpid = deptid;
}

+ (NSString *)getDeptid{
    return strDetpid;
}

+(void)setHtmlpluginArray:(NSArray *)htmlplugin{
    htmlpluginArray = htmlplugin;
}
+(NSArray *)getHtmlplugin{
    return htmlpluginArray;
}

+ (void)delSession{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"" forKey:@"sessionid"];
    [defaults synchronize];
}

+(void)setCity:(NSString *)city{
    strCity = city;
}
+(NSString *)getCity{
    return strCity;
}

@end
