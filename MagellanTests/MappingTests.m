//
//  MappingTests.m
//  Magellan
//
//  Created by Ian Henry on 6/19/14.
//
//

#import <XCTest/XCTest.h>

#define EXP_SHORTHAND
#import <Expecta/Expecta.h>
#import "MGNMapping.h"
#import "MGNMasseuse.h"

@interface MappingTests : XCTestCase
@end

@interface Person : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, assign) NSUInteger age;
@end
@implementation Person @end

@implementation MappingTests

- (void)testSetter {
    Person *person = [[Person alloc] init];
    [[MGNSetter setterWithKeyPath:@"firstName"] map:@"John" to:person];
    expect(person.firstName).equal(@"John");
}

- (void)testKeyExtractor {
    Person *person = [[Person alloc] init];
    person.firstName = @"John";

    [[MGNKeyExtractor keyExtractorWithKeyPath:@"firstName" mapper:[MGNSetter setterWithKeyPath:@"lastName"]]
     map:person to:person];
    expect(person.firstName).equal(person.lastName);
}

- (void)testKeyExtractorWithPath {
    Person *person = [[Person alloc] init];
    person.firstName = @"John";

    [[MGNKeyExtractor keyExtractorWithKeyPath:@"firstName.length" mapper:[MGNSetter setterWithKeyPath:@"age"]]
     map:person to:person];
    expect(person.age).equal(4);
}


@end
