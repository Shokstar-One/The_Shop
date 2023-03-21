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
    
}
