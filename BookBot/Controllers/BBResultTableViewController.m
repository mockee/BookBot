//
//  BBResultTableViewController.m
//  BookBot
//
//  Created by everbird on 12/11/12.
//  Copyright (c) 2012 Douban.com Inc. All rights reserved.
//

#import "BBResultTableViewController.h"

#import "BBBookResultCell.h"
#import "BBDetailViewController.h"
#import "AppCommon.h"


@interface BBResultTableViewController ()

@end

@implementation BBResultTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _mockedData = @[
        @"Apple",
        @"Google",
        @"Amazon",
        @"Facebook",
        @"Twitter",
        @"Yahoo",
    ];
    
    _resultData = [[NSMutableArray alloc] initWithCapacity:[_mockedData count]];
    for (NSString* item in _mockedData) {
        if (NSNotFound != [item rangeOfString:_searchText].location) {
            [_resultData addObject:item];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (ISINSTANCE(sender, BBBookResultCell)) {
        BBBookResultCell* resultCell = (BBBookResultCell*)sender;
        BBDetailViewController* dest = [segue destinationViewController];
        dest.itemText = resultCell.itemText;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_resultData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier = @"BBBookResultCell";
    BBBookResultCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    cell.itemText = [_resultData objectAtIndex:indexPath.row];
    [cell refreshUI];
    return cell;
}

@end
