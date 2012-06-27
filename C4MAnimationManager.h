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

#import <Foundation/Foundation.h>

@interface UIView (C4MAnimationManager)

-(void)fadeIn;
-(void)fadeIn:(double)_seconds;

-(void)fadeOut;
-(void)fadeOut:(double)_seconds;

-(void)fadeInOut;
-(void)fadeInOut:(double)_seconds;

-(void)twinkle;
-(void)twinkle:(double)_seconds;

-(void)dropIn;
-(void)dropIn:(double)_seconds;

-(void)dropOut;
-(void)dropOut:(double)_seconds;

-(void)appear;
-(void)appear:(double)_seconds;
-(void)appear:(double)_seconds withDelegate:(id)_delegate andSelector:(SEL)_selector;

-(void)disappear;
-(void)disappear:(double)_seconds;
-(void)disappear:(double)_seconds withDelegate:(id)_delegate andSelector:(SEL)_selector;

-(void)zoomIn;
-(void)zoomIn:(double)_seconds;
-(void)zoomOut;
-(void)zoomOut:(double)_seconds;
-(void)zoomTo:(double)_scale;
-(void)zoomTo:(double)_scale time:(double)_seconds;

-(void)bounce;
-(void)bounce:(double)_seconds;
-(void)bounce:(double)_seconds from:(double)_scale to:(double)_scale2;

-(void)transitionFade;
-(void)transitionFade:(double)_seconds;

@end

@interface C4MAnimationManager : NSObject {
    
}

@end
