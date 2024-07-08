import { initializeApp } from "firebase/app";
import {
  getFirestore,
  collection,
  query,
  where,
  getDocs,
  getDoc,
  doc,
  setDoc,
  updateDoc,
} from "firebase/firestore";
import {
  getAuth,
  createUserWithEmailAndPassword,
  sendEmailVerification as sendVerificationEmail,
  signInWithEmailAndPassword as signInWithEmail,
  signOut,
  sendPasswordResetEmail,
} from "firebase/auth";
import { v4 as uuidv4 } from "uuid"; // npm install uuid

// Your Firebase configuration
const firebaseConfig = {
  apiKey: process.env.REACT_APP_FIREBASE_API_KEY,
  authDomain: process.env.REACT_APP_FIREBASE_AUTH_DOMAIN,
  projectId: process.env.REACT_APP_FIREBASE_PROJECT_ID,
  storageBucket: process.env.REACT_APP_FIREBASE_STORAGE_BUCKET,
  messagingSenderId: process.env.REACT_APP_FIREBASE_MESSAGING_SENDER_ID,
  appId: process.env.REACT_APP_FIREBASE_APP_ID,
  measurementId: process.env.REACT_APP_FIREBASE_MEASUREMENT_ID,
};

const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const db = getFirestore(app);

// Define temporary admin credentials (replace with your actual admin credentials)
const adminEmail = process.env.REACT_APP_ADMIN_EMAIL;
const adminPassword = process.env.REACT_APP_ADMIN_PASSWORD;
// Replace with a secure password

export const signUpWithEmailAndPassword = async (
  email,
  password,
  invitationCode
) => {
  try {
    if (!/\S+@\S+\.\S+/.test(email)) {
      throw new Error("Invalid email format.");
    }

    const userCredential = await createUserWithEmailAndPassword(
      auth,
      email,
      password
    );

    // Add user data to Firestore
    const userDocRef = doc(db, "users", userCredential.user.uid);
    await setDoc(userDocRef, {
      email: email,
      invitationCode: invitationCode,
      createdAt: new Date(),
    });

    // Send email verification
    await sendVerificationEmail(userCredential.user);

    // Sign out the user immediately after sending the verification email
    await signOut(auth);

    return userCredential.user;
  } catch (error) {
    console.error("Error signing up:", error.message);
    throw error;
  }
};

export const sendEmailVerification = async (user) => {
  try {
    if (user) {
      await sendVerificationEmail(user);
    } else {
      throw new Error("No user found. Please sign in again.");
    }
  } catch (error) {
    console.error("Error sending email verification:", error.message);
    throw error;
  }
};

export const signInWithEmailAndPassword = async (email, password) => {
  try {
    const userCredential = await signInWithEmail(auth, email, password);

    // Check if the email is verified
    if (!userCredential.user.emailVerified) {
      await signOut(auth); // Sign out the user immediately
      throw new Error(
        "Email not verified. Please check your email for the verification link."
      );
    }

    return userCredential.user;
  } catch (error) {
    console.error("Error signing in:", error.message);
    throw error;
  }
};

export const checkIfEmailVerified = async (email) => {
  try {
    const user = auth.currentUser;
    if (user) {
      await user.reload();
      return user.email === email && user.emailVerified;
    }
    return false;
  } catch (error) {
    console.error("Error checking email verification:", error.message);
    throw error;
  }
};

// In your firebase.js
export const checkIfUserExists = async (email) => {
  try {
    const usersRef = collection(db, "users");
    const q = query(usersRef, where("email", "==", email));
    const querySnapshot = await getDocs(q);

    if (!querySnapshot.empty) {
      const user = querySnapshot.docs[0].data();
      if (user.emailVerified) {
        return true;
      }
    }
    return false;
  } catch (error) {
    console.error("Error checking if user exists:", error.message);
    throw error;
  }
};

export const resetPassword = async (email) => {
  try {
    await sendPasswordResetEmail(auth, email);
  } catch (error) {
    console.error("Error resetting password:", error.message);
    throw error;
  }
};

export const signOutUser = async () => {
  try {
    await signOut(auth);
  } catch (error) {
    console.error("Error signing out:", error.message);
    throw error;
  }
};

// Check if an invitation code is valid and unused
export const checkInvitationCode = async (code) => {
  try {
    const codeDoc = await getDoc(doc(db, "invitationCodes", code));
    if (codeDoc.exists() && !codeDoc.data().used) {
      return true;
    }
    return false;
  } catch (error) {
    console.error("Error checking invitation code:", error.message);
    throw error;
  }
};

// Mark an invitation code as used
export const markCodeAsUsed = async (code) => {
  try {
    await updateDoc(doc(db, "invitationCodes", code), {
      used: true,
    });
  } catch (error) {
    console.error("Error marking code as used:", error.message);
    throw error;
  }
};

export const generateInvitationCode = async () => {
  try {
    const newCode = uuidv4();
    console.log("Generated Code:", newCode); // Log generated code
    await setDoc(doc(db, "invitationCodes", newCode), {
      used: false,
    });
    console.log("Code saved to Firestore"); // Log success
    return newCode;
  } catch (error) {
    console.error("Error generating invitation code:", error.message); // Log error
    throw error;
  }
};

export { auth, db, adminEmail, adminPassword };
