//
//  NumbersTableViewController.m
//  Tarea1
//
//  Created by SYSCO on 2/8/17.
//
//

#import "NumbersTableViewController.h"

@interface NumbersTableViewController ()
    @property(nonatomic,strong) NSMutableArray *numbersArray;
@end

@implementation NumbersTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeNumbersArray];
    
}

-(void) initializeNumbersArray{
    
    self.numbersArray = [NSMutableArray new];
    
    for (int counter = 0; counter <= 100; counter++)
    {
        NSString *leftLabel = [NSString stringWithFormat:@"8 * %d =", counter];
        NSDictionary *numbersDictionary = [[NSDictionary alloc] initWithObjects:@[leftLabel, [NSNumber numberWithInt:counter * 8]] forKeys:@[@"leftLabel", @"result"]];
        
        [self.numbersArray addObject:numbersDictionary];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numbersArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *currentNumbers = self.numbersArray[indexPath.row];
    
    cell.textLabel.text = [currentNumbers valueForKey:@"leftLabel"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [[currentNumbers valueForKey:@"result"] intValue]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
