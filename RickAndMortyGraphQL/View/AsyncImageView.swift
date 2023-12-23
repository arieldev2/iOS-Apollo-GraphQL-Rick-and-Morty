//
//  AsyncImageView.swift
//  RickAndMortyGraphQL
//
//  Created by Ariel Ortiz on 12/22/23.
//

import SwiftUI

struct AsyncImageView: View {
    
    let url: URL?
    @State private var image: UIImage?
    @State private var imageState: ImageState = .loading
    
    var body: some View {
        Group{
            switch imageState {
            case .success:
                if let image = image{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 350)
                }
            case .loading:
                HStack(alignment: .center){
                    ProgressView()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.black)
                        .padding()
                        .padding(.top, 20)
                }
                .frame(maxWidth: .infinity)
            case .failed:
                HStack(alignment: .center){
                    Image(systemName: "xmark.octagon")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundStyle(.black)
                        .padding()
                        .padding(.top, 20)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .onAppear{
            if let url = url{
                Task{
                    do{
                        image = try await downloadImage(url: url)
                        imageState = .success
                    }catch{
                        imageState = .failed
                    }
                }
            }else{
                imageState = .failed
            }
        }
    }
    
    private func downloadImage(url: URL) async throws -> UIImage{
        let cache = CacheManager.shared
        if let cachedImage = cache[url.absoluteString]{
            print("Image already cached")
            return cachedImage
        }
        
        do{
            let (data, _) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data){
                cache[url.absoluteString] = image
                //print("Image")
                return image
            }
        }catch{
            throw ImageError.downloadFailed
        }
        throw ImageError.downloadFailed
        
    }
    
    enum ImageState{
        case success
        case loading
        case failed
    }
    
    enum ImageError: Error{
        case downloadFailed
    }
}

