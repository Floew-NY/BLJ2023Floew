import axios from "axios";

export interface ImageApiProps {
  id: string;
  url: string;
  width: number;
  height: number;
}
export const defaultAxiosInstance = axios.create({
  baseURL: process.env.IMAGE_API_URL || "https://api.thecatapi.com/v1/images",
});
export async function getRandomImage() {
  const responce = await defaultAxiosInstance.get<ImageApiProps[]>("search");
  return responce.data[0].url;
}
