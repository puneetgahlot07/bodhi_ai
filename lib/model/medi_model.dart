// To parse this JSON data, do
//
//     final medinieModel = medinieModelFromJson(jsonString);

import 'dart:convert';

List<MedinieModel> medinieModelFromJson(String str) => List<MedinieModel>.from(
    json.decode(str).map((x) => MedinieModel.fromJson(x)));

String medinieModelToJson(List<MedinieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MedinieModel {
  String? productNdc;
  String? genericName;
  String? labelerName;
  String? brandName;
  List<ActiveIngredient>? activeIngredients;
  bool? finished;
  List<Packaging>? packaging;
  String? listingExpirationDate;
  Openfda? openfda;
  String? marketingCategory;
  String? dosageForm;
  String? splId;
  String? productType;
  List<String>? route;
  String? marketingStartDate;
  String? productId;
  String? applicationNumber;
  String? brandNameBase;
  List<String>? pharmClass;

  MedinieModel({
    this.productNdc,
    this.genericName,
    this.labelerName,
    this.brandName,
    this.activeIngredients,
    this.finished,
    this.packaging,
    this.listingExpirationDate,
    this.openfda,
    this.marketingCategory,
    this.dosageForm,
    this.splId,
    this.productType,
    this.route,
    this.marketingStartDate,
    this.productId,
    this.applicationNumber,
    this.brandNameBase,
    this.pharmClass,
  });

  factory MedinieModel.fromJson(Map<String, dynamic> json) => MedinieModel(
        productNdc: json["product_ndc"],
        genericName: json["generic_name"],
        labelerName: json["labeler_name"],
        brandName: json["brand_name"],
        activeIngredients: json["active_ingredients"] == null
            ? []
            : List<ActiveIngredient>.from(json["active_ingredients"]!
                .map((x) => ActiveIngredient.fromJson(x))),
        finished: json["finished"],
        packaging: json["packaging"] == null
            ? []
            : List<Packaging>.from(
                json["packaging"]!.map((x) => Packaging.fromJson(x))),
        listingExpirationDate: json["listing_expiration_date"],
        openfda:
            json["openfda"] == null ? null : Openfda.fromJson(json["openfda"]),
        marketingCategory: json["marketing_category"],
        dosageForm: json["dosage_form"],
        splId: json["spl_id"],
        productType: json["product_type"],
        route: json["route"] == null
            ? []
            : List<String>.from(json["route"]!.map((x) => x)),
        marketingStartDate: json["marketing_start_date"],
        productId: json["product_id"],
        applicationNumber: json["application_number"],
        brandNameBase: json["brand_name_base"],
        pharmClass: json["pharm_class"] == null
            ? []
            : List<String>.from(json["pharm_class"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "product_ndc": productNdc,
        "generic_name": genericName,
        "labeler_name": labelerName,
        "brand_name": brandName,
        "active_ingredients": activeIngredients == null
            ? []
            : List<dynamic>.from(activeIngredients!.map((x) => x.toJson())),
        "finished": finished,
        "packaging": packaging == null
            ? []
            : List<dynamic>.from(packaging!.map((x) => x.toJson())),
        "listing_expiration_date": listingExpirationDate,
        "openfda": openfda?.toJson(),
        "marketing_category": marketingCategory,
        "dosage_form": dosageForm,
        "spl_id": splId,
        "product_type": productType,
        "route": route == null ? [] : List<dynamic>.from(route!.map((x) => x)),
        "marketing_start_date": marketingStartDate,
        "product_id": productId,
        "application_number": applicationNumber,
        "brand_name_base": brandNameBase,
        "pharm_class": pharmClass == null
            ? []
            : List<dynamic>.from(pharmClass!.map((x) => x)),
      };
}

class ActiveIngredient {
  String? name;
  String? strength;

  ActiveIngredient({
    this.name,
    this.strength,
  });

  factory ActiveIngredient.fromJson(Map<String, dynamic> json) =>
      ActiveIngredient(
        name: json["name"],
        strength: json["strength"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "strength": strength,
      };
}

class Openfda {
  List<String>? manufacturerName;
  List<String>? rxcui;
  List<String>? splSetId;
  List<bool>? isOriginalPackager;
  List<String>? nui;
  List<String>? pharmClassMoa;
  List<String>? pharmClassCs;
  List<String>? pharmClassEpc;
  List<String>? unii;

  Openfda({
    this.manufacturerName,
    this.rxcui,
    this.splSetId,
    this.isOriginalPackager,
    this.nui,
    this.pharmClassMoa,
    this.pharmClassCs,
    this.pharmClassEpc,
    this.unii,
  });

  factory Openfda.fromJson(Map<String, dynamic> json) => Openfda(
        manufacturerName: json["manufacturer_name"] == null
            ? []
            : List<String>.from(json["manufacturer_name"]!.map((x) => x)),
        rxcui: json["rxcui"] == null
            ? []
            : List<String>.from(json["rxcui"]!.map((x) => x)),
        splSetId: json["spl_set_id"] == null
            ? []
            : List<String>.from(json["spl_set_id"]!.map((x) => x)),
        isOriginalPackager: json["is_original_packager"] == null
            ? []
            : List<bool>.from(json["is_original_packager"]!.map((x) => x)),
        nui: json["nui"] == null
            ? []
            : List<String>.from(json["nui"]!.map((x) => x)),
        pharmClassMoa: json["pharm_class_moa"] == null
            ? []
            : List<String>.from(json["pharm_class_moa"]!.map((x) => x)),
        pharmClassCs: json["pharm_class_cs"] == null
            ? []
            : List<String>.from(json["pharm_class_cs"]!.map((x) => x)),
        pharmClassEpc: json["pharm_class_epc"] == null
            ? []
            : List<String>.from(json["pharm_class_epc"]!.map((x) => x)),
        unii: json["unii"] == null
            ? []
            : List<String>.from(json["unii"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "manufacturer_name": manufacturerName == null
            ? []
            : List<dynamic>.from(manufacturerName!.map((x) => x)),
        "rxcui": rxcui == null ? [] : List<dynamic>.from(rxcui!.map((x) => x)),
        "spl_set_id":
            splSetId == null ? [] : List<dynamic>.from(splSetId!.map((x) => x)),
        "is_original_packager": isOriginalPackager == null
            ? []
            : List<dynamic>.from(isOriginalPackager!.map((x) => x)),
        "nui": nui == null ? [] : List<dynamic>.from(nui!.map((x) => x)),
        "pharm_class_moa": pharmClassMoa == null
            ? []
            : List<dynamic>.from(pharmClassMoa!.map((x) => x)),
        "pharm_class_cs": pharmClassCs == null
            ? []
            : List<dynamic>.from(pharmClassCs!.map((x) => x)),
        "pharm_class_epc": pharmClassEpc == null
            ? []
            : List<dynamic>.from(pharmClassEpc!.map((x) => x)),
        "unii": unii == null ? [] : List<dynamic>.from(unii!.map((x) => x)),
      };
}

class Packaging {
  String? packageNdc;
  String? description;
  String? marketingStartDate;
  bool? sample;

  Packaging({
    this.packageNdc,
    this.description,
    this.marketingStartDate,
    this.sample,
  });

  factory Packaging.fromJson(Map<String, dynamic> json) => Packaging(
        packageNdc: json["package_ndc"],
        description: json["description"],
        marketingStartDate: json["marketing_start_date"],
        sample: json["sample"],
      );

  Map<String, dynamic> toJson() => {
        "package_ndc": packageNdc,
        "description": description,
        "marketing_start_date": marketingStartDate,
        "sample": sample,
      };
}





// class MedicineModelOpenfda {
//   List<String?>? manufacturerName;
//   List<String?>? rxcui;
//   List<String?>? splSetId;
//   List<bool?>? isOriginalPackager;
//   List<String?>? nui;
//   List<String?>? pharmClassMoa;
//   List<String?>? pharmClassCs;
//   List<String?>? pharmClassEpc;
//   List<String?>? unii;

//   MedicineModelOpenfda({
//     this.manufacturerName,
//     this.rxcui,
//     this.splSetId,
//     this.isOriginalPackager,
//     this.nui,
//     this.pharmClassMoa,
//     this.pharmClassCs,
//     this.pharmClassEpc,
//     this.unii,
//   });
//   MedicineModelOpenfda.fromJson(Map<String, dynamic> json) {
//     if (json['manufacturer_name'] != null) {
//       final v = json['manufacturer_name'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       manufacturerName = arr0;
//     }
//     if (json['rxcui'] != null) {
//       final v = json['rxcui'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       rxcui = arr0;
//     }
//     if (json['spl_set_id'] != null) {
//       final v = json['spl_set_id'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       splSetId = arr0;
//     }
//     if (json['is_original_packager'] != null) {
//       final v = json['is_original_packager'];
//       final arr0 = <bool>[];
//       v.forEach((v) {
//         arr0.add(v);
//       });
//       isOriginalPackager = arr0;
//     }
//     if (json['nui'] != null) {
//       final v = json['nui'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       nui = arr0;
//     }
//     if (json['pharm_class_moa'] != null) {
//       final v = json['pharm_class_moa'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       pharmClassMoa = arr0;
//     }
//     if (json['pharm_class_cs'] != null) {
//       final v = json['pharm_class_cs'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       pharmClassCs = arr0;
//     }
//     if (json['pharm_class_epc'] != null) {
//       final v = json['pharm_class_epc'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       pharmClassEpc = arr0;
//     }
//     if (json['unii'] != null) {
//       final v = json['unii'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       unii = arr0;
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     if (manufacturerName != null) {
//       final v = manufacturerName;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['manufacturer_name'] = arr0;
//     }
//     if (rxcui != null) {
//       final v = rxcui;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['rxcui'] = arr0;
//     }
//     if (splSetId != null) {
//       final v = splSetId;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['spl_set_id'] = arr0;
//     }
//     if (isOriginalPackager != null) {
//       final v = isOriginalPackager;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['is_original_packager'] = arr0;
//     }
//     if (nui != null) {
//       final v = nui;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['nui'] = arr0;
//     }
//     if (pharmClassMoa != null) {
//       final v = pharmClassMoa;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['pharm_class_moa'] = arr0;
//     }
//     if (pharmClassCs != null) {
//       final v = pharmClassCs;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['pharm_class_cs'] = arr0;
//     }
//     if (pharmClassEpc != null) {
//       final v = pharmClassEpc;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['pharm_class_epc'] = arr0;
//     }
//     if (unii != null) {
//       final v = unii;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['unii'] = arr0;
//     }
//     return data;
//   }
// }

// class MedicineModelPackaging {
//   String? packageNdc;
//   String? description;
//   String? marketingStartDate;
//   bool? sample;

//   MedicineModelPackaging({
//     this.packageNdc,
//     this.description,
//     this.marketingStartDate,
//     this.sample,
//   });
//   MedicineModelPackaging.fromJson(Map<String, dynamic> json) {
//     packageNdc = json['package_ndc']?.toString();
//     description = json['description']?.toString();
//     marketingStartDate = json['marketing_start_date']?.toString();
//     sample = json['sample'];
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['package_ndc'] = packageNdc;
//     data['description'] = description;
//     data['marketing_start_date'] = marketingStartDate;
//     data['sample'] = sample;
//     return data;
//   }
// }

// class MedicineModelActiveIngredients {
//   String? name;
//   String? strength;

//   MedicineModelActiveIngredients({
//     this.name,
//     this.strength,
//   });
//   MedicineModelActiveIngredients.fromJson(Map<String, dynamic> json) {
//     name = json['name']?.toString();
//     strength = json['strength']?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['name'] = name;
//     data['strength'] = strength;
//     return data;
//   }
// }

// class MedicineModel {
//   String? productNdc;
//   String? genericName;
//   String? labelerName;
//   String? brandName;
//   List<MedicineModelActiveIngredients?>? activeIngredients;
//   bool? finished;
//   List<MedicineModelPackaging?>? packaging;
//   String? listingExpirationDate;
//   MedicineModelOpenfda? openfda;
//   String? marketingCategory;
//   String? dosageForm;
//   String? splId;
//   String? productType;
//   List<String?>? route;
//   String? marketingStartDate;
//   String? productId;
//   String? applicationNumber;
//   String? brandNameBase;
//   List<String?>? pharmClass;

//   MedicineModel({
//     this.productNdc,
//     this.genericName,
//     this.labelerName,
//     this.brandName,
//     this.activeIngredients,
//     this.finished,
//     this.packaging,
//     this.listingExpirationDate,
//     this.openfda,
//     this.marketingCategory,
//     this.dosageForm,
//     this.splId,
//     this.productType,
//     this.route,
//     this.marketingStartDate,
//     this.productId,
//     this.applicationNumber,
//     this.brandNameBase,
//     this.pharmClass,
//   });
//   MedicineModel.fromJson(Map<String, dynamic> json) {
//     productNdc = json['product_ndc']?.toString();
//     genericName = json['generic_name']?.toString();
//     labelerName = json['labeler_name']?.toString();
//     brandName = json['brand_name']?.toString();
//     if (json['active_ingredients'] != null) {
//       final v = json['active_ingredients'];
//       final arr0 = <MedicineModelActiveIngredients>[];
//       v.forEach((v) {
//         arr0.add(MedicineModelActiveIngredients.fromJson(v));
//       });
//       activeIngredients = arr0;
//     }
//     finished = json['finished'];
//     if (json['packaging'] != null) {
//       final v = json['packaging'];
//       final arr0 = <MedicineModelPackaging>[];
//       v.forEach((v) {
//         arr0.add(MedicineModelPackaging.fromJson(v));
//       });
//       packaging = arr0;
//     }
//     listingExpirationDate = json['listing_expiration_date']?.toString();
//     openfda = (json['openfda'] != null)
//         ? MedicineModelOpenfda.fromJson(json['openfda'])
//         : null;
//     marketingCategory = json['marketing_category']?.toString();
//     dosageForm = json['dosage_form']?.toString();
//     splId = json['spl_id']?.toString();
//     productType = json['product_type']?.toString();
//     if (json['route'] != null) {
//       final v = json['route'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       route = arr0;
//     }
//     marketingStartDate = json['marketing_start_date']?.toString();
//     productId = json['product_id']?.toString();
//     applicationNumber = json['application_number']?.toString();
//     brandNameBase = json['brand_name_base']?.toString();
//     if (json['pharm_class'] != null) {
//       final v = json['pharm_class'];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       pharmClass = arr0;
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['product_ndc'] = productNdc;
//     data['generic_name'] = genericName;
//     data['labeler_name'] = labelerName;
//     data['brand_name'] = brandName;
//     if (activeIngredients != null) {
//       final v = activeIngredients;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v!.toJson());
//       });
//       data['active_ingredients'] = arr0;
//     }
//     data['finished'] = finished;
//     if (packaging != null) {
//       final v = packaging;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v!.toJson());
//       });
//       data['packaging'] = arr0;
//     }
//     data['listing_expiration_date'] = listingExpirationDate;
//     if (openfda != null) {
//       data['openfda'] = openfda!.toJson();
//     }
//     data['marketing_category'] = marketingCategory;
//     data['dosage_form'] = dosageForm;
//     data['spl_id'] = splId;
//     data['product_type'] = productType;
//     if (route != null) {
//       final v = route;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['route'] = arr0;
//     }
//     data['marketing_start_date'] = marketingStartDate;
//     data['product_id'] = productId;
//     data['application_number'] = applicationNumber;
//     data['brand_name_base'] = brandNameBase;
//     if (pharmClass != null) {
//       final v = pharmClass;
//       final arr0 = [];
//       v!.forEach((v) {
//         arr0.add(v);
//       });
//       data['pharm_class'] = arr0;
//     }
//     return data;
//   }
// }
