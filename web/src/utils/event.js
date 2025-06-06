import { DefaultData } from "@/stores/index";
import { FetchNUI } from "@/utils";
import { storeToRefs } from "pinia";

export default function () {
  const StoreData = DefaultData();
  const { } = storeToRefs(StoreData);

  window.addEventListener("message", async ({ data }) => {
    switch (data.action) {
      case 'checkNui':
        FetchNUI('nuiReady', {})
        break;
      default:
        break;
    }
  });
}