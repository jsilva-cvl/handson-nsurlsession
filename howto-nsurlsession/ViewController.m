#import "ViewController.h"

@interface ViewController ()

@end

NSMutableArray *listOfLibs;

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createListOfLibs];
    [self fetchData];
    
    //uncomment the following line to see a example of upload request
//    [self unusedPostExample];
}

//Creates the list of Strings with libraries names to fetch the metrics
-(void)createListOfLibs {
    listOfLibs = [NSMutableArray array];
    [listOfLibs addObject:@"SDWebImage"];
    [listOfLibs addObject:@"AFNetworking"];
    [listOfLibs addObject:@"Alamofire"];
    [listOfLibs addObject:@"Kingfisher"];
    [listOfLibs addObject:@"Moya"];
}

//Iterates the list of libries names and fetch the data
-(void)fetchData {
    
    NSLog(@"NAME || DOWNLOADS || APPS || STARS");
    for(NSString *libName in listOfLibs){
        NSURLSession *session = [NSURLSession sharedSession];
        NSString *urlString = [[NSString alloc] initWithFormat:@"https://metrics.cocoapods.org/api/v1/pods/%@",libName];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else if (data && [data length] > 0) {
                NSError *JSONError = nil;
                id JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONError];
                if (JSONError) {
                    NSLog(@"JSON Error: %@", error);
                } else {
                    NSLog(@"%@ || %@ || %@ || %@",libName,JSON[@"stats"][@"download_total"],JSON[@"stats"][@"app_total"],JSON[@"github"][@"stargazers"]);
                }
            }
        }];
        [dataTask resume];
    }
}

-(void)unusedPostExample{
    
    //1 - using shared NSURLSession session
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 2 - defining post request
    NSURL *url = [NSURL URLWithString:@"https://httpbin.org/post"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    request.HTTPMethod = @"POST";
    
    // 3 -  creating data to be uploaded
    NSDictionary *jsonData = @{@"Codavel": @"Shielding your app from Wi-Fi/3G/4G instability"};
    NSError *jsonError = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonData
                                                   options:kNilOptions error:&jsonError];
    
    if (!jsonError) {
        // 4 - creating the upload task
        NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error) {
            
            if(!error){
                NSError *JSONError = nil;
                id JSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:&JSONError];
                if (!JSONError) {
                    NSLog(@"RESPONSE %@", JSON);
                }
            }
            
            //5 - handle response
            
        }];
        // 6 - starting the task
        [uploadTask resume];
    }else{
        NSLog(@"JSON Error: %@", jsonError);
    }
}
@end
