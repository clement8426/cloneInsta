import * as FilePond from "filepond";
import FilePondPluginImagePreview from "filepond-plugin-image-preview";
import FilePondPluginFileValidateType from "filepond-plugin-file-validate-type";
import FilePondPluginImageCrop from "filepond-plugin-image-crop";

document.addEventListener("turbo:load", LoadFilePond);

function LoadFilePond() {
  FilePond.registerPlugin(
    FilePondPluginImagePreview,
    FilePondPluginFileValidateType,
    FilePondPluginImageCrop
  );

  // Get a reference to the file input element
  const inputElement = document.querySelector("#post-images");

  // Create a FilePond instance
  const pond = FilePond.create(inputElement, {
    credits: {},
    storeAsFile: true,
    allowMultiple: true,
    allowReorder: true,
    acceptedFileTypes: ["image/*"],
    allowImageCrop: true,
  });
}
