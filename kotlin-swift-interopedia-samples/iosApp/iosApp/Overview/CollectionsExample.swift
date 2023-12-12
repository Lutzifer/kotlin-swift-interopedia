import Foundation
import shared

func getCollectionsExample(){
    print(CollectionsKt.getList())
    print(CollectionsKt.getArray())
    print(CollectionsKt.getMap())
    print(CollectionsKt.getSet())
}

func setCollectionsExample(){
    CollectionsKt.set(collection: [1,2,3])
}
