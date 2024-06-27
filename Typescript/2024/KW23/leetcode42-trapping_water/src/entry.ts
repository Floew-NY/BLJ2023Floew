import Bun from "bun"
import { findAncestor } from "typescript";

let file = await Bun.file("rainfall.txt").text()

const heightArray = file.split(",").map(parseInt);

let maxHeight = Math.max(...heightArray)
let waterVolume = 0;

let currentLeftRim = heightArray.length
let currentRightRim = 0
for (let layer = maxHeight; 0 < layer; layer--) {
    const firstOnLayer = heightArray.indexOf(layer);
    const lastOnLayer = heightArray.lastIndexOf(layer);
    if (firstOnLayer != -1) { // if theres nothing on this layer
        currentLeftRim = Math.min(...[firstOnLayer, currentLeftRim])
        currentRightRim = Math.max(...[lastOnLayer, currentRightRim])
    }
    const potentialWaterOnLayer = currentRightRim - currentLeftRim - 1
    if (potentialWaterOnLayer <= 0) continue; // will not add negative water
    let mountainInWaterCount = -2
    heightArray.forEach((currentMountainHeight) => (currentMountainHeight >= layer) ? mountainInWaterCount++ : 0);
    if (mountainInWaterCount < 0) continue;
    const waterOnLayerCount = potentialWaterOnLayer - mountainInWaterCount;
    waterVolume += waterOnLayerCount;
}

function findMax(array: number[]) {
    let max = 0;
    array.forEach((current) => { max++ })
    return max;
}

console.log(`Water Volume: ${waterVolume}`);