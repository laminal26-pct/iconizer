//
// ImageSetViewController.swift
// Iconizer
// https://github.com/raphaelhanneken/iconizer
//

import Cocoa

/// Handles the ImageSet view.
class ImageSetViewController: NSViewController, IconizerViewControllerProtocol {

    /// Reference to the Image Well.
    @IBOutlet weak var imageView: NSImageView!

    /// Holds the ImageSet model
    let imageSet = ImageSet()

    /// Name of the corresponding nib file.
    override var nibName: String {
        return "ImageSetView"
    }

    // MARK: Iconizer View Controller

    func generateRequiredImages() throws {
        guard let image = imageView.image else {
            throw IconizerViewControllerError.missingImage
        }
        imageSet.generateScaledImagesFromImage(image)
    }

    func saveAssetCatalogNamed(_ name: String, toURL url: URL) throws {
        try imageSet.saveAssetCatalogNamed(name, toURL: url)
    }

    func openSelectedImage(_ image: NSImage?) throws {
        guard let img = image else {
            throw ImageSetError.selectedImageNotFound
        }
        imageView.image = img
    }
}
