HW_1
====
Я оставил имплементацию классов `Company` и `Person` пустой. `Company` может содержать массив из обьектов `Person`. У `Person`a могут быть подчиненные класса `Person`. Таким образом получается некая древовидная структура.
Попробуйте имплементировать эти классы и добейтесь успешного выполнения тестов (вкладка `Product->Test`)
## Кратко о массивах
Создание неизменяемого массива:
```objective-c
//последним элементом обязательно передаем nil
[[NSArray alloc] initWithObjects:@1, @2, @"Orange", [NSNull null], nil];
//эквивалентно
@[@1, @2, @"Orange", [NSNull null]];
```

Создание изменяемого массива:
```objective-c
//последним элементом обязательно передаем nil
[[NSMutableArray alloc] initWithObjects:@1, @2, @"Orange", [NSNull null], nil];
//либо сначала создаем неизменяемый, потом делаем изменяемую копию
[@[@1, @2, @"Orange", [NSNull null]] mutableCopy];
```

Обращение к элементам массива:
```objective-c
NSArray* arr = @[@1, @2, @3];
NSNumber* num = [arr objectAtIndex:1];
//эквивалентно
NSNumber* num = arr[1];
```

Изменение массивов
```objective-c
NSMutableArray* arr = [@[@1, @2, @3] mutableCopy];
[arr addObject:@"Some string"];
[arr insertObject:@"312" atIndex:1];
[arr replaceObjectAtIndex:0 withObject:@"123"];
//эквивалентно
arr[0] = @"123";
```

Более подробно о массивах [тут](http://idev.by/ios/843/)

У кого вызывают напряжение квадратные скобки, рекомендую почитать код на [Racket](https://github.com/plt/racket/blob/master/racket/src/mac/osx_appl.rkt). Там они не квадратные:)

