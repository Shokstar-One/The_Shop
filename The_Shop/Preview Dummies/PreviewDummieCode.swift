//
//  PreviewDummieCode.swift
//  The_Shop
//
//  Created by Timo Schönbeck on 13.03.23.
//

import Foundation


struct PreviewDummieCode {
    
    let sellableResponsePD = SellableResponse(
        count: 2400,
        limit: 48,
        offset: 0,
        sellables: [
            Sellable(
                sellableId: "N02abp1xnxSjx7Jywby7-812-7",
                ideaId: "62a46a3628f4aa0fbe2b00de",
                mainDesignId: "308271771",
                productTypeId: "812",
                price: Price(amount: 29.9, currencyId: "1"),
                name: "Das Höllen Baby - GEILdesignt",
                description: "Super Geschenkidee für werdende Mütter als lustiges Sprüche T-Shirt für kommende Babyparties. Designt von Shokstar für GEILdesignt.",
                tags: [
                    "birthday",
                    "GEILdesignt",
                    "geburt",
                    "mummy",
                    "baby",
                    "Baby",
                    "schwanger",
                    "schwangerschaft",
                    "Shokstar"
                ],
                previewImage: PreviewImage(
                    url: "https://image.spreadshirtmedia.net/image-server/v1/products/T812A2PA5886PT17X33Y0D308271771W27990H44748/views/1,width=500,height=500,appearanceId=2,backgroundColor=22262d,crop=list,modelId=85/super-geschenkidee-fuer-werdende-muetter-als-lustiges-sprueche-t-shirt-fuer-kommende-babyparties-designt-von-shokstar-fuer-geildesignt.jpg",
                    type: "MODEL"
                ),
                appearanceIds: [
                    "566",
                    "645",
                    "648",
                    "719",
                    "1",
                    "2",
                    "366",
                    "348",
                    "387",
                    "92",
                    "39",
                    "231",
                    "317",
                    "3",
                    "29",
                    "328",
                    "339"
                ],
                defaultAppearanceId: "2"
            )
        ]
    )
    
    let sellablePD =  Sellable(
        sellableId: "N02abp1xnxSjx7Jywby7-812-7",
        ideaId: "62a46a3628f4aa0fbe2b00de",
        mainDesignId: "308271771",
        productTypeId: "812",
        price: Price(amount: 29.9, currencyId: "1"),
        name: "Das Höllen Baby - GEILdesignt",
        description: "Super Geschenkidee für werdende Mütter als lustiges Sprüche T-Shirt für kommende Babyparties. Designt von Shokstar für GEILdesignt.",
        tags: [
            "birthday",
            "GEILdesignt",
            "geburt",
            "mummy",
            "baby",
            "Baby",
            "schwanger",
            "schwangerschaft",
            "Shokstar"
        ],
        previewImage: PreviewImage(
            url: "https://image.spreadshirtmedia.net/image-server/v1/products/T812A2PA5886PT17X33Y0D308271771W27990H44748/views/1,width=500,height=500,appearanceId=2,backgroundColor=22262d,crop=list,modelId=85/super-geschenkidee-fuer-werdende-muetter-als-lustiges-sprueche-t-shirt-fuer-kommende-babyparties-designt-von-shokstar-fuer-geildesignt.jpg",
            type: "MODEL"
        ),
        appearanceIds: [
            "566",
            "645",
            "648",
            "719",
            "1",
            "2",
            "366",
            "348",
            "387",
            "92",
            "39",
            "231",
            "317",
            "3",
            "29",
            "328",
            "339"
        ],
        defaultAppearanceId: "2"
    )
    
    let productPD = Product(sizeIds: ["3",
                                      "4",
                                      "5"], images: [
                                        ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/1,width=650,height=650,appearanceId=70,backgroundColor=22262d,crop=detail,modelId=3710/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "MODEL"),
                                        ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/compositions/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/1,width=650,height=650,appearanceId=70,backgroundColor=22262d/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "DESIGN"),
                                        ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/2,width=650,height=650,appearanceId=70,backgroundColor=22262d,crop=detail,modelId=3716/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "MODEL"),
                                        ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/3,width=650,height=650,appearanceId=70,backgroundColor=22262d/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "PRODUCT"),
                                        ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/4,width=650,height=650,appearanceId=70,backgroundColor=22262d/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "PRODUCT"),
                                        ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/1,width=650,height=650,appearanceId=70,backgroundColor=22262d,crop=detail,modelId=5060/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg",
                                                     type: "ALTERNATIVE_MODEL")
                                        
                                        
                                      ], sellableId: "ZbgkEgwNb1TEx7YB0JzD-36-18", ideaId: "61a0db239025455a89e6c1e2", mainDesignId: "300079111", productTypeId: "36", price: ProductPrice(amount: 34.9, currencyId: "1"), name: "One word - Drachen T-Shirt", description: "Das ist der TEST für eine DESCRIPTION!!!!!", tags: [
                                        "one word",
                                        "geschenkidee",
                                        "grün",
                                        "künstlerisch",
                                        "Shokstar",
                                        "Geburtstagsgeschenk",
                                        "handgemalt",
                                        "GEILdesignt",
                                        "drachenkopf",
                                        "rot",
                                        "Comicstyle",
                                        "Dragon head",
                                        "drachen",
                                        "and you are"
                                      ], previewImage: ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/1,width=500,height=500,appearanceId=70,backgroundColor=22262d,crop=list,modelId=3710/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg",
                                                                    type: "MODEL"), appearanceIds: [
                                                                        "70",
                                                                        "26"
                                                                    ], defaultAppearanceId: "70")
    
    var productViewModel = ProductViewModel(product: Product(sizeIds: ["3",
                                                                       "4",
                                                                       "5"], images: [
                                                                         ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/1,width=650,height=650,appearanceId=70,backgroundColor=22262d,crop=detail,modelId=3710/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "MODEL"),
                                                                         ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/compositions/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/1,width=650,height=650,appearanceId=70,backgroundColor=22262d/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "DESIGN"),
                                                                         ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/2,width=650,height=650,appearanceId=70,backgroundColor=22262d,crop=detail,modelId=3716/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "MODEL"),
                                                                         ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/3,width=650,height=650,appearanceId=70,backgroundColor=22262d/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "PRODUCT"),
                                                                         ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/4,width=650,height=650,appearanceId=70,backgroundColor=22262d/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg", type: "PRODUCT"),
                                                                         ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/1,width=650,height=650,appearanceId=70,backgroundColor=22262d,crop=detail,modelId=5060/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg",
                                                                                      type: "ALTERNATIVE_MODEL")
                                                                         
                                                                         
                                                                       ], sellableId: "ZbgkEgwNb1TEx7YB0JzD-36-18", ideaId: "61a0db239025455a89e6c1e2", mainDesignId: "300079111", productTypeId: "36", price: ProductPrice(amount: 34.9, currencyId: "1"), name: "One word - Drachen T-Shirt", description: "Das ist der TEST für eine DESCRIPTION!!!!!", tags: [
                                                                         "one word",
                                                                         "geschenkidee",
                                                                         "grün",
                                                                         "künstlerisch",
                                                                         "Shokstar",
                                                                         "Geburtstagsgeschenk",
                                                                         "handgemalt",
                                                                         "GEILdesignt",
                                                                         "drachenkopf",
                                                                         "rot",
                                                                         "Comicstyle",
                                                                         "Dragon head",
                                                                         "drachen",
                                                                         "and you are"
                                                                       ], previewImage: ProductImage(url: "https://image.spreadshirtmedia.net/image-server/v1/products/T36A70PA4643PT17X42Y1D300079111W25835H39985/views/1,width=500,height=500,appearanceId=70,backgroundColor=22262d,crop=list,modelId=3710/ein-drachen-premium-t-shirt-design-fuer-maenner-und-frauen-mit-der-botschaftone-word-and-you-are-springt-der-drache-einen-foermlich-angemacht-vo.jpg",
                                                                                                     type: "MODEL"), appearanceIds: [
                                                                                                         "70",
                                                                                                         "26"
                                                                                                     ], defaultAppearanceId: "70"))
    
}
