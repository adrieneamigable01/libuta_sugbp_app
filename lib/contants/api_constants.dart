const _kProductionDomain = 'api.goshop.website';
const _kDevelopmentDomain = 'http://localhost/libutasugbo_api/';

const _kAPIDomain = _kDevelopmentDomain;

var kBuildNumber = "0.0.3";

Uri kAuthLogin = Uri.parse('${_kAPIDomain}api/auth/login'); // Login
Uri kAuthCustomerRegister = Uri.https(_kAPIDomain, '/api/auth/register'); // Register customer account

// User
Uri kGetUserProfile = Uri.parse('${_kAPIDomain}api/users/profile'); // User Profile

// Listings
Uri kGetUserListing = Uri.parse('${_kAPIDomain}api/listing'); // Listing List