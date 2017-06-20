//
//  ViewController.m
//  JSONDictionaries
//
//  Created by sd79 on 2017-06-19.
//  Copyright © 2017 Glen Posey. All rights reserved.
//

#import "ViewController.h"
#import "Repo.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *repoArray;
@property (weak, nonatomic) IBOutlet UITableView *repoTableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.repoArray = [[NSMutableArray alloc]init];
    
    self.repoTableView.dataSource = self;
    
    NSURL *url = [NSURL URLWithString:@"https://api.github.com/users/GRP79/repos"];
    NSURLRequest *urlRequest = [[NSURLRequest alloc]initWithURL:url];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error) {
            NSLog(@"error: %@", error.localizedDescription);
            return;
            
        }
        NSError *jsonError = nil;
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if (jsonError){
            NSLog(@"jsonError: %@", jsonError.localizedDescription);
            return;
            
        }
        
        
        for (NSDictionary *repo in repos) {
            
            Repo *testRepo = [[Repo alloc]initWithJSONData:repo];
            
            [self.repoArray addObject:testRepo];
            
            NSString *repoName = testRepo.name;
            NSLog(@"repo: %@", repoName);
        }
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            [self.repoTableView reloadData];
            
        }];
        
    }];
    
    [dataTask resume];


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.repoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    Repo *repoElement = [self.repoArray objectAtIndex:indexPath.row];
    cell.textLabel.text = repoElement.name;
    return cell;
}


@end
