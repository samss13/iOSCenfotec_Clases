//
//  DogsTableViewController.m
//  TableViewDefault
//
//  Created by Estudiantes on 4/2/17.
//  Copyright © 2017 Cenfotec. All rights reserved.
//

#import "DogsTableViewController.h"

@interface DogsTableViewController ()
@property(nonatomic,strong) NSMutableArray *dogsArray;
@end

@implementation DogsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeDogsArray];
}

-(void) initializeDogsArray{
    
    int counter = 0;
    
    self.dogsArray = [NSMutableArray new];
    //self.dogsArray = [[NSMutableArray alloc] init];
    //self.dogsArray = [[NSMutableArray alloc] initWithObjects:@"", @"", @"", nil];
    
    while (counter < 1001) {
        NSString *dogName = [NSString stringWithFormat:@"Name%d", counter+1];
        NSDictionary *dogsDictionary = [[NSDictionary alloc] initWithObjects:@[dogName, [NSNumber numberWithInt:counter+1]] forKeys:@[@"dogName", @"dogAge"]];
        
        [self.dogsArray addObject:dogsDictionary];
        
        counter++;
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
    return self.dogsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    NSDictionary *currentDog = self.dogsArray[indexPath.row];
    
    cell.textLabel.text = [currentDog valueForKey:@"dogName"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", [[currentDog valueForKey:@"dogAge"] intValue]];
    
    //cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long) indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NSString *message = [NSString stringWithFormat:@"You selected the row# %ld", (long)indexPath.row+1];
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Information Message" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:true completion:nil];
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [self.dogsArray removeObjectAtIndex:indexPath.row];
        
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
