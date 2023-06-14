import { MongoClient } from 'mongodb';

const client = new MongoClient('mongodb://mongodb:27017');

async function connectToMongoDB() {
  try {
    await client.connect();
    console.log('Connected to MongoDB');
	return true;
    // Use the client to perform MongoDB operations
  } catch (error) {
    console.error('Error connecting to MongoDB', error);
	return false;
  }
}

export default async function handler(req, res) {
	let connected = await connectToMongoDB();

	const nodeVersion = process.version;
	res.status(200).json({ version: nodeVersion, connected: connected });
  }
  