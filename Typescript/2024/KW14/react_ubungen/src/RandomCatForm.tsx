import React, { useEffect, useState } from "react";
import { getRandomImage } from "./services/Api";

function RandomCatForm() {
  const [image, setImage] = useState<string>(
    "https://www.google.com/images/branding/googlelogo/2x/googlelogo_light_color_272x92dp.png"
  );
  useEffect(() => {
    (async () => {
      setImage(await getRandomImage());
    })();
  });
  return (
    <img src={image} style={{ width: 128, height: 128, overflow: "clip" }} />
  );
}

export default RandomCatForm;
