
import bcrypt from 'bcrypt';

export async function hashPassword(password:string) {
    try {
      // Generate a salt
      const salt = await bcrypt.genSalt(10);
  
      // Hash the password with the salt
      const hashedPassword = await bcrypt.hash(password, salt);
  
      // Return the hashed password
      return hashedPassword;
    } catch (error) {
      console.error('Error hashing password:', error);
      throw error;
    }
  }