(in-package #:mfiano.lib.ffi.libsdl3)

(define-sdl-function %acquire-gpu-command-buffer ()
  (:name "SDL_AcquireGPUCommandBuffer"
   :type (:pointer (:struct gpu-command-buffer))
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device))))

(define-sdl-function %acquire-gpu-swapchain-texture ()
  (:name "SDL_AcquireGPUSwapchainTexture"
   :type :bool
   :check #'identity)
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (window (:pointer (:struct window)))
  (swapchain-texture (:pointer (:pointer (:struct gpu-texture))))
  (swapchain-texture-width (:pointer :uint32))
  (swapchain-texture-height (:pointer :uint32)))

(define-sdl-function %begin-gpu-compute-pass ()
  (:name "SDL_BeginGPUComputePass"
   :type (:pointer (:struct gpu-compute-pass)))
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (storage-texture-bindings (:pointer (:struct gpu-storage-texture-read-write-binding)))
  (num-storage-texture-bindings :uint32)
  (storage-buffer-bindings (:pointer (:struct gpu-storage-buffer-read-write-binding)))
  (num-storage-buffer-bindings :uint32))

(define-sdl-function %begin-gpu-copy-pass ()
  (:name "SDL_BeginGPUCopyPass"
   :type (:pointer (:struct gpu-copy-pass)))
  (command-buffer (:pointer (:struct gpu-command-buffer))))

(define-sdl-function %begin-gpu-render-pass ()
  (:name "SDL_BeginGPURenderPass"
   :type (:pointer (:struct gpu-render-pass)))
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (color-target-infos (:pointer (:struct gpu-color-target-info)))
  (num-color-targets :uint32)
  (depth-stencil-target-info (:pointer (:struct gpu-depth-stencil-target-info))))

(define-sdl-function %bind-gpu-compute-pipeline ()
  (:name "SDL_BindGPUComputePipeline")
  (compute-pass (:pointer (:struct gpu-compute-pass)))
  (compute-pipeline (:pointer (:struct gpu-compute-pipeline))))

(define-sdl-function %bind-gpu-compute-samplers ()
  (:name "SDL_BindGPUComputeSamplers")
  (compute-pass (:pointer (:struct gpu-compute-pass)))
  (first-slot :uint32)
  (texture-sampler-bindings (:pointer (:struct gpu-texture-sampler-binding)))
  (num-bindings :uint32))

(define-sdl-function %bind-gpu-compute-storage-buffers ()
  (:name "SDL_BindGPUComputeStorageBuffers")
  (compute-pass (:pointer (:struct gpu-compute-pass)))
  (first-slot :uint32)
  (storage-buffers (:pointer (:pointer (:struct gpu-buffer))))
  (num-bindings :uint32))

(define-sdl-function %bind-gpu-compute-storage-textures ()
  (:name "SDL_BindGPUComputeStorageTextures")
  (compute-pass (:pointer (:struct gpu-compute-pass)))
  (first-slot :uint32)
  (storage-textures (:pointer (:pointer (:struct gpu-texture))))
  (num-bindings :uint32))

(define-sdl-function %bind-gpu-fragment-samplers ()
  (:name "SDL_BindGPUFragmentSamplers")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (first-slot :uint32)
  (texture-sampler-bindings (:pointer (:struct gpu-texture-sampler-binding)))
  (num-bindings :uint32))

(define-sdl-function %bind-gpu-fragment-storage-buffers ()
  (:name "SDL_BindGPUFragmentStorageBuffers")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (first-slot :uint32)
  (storage-buffers (:pointer (:pointer (:struct gpu-buffer))))
  (num-bindings :uint32))

(define-sdl-function %bind-gpu-fragment-storage-textures ()
  (:name "SDL_BindGPUFragmentStorageTextures")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (first-slot :uint32)
  (storage-textures (:pointer (:pointer (:struct gpu-texture))))
  (num-bindings :uint32))

(define-sdl-function %bind-gpu-graphics-pipeline ()
  (:name "SDL_BindGPUGraphicsPipeline")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (graphics-pipeline (:pointer (:struct gpu-graphics-pipeline))))

(define-sdl-function %bind-gpu-index-buffer ()
  (:name "SDL_BindGPUIndexBuffer")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (binding (:pointer (:struct gpu-buffer-binding)))
  (index-element-size gpu-index-element-size))

(define-sdl-function %bind-gpu-vertex-buffers ()
  (:name "SDL_BindGPUVertexBuffers")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (first-slot :uint32)
  (bindings (:pointer (:struct gpu-buffer-binding)))
  (num-bindings :uint32))

(define-sdl-function %bind-gpu-vertex-samplers ()
  (:name "SDL_BindGPUVertexSamplers")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (first-slot :uint32)
  (texture-sampler-bindings (:pointer (:struct gpu-texture-sampler-binding)))
  (num-bindings :uint32))

(define-sdl-function %bind-gpu-vertex-storage-buffers ()
  (:name "SDL_BindGPUVertexStorageBuffers")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (first-slot :uint32)
  (storage-buffers (:pointer (:pointer (:struct gpu-buffer))))
  (num-bindings :uint32))

(define-sdl-function %bind-gpu-vertex-storage-textures ()
  (:name "SDL_BindGPUVertexStorageTextures")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (first-slot :uint32)
  (storage-textures (:pointer (:pointer (:struct gpu-texture))))
  (num-bindings :uint32))

(define-sdl-function %blit-gpu-texture ()
  (:name "SDL_BlitGPUTexture")
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (info (:pointer (:struct gpu-blit-info))))

(define-sdl-function %calculate-gpu-texture-format-size ()
  (:name "SDL_CalculateGPUTextureFormatSize"
   :type :uint32)
  (format gpu-texture-format)
  (width :uint32)
  (height :uint32)
  (depth-or-layer-count :uint32))

(define-sdl-function %cancel-gpu-command-buffer ()
  (:name "SDL_CancelGPUCommandBuffer"
   :type :bool
   :check #'identity)
  (command-buffer (:pointer (:struct gpu-command-buffer))))

(define-sdl-function %claim-window-for-gpu-device ()
  (:name "SDL_ClaimWindowForGPUDevice"
   :type :bool
   :check #'identity)
  (device (:pointer (:struct gpu-device)))
  (window (:pointer (:struct window))))

(define-sdl-function %copy-gpu-buffer-to-buffer ()
  (:name "SDL_CopyGPUBufferToBuffer")
  (copy-pass (:pointer (:struct gpu-copy-pass)))
  (source (:pointer (:struct gpu-buffer-location)))
  (destination (:pointer (:struct gpu-buffer-location)))
  (size :uint32)
  (cycle :bool))

(define-sdl-function %copy-gpu-texture-to-texture ()
  (:name "SDL_CopyGPUTextureToTexture")
  (copy-pass (:pointer (:struct gpu-copy-pass)))
  (source (:pointer (:struct gpu-texture-location)))
  (destination (:pointer (:struct gpu-texture-location)))
  (w :uint32)
  (h :uint32)
  (d :uint32)
  (cycle :bool))

(define-sdl-function %create-gpu-buffer ()
  (:name "SDL_CreateGPUBuffer"
   :type (:pointer (:struct gpu-buffer))
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device)))
  (createinfo (:pointer (:struct gpu-buffer-create-info))))

(define-sdl-function %create-gpu-compute-pipeline ()
  (:name "SDL_CreateGPUComputePipeline"
   :type (:pointer (:struct gpu-compute-pipeline))
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device)))
  (createinfo (:pointer (:struct gpu-compute-pipeline-create-info))))

(define-sdl-function %create-gpu-device ()
  (:name "SDL_CreateGPUDevice"
   :type (:pointer (:struct gpu-device))
   :check #'valid-pointer?)
  (format-flags gpu-shader-format)
  (debug-mode :bool)
  (name :string))

(define-sdl-function %create-gpu-device-with-properties ()
  (:name "SDL_CreateGPUDeviceWithProperties"
   :type (:pointer (:struct gpu-device))
   :check #'valid-pointer?)
  (props properties-id))

(define-sdl-function %create-gpu-graphics-pipeline ()
  (:name "SDL_CreateGPUGraphicsPipeline"
   :type (:pointer (:struct gpu-graphics-pipeline))
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device)))
  (createinfo (:pointer (:struct gpu-graphics-pipeline-create-info))))

(define-sdl-function %create-gpu-render-state ()
  (:name "SDL_CreateGPURenderState"
   :type (:pointer (:struct gpu-render-state))
   :check #'valid-pointer?)
  (renderer (:pointer (:struct renderer)))
  (createinfo (:pointer (:struct gpu-render-state-create-info))))

(define-sdl-function %create-gpu-renderer ()
  (:name "SDL_CreateGPURenderer"
   :type (:pointer (:struct renderer))
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device)))
  (window (:pointer (:struct window))))

(define-sdl-function %create-gpu-sampler ()
  (:name "SDL_CreateGPUSampler"
   :type (:pointer (:struct gpu-sampler))
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device)))
  (createinfo (:pointer (:struct gpu-sampler-create-info))))

(define-sdl-function %create-gpu-shader ()
  (:name "SDL_CreateGPUShader"
   :type (:pointer (:struct gpu-shader))
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device)))
  (createinfo (:pointer (:struct gpu-shader-create-info))))

(define-sdl-function %create-gpu-texture ()
  (:name "SDL_CreateGPUTexture"
   :type (:pointer (:struct gpu-texture))
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device)))
  (createinfo (:pointer (:struct gpu-texture-create-info))))

(define-sdl-function %create-gpu-transfer-buffer ()
  (:name "SDL_CreateGPUTransferBuffer"
   :type (:pointer (:struct gpu-transfer-buffer))
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device)))
  (createinfo (:pointer (:struct gpu-transfer-buffer-create-info))))

(define-sdl-function %destroy-gpu-device ()
  (:name "SDL_DestroyGPUDevice")
  (device (:pointer (:struct gpu-device))))

(define-sdl-function %destroy-gpu-render-state ()
  (:name "SDL_DestroyGPURenderState")
  (state (:pointer (:struct gpu-render-state))))

(define-sdl-function %dispatch-gpu-compute ()
  (:name "SDL_DispatchGPUCompute")
  (compute-pass (:pointer (:struct gpu-compute-pass)))
  (groupcount-x :uint32)
  (groupcount-y :uint32)
  (groupcount-z :uint32))

(define-sdl-function %dispatch-gpu-compute-indirect ()
  (:name "SDL_DispatchGPUComputeIndirect")
  (compute-pass (:pointer (:struct gpu-compute-pass)))
  (buffer (:pointer (:struct gpu-buffer)))
  (offset :uint32))

(define-sdl-function %download-from-gpu-buffer ()
  (:name "SDL_DownloadFromGPUBuffer")
  (copy-pass (:pointer (:struct gpu-copy-pass)))
  (source (:pointer (:struct gpu-buffer-region)))
  (destination (:pointer (:struct gpu-transfer-buffer-location))))

(define-sdl-function %download-from-gpu-texture ()
  (:name "SDL_DownloadFromGPUTexture")
  (copy-pass (:pointer (:struct gpu-copy-pass)))
  (source (:pointer (:struct gpu-texture-region)))
  (destination (:pointer (:struct gpu-texture-transfer-info))))

(define-sdl-function %draw-gpu-indexed-primitives ()
  (:name "SDL_DrawGPUIndexedPrimitives")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (num-indices :uint32)
  (num-instances :uint32)
  (first-index :uint32)
  (vertex-offset :int32)
  (first-instance :uint32))

(define-sdl-function %draw-gpu-indexed-primitives-indirect ()
  (:name "SDL_DrawGPUIndexedPrimitivesIndirect")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (buffer (:pointer (:struct gpu-buffer)))
  (offset :uint32)
  (draw-count :uint32))

(define-sdl-function %draw-gpu-primitives ()
  (:name "SDL_DrawGPUPrimitives")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (num-vertices :uint32)
  (num-instances :uint32)
  (first-vertex :uint32)
  (first-instance :uint32))

(define-sdl-function %draw-gpu-primitives-indirect ()
  (:name "SDL_DrawGPUPrimitivesIndirect")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (buffer (:pointer (:struct gpu-buffer)))
  (offset :uint32)
  (draw-count :uint32))

(define-sdl-function %end-gpu-compute-pass ()
  (:name "SDL_EndGPUComputePass")
  (compute-pass (:pointer (:struct gpu-compute-pass))))

(define-sdl-function %end-gpu-copy-pass ()
  (:name "SDL_EndGPUCopyPass")
  (copy-pass (:pointer (:struct gpu-copy-pass))))

(define-sdl-function %end-gpu-render-pass ()
  (:name "SDL_EndGPURenderPass")
  (render-pass (:pointer (:struct gpu-render-pass))))

(define-sdl-function %gdk-resume-gpu ()
  (:name "SDL_GDKResumeGPU")
  (device (:pointer (:struct gpu-device))))

(define-sdl-function %gdk-suspend-gpu ()
  (:name "SDL_GDKSuspendGPU")
  (device (:pointer (:struct gpu-device))))

(define-sdl-function %generate-mipmaps-for-gpu-texture ()
  (:name "SDL_GenerateMipmapsForGPUTexture")
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (texture (:pointer (:struct gpu-texture))))

(define-sdl-function %get-gpu-device-driver ()
  (:name "SDL_GetGPUDeviceDriver"
   :type :string)
  (device (:pointer (:struct gpu-device))))

(define-sdl-function %get-gpu-device-properties ()
  (:name "SDL_GetGPUDeviceProperties"
   :type properties-id
   :check #'plusp)
  (device (:pointer (:struct gpu-device))))

(define-sdl-function %get-gpu-driver ()
  (:name "SDL_GetGPUDriver"
   :type :string)
  (index :int))

(define-sdl-function %get-gpu-renderer-device ()
  (:name "SDL_GetGPURendererDevice"
   :type (:pointer (:struct gpu-device))
   :check #'valid-pointer?)
  (renderer (:pointer (:struct renderer))))

(define-sdl-function %get-gpu-shader-formats ()
  (:name "SDL_GetGPUShaderFormats"
   :type gpu-shader-format)
  (device (:pointer (:struct gpu-device))))

(define-sdl-function %get-gpu-swapchain-texture-format ()
  (:name "SDL_GetGPUSwapchainTextureFormat"
   :type gpu-texture-format)
  (device (:pointer (:struct gpu-device)))
  (window (:pointer (:struct window))))

(define-sdl-function %get-gpu-texture-format-from-pixel-format ()
  (:name "SDL_GetGPUTextureFormatFromPixelFormat"
   :type gpu-texture-format)
  (format pixel-format))

(define-sdl-function %get-num-gpu-drivers ()
  (:name "SDL_GetNumGPUDrivers"
   :type :int))

(define-sdl-function %get-pixel-format-from-gpu-texture-format ()
  (:name "SDL_GetPixelFormatFromGPUTextureFormat"
   :type pixel-format)
  (format gpu-texture-format))

(define-sdl-function %gpu-supports-properties ()
  (:name "SDL_GPUSupportsProperties"
   :type :bool)
  (props properties-id))

(define-sdl-function %gpu-supports-shader-formats ()
  (:name "SDL_GPUSupportsShaderFormats"
   :type :bool)
  (format-flags gpu-shader-format)
  (name :string))

(define-sdl-function %gpu-texture-format-texel-block-size ()
  (:name "SDL_GPUTextureFormatTexelBlockSize"
   :type :uint32)
  (format gpu-texture-format))

(define-sdl-function %gpu-texture-supports-format ()
  (:name "SDL_GPUTextureSupportsFormat"
   :type :bool)
  (device (:pointer (:struct gpu-device)))
  (format gpu-texture-format)
  (type gpu-texture-type)
  (usage gpu-texture-usage-flags))

(define-sdl-function %gpu-texture-supports-sample-count ()
  (:name "SDL_GPUTextureSupportsSampleCount"
   :type :bool)
  (device (:pointer (:struct gpu-device)))
  (format gpu-texture-format)
  (sample-count gpu-sample-count))

(define-sdl-function %insert-gpu-debug-label ()
  (:name "SDL_InsertGPUDebugLabel")
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (text :string))

(define-sdl-function %map-gpu-transfer-buffer ()
  (:name "SDL_MapGPUTransferBuffer"
   :type :pointer
   :check #'valid-pointer?)
  (device (:pointer (:struct gpu-device)))
  (transfer-buffer (:pointer (:struct gpu-transfer-buffer)))
  (cycle :bool))

(define-sdl-function %pop-gpu-debug-group ()
  (:name "SDL_PopGPUDebugGroup")
  (command-buffer (:pointer (:struct gpu-command-buffer))))

(define-sdl-function %push-gpu-compute-uniform-data ()
  (:name "SDL_PushGPUComputeUniformData")
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (slot-index :uint32)
  (data :pointer)
  (length :uint32))

(define-sdl-function %push-gpu-debug-group ()
  (:name "SDL_PushGPUDebugGroup")
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (name :string))

(define-sdl-function %push-gpu-fragment-uniform-data ()
  (:name "SDL_PushGPUFragmentUniformData")
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (slot-index :uint32)
  (data :pointer)
  (length :uint32))

(define-sdl-function %push-gpu-vertex-uniform-data ()
  (:name "SDL_PushGPUVertexUniformData")
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (slot-index :uint32)
  (data :pointer)
  (length :uint32))

(define-sdl-function %query-gpu-fence ()
  (:name "SDL_QueryGPUFence"
   :type :bool)
  (device (:pointer (:struct gpu-device)))
  (fence (:pointer (:struct gpu-fence))))

(define-sdl-function %release-gpu-buffer ()
  (:name "SDL_ReleaseGPUBuffer")
  (device (:pointer (:struct gpu-device)))
  (buffer (:pointer (:struct gpu-buffer))))

(define-sdl-function %release-gpu-compute-pipeline ()
  (:name "SDL_ReleaseGPUComputePipeline")
  (device (:pointer (:struct gpu-device)))
  (compute-pipeline (:pointer (:struct gpu-compute-pipeline))))

(define-sdl-function %release-gpu-fence ()
  (:name "SDL_ReleaseGPUFence")
  (device (:pointer (:struct gpu-device)))
  (fence (:pointer (:struct gpu-fence))))

(define-sdl-function %release-gpu-graphics-pipeline ()
  (:name "SDL_ReleaseGPUGraphicsPipeline")
  (device (:pointer (:struct gpu-device)))
  (graphics-pipeline (:pointer (:struct gpu-graphics-pipeline))))

(define-sdl-function %release-gpu-sampler ()
  (:name "SDL_ReleaseGPUSampler")
  (device (:pointer (:struct gpu-device)))
  (sampler (:pointer (:struct gpu-sampler))))

(define-sdl-function %release-gpu-shader ()
  (:name "SDL_ReleaseGPUShader")
  (device (:pointer (:struct gpu-device)))
  (shader (:pointer (:struct gpu-shader))))

(define-sdl-function %release-gpu-texture ()
  (:name "SDL_ReleaseGPUTexture")
  (device (:pointer (:struct gpu-device)))
  (texture (:pointer (:struct gpu-texture))))

(define-sdl-function %release-gpu-transfer-buffer ()
  (:name "SDL_ReleaseGPUTransferBuffer")
  (device (:pointer (:struct gpu-device)))
  (transfer-buffer (:pointer (:struct gpu-transfer-buffer))))

(define-sdl-function %release-window-from-gpu-device ()
  (:name "SDL_ReleaseWindowFromGPUDevice")
  (device (:pointer (:struct gpu-device)))
  (window (:pointer (:struct window))))

(define-sdl-function %set-gpu-allowed-frames-in-flight ()
  (:name "SDL_SetGPUAllowedFramesInFlight"
   :type :bool
   :check #'identity)
  (device (:pointer (:struct gpu-device)))
  (allowed-frames-in-flight :uint32))

(define-sdl-function %set-gpu-buffer-name ()
  (:name "SDL_SetGPUBufferName")
  (device (:pointer (:struct gpu-device)))
  (buffer (:pointer (:struct gpu-buffer)))
  (text :string))

(define-sdl-function %set-gpu-render-state ()
  (:name "SDL_SetGPURenderState"
   :type :bool
   :check #'identity)
  (renderer (:pointer (:struct renderer)))
  (state (:pointer (:struct gpu-render-state))))

(define-sdl-function %set-gpu-render-state-fragment-uniforms ()
  (:name "SDL_SetGPURenderStateFragmentUniforms"
   :type :bool
   :check #'identity)
  (state (:pointer (:struct gpu-render-state)))
  (slot-index :uint32)
  (data :pointer)
  (length :uint32))

(define-sdl-function %set-gpu-scissor ()
  (:name "SDL_SetGPUScissor")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (scissor (:pointer (:struct rect))))

(define-sdl-function %set-gpu-stencil-reference ()
  (:name "SDL_SetGPUStencilReference")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (reference :uint8))

(define-sdl-function %set-gpu-swapchain-parameters ()
  (:name "SDL_SetGPUSwapchainParameters"
   :type :bool
   :check #'identity)
  (device (:pointer (:struct gpu-device)))
  (window (:pointer (:struct window)))
  (swapchain-composition gpu-swapchain-composition)
  (present-mode gpu-present-mode))

(define-sdl-function %set-gpu-texture-name ()
  (:name "SDL_SetGPUTextureName")
  (device (:pointer (:struct gpu-device)))
  (texture (:pointer (:struct gpu-texture)))
  (text :string))

(define-sdl-function %set-gpu-viewport ()
  (:name "SDL_SetGPUViewport")
  (render-pass (:pointer (:struct gpu-render-pass)))
  (viewport (:pointer (:struct gpu-viewport))))

(define-sdl-function %submit-gpu-command-buffer ()
  (:name "SDL_SubmitGPUCommandBuffer"
   :type :bool
   :check #'identity)
  (command-buffer (:pointer (:struct gpu-command-buffer))))

(define-sdl-function %submit-gpu-command-buffer-and-acquire-fence ()
  (:name "SDL_SubmitGPUCommandBufferAndAcquireFence"
   :type (:pointer (:struct gpu-fence))
   :check #'valid-pointer?)
  (command-buffer (:pointer (:struct gpu-command-buffer))))

(define-sdl-function %unmap-gpu-transfer-buffer ()
  (:name "SDL_UnmapGPUTransferBuffer")
  (device (:pointer (:struct gpu-device)))
  (transfer-buffer (:pointer (:struct gpu-transfer-buffer))))

(define-sdl-function %upload-to-gpu-buffer ()
  (:name "SDL_UploadToGPUBuffer")
  (copy-pass (:pointer (:struct gpu-copy-pass)))
  (source (:pointer (:struct gpu-transfer-buffer-location)))
  (destination (:pointer (:struct gpu-buffer-region)))
  (cycle :bool))

(define-sdl-function %upload-to-gpu-texture ()
  (:name "SDL_UploadToGPUTexture")
  (copy-pass (:pointer (:struct gpu-copy-pass)))
  (source (:pointer (:struct gpu-texture-transfer-info)))
  (destination (:pointer (:struct gpu-texture-region)))
  (cycle :bool))

(define-sdl-function %wait-and-acquire-gpu-swapchain-texture ()
  (:name "SDL_WaitAndAcquireGPUSwapchainTexture"
   :type :bool
   :check #'identity)
  (command-buffer (:pointer (:struct gpu-command-buffer)))
  (window (:pointer (:struct window)))
  (swapchain-texture (:pointer (:pointer (:struct gpu-texture))))
  (swapchain-texture-width (:pointer :uint32))
  (swapchain-texture-height (:pointer :uint32)))

(define-sdl-function %wait-for-gpu-fences ()
  (:name "SDL_WaitForGPUFences"
   :type :bool
   :check #'identity)
  (device (:pointer (:struct gpu-device)))
  (wait-all :bool)
  (fences (:pointer (:pointer (:struct gpu-fence))))
  (num-fences :uint32))

(define-sdl-function %wait-for-gpu-idle ()
  (:name "SDL_WaitForGPUIdle"
   :type :bool
   :check #'identity)
  (device (:pointer (:struct gpu-device))))

(define-sdl-function %wait-for-gpu-swapchain ()
  (:name "SDL_WaitForGPUSwapchain"
   :type :bool
   :check #'identity)
  (device (:pointer (:struct gpu-device)))
  (window (:pointer (:struct window))))

(define-sdl-function %window-supports-gpu-present-mode ()
  (:name "SDL_WindowSupportsGPUPresentMode"
   :type :bool)
  (device (:pointer (:struct gpu-device)))
  (window (:pointer (:struct window)))
  (present-mode gpu-present-mode))

(define-sdl-function %window-supports-gpu-swapchain-composition ()
  (:name "SDL_WindowSupportsGPUSwapchainComposition"
   :type :bool)
  (device (:pointer (:struct gpu-device)))
  (window (:pointer (:struct window)))
  (swapchain-composition gpu-swapchain-composition))
