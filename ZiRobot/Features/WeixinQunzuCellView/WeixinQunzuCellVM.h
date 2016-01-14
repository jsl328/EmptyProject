//
//  WeixinQunzuVM.h
//  Lvpingguo
//
//  Created by fuyonghua on 14-8-14.
//  Copyright (c) 2014年 fuyonghua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DCCellHeightDataSource.h"
#import "UserinfoByHuanxinSM.h"
#import "DCListBoxItemDataSource.h"
@protocol ListBoxDeleteCellDelegate <NSObject>

-(void)deleteCell;

@end

@interface WeixinQunzuCellVM : NSObject<DCListBoxItemDataSource>
@property (nonatomic,assign) BOOL isGroupVC;
@property (nonatomic,assign) BOOL isGroup;
@property (nonatomic, assign) id <ListBoxDeleteCellDelegate> delegate;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, assign) MessageDeliveryState messageState;
@property (nonatomic, strong) NSArray *huanxinSM;
@property (nonatomic, strong) NSString *groupID;
@property (nonatomic, strong) NSString *touxiangString;
@property (nonatomic, strong) NSString *userTouxiangString;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *lastLiuyan;
@property (nonatomic, strong) NSString *shijian;
@property (nonatomic, strong) NSArray *IdArray;
@property (nonatomic,assign) int liuyanCount;
@property (nonatomic,strong) NSString *renshu;
@property (nonatomic,strong) NSString *qunzuOwer;
@property (nonatomic,assign) BOOL isDeletable;
@end
