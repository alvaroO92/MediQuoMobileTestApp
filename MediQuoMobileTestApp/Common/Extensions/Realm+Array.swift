//
//  Realm+Array.swift
//  MediQuoMobileTestApp
//
//  Created by Alvaro Orti Moreno on 8/2/22.
//  Copyright © 2022 Alvaro Orti Moreno. All rights reserved.
//

import RealmSwift

extension RealmCollection {
  func toArray<T>() ->[T]  {
    return self.compactMap{$0 as? T}
  }
}
