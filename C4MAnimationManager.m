/*******************************************************************************
 * This file is part of the C4MiOS_AnimationManager project.
 * 
 * Copyright (c) 2012 C4M PROD.
 * 
 * C4MiOS_AnimationManager is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 * 
 * C4MiOS_AnimationManager is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public License
 * along with C4MiOS_AnimationManager. If not, see <http://www.gnu.org/licenses/lgpl.html>.
 * 
 * Contributors:
 * C4M PROD - initial API and implementation
 ******************************************************************************/

#import "C4MAnimationManager.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIView (C4MAnimationManager)

-(void)fadeIn:(double)_seconds
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];
	self.alpha= 0.0;
	self.alpha= 1.0;
	[UIView commitAnimations];
}
-(void)fadeOut:(double)_seconds
{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];
	self.alpha= 0.0;
	[UIView commitAnimations];
}
-(void)fadeInOut:(double)_seconds
{
	CABasicAnimation* fadeInOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
	[fadeInOut setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
	[fadeInOut setDuration:_seconds];
	[fadeInOut setFromValue:[NSNumber numberWithDouble:0]];
	[fadeInOut setToValue:[NSNumber numberWithDouble:1]];
	[fadeInOut setAutoreverses:YES];
	[self.layer addAnimation:fadeInOut forKey:@"fadeInOut"];
}

-(void)fadeIn
{
	[self fadeIn:1.0];
}
-(void)fadeOut
{
	[self fadeOut:1.0];
}
-(void)fadeInOut
{
	[self fadeInOut:2.0];	 
}
-(void)twinkle
{
	[self twinkle:1.0];
}
	 
-(void)twinkle:(double)_seconds
{
	CABasicAnimation* twinkle = [CABasicAnimation animationWithKeyPath:@"opacity"];
	[twinkle setDuration:_seconds];
	[twinkle setFromValue:[NSNumber numberWithDouble:0]];
	[twinkle setToValue:[NSNumber numberWithDouble:1]];
	[twinkle setAutoreverses:YES]; 
	[twinkle setRepeatCount:HUGE_VALF];
	[self.layer addAnimation:twinkle forKey:@"twinkle"];
}
-(void)dropIn:(double)_seconds
{
	self.alpha=0;
	self.layer.anchorPoint=CGPointMake(0.5, 0.5);
	self.transform=CGAffineTransformMakeScale(10, 10);
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];
	self.alpha=1;
	self.transform=CGAffineTransformMakeScale(1, 1);
	[UIView commitAnimations];
}
-(void)dropOut:(double)_seconds
{
	self.alpha=1;
	self.layer.anchorPoint=CGPointMake(0.5, 0.5);
	self.transform=CGAffineTransformMakeScale(1, 1);
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];
	self.alpha=0;
	self.transform=CGAffineTransformMakeScale(10, 10);
	[UIView commitAnimations];
}
-(void)dropIn
{
	[self dropIn:1.0];
}
-(void)dropOut
{
	[self dropOut:1.0];
}
-(void)appear:(double)_seconds withDelegate:(id)_delegate andSelector:(SEL)_selector
{
	self.alpha=0;
	self.layer.anchorPoint=CGPointMake(0.5, 0.5);
	self.transform=CGAffineTransformMakeScale(0.0001, 0.0001);
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];

	if(_delegate && _selector && [_delegate respondsToSelector:_selector])
	{
		[UIView setAnimationDelegate:_delegate];
		[UIView setAnimationDidStopSelector:@selector(_selector)];
	}
	
	self.alpha=1;
	self.transform=CGAffineTransformMakeScale(1, 1);
	[UIView commitAnimations];
}
-(void)appear:(double)_seconds
{
	[self appear:_seconds withDelegate:nil andSelector:nil];
}
-(void)appear
{
	[self appear:1.0 withDelegate:nil andSelector:nil];
}
-(void)disappear:(double)_seconds withDelegate:(id)_delegate andSelector:(SEL)_selector
{
	self.alpha=1;
	self.layer.anchorPoint=CGPointMake(0.5, 0.5);
	self.transform=CGAffineTransformMakeScale(1, 1);
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];
	
	if(_delegate && _selector && [_delegate respondsToSelector:_selector])
	{
		[UIView setAnimationDelegate:_delegate];
		[UIView setAnimationDidStopSelector:@selector(_selector)];
	}
	
	self.alpha=0;
	self.transform=CGAffineTransformMakeScale(0.0001, 0.0001);
	[UIView commitAnimations];
}
-(void)disappear:(double)_seconds
{
	[self disappear:_seconds withDelegate:nil andSelector:nil];
}
-(void)disappear
{
	[self disappear:1.0 withDelegate:nil andSelector:nil];
}

-(void)zoomIn
{
	[self zoomIn:1.0];
}
-(void)zoomIn:(double)_seconds
{
	self.layer.anchorPoint=CGPointMake(0.5, 0.5);
	self.transform=CGAffineTransformMakeScale(0.00001, 0.00001);
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];
	self.transform=CGAffineTransformMakeScale(1, 1);
	[UIView commitAnimations];
}
-(void)zoomOut
{
	[self zoomOut:1.0];
}
-(void)zoomOut:(double)_seconds
{
	self.layer.anchorPoint=CGPointMake(0.5, 0.5);
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];
	self.transform=CGAffineTransformMakeScale(0.00001, 0.00001);
	[UIView commitAnimations];
}
-(void)zoomTo:(double)_scale
{
	[self zoomTo:_scale time:1.0];
}
-(void)zoomTo:(double)_scale time:(double)_seconds
{
	self.layer.anchorPoint=CGPointMake(0.5, 0.5);
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];
	self.transform=CGAffineTransformMakeScale(_scale, _scale);
	[UIView commitAnimations];
}

-(void)bounce
{
	[self bounce:1.0];
}
-(void)bounce:(double)_seconds
{
	[self bounce:_seconds from:1.0 to:1.2];
}
-(void)bounce:(double)_seconds from:(double)_scale to:(double)_scale2
{
	self.layer.anchorPoint=CGPointMake(0.5, 0.5);

	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:_seconds];
	[UIView setAnimationRepeatAutoreverses:YES];
	[UIView setAnimationRepeatCount:HUGE_VALF];
	self.transform=CGAffineTransformMakeScale(_scale, _scale);
	self.transform=CGAffineTransformMakeScale(_scale2, _scale2);
	[UIView commitAnimations];
}

-(void)transitionFade
{
	[self transitionFade:1.0];
}
-(void)transitionFade:(double)_seconds
{
	CATransition* transitionFade = [CATransition animation];
	[transitionFade setDuration:_seconds];
	[self.layer addAnimation:transitionFade forKey:@"C4MAnimationManager_TransitionFade"];
}

@end

@implementation C4MAnimationManager

@end
