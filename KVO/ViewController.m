

#import "ViewController.h"
#import "KVOObject.h"
#import "NSObject+DXKVO.h"
@interface ViewController ()
/**<#注释#>*/
@property (nonatomic, strong) KVOObject * object;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KVOObject *object = [[KVOObject alloc] init];
    [object dx_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil callBack:^(id  _Nullable paramter) {
        NSLog(@"newName : %@===%@",paramter,object.name);
    }];
    
    _object = object;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    static int a = 0;
    a++;
    _object.name = [NSString stringWithFormat:@"%d",a];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
