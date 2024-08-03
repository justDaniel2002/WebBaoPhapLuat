export function isValidEmail(email) {
  // Define the regex for a valid email address
  const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

  // Test the email against the regex
  return regex.test(email);
}

export function formatDate(isoString) {
  const date = new Date(isoString);

  // Pad single digit numbers with a leading zero
  const pad = (num) => (num < 10 ? "0" : "") + num;

  const day = pad(date.getUTCDate());
  const month = pad(date.getUTCMonth() + 1); // Months are zero-indexed
  const year = date.getUTCFullYear();
  const hours = pad(date.getUTCHours());
  const minutes = pad(date.getUTCMinutes());

  return `${day}/${month}/${year} ${hours}:${minutes}`;
}

export function getMonthFromDate(dateString) {
  const date = new Date(dateString);
  const month = date.getMonth() + 1; // getMonth() returns month index (0-11), so add 1 to get the actual month (1-12)
  return `Tháng ${month}`;
}

export function gettDayFormattedDDMM(inputDate) {
  const date = new Date(inputDate);

  const day = String(date.getDate()).padStart(2, '0');
  const month = String(date.getMonth() + 1).padStart(2, '0'); // Months are zero-indexed

  return `${day}/${month}`;
}

export function getMillisecondsAgo(daysAgo) {
  const today = new Date();
  const pastDate = new Date(today);
  pastDate.setDate(today.getDate() - daysAgo);
  return pastDate.getTime();
}

export function formatDateToDDMM(dateString) {
  const date = new Date(dateString);
  
  const day = String(date.getUTCDate()).padStart(2, '0'); // Get the day of the month and pad with zero if needed
  const month = String(date.getUTCMonth() + 1).padStart(2, '0'); // Get the month (0-based) and pad with zero if needed
  
  return `${day}/${month}`;
}