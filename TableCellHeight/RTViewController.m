//
//  RTViewController.m
//  TableCellHeight
//
//  Created by DEV_IPHONE_01 on 08/10/14.
//  Copyright (c) 2014 tilak_ios. All rights reserved.
//

#import "RTViewController.h"
#import "RTCustomCellTableViewCell.h"
@interface RTViewController ()
{
    NSArray *arrayData,*imageArray;
    float questionLblHeight;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation RTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    
   arrayData=[[NSArray alloc] initWithObjects:
              @"You should also read the documents for UISearchDisplayController as there are several other details of the dataSource and delegate protocols that need to be updated to reflect the fact that there are multiple tableviews in play.",
              @"You should also read the documents for UISearchDisplayController as there are several other details of the dataSource and delegate protocols that need to be updated to reflect the fact that there are multiple tableviews in play.",
              @"You should also read the documents for UISearchDisplayController as there are several other details of the dataSource and delegate protocols that need to be updated to reflect the fact that there are multiple tableviews in play.",
              @"You should also read the documents for UISearchDisplayController as there are several other details of the dataSource ...",
              @"You should also read the documents for UISearchDisplayController as there are several other details of the dataSource and delegate protocols that need to be updated to reflect ...", nil];
    
    imageArray=[[NSArray alloc] initWithObjects:@"1.png",@"2.jpg",@"3.jpeg",@"1.png",@"2.jpg", nil];
}

#pragma mark- Table View Delegates

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    //image height is 100
    CGFloat finalHeight=5+100+5; 
    
    
    NSString *str=[arrayData objectAtIndex:indexPath.row];
    CGSize sizeOfRect=CGSizeMake(300, 900);
    CGRect possibleSize = [str boundingRectWithSize:sizeOfRect
                                            options:NSStringDrawingUsesLineFragmentOrigin
                                         attributes:@{
                                                      NSFontAttributeName : [UIFont systemFontOfSize:19]
                                                      }
                                            context:nil];
    
    
    questionLblHeight=possibleSize.size.height+10;
    finalHeight=finalHeight+possibleSize.size.height+30;
    
    return finalHeight;
}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}


#pragma mark- Table View Data Source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    RTCustomCellTableViewCell *cell=(RTCustomCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cellId"];
    cell.myImage.image=[UIImage imageNamed:[imageArray objectAtIndex:indexPath.row]];
    
    cell.mylabel.text=[arrayData objectAtIndex:indexPath.row];
    cell.mylabel.backgroundColor=[UIColor grayColor];
    CGRect frame=cell.mylabel.frame;
    frame.origin.y=5+100+5;
    frame.size.height=questionLblHeight;
    [self disableAutoLayoutsForObject:cell.mylabel setFrame:frame addObjectToSuperView:cell.contentView];
    return cell;
}

#pragma mark Helper MEthods
-(void)disableAutoLayoutsForObject:(id)object setFrame:(CGRect)frame addObjectToSuperView:(id)superView
{
    [object removeFromSuperview];
    [object setTranslatesAutoresizingMaskIntoConstraints:YES];
    [object setFrame:frame];
    [superView addSubview:object];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
