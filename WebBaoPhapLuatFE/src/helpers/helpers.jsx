export function isValidEmail(email) {
    // Define the regex for a valid email address
    const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    // Test the email against the regex
    return regex.test(email);
}


export function formatDate(isoString) {
    const date = new Date(isoString);

    // Pad single digit numbers with a leading zero
    const pad = (num) => (num < 10 ? '0' : '') + num;

    const day = pad(date.getUTCDate());
    const month = pad(date.getUTCMonth() + 1); // Months are zero-indexed
    const year = date.getUTCFullYear();
    const hours = pad(date.getUTCHours());
    const minutes = pad(date.getUTCMinutes());

    return `${day}/${month}/${year} ${hours}:${minutes}`;
}