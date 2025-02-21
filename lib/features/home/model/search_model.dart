class SearchResponseDataModel {
  int? id;
  String? name;
  String? symbol;
  String? createdAt;
  String? updatedAt;
  String? alpacaId;
  String? exchange;
  String? description;
  String? assetType;
  String? isin;
  String? industry;
  String? sector;
  int? employees;
  dynamic website;
  dynamic address;
  dynamic netZeroProgress;
  dynamic carbonIntensityScope3;
  dynamic carbonIntensityScope1And2;
  dynamic carbonIntensityScope1And2And3;
  dynamic tempAlignmentScopes1And2;
  dynamic dnshAssessmentPass;
  dynamic goodGovernanceAssessment;
  dynamic contributeToEnvironmentOrSocialObjective;
  dynamic sustainableInvestment;
  dynamic scope1Emissions;
  dynamic scope2Emissions;
  dynamic scope3Emissions;
  dynamic totalEmissions;
  String? listingDate;
  dynamic marketCap;
  int? ibkrConnectionId;
  Image? image;
  dynamic createdBy;
  dynamic updatedBy;

  SearchResponseDataModel(
      {this.id,
        this.name,
        this.symbol,
        this.createdAt,
        this.updatedAt,
        this.alpacaId,
        this.exchange,
        this.description,
        this.assetType,
        this.isin,
        this.industry,
        this.sector,
        this.employees,
        this.website,
        this.address,
        this.netZeroProgress,
        this.carbonIntensityScope3,
        this.carbonIntensityScope1And2,
        this.carbonIntensityScope1And2And3,
        this.tempAlignmentScopes1And2,
        this.dnshAssessmentPass,
        this.goodGovernanceAssessment,
        this.contributeToEnvironmentOrSocialObjective,
        this.sustainableInvestment,
        this.scope1Emissions,
        this.scope2Emissions,
        this.scope3Emissions,
        this.totalEmissions,
        this.listingDate,
        this.marketCap,
        this.ibkrConnectionId,
        this.image,
        this.createdBy,
        this.updatedBy});

  SearchResponseDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    alpacaId = json['alpaca_id'];
    exchange = json['exchange'];
    description = json['description'];
    assetType = json['asset_type'];
    isin = json['isin'];
    industry = json['industry'];
    sector = json['sector'];
    employees = json['employees'];
    website = json['website'];
    address = json['address'];
    netZeroProgress = json['net_zero_progress'];
    carbonIntensityScope3 = json['carbon_intensity_scope_3'];
    carbonIntensityScope1And2 = json['carbon_intensity_scope_1_and_2'];
    carbonIntensityScope1And2And3 =
    json['carbon_intensity_scope_1_and_2_and_3'];
    tempAlignmentScopes1And2 = json['temp_alignment_scopes_1_and_2'];
    dnshAssessmentPass = json['dnsh_assessment_pass'];
    goodGovernanceAssessment = json['good_governance_assessment'];
    contributeToEnvironmentOrSocialObjective =
    json['contribute_to_environment_or_social_objective'];
    sustainableInvestment = json['sustainable_investment'];
    scope1Emissions = json['scope_1_emissions'];
    scope2Emissions = json['scope_2_emissions'];
    scope3Emissions = json['scope_3_emissions'];
    totalEmissions = json['total_emissions'];
    listingDate = json['listing_date'];
    marketCap = json['market_cap'];
    ibkrConnectionId = json['ibkr_connection_id'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    createdBy = json['createdBy'];
    updatedBy = json['updatedBy'];
  }
}

class Image {
  int? id;
  String? name;
  dynamic alternativeText;
  dynamic caption;
  int? width;
  int? height;
  dynamic formats;
  String? hash;
  String? ext;
  String? mime;
  double? size;
  String? url;
  dynamic previewUrl;
  String? provider;
  dynamic providerMetadata;
  String? folderPath;
  String? createdAt;
  String? updatedAt;

  Image(
      {this.id,
        this.name,
        this.alternativeText,
        this.caption,
        this.width,
        this.height,
        this.formats,
        this.hash,
        this.ext,
        this.mime,
        this.size,
        this.url,
        this.previewUrl,
        this.provider,
        this.providerMetadata,
        this.folderPath,
        this.createdAt,
        this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    alternativeText = json['alternativeText'];
    caption = json['caption'];
    width = json['width'];
    height = json['height'];
    formats = json['formats'];
    hash = json['hash'];
    ext = json['ext'];
    mime = json['mime'];
    size = json['size'];
    url = json['url'];
    previewUrl = json['previewUrl'];
    provider = json['provider'];
    providerMetadata = json['provider_metadata'];
    folderPath = json['folderPath'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}