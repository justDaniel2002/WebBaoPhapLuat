
import bcrypt from 'bcrypt';
import crypto from 'crypto'

// export async function hashPassword(password:string) {
//     try {
//       // Generate a salt
//       const salt = "mysalte";
  
//       // Hash the password with the salt
//       const hashedPassword = await bcrypt.hash(password, salt);
  
//       // Return the hashed password
//       return hashedPassword;
//     } catch (error) {
//       console.error('Error hashing password:', error);
//       throw error;
//     }
//   }

export function hashPassword(password:string) {
  return crypto.createHash('sha256').update(password).digest('hex');
}