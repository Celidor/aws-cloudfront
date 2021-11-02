function handler(event) {
    var response = event.response;
    var headers = response.headers;

    // Set HTTP security headers
    // Since JavaScript doesn't allow for hyphens in variable names, we use the dict["key"] notation 
    headers['strict-transport-security'] = { value: 'max-age=63072000; includeSubdomains; preload'}; 
    headers['content-security-policy'] = { value: "default-src 'none'; img-src 'self'; script-src 'self'; style-src 'self'; object-src 'none'"}; 
    headers['x-content-type-options'] = { value: 'nosniff'}; 
    headers['x-frame-options'] = {value: 'DENY'}; 
    headers['x-xss-protection'] = {value: '1; mode=block'};
    headers['referrer-policy'] = {value: 'no-referrer'};
    headers['permissions-policy'] = {value: 'accelerometer=(none), ambient-light-sensor=(none), autoplay=(none), camera=(none), encrypted-media=(none), fullscreen=(none), geolocation=(none), gyroscope=(none), magnetometer=(none), microphone=(none), midi=(none), payment=(none), picture-in-picture=(none), speaker=(none), usb=(none), vibrate=(none), vr=(none)'}; 

    // Return the response to viewers 
    return response;
}