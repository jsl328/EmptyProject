//
//  WeixinQunzuCellView.m
//  Lvpingguo
//
//  Created by fuyonghua on 14-8-14.
//  Copyright (c) 2014年 fuyonghua. All rights reserved.
//

#import "WeixinQunzuCellView.h"

@implementation WeixinQunzuCellView

- (void)bind:(WeixinQunzuCellVM *)model{
    cellVM = model;
    NSString *image = URLKEY;
    
	if (model.messageState !=eMessageDeliveryState_Delivered) {
		
		_deliverStateImageView.hidden = NO;
		
		_deliverStateImageView.image = [UIImage imageNamed:@"messageSendFail@2x.png"];
		
	}else{
		
		_deliverStateImageView.hidden =YES;
	
	}
    
    NSLog(@"ee%d",model.imageArray.count);
    
    if (model.liuyanCount >= 10) {
        _weiduImaeView.hidden = YES;
        _chaohuoShiImageView.hidden = NO;
        NSLog(@"ff%d",model.liuyanCount);
        if (model.liuyanCount >= 100) {
            _weiduLabel.text  = @"99+";
        }else{
            _weiduLabel.text  = [NSString stringWithFormat:@"%d",model.liuyanCount];
        }
    }else if(model.liuyanCount == 0){
        _chaohuoShiImageView.hidden = YES;
        _weiduLabel.hidden = YES;
        _weiduImaeView.hidden = YES;
    }else{
        _weiduLabel.hidden = NO;
        _weiduImaeView.hidden = NO;
        _chaohuoShiImageView.hidden = YES;
        _weiduLabel.text  = [NSString stringWithFormat:@"%d",model.liuyanCount];
    }
    if ([model.renshu isEqualToString:@"2"]) {
        _yirenTouxiangView.hidden = NO;
        _liangrenTouxiangView.hidden = YES;
        _sanrenTouxiangView.hidden = YES;
        _duoTouxiangView.hidden = YES;
        for (int i = 0; i < model.imageArray.count; i++) {
            if (i == 0) {
                NSLog(@"=====%@",[model.imageArray objectAtIndex:i]);
                [_touxiangimageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中单人头像.png" Width:_touxiangimageFrame.frame.size.width];
            }
        }
    }else if ([model.renshu isEqualToString:@"1"]){
        _yirenTouxiangView.hidden = NO;
        _liangrenTouxiangView.hidden = YES;
        _sanrenTouxiangView.hidden = YES;
        _duoTouxiangView.hidden = YES;
        for (int i = 0; i < model.imageArray.count; i++) {
            if (i == 0) {
                
                [_touxiangimageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中单人头像.png" Width:_touxiangimageFrame.frame.size.width];
                
            }
        }
    }else if ([model.renshu isEqualToString:@"3"]){
        _yirenTouxiangView.hidden = YES;
        _liangrenTouxiangView.hidden = NO;
        _sanrenTouxiangView.hidden = YES;
        _duoTouxiangView.hidden = YES;
        for (int i = 0; i < model.imageArray.count; i++) {
            if (i == 0) {
                [_liangrenYiImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_liangrenYiImageFrame.frame.size.width];
                
               
            }else if (i == 1){
                [_liangrenErImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_liangrenErImageFrame.frame.size.width];
                
            }
            
        }
    }else if ([model.renshu isEqualToString:@"4"]){
        _yirenTouxiangView.hidden = YES;
        _liangrenTouxiangView.hidden = YES;
        _sanrenTouxiangView.hidden = NO;
        _duoTouxiangView.hidden = YES;
        for (int i = 0; i < model.imageArray.count; i++) {
            if (i == 0) {
                [_sanrenYiImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sanrenYiImageFrame.frame.size.width];
            
            }else if (i == 1){
                [_sanrenErImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sanrenErImageFrame.frame.size.width];

                
            }else if (i == 2){
                 [_sanrenSanImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sanrenSanImageFrame.frame.size.width];
            }
            
        }
    }else if ([model.renshu isEqualToString:@"5"]){
        _yirenTouxiangView.hidden = YES;
        _liangrenTouxiangView.hidden = YES;
        _sanrenTouxiangView.hidden = YES;
        _duoTouxiangView.hidden = NO;
        for (int i = 0; i < model.imageArray.count; i++) {
            if (i == 0) {
                [_sirenYiImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sirenYiImageFrame.frame.size.width];
            
            }else if (i == 1){
                [_sirenErImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sirenErImageFrame.frame.size.width];
              
            }else if (i == 2){
                [_sirenSanImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sirenSanImageFrame.frame.size.width];

            }else if (i == 3){
                [_sirenSiImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sirenSiImageFrame.frame.size.width];
            }
            
        }
        _renshuLabel.text = [NSString stringWithFormat:@"%@",model.renshu];
    }else{
        _yirenTouxiangView.hidden = YES;
        _liangrenTouxiangView.hidden = YES;
        _sanrenTouxiangView.hidden = YES;
        _duoTouxiangView.hidden = NO;
        for (int i = 0; i < model.imageArray.count; i++) {
            if (i == 0) {
                [_sirenYiImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sirenYiImageFrame.frame.size.width];
                
            }else if (i == 1){
                [_sirenErImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sirenErImageFrame.frame.size.width];
                
            }else if (i == 2){
                [_sirenSanImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sirenSanImageFrame.frame.size.width];
                
            }else if (i == 3){
                [_sirenSiImageFrame setUrl:[NSString stringWithFormat:@"%@%@",image,[model.imageArray objectAtIndex:i]]fileName:@"聊天中三人头像.png" Width:_sirenSiImageFrame.frame.size.width];
            }
            
        }
        _renshuLabel.text = [NSString stringWithFormat:@"%@",model.renshu];
    }
	
	if (model.nameArray.count ==0 || !model.nameArray) {
		
		_nameLabel.font =[UIFont systemFontOfSize:17.0f];
	}
	
	if (model.isGroupVC) {
		
		_nameLabel.frame= CGRectMake(85, 12, self.frame.size.width-85, _nameLabel.frame.size.height);
	}
	
	_nameLabel.text = model.name;
    _liuyanLabel.text = model.lastLiuyan;
    _shijianLabel.text = model.shijian;
	
	[self size];
}

-(void)size
{
	if (_deliverStateImageView.hidden) {
		
		_nameLabel.frame = CGRectMake(85, 12, _nameLabel.frame.size.width, _nameLabel.frame.size.height);
	}
	
}


- (void)layoutSubviews{
    [super layoutSubviews];
	
	[self size];
}


- (IBAction)deleteCellOnclick:(id)sender {
	
}
@end
