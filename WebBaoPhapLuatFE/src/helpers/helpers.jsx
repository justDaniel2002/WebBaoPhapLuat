export function isValidEmail(email) {
    // Define the regex for a valid email address
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Test the email against the regex
    return regex.test(email);
}

