##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=ax329x_sdk
ConfigurationName      :=Debug
WorkspacePath          := "C:\Users\jingcheng.huang\Desktop\project\waterMeter\firmware\ax32_platform_demo"
ProjectPath            := "C:\Users\jingcheng.huang\Desktop\project\waterMeter\firmware\ax32_platform_demo"
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=jingcheng.huang
Date                   :=2025/3/17
CodeLitePath           :="c:\program files (x86)\codelite"
LinkerName             :=C:/MinGW-4.7.1/bin/or1k-elf-ld.exe
SharedObjectLinkerName :=C:/MinGW-4.7.1/bin/or1k-elf-g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.o.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E 
ObjectsFileList        :="ax329x_sdk.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=C:/MinGW-4.7.1/bin/windres.exe
LinkOptions            :=  -T../ax32xx/ax329x.ld -Map=output/$(ProjectName).map
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch)../bwlib 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)avi $(LibrarySwitch)fs $(LibrarySwitch)sd $(LibrarySwitch)c $(LibrarySwitch)gcc 
ArLibs                 :=  "avi" "fs" "sd" "c" "gcc" 
LibPath                :=$(LibraryPathSwitch)C:/MinGW-4.7.1/lib/gcc/or1k-elf/4.9.1/no-delay $(LibraryPathSwitch)C:/MinGW-4.7.1/or1k-elf/lib/no-delay  $(LibraryPathSwitch). $(LibraryPathSwitch). $(LibraryPathSwitch)Debug $(LibraryPathSwitch)../bwlib $(LibraryPathSwitch)C:/MinGW-4.7.1/lib/gcc/or1k-elf/4.9.1 $(LibraryPathSwitch)C:/MinGW-4.7.1/or1k-elf/lib 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := C:/MinGW-4.7.1/bin/or1k-elf-ar.exe rcu
CXX      := C:/MinGW-4.7.1/bin/or1k-elf-g++.exe
CC       := C:/MinGW-4.7.1/bin/or1k-elf-gcc.exe -DIoTEgr -DOR1K_NEWCPU -mno-delay -w
CXXFLAGS :=  -g -Wall $(Preprocessors)
CFLAGS   :=  -Os -Wall -mhard-div $(Preprocessors)
ASFLAGS  := 
AS       := C:/MinGW-4.7.1/bin/or1k-elf-as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\Program Files (x86)\CodeLite
Objects0=$(IntermediateDirectory)/ax32xx_reset.S$(ObjectSuffix) $(IntermediateDirectory)/ax32xx_spi_boot_cfg.S$(ObjectSuffix) $(IntermediateDirectory)/ax32xx_BLDRX32.S$(ObjectSuffix) $(IntermediateDirectory)/main.c$(ObjectSuffix) $(IntermediateDirectory)/resource_manager.c$(ObjectSuffix) $(IntermediateDirectory)/task_audio_playback.c$(ObjectSuffix) $(IntermediateDirectory)/task_audio_record.c$(ObjectSuffix) $(IntermediateDirectory)/task_deamon.c$(ObjectSuffix) $(IntermediateDirectory)/task_image_encode.c$(ObjectSuffix) $(IntermediateDirectory)/task_main.c$(ObjectSuffix) \
	$(IntermediateDirectory)/task_usb.c$(ObjectSuffix) $(IntermediateDirectory)/task_video_playback.c$(ObjectSuffix) $(IntermediateDirectory)/task_video_record.c$(ObjectSuffix) $(IntermediateDirectory)/upgrade.c$(ObjectSuffix) $(IntermediateDirectory)/board.c$(ObjectSuffix) $(IntermediateDirectory)/board_bwv1.c$(ObjectSuffix) $(IntermediateDirectory)/config.c$(ObjectSuffix) $(IntermediateDirectory)/explorer.c$(ObjectSuffix) $(IntermediateDirectory)/filelist.c$(ObjectSuffix) $(IntermediateDirectory)/task_usb_host.c$(ObjectSuffix) \
	$(IntermediateDirectory)/xos_x_cpu.c$(ObjectSuffix) $(IntermediateDirectory)/xos_xmbox.c$(ObjectSuffix) $(IntermediateDirectory)/xos_xmsgq.c$(ObjectSuffix) $(IntermediateDirectory)/xos_xos.c$(ObjectSuffix) $(IntermediateDirectory)/xos_xwork.c$(ObjectSuffix) $(IntermediateDirectory)/multimedia_user_media.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_int.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_sys.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_dma.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_wdt.c$(ObjectSuffix) \
	$(IntermediateDirectory)/src_ax32xx_gpio.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_uart.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_timer.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_tminf.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_spi.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_rtc.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_md.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_iic.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_dac.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_adc.c$(ObjectSuffix) \
	$(IntermediateDirectory)/src_ax32xx_auadc.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_isp.c$(ObjectSuffix) $(IntermediateDirectory)/src_jpeg_table.c$(ObjectSuffix) $(IntermediateDirectory)/src_isp_tab.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_usb.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_misc.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_pip.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_btuart.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_crc.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_emi.c$(ObjectSuffix) \
	

Objects1=$(IntermediateDirectory)/src_ax32xx_rotate.c$(ObjectSuffix) $(IntermediateDirectory)/src_ax32xx_osdcmp.c$(ObjectSuffix) $(IntermediateDirectory)/osd_ax32xx_osd.c$(ObjectSuffix) $(IntermediateDirectory)/csi_ax32xx_csi.c$(ObjectSuffix) $(IntermediateDirectory)/lcd_ax32xx_lcd.c$(ObjectSuffix) $(IntermediateDirectory)/mjpeg_ax32xx_mjpeg.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_adc.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_csi.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_dac.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_eeprom.c$(ObjectSuffix) \
	$(IntermediateDirectory)/src_hal_gpio.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_iic.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_lcd.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_md.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_osd.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_rtc.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_sd.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_spi.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_timer.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_uart.c$(ObjectSuffix) \
	$(IntermediateDirectory)/src_hal_watermark.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_sys.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_auadc.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_mjpeg.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_int.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_wdt.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_stream.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_emi.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_mjpegB.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_osdcmp.c$(ObjectSuffix) \
	$(IntermediateDirectory)/src_hal_rotate.c$(ObjectSuffix) $(IntermediateDirectory)/src_hal_lcdframe.c$(ObjectSuffix) $(IntermediateDirectory)/isp_hal_isp.c$(ObjectSuffix) $(IntermediateDirectory)/dusb_hal_usb_api.c$(ObjectSuffix) $(IntermediateDirectory)/dusb_hal_usb_dev_enum.c$(ObjectSuffix) $(IntermediateDirectory)/dusb_hal_usb_msc.c$(ObjectSuffix) $(IntermediateDirectory)/dusb_hal_usb_uac.c$(ObjectSuffix) $(IntermediateDirectory)/dusb_hal_usb_uvc.c$(ObjectSuffix) $(IntermediateDirectory)/husb_hal_usb_host_api.c$(ObjectSuffix) $(IntermediateDirectory)/husb_hal_usb_host_enum.c$(ObjectSuffix) \
	$(IntermediateDirectory)/husb_hal_usb_host_tpbulk.c$(ObjectSuffix) $(IntermediateDirectory)/husb_hal_usb_host_uvc.c$(ObjectSuffix) $(IntermediateDirectory)/husb_hal_usensor.c$(ObjectSuffix) $(IntermediateDirectory)/audio_audio_playback.c$(ObjectSuffix) $(IntermediateDirectory)/audio_audio_record.c$(ObjectSuffix) $(IntermediateDirectory)/audio_ring_buffer.c$(ObjectSuffix) $(IntermediateDirectory)/video_video_playback.c$(ObjectSuffix) $(IntermediateDirectory)/video_video_record.c$(ObjectSuffix) $(IntermediateDirectory)/video_video_record_B.c$(ObjectSuffix) $(IntermediateDirectory)/image_image_decode.c$(ObjectSuffix) \
	

Objects2=$(IntermediateDirectory)/image_image_encode.c$(ObjectSuffix) $(IntermediateDirectory)/wav_alaw.c$(ObjectSuffix) $(IntermediateDirectory)/wav_imaadpcm.c$(ObjectSuffix) $(IntermediateDirectory)/wav_pcm.c$(ObjectSuffix) $(IntermediateDirectory)/wav_ulaw.c$(ObjectSuffix) $(IntermediateDirectory)/wav_wav.c$(ObjectSuffix) $(IntermediateDirectory)/stream_stream.c$(ObjectSuffix) $(IntermediateDirectory)/uartcom_uartcom.c$(ObjectSuffix) $(IntermediateDirectory)/uartcom_uartCrc.c$(ObjectSuffix) $(IntermediateDirectory)/gsensor_G_gma301.c$(ObjectSuffix) \
	$(IntermediateDirectory)/gsensor_gsensor.c$(ObjectSuffix) $(IntermediateDirectory)/gsensor_G_sc7a30e.c$(ObjectSuffix) $(IntermediateDirectory)/gsensor_g_da380.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_cmos_sensor.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF3a03.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF2013.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF3016.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF3703.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0307.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0308.c$(ObjectSuffix) \
	$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0309.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0328.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1004.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_H42.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_H7640.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_HM1055.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_IT03A1.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_NT99141.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_NT99142.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_OV7670.c$(ObjectSuffix) \
	$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7725.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_OV9710.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_OV9732.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_SC1045.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_SIV100B.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_SIV120B.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_SIV121DS.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_SP1409.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_H62.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1034.c$(ObjectSuffix) \
	$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7736.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_SP140A.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1054.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1064.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_H65.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_SC1243.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SNESOR_FPX1002.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_H63P.c$(ObjectSuffix) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF20A6.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789.c$(ObjectSuffix) \
	$(IntermediateDirectory)/tft_lcd_lcd_rgb_jl_lcd.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_rgb_st7282.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_tft_lcd.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_mcu_5420.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_mcu_r61509v.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_rgb_ili8961.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9342c.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_mcu_ili9328.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352b.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789v.c$(ObjectSuffix) \
	$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352c.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8357b.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9806e.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_rgb_ota5182.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_rgb_st7701.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_mcu_lgdp4532.c$(ObjectSuffix) $(IntermediateDirectory)/tft_lcd_lcd_mcu_9225G.c$(ObjectSuffix) $(IntermediateDirectory)/usensor_237a_1.c$(ObjectSuffix) $(IntermediateDirectory)/usensor_usensor.c$(ObjectSuffix) $(IntermediateDirectory)/usensor_237a_2.c$(ObjectSuffix) \
	$(IntermediateDirectory)/nvfs_nvfs.c$(ObjectSuffix) $(IntermediateDirectory)/res_ascii.c$(ObjectSuffix) $(IntermediateDirectory)/res_ascii_default.c$(ObjectSuffix) $(IntermediateDirectory)/res_ascii_default_draw.c$(ObjectSuffix) $(IntermediateDirectory)/res_ascii_num2.c$(ObjectSuffix) $(IntermediateDirectory)/res_ascii_num2_draw.c$(ObjectSuffix) 

Objects3=$(IntermediateDirectory)/res_ascii_num3.c$(ObjectSuffix) $(IntermediateDirectory)/res_ascii_num3_draw.c$(ObjectSuffix) $(IntermediateDirectory)/res_ascii_num4.c$(ObjectSuffix) $(IntermediateDirectory)/res_ascii_num4_draw.c$(ObjectSuffix) \
	$(IntermediateDirectory)/res_R.c$(ObjectSuffix) 



Objects=$(Objects0) $(Objects1) $(Objects2) $(Objects3) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	@echo $(Objects1) >> $(ObjectsFileList)
	@echo $(Objects2) >> $(ObjectsFileList)
	@echo $(Objects3) >> $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	or1k-elf-objcopy -O binary $(IntermediateDirectory)/$(ProjectName).elf ./output/$(ProjectName).bin
	or1k-elf-size -A $(IntermediateDirectory)/$(ProjectName).elf
	./output/elfsym.exe ./output/order.ini ./Debug/$(ProjectName).elf ./output/list.tmp
	.\output\make.bat $(ProjectName).bin
	or1k-elf-objdump -d $(IntermediateDirectory)/$(ProjectName).elf >./output/$(ProjectName).lst
	@echo Done

$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/ax32xx_reset.S$(ObjectSuffix): ../ax32xx/reset.S $(IntermediateDirectory)/ax32xx_reset.S$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/reset.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ax32xx_reset.S$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ax32xx_reset.S$(DependSuffix): ../ax32xx/reset.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ax32xx_reset.S$(ObjectSuffix) -MF$(IntermediateDirectory)/ax32xx_reset.S$(DependSuffix) -MM "../ax32xx/reset.S"

$(IntermediateDirectory)/ax32xx_reset.S$(PreprocessSuffix): ../ax32xx/reset.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ax32xx_reset.S$(PreprocessSuffix) "../ax32xx/reset.S"

$(IntermediateDirectory)/ax32xx_spi_boot_cfg.S$(ObjectSuffix): ../ax32xx/spi_boot_cfg.S $(IntermediateDirectory)/ax32xx_spi_boot_cfg.S$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/spi_boot_cfg.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ax32xx_spi_boot_cfg.S$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ax32xx_spi_boot_cfg.S$(DependSuffix): ../ax32xx/spi_boot_cfg.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ax32xx_spi_boot_cfg.S$(ObjectSuffix) -MF$(IntermediateDirectory)/ax32xx_spi_boot_cfg.S$(DependSuffix) -MM "../ax32xx/spi_boot_cfg.S"

$(IntermediateDirectory)/ax32xx_spi_boot_cfg.S$(PreprocessSuffix): ../ax32xx/spi_boot_cfg.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ax32xx_spi_boot_cfg.S$(PreprocessSuffix) "../ax32xx/spi_boot_cfg.S"

$(IntermediateDirectory)/ax32xx_BLDRX32.S$(ObjectSuffix): ../ax32xx/BLDRX32.S $(IntermediateDirectory)/ax32xx_BLDRX32.S$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/BLDRX32.S" $(ASFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ax32xx_BLDRX32.S$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ax32xx_BLDRX32.S$(DependSuffix): ../ax32xx/BLDRX32.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ax32xx_BLDRX32.S$(ObjectSuffix) -MF$(IntermediateDirectory)/ax32xx_BLDRX32.S$(DependSuffix) -MM "../ax32xx/BLDRX32.S"

$(IntermediateDirectory)/ax32xx_BLDRX32.S$(PreprocessSuffix): ../ax32xx/BLDRX32.S
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ax32xx_BLDRX32.S$(PreprocessSuffix) "../ax32xx/BLDRX32.S"

$(IntermediateDirectory)/main.c$(ObjectSuffix): main.c $(IntermediateDirectory)/main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.c$(DependSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main.c$(DependSuffix) -MM "main.c"

$(IntermediateDirectory)/main.c$(PreprocessSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.c$(PreprocessSuffix) "main.c"

$(IntermediateDirectory)/resource_manager.c$(ObjectSuffix): resource_manager.c $(IntermediateDirectory)/resource_manager.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/resource_manager.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/resource_manager.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/resource_manager.c$(DependSuffix): resource_manager.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/resource_manager.c$(ObjectSuffix) -MF$(IntermediateDirectory)/resource_manager.c$(DependSuffix) -MM "resource_manager.c"

$(IntermediateDirectory)/resource_manager.c$(PreprocessSuffix): resource_manager.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/resource_manager.c$(PreprocessSuffix) "resource_manager.c"

$(IntermediateDirectory)/task_audio_playback.c$(ObjectSuffix): task_audio_playback.c $(IntermediateDirectory)/task_audio_playback.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/task_audio_playback.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/task_audio_playback.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/task_audio_playback.c$(DependSuffix): task_audio_playback.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/task_audio_playback.c$(ObjectSuffix) -MF$(IntermediateDirectory)/task_audio_playback.c$(DependSuffix) -MM "task_audio_playback.c"

$(IntermediateDirectory)/task_audio_playback.c$(PreprocessSuffix): task_audio_playback.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/task_audio_playback.c$(PreprocessSuffix) "task_audio_playback.c"

$(IntermediateDirectory)/task_audio_record.c$(ObjectSuffix): task_audio_record.c $(IntermediateDirectory)/task_audio_record.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/task_audio_record.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/task_audio_record.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/task_audio_record.c$(DependSuffix): task_audio_record.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/task_audio_record.c$(ObjectSuffix) -MF$(IntermediateDirectory)/task_audio_record.c$(DependSuffix) -MM "task_audio_record.c"

$(IntermediateDirectory)/task_audio_record.c$(PreprocessSuffix): task_audio_record.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/task_audio_record.c$(PreprocessSuffix) "task_audio_record.c"

$(IntermediateDirectory)/task_deamon.c$(ObjectSuffix): task_deamon.c $(IntermediateDirectory)/task_deamon.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/task_deamon.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/task_deamon.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/task_deamon.c$(DependSuffix): task_deamon.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/task_deamon.c$(ObjectSuffix) -MF$(IntermediateDirectory)/task_deamon.c$(DependSuffix) -MM "task_deamon.c"

$(IntermediateDirectory)/task_deamon.c$(PreprocessSuffix): task_deamon.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/task_deamon.c$(PreprocessSuffix) "task_deamon.c"

$(IntermediateDirectory)/task_image_encode.c$(ObjectSuffix): task_image_encode.c $(IntermediateDirectory)/task_image_encode.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/task_image_encode.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/task_image_encode.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/task_image_encode.c$(DependSuffix): task_image_encode.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/task_image_encode.c$(ObjectSuffix) -MF$(IntermediateDirectory)/task_image_encode.c$(DependSuffix) -MM "task_image_encode.c"

$(IntermediateDirectory)/task_image_encode.c$(PreprocessSuffix): task_image_encode.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/task_image_encode.c$(PreprocessSuffix) "task_image_encode.c"

$(IntermediateDirectory)/task_main.c$(ObjectSuffix): task_main.c $(IntermediateDirectory)/task_main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/task_main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/task_main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/task_main.c$(DependSuffix): task_main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/task_main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/task_main.c$(DependSuffix) -MM "task_main.c"

$(IntermediateDirectory)/task_main.c$(PreprocessSuffix): task_main.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/task_main.c$(PreprocessSuffix) "task_main.c"

$(IntermediateDirectory)/task_usb.c$(ObjectSuffix): task_usb.c $(IntermediateDirectory)/task_usb.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/task_usb.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/task_usb.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/task_usb.c$(DependSuffix): task_usb.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/task_usb.c$(ObjectSuffix) -MF$(IntermediateDirectory)/task_usb.c$(DependSuffix) -MM "task_usb.c"

$(IntermediateDirectory)/task_usb.c$(PreprocessSuffix): task_usb.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/task_usb.c$(PreprocessSuffix) "task_usb.c"

$(IntermediateDirectory)/task_video_playback.c$(ObjectSuffix): task_video_playback.c $(IntermediateDirectory)/task_video_playback.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/task_video_playback.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/task_video_playback.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/task_video_playback.c$(DependSuffix): task_video_playback.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/task_video_playback.c$(ObjectSuffix) -MF$(IntermediateDirectory)/task_video_playback.c$(DependSuffix) -MM "task_video_playback.c"

$(IntermediateDirectory)/task_video_playback.c$(PreprocessSuffix): task_video_playback.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/task_video_playback.c$(PreprocessSuffix) "task_video_playback.c"

$(IntermediateDirectory)/task_video_record.c$(ObjectSuffix): task_video_record.c $(IntermediateDirectory)/task_video_record.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/task_video_record.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/task_video_record.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/task_video_record.c$(DependSuffix): task_video_record.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/task_video_record.c$(ObjectSuffix) -MF$(IntermediateDirectory)/task_video_record.c$(DependSuffix) -MM "task_video_record.c"

$(IntermediateDirectory)/task_video_record.c$(PreprocessSuffix): task_video_record.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/task_video_record.c$(PreprocessSuffix) "task_video_record.c"

$(IntermediateDirectory)/upgrade.c$(ObjectSuffix): upgrade.c $(IntermediateDirectory)/upgrade.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/upgrade.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/upgrade.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/upgrade.c$(DependSuffix): upgrade.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/upgrade.c$(ObjectSuffix) -MF$(IntermediateDirectory)/upgrade.c$(DependSuffix) -MM "upgrade.c"

$(IntermediateDirectory)/upgrade.c$(PreprocessSuffix): upgrade.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/upgrade.c$(PreprocessSuffix) "upgrade.c"

$(IntermediateDirectory)/board.c$(ObjectSuffix): board.c $(IntermediateDirectory)/board.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/board.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/board.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/board.c$(DependSuffix): board.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/board.c$(ObjectSuffix) -MF$(IntermediateDirectory)/board.c$(DependSuffix) -MM "board.c"

$(IntermediateDirectory)/board.c$(PreprocessSuffix): board.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/board.c$(PreprocessSuffix) "board.c"

$(IntermediateDirectory)/board_bwv1.c$(ObjectSuffix): board_bwv1.c $(IntermediateDirectory)/board_bwv1.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/board_bwv1.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/board_bwv1.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/board_bwv1.c$(DependSuffix): board_bwv1.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/board_bwv1.c$(ObjectSuffix) -MF$(IntermediateDirectory)/board_bwv1.c$(DependSuffix) -MM "board_bwv1.c"

$(IntermediateDirectory)/board_bwv1.c$(PreprocessSuffix): board_bwv1.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/board_bwv1.c$(PreprocessSuffix) "board_bwv1.c"

$(IntermediateDirectory)/config.c$(ObjectSuffix): config.c $(IntermediateDirectory)/config.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/config.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/config.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/config.c$(DependSuffix): config.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/config.c$(ObjectSuffix) -MF$(IntermediateDirectory)/config.c$(DependSuffix) -MM "config.c"

$(IntermediateDirectory)/config.c$(PreprocessSuffix): config.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/config.c$(PreprocessSuffix) "config.c"

$(IntermediateDirectory)/explorer.c$(ObjectSuffix): explorer.c $(IntermediateDirectory)/explorer.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/explorer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/explorer.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/explorer.c$(DependSuffix): explorer.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/explorer.c$(ObjectSuffix) -MF$(IntermediateDirectory)/explorer.c$(DependSuffix) -MM "explorer.c"

$(IntermediateDirectory)/explorer.c$(PreprocessSuffix): explorer.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/explorer.c$(PreprocessSuffix) "explorer.c"

$(IntermediateDirectory)/filelist.c$(ObjectSuffix): filelist.c $(IntermediateDirectory)/filelist.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/filelist.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/filelist.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/filelist.c$(DependSuffix): filelist.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/filelist.c$(ObjectSuffix) -MF$(IntermediateDirectory)/filelist.c$(DependSuffix) -MM "filelist.c"

$(IntermediateDirectory)/filelist.c$(PreprocessSuffix): filelist.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/filelist.c$(PreprocessSuffix) "filelist.c"

$(IntermediateDirectory)/task_usb_host.c$(ObjectSuffix): task_usb_host.c $(IntermediateDirectory)/task_usb_host.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32_platform_demo/task_usb_host.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/task_usb_host.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/task_usb_host.c$(DependSuffix): task_usb_host.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/task_usb_host.c$(ObjectSuffix) -MF$(IntermediateDirectory)/task_usb_host.c$(DependSuffix) -MM "task_usb_host.c"

$(IntermediateDirectory)/task_usb_host.c$(PreprocessSuffix): task_usb_host.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/task_usb_host.c$(PreprocessSuffix) "task_usb_host.c"

$(IntermediateDirectory)/xos_x_cpu.c$(ObjectSuffix): ../xos/x_cpu.c $(IntermediateDirectory)/xos_x_cpu.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/xos/x_cpu.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/xos_x_cpu.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/xos_x_cpu.c$(DependSuffix): ../xos/x_cpu.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/xos_x_cpu.c$(ObjectSuffix) -MF$(IntermediateDirectory)/xos_x_cpu.c$(DependSuffix) -MM "../xos/x_cpu.c"

$(IntermediateDirectory)/xos_x_cpu.c$(PreprocessSuffix): ../xos/x_cpu.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/xos_x_cpu.c$(PreprocessSuffix) "../xos/x_cpu.c"

$(IntermediateDirectory)/xos_xmbox.c$(ObjectSuffix): ../xos/xmbox.c $(IntermediateDirectory)/xos_xmbox.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/xos/xmbox.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/xos_xmbox.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/xos_xmbox.c$(DependSuffix): ../xos/xmbox.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/xos_xmbox.c$(ObjectSuffix) -MF$(IntermediateDirectory)/xos_xmbox.c$(DependSuffix) -MM "../xos/xmbox.c"

$(IntermediateDirectory)/xos_xmbox.c$(PreprocessSuffix): ../xos/xmbox.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/xos_xmbox.c$(PreprocessSuffix) "../xos/xmbox.c"

$(IntermediateDirectory)/xos_xmsgq.c$(ObjectSuffix): ../xos/xmsgq.c $(IntermediateDirectory)/xos_xmsgq.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/xos/xmsgq.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/xos_xmsgq.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/xos_xmsgq.c$(DependSuffix): ../xos/xmsgq.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/xos_xmsgq.c$(ObjectSuffix) -MF$(IntermediateDirectory)/xos_xmsgq.c$(DependSuffix) -MM "../xos/xmsgq.c"

$(IntermediateDirectory)/xos_xmsgq.c$(PreprocessSuffix): ../xos/xmsgq.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/xos_xmsgq.c$(PreprocessSuffix) "../xos/xmsgq.c"

$(IntermediateDirectory)/xos_xos.c$(ObjectSuffix): ../xos/xos.c $(IntermediateDirectory)/xos_xos.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/xos/xos.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/xos_xos.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/xos_xos.c$(DependSuffix): ../xos/xos.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/xos_xos.c$(ObjectSuffix) -MF$(IntermediateDirectory)/xos_xos.c$(DependSuffix) -MM "../xos/xos.c"

$(IntermediateDirectory)/xos_xos.c$(PreprocessSuffix): ../xos/xos.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/xos_xos.c$(PreprocessSuffix) "../xos/xos.c"

$(IntermediateDirectory)/xos_xwork.c$(ObjectSuffix): ../xos/xwork.c $(IntermediateDirectory)/xos_xwork.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/xos/xwork.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/xos_xwork.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/xos_xwork.c$(DependSuffix): ../xos/xwork.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/xos_xwork.c$(ObjectSuffix) -MF$(IntermediateDirectory)/xos_xwork.c$(DependSuffix) -MM "../xos/xwork.c"

$(IntermediateDirectory)/xos_xwork.c$(PreprocessSuffix): ../xos/xwork.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/xos_xwork.c$(PreprocessSuffix) "../xos/xwork.c"

$(IntermediateDirectory)/multimedia_user_media.c$(ObjectSuffix): ../multimedia/user_media.c $(IntermediateDirectory)/multimedia_user_media.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/user_media.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/multimedia_user_media.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/multimedia_user_media.c$(DependSuffix): ../multimedia/user_media.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/multimedia_user_media.c$(ObjectSuffix) -MF$(IntermediateDirectory)/multimedia_user_media.c$(DependSuffix) -MM "../multimedia/user_media.c"

$(IntermediateDirectory)/multimedia_user_media.c$(PreprocessSuffix): ../multimedia/user_media.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/multimedia_user_media.c$(PreprocessSuffix) "../multimedia/user_media.c"

$(IntermediateDirectory)/src_ax32xx_int.c$(ObjectSuffix): ../ax32xx/src/ax32xx_int.c $(IntermediateDirectory)/src_ax32xx_int.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_int.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_int.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_int.c$(DependSuffix): ../ax32xx/src/ax32xx_int.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_int.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_int.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_int.c"

$(IntermediateDirectory)/src_ax32xx_int.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_int.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_int.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_int.c"

$(IntermediateDirectory)/src_ax32xx_sys.c$(ObjectSuffix): ../ax32xx/src/ax32xx_sys.c $(IntermediateDirectory)/src_ax32xx_sys.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_sys.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_sys.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_sys.c$(DependSuffix): ../ax32xx/src/ax32xx_sys.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_sys.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_sys.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_sys.c"

$(IntermediateDirectory)/src_ax32xx_sys.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_sys.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_sys.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_sys.c"

$(IntermediateDirectory)/src_ax32xx_dma.c$(ObjectSuffix): ../ax32xx/src/ax32xx_dma.c $(IntermediateDirectory)/src_ax32xx_dma.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_dma.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_dma.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_dma.c$(DependSuffix): ../ax32xx/src/ax32xx_dma.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_dma.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_dma.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_dma.c"

$(IntermediateDirectory)/src_ax32xx_dma.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_dma.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_dma.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_dma.c"

$(IntermediateDirectory)/src_ax32xx_wdt.c$(ObjectSuffix): ../ax32xx/src/ax32xx_wdt.c $(IntermediateDirectory)/src_ax32xx_wdt.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_wdt.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_wdt.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_wdt.c$(DependSuffix): ../ax32xx/src/ax32xx_wdt.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_wdt.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_wdt.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_wdt.c"

$(IntermediateDirectory)/src_ax32xx_wdt.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_wdt.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_wdt.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_wdt.c"

$(IntermediateDirectory)/src_ax32xx_gpio.c$(ObjectSuffix): ../ax32xx/src/ax32xx_gpio.c $(IntermediateDirectory)/src_ax32xx_gpio.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_gpio.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_gpio.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_gpio.c$(DependSuffix): ../ax32xx/src/ax32xx_gpio.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_gpio.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_gpio.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_gpio.c"

$(IntermediateDirectory)/src_ax32xx_gpio.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_gpio.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_gpio.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_gpio.c"

$(IntermediateDirectory)/src_ax32xx_uart.c$(ObjectSuffix): ../ax32xx/src/ax32xx_uart.c $(IntermediateDirectory)/src_ax32xx_uart.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_uart.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_uart.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_uart.c$(DependSuffix): ../ax32xx/src/ax32xx_uart.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_uart.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_uart.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_uart.c"

$(IntermediateDirectory)/src_ax32xx_uart.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_uart.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_uart.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_uart.c"

$(IntermediateDirectory)/src_ax32xx_timer.c$(ObjectSuffix): ../ax32xx/src/ax32xx_timer.c $(IntermediateDirectory)/src_ax32xx_timer.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_timer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_timer.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_timer.c$(DependSuffix): ../ax32xx/src/ax32xx_timer.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_timer.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_timer.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_timer.c"

$(IntermediateDirectory)/src_ax32xx_timer.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_timer.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_timer.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_timer.c"

$(IntermediateDirectory)/src_ax32xx_tminf.c$(ObjectSuffix): ../ax32xx/src/ax32xx_tminf.c $(IntermediateDirectory)/src_ax32xx_tminf.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_tminf.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_tminf.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_tminf.c$(DependSuffix): ../ax32xx/src/ax32xx_tminf.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_tminf.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_tminf.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_tminf.c"

$(IntermediateDirectory)/src_ax32xx_tminf.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_tminf.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_tminf.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_tminf.c"

$(IntermediateDirectory)/src_ax32xx_spi.c$(ObjectSuffix): ../ax32xx/src/ax32xx_spi.c $(IntermediateDirectory)/src_ax32xx_spi.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_spi.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_spi.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_spi.c$(DependSuffix): ../ax32xx/src/ax32xx_spi.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_spi.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_spi.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_spi.c"

$(IntermediateDirectory)/src_ax32xx_spi.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_spi.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_spi.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_spi.c"

$(IntermediateDirectory)/src_ax32xx_rtc.c$(ObjectSuffix): ../ax32xx/src/ax32xx_rtc.c $(IntermediateDirectory)/src_ax32xx_rtc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_rtc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_rtc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_rtc.c$(DependSuffix): ../ax32xx/src/ax32xx_rtc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_rtc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_rtc.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_rtc.c"

$(IntermediateDirectory)/src_ax32xx_rtc.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_rtc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_rtc.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_rtc.c"

$(IntermediateDirectory)/src_ax32xx_md.c$(ObjectSuffix): ../ax32xx/src/ax32xx_md.c $(IntermediateDirectory)/src_ax32xx_md.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_md.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_md.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_md.c$(DependSuffix): ../ax32xx/src/ax32xx_md.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_md.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_md.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_md.c"

$(IntermediateDirectory)/src_ax32xx_md.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_md.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_md.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_md.c"

$(IntermediateDirectory)/src_ax32xx_iic.c$(ObjectSuffix): ../ax32xx/src/ax32xx_iic.c $(IntermediateDirectory)/src_ax32xx_iic.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_iic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_iic.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_iic.c$(DependSuffix): ../ax32xx/src/ax32xx_iic.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_iic.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_iic.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_iic.c"

$(IntermediateDirectory)/src_ax32xx_iic.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_iic.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_iic.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_iic.c"

$(IntermediateDirectory)/src_ax32xx_dac.c$(ObjectSuffix): ../ax32xx/src/ax32xx_dac.c $(IntermediateDirectory)/src_ax32xx_dac.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_dac.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_dac.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_dac.c$(DependSuffix): ../ax32xx/src/ax32xx_dac.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_dac.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_dac.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_dac.c"

$(IntermediateDirectory)/src_ax32xx_dac.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_dac.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_dac.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_dac.c"

$(IntermediateDirectory)/src_ax32xx_adc.c$(ObjectSuffix): ../ax32xx/src/ax32xx_adc.c $(IntermediateDirectory)/src_ax32xx_adc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_adc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_adc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_adc.c$(DependSuffix): ../ax32xx/src/ax32xx_adc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_adc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_adc.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_adc.c"

$(IntermediateDirectory)/src_ax32xx_adc.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_adc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_adc.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_adc.c"

$(IntermediateDirectory)/src_ax32xx_auadc.c$(ObjectSuffix): ../ax32xx/src/ax32xx_auadc.c $(IntermediateDirectory)/src_ax32xx_auadc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_auadc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_auadc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_auadc.c$(DependSuffix): ../ax32xx/src/ax32xx_auadc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_auadc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_auadc.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_auadc.c"

$(IntermediateDirectory)/src_ax32xx_auadc.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_auadc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_auadc.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_auadc.c"

$(IntermediateDirectory)/src_ax32xx_isp.c$(ObjectSuffix): ../ax32xx/src/ax32xx_isp.c $(IntermediateDirectory)/src_ax32xx_isp.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_isp.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_isp.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_isp.c$(DependSuffix): ../ax32xx/src/ax32xx_isp.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_isp.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_isp.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_isp.c"

$(IntermediateDirectory)/src_ax32xx_isp.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_isp.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_isp.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_isp.c"

$(IntermediateDirectory)/src_jpeg_table.c$(ObjectSuffix): ../ax32xx/src/jpeg_table.c $(IntermediateDirectory)/src_jpeg_table.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/jpeg_table.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_jpeg_table.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_jpeg_table.c$(DependSuffix): ../ax32xx/src/jpeg_table.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_jpeg_table.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_jpeg_table.c$(DependSuffix) -MM "../ax32xx/src/jpeg_table.c"

$(IntermediateDirectory)/src_jpeg_table.c$(PreprocessSuffix): ../ax32xx/src/jpeg_table.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_jpeg_table.c$(PreprocessSuffix) "../ax32xx/src/jpeg_table.c"

$(IntermediateDirectory)/src_isp_tab.c$(ObjectSuffix): ../ax32xx/src/isp_tab.c $(IntermediateDirectory)/src_isp_tab.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/isp_tab.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_isp_tab.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_isp_tab.c$(DependSuffix): ../ax32xx/src/isp_tab.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_isp_tab.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_isp_tab.c$(DependSuffix) -MM "../ax32xx/src/isp_tab.c"

$(IntermediateDirectory)/src_isp_tab.c$(PreprocessSuffix): ../ax32xx/src/isp_tab.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_isp_tab.c$(PreprocessSuffix) "../ax32xx/src/isp_tab.c"

$(IntermediateDirectory)/src_ax32xx_usb.c$(ObjectSuffix): ../ax32xx/src/ax32xx_usb.c $(IntermediateDirectory)/src_ax32xx_usb.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_usb.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_usb.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_usb.c$(DependSuffix): ../ax32xx/src/ax32xx_usb.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_usb.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_usb.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_usb.c"

$(IntermediateDirectory)/src_ax32xx_usb.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_usb.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_usb.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_usb.c"

$(IntermediateDirectory)/src_ax32xx_misc.c$(ObjectSuffix): ../ax32xx/src/ax32xx_misc.c $(IntermediateDirectory)/src_ax32xx_misc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_misc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_misc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_misc.c$(DependSuffix): ../ax32xx/src/ax32xx_misc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_misc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_misc.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_misc.c"

$(IntermediateDirectory)/src_ax32xx_misc.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_misc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_misc.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_misc.c"

$(IntermediateDirectory)/src_ax32xx_pip.c$(ObjectSuffix): ../ax32xx/src/ax32xx_pip.c $(IntermediateDirectory)/src_ax32xx_pip.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_pip.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_pip.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_pip.c$(DependSuffix): ../ax32xx/src/ax32xx_pip.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_pip.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_pip.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_pip.c"

$(IntermediateDirectory)/src_ax32xx_pip.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_pip.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_pip.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_pip.c"

$(IntermediateDirectory)/src_ax32xx_btuart.c$(ObjectSuffix): ../ax32xx/src/ax32xx_btuart.c $(IntermediateDirectory)/src_ax32xx_btuart.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_btuart.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_btuart.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_btuart.c$(DependSuffix): ../ax32xx/src/ax32xx_btuart.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_btuart.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_btuart.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_btuart.c"

$(IntermediateDirectory)/src_ax32xx_btuart.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_btuart.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_btuart.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_btuart.c"

$(IntermediateDirectory)/src_ax32xx_crc.c$(ObjectSuffix): ../ax32xx/src/ax32xx_crc.c $(IntermediateDirectory)/src_ax32xx_crc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_crc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_crc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_crc.c$(DependSuffix): ../ax32xx/src/ax32xx_crc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_crc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_crc.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_crc.c"

$(IntermediateDirectory)/src_ax32xx_crc.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_crc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_crc.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_crc.c"

$(IntermediateDirectory)/src_ax32xx_emi.c$(ObjectSuffix): ../ax32xx/src/ax32xx_emi.c $(IntermediateDirectory)/src_ax32xx_emi.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_emi.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_emi.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_emi.c$(DependSuffix): ../ax32xx/src/ax32xx_emi.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_emi.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_emi.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_emi.c"

$(IntermediateDirectory)/src_ax32xx_emi.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_emi.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_emi.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_emi.c"

$(IntermediateDirectory)/src_ax32xx_rotate.c$(ObjectSuffix): ../ax32xx/src/ax32xx_rotate.c $(IntermediateDirectory)/src_ax32xx_rotate.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_rotate.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_rotate.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_rotate.c$(DependSuffix): ../ax32xx/src/ax32xx_rotate.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_rotate.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_rotate.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_rotate.c"

$(IntermediateDirectory)/src_ax32xx_rotate.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_rotate.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_rotate.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_rotate.c"

$(IntermediateDirectory)/src_ax32xx_osdcmp.c$(ObjectSuffix): ../ax32xx/src/ax32xx_osdcmp.c $(IntermediateDirectory)/src_ax32xx_osdcmp.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/src/ax32xx_osdcmp.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_ax32xx_osdcmp.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_ax32xx_osdcmp.c$(DependSuffix): ../ax32xx/src/ax32xx_osdcmp.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_ax32xx_osdcmp.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_ax32xx_osdcmp.c$(DependSuffix) -MM "../ax32xx/src/ax32xx_osdcmp.c"

$(IntermediateDirectory)/src_ax32xx_osdcmp.c$(PreprocessSuffix): ../ax32xx/src/ax32xx_osdcmp.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_ax32xx_osdcmp.c$(PreprocessSuffix) "../ax32xx/src/ax32xx_osdcmp.c"

$(IntermediateDirectory)/osd_ax32xx_osd.c$(ObjectSuffix): ../ax32xx/osd/ax32xx_osd.c $(IntermediateDirectory)/osd_ax32xx_osd.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/osd/ax32xx_osd.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/osd_ax32xx_osd.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/osd_ax32xx_osd.c$(DependSuffix): ../ax32xx/osd/ax32xx_osd.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/osd_ax32xx_osd.c$(ObjectSuffix) -MF$(IntermediateDirectory)/osd_ax32xx_osd.c$(DependSuffix) -MM "../ax32xx/osd/ax32xx_osd.c"

$(IntermediateDirectory)/osd_ax32xx_osd.c$(PreprocessSuffix): ../ax32xx/osd/ax32xx_osd.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/osd_ax32xx_osd.c$(PreprocessSuffix) "../ax32xx/osd/ax32xx_osd.c"

$(IntermediateDirectory)/csi_ax32xx_csi.c$(ObjectSuffix): ../ax32xx/csi/ax32xx_csi.c $(IntermediateDirectory)/csi_ax32xx_csi.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/csi/ax32xx_csi.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/csi_ax32xx_csi.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/csi_ax32xx_csi.c$(DependSuffix): ../ax32xx/csi/ax32xx_csi.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/csi_ax32xx_csi.c$(ObjectSuffix) -MF$(IntermediateDirectory)/csi_ax32xx_csi.c$(DependSuffix) -MM "../ax32xx/csi/ax32xx_csi.c"

$(IntermediateDirectory)/csi_ax32xx_csi.c$(PreprocessSuffix): ../ax32xx/csi/ax32xx_csi.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/csi_ax32xx_csi.c$(PreprocessSuffix) "../ax32xx/csi/ax32xx_csi.c"

$(IntermediateDirectory)/lcd_ax32xx_lcd.c$(ObjectSuffix): ../ax32xx/lcd/ax32xx_lcd.c $(IntermediateDirectory)/lcd_ax32xx_lcd.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/lcd/ax32xx_lcd.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/lcd_ax32xx_lcd.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/lcd_ax32xx_lcd.c$(DependSuffix): ../ax32xx/lcd/ax32xx_lcd.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/lcd_ax32xx_lcd.c$(ObjectSuffix) -MF$(IntermediateDirectory)/lcd_ax32xx_lcd.c$(DependSuffix) -MM "../ax32xx/lcd/ax32xx_lcd.c"

$(IntermediateDirectory)/lcd_ax32xx_lcd.c$(PreprocessSuffix): ../ax32xx/lcd/ax32xx_lcd.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/lcd_ax32xx_lcd.c$(PreprocessSuffix) "../ax32xx/lcd/ax32xx_lcd.c"

$(IntermediateDirectory)/mjpeg_ax32xx_mjpeg.c$(ObjectSuffix): ../ax32xx/mjpeg/ax32xx_mjpeg.c $(IntermediateDirectory)/mjpeg_ax32xx_mjpeg.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/ax32xx/mjpeg/ax32xx_mjpeg.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/mjpeg_ax32xx_mjpeg.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/mjpeg_ax32xx_mjpeg.c$(DependSuffix): ../ax32xx/mjpeg/ax32xx_mjpeg.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/mjpeg_ax32xx_mjpeg.c$(ObjectSuffix) -MF$(IntermediateDirectory)/mjpeg_ax32xx_mjpeg.c$(DependSuffix) -MM "../ax32xx/mjpeg/ax32xx_mjpeg.c"

$(IntermediateDirectory)/mjpeg_ax32xx_mjpeg.c$(PreprocessSuffix): ../ax32xx/mjpeg/ax32xx_mjpeg.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/mjpeg_ax32xx_mjpeg.c$(PreprocessSuffix) "../ax32xx/mjpeg/ax32xx_mjpeg.c"

$(IntermediateDirectory)/src_hal_adc.c$(ObjectSuffix): ../hal/src/hal_adc.c $(IntermediateDirectory)/src_hal_adc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_adc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_adc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_adc.c$(DependSuffix): ../hal/src/hal_adc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_adc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_adc.c$(DependSuffix) -MM "../hal/src/hal_adc.c"

$(IntermediateDirectory)/src_hal_adc.c$(PreprocessSuffix): ../hal/src/hal_adc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_adc.c$(PreprocessSuffix) "../hal/src/hal_adc.c"

$(IntermediateDirectory)/src_hal_csi.c$(ObjectSuffix): ../hal/src/hal_csi.c $(IntermediateDirectory)/src_hal_csi.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_csi.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_csi.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_csi.c$(DependSuffix): ../hal/src/hal_csi.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_csi.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_csi.c$(DependSuffix) -MM "../hal/src/hal_csi.c"

$(IntermediateDirectory)/src_hal_csi.c$(PreprocessSuffix): ../hal/src/hal_csi.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_csi.c$(PreprocessSuffix) "../hal/src/hal_csi.c"

$(IntermediateDirectory)/src_hal_dac.c$(ObjectSuffix): ../hal/src/hal_dac.c $(IntermediateDirectory)/src_hal_dac.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_dac.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_dac.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_dac.c$(DependSuffix): ../hal/src/hal_dac.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_dac.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_dac.c$(DependSuffix) -MM "../hal/src/hal_dac.c"

$(IntermediateDirectory)/src_hal_dac.c$(PreprocessSuffix): ../hal/src/hal_dac.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_dac.c$(PreprocessSuffix) "../hal/src/hal_dac.c"

$(IntermediateDirectory)/src_hal_eeprom.c$(ObjectSuffix): ../hal/src/hal_eeprom.c $(IntermediateDirectory)/src_hal_eeprom.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_eeprom.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_eeprom.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_eeprom.c$(DependSuffix): ../hal/src/hal_eeprom.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_eeprom.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_eeprom.c$(DependSuffix) -MM "../hal/src/hal_eeprom.c"

$(IntermediateDirectory)/src_hal_eeprom.c$(PreprocessSuffix): ../hal/src/hal_eeprom.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_eeprom.c$(PreprocessSuffix) "../hal/src/hal_eeprom.c"

$(IntermediateDirectory)/src_hal_gpio.c$(ObjectSuffix): ../hal/src/hal_gpio.c $(IntermediateDirectory)/src_hal_gpio.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_gpio.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_gpio.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_gpio.c$(DependSuffix): ../hal/src/hal_gpio.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_gpio.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_gpio.c$(DependSuffix) -MM "../hal/src/hal_gpio.c"

$(IntermediateDirectory)/src_hal_gpio.c$(PreprocessSuffix): ../hal/src/hal_gpio.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_gpio.c$(PreprocessSuffix) "../hal/src/hal_gpio.c"

$(IntermediateDirectory)/src_hal_iic.c$(ObjectSuffix): ../hal/src/hal_iic.c $(IntermediateDirectory)/src_hal_iic.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_iic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_iic.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_iic.c$(DependSuffix): ../hal/src/hal_iic.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_iic.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_iic.c$(DependSuffix) -MM "../hal/src/hal_iic.c"

$(IntermediateDirectory)/src_hal_iic.c$(PreprocessSuffix): ../hal/src/hal_iic.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_iic.c$(PreprocessSuffix) "../hal/src/hal_iic.c"

$(IntermediateDirectory)/src_hal_lcd.c$(ObjectSuffix): ../hal/src/hal_lcd.c $(IntermediateDirectory)/src_hal_lcd.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_lcd.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_lcd.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_lcd.c$(DependSuffix): ../hal/src/hal_lcd.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_lcd.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_lcd.c$(DependSuffix) -MM "../hal/src/hal_lcd.c"

$(IntermediateDirectory)/src_hal_lcd.c$(PreprocessSuffix): ../hal/src/hal_lcd.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_lcd.c$(PreprocessSuffix) "../hal/src/hal_lcd.c"

$(IntermediateDirectory)/src_hal_md.c$(ObjectSuffix): ../hal/src/hal_md.c $(IntermediateDirectory)/src_hal_md.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_md.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_md.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_md.c$(DependSuffix): ../hal/src/hal_md.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_md.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_md.c$(DependSuffix) -MM "../hal/src/hal_md.c"

$(IntermediateDirectory)/src_hal_md.c$(PreprocessSuffix): ../hal/src/hal_md.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_md.c$(PreprocessSuffix) "../hal/src/hal_md.c"

$(IntermediateDirectory)/src_hal_osd.c$(ObjectSuffix): ../hal/src/hal_osd.c $(IntermediateDirectory)/src_hal_osd.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_osd.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_osd.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_osd.c$(DependSuffix): ../hal/src/hal_osd.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_osd.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_osd.c$(DependSuffix) -MM "../hal/src/hal_osd.c"

$(IntermediateDirectory)/src_hal_osd.c$(PreprocessSuffix): ../hal/src/hal_osd.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_osd.c$(PreprocessSuffix) "../hal/src/hal_osd.c"

$(IntermediateDirectory)/src_hal_rtc.c$(ObjectSuffix): ../hal/src/hal_rtc.c $(IntermediateDirectory)/src_hal_rtc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_rtc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_rtc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_rtc.c$(DependSuffix): ../hal/src/hal_rtc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_rtc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_rtc.c$(DependSuffix) -MM "../hal/src/hal_rtc.c"

$(IntermediateDirectory)/src_hal_rtc.c$(PreprocessSuffix): ../hal/src/hal_rtc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_rtc.c$(PreprocessSuffix) "../hal/src/hal_rtc.c"

$(IntermediateDirectory)/src_hal_sd.c$(ObjectSuffix): ../hal/src/hal_sd.c $(IntermediateDirectory)/src_hal_sd.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_sd.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_sd.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_sd.c$(DependSuffix): ../hal/src/hal_sd.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_sd.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_sd.c$(DependSuffix) -MM "../hal/src/hal_sd.c"

$(IntermediateDirectory)/src_hal_sd.c$(PreprocessSuffix): ../hal/src/hal_sd.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_sd.c$(PreprocessSuffix) "../hal/src/hal_sd.c"

$(IntermediateDirectory)/src_hal_spi.c$(ObjectSuffix): ../hal/src/hal_spi.c $(IntermediateDirectory)/src_hal_spi.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_spi.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_spi.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_spi.c$(DependSuffix): ../hal/src/hal_spi.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_spi.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_spi.c$(DependSuffix) -MM "../hal/src/hal_spi.c"

$(IntermediateDirectory)/src_hal_spi.c$(PreprocessSuffix): ../hal/src/hal_spi.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_spi.c$(PreprocessSuffix) "../hal/src/hal_spi.c"

$(IntermediateDirectory)/src_hal_timer.c$(ObjectSuffix): ../hal/src/hal_timer.c $(IntermediateDirectory)/src_hal_timer.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_timer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_timer.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_timer.c$(DependSuffix): ../hal/src/hal_timer.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_timer.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_timer.c$(DependSuffix) -MM "../hal/src/hal_timer.c"

$(IntermediateDirectory)/src_hal_timer.c$(PreprocessSuffix): ../hal/src/hal_timer.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_timer.c$(PreprocessSuffix) "../hal/src/hal_timer.c"

$(IntermediateDirectory)/src_hal_uart.c$(ObjectSuffix): ../hal/src/hal_uart.c $(IntermediateDirectory)/src_hal_uart.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_uart.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_uart.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_uart.c$(DependSuffix): ../hal/src/hal_uart.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_uart.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_uart.c$(DependSuffix) -MM "../hal/src/hal_uart.c"

$(IntermediateDirectory)/src_hal_uart.c$(PreprocessSuffix): ../hal/src/hal_uart.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_uart.c$(PreprocessSuffix) "../hal/src/hal_uart.c"

$(IntermediateDirectory)/src_hal_watermark.c$(ObjectSuffix): ../hal/src/hal_watermark.c $(IntermediateDirectory)/src_hal_watermark.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_watermark.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_watermark.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_watermark.c$(DependSuffix): ../hal/src/hal_watermark.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_watermark.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_watermark.c$(DependSuffix) -MM "../hal/src/hal_watermark.c"

$(IntermediateDirectory)/src_hal_watermark.c$(PreprocessSuffix): ../hal/src/hal_watermark.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_watermark.c$(PreprocessSuffix) "../hal/src/hal_watermark.c"

$(IntermediateDirectory)/src_hal_sys.c$(ObjectSuffix): ../hal/src/hal_sys.c $(IntermediateDirectory)/src_hal_sys.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_sys.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_sys.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_sys.c$(DependSuffix): ../hal/src/hal_sys.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_sys.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_sys.c$(DependSuffix) -MM "../hal/src/hal_sys.c"

$(IntermediateDirectory)/src_hal_sys.c$(PreprocessSuffix): ../hal/src/hal_sys.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_sys.c$(PreprocessSuffix) "../hal/src/hal_sys.c"

$(IntermediateDirectory)/src_hal_auadc.c$(ObjectSuffix): ../hal/src/hal_auadc.c $(IntermediateDirectory)/src_hal_auadc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_auadc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_auadc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_auadc.c$(DependSuffix): ../hal/src/hal_auadc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_auadc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_auadc.c$(DependSuffix) -MM "../hal/src/hal_auadc.c"

$(IntermediateDirectory)/src_hal_auadc.c$(PreprocessSuffix): ../hal/src/hal_auadc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_auadc.c$(PreprocessSuffix) "../hal/src/hal_auadc.c"

$(IntermediateDirectory)/src_hal_mjpeg.c$(ObjectSuffix): ../hal/src/hal_mjpeg.c $(IntermediateDirectory)/src_hal_mjpeg.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_mjpeg.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_mjpeg.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_mjpeg.c$(DependSuffix): ../hal/src/hal_mjpeg.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_mjpeg.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_mjpeg.c$(DependSuffix) -MM "../hal/src/hal_mjpeg.c"

$(IntermediateDirectory)/src_hal_mjpeg.c$(PreprocessSuffix): ../hal/src/hal_mjpeg.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_mjpeg.c$(PreprocessSuffix) "../hal/src/hal_mjpeg.c"

$(IntermediateDirectory)/src_hal_int.c$(ObjectSuffix): ../hal/src/hal_int.c $(IntermediateDirectory)/src_hal_int.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_int.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_int.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_int.c$(DependSuffix): ../hal/src/hal_int.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_int.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_int.c$(DependSuffix) -MM "../hal/src/hal_int.c"

$(IntermediateDirectory)/src_hal_int.c$(PreprocessSuffix): ../hal/src/hal_int.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_int.c$(PreprocessSuffix) "../hal/src/hal_int.c"

$(IntermediateDirectory)/src_hal_wdt.c$(ObjectSuffix): ../hal/src/hal_wdt.c $(IntermediateDirectory)/src_hal_wdt.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_wdt.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_wdt.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_wdt.c$(DependSuffix): ../hal/src/hal_wdt.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_wdt.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_wdt.c$(DependSuffix) -MM "../hal/src/hal_wdt.c"

$(IntermediateDirectory)/src_hal_wdt.c$(PreprocessSuffix): ../hal/src/hal_wdt.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_wdt.c$(PreprocessSuffix) "../hal/src/hal_wdt.c"

$(IntermediateDirectory)/src_hal_stream.c$(ObjectSuffix): ../hal/src/hal_stream.c $(IntermediateDirectory)/src_hal_stream.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_stream.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_stream.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_stream.c$(DependSuffix): ../hal/src/hal_stream.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_stream.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_stream.c$(DependSuffix) -MM "../hal/src/hal_stream.c"

$(IntermediateDirectory)/src_hal_stream.c$(PreprocessSuffix): ../hal/src/hal_stream.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_stream.c$(PreprocessSuffix) "../hal/src/hal_stream.c"

$(IntermediateDirectory)/src_hal_emi.c$(ObjectSuffix): ../hal/src/hal_emi.c $(IntermediateDirectory)/src_hal_emi.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_emi.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_emi.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_emi.c$(DependSuffix): ../hal/src/hal_emi.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_emi.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_emi.c$(DependSuffix) -MM "../hal/src/hal_emi.c"

$(IntermediateDirectory)/src_hal_emi.c$(PreprocessSuffix): ../hal/src/hal_emi.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_emi.c$(PreprocessSuffix) "../hal/src/hal_emi.c"

$(IntermediateDirectory)/src_hal_mjpegB.c$(ObjectSuffix): ../hal/src/hal_mjpegB.c $(IntermediateDirectory)/src_hal_mjpegB.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_mjpegB.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_mjpegB.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_mjpegB.c$(DependSuffix): ../hal/src/hal_mjpegB.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_mjpegB.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_mjpegB.c$(DependSuffix) -MM "../hal/src/hal_mjpegB.c"

$(IntermediateDirectory)/src_hal_mjpegB.c$(PreprocessSuffix): ../hal/src/hal_mjpegB.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_mjpegB.c$(PreprocessSuffix) "../hal/src/hal_mjpegB.c"

$(IntermediateDirectory)/src_hal_osdcmp.c$(ObjectSuffix): ../hal/src/hal_osdcmp.c $(IntermediateDirectory)/src_hal_osdcmp.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_osdcmp.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_osdcmp.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_osdcmp.c$(DependSuffix): ../hal/src/hal_osdcmp.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_osdcmp.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_osdcmp.c$(DependSuffix) -MM "../hal/src/hal_osdcmp.c"

$(IntermediateDirectory)/src_hal_osdcmp.c$(PreprocessSuffix): ../hal/src/hal_osdcmp.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_osdcmp.c$(PreprocessSuffix) "../hal/src/hal_osdcmp.c"

$(IntermediateDirectory)/src_hal_rotate.c$(ObjectSuffix): ../hal/src/hal_rotate.c $(IntermediateDirectory)/src_hal_rotate.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_rotate.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_rotate.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_rotate.c$(DependSuffix): ../hal/src/hal_rotate.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_rotate.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_rotate.c$(DependSuffix) -MM "../hal/src/hal_rotate.c"

$(IntermediateDirectory)/src_hal_rotate.c$(PreprocessSuffix): ../hal/src/hal_rotate.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_rotate.c$(PreprocessSuffix) "../hal/src/hal_rotate.c"

$(IntermediateDirectory)/src_hal_lcdframe.c$(ObjectSuffix): ../hal/src/hal_lcdframe.c $(IntermediateDirectory)/src_hal_lcdframe.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/src/hal_lcdframe.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/src_hal_lcdframe.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/src_hal_lcdframe.c$(DependSuffix): ../hal/src/hal_lcdframe.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/src_hal_lcdframe.c$(ObjectSuffix) -MF$(IntermediateDirectory)/src_hal_lcdframe.c$(DependSuffix) -MM "../hal/src/hal_lcdframe.c"

$(IntermediateDirectory)/src_hal_lcdframe.c$(PreprocessSuffix): ../hal/src/hal_lcdframe.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/src_hal_lcdframe.c$(PreprocessSuffix) "../hal/src/hal_lcdframe.c"

$(IntermediateDirectory)/isp_hal_isp.c$(ObjectSuffix): ../hal/isp/hal_isp.c $(IntermediateDirectory)/isp_hal_isp.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/isp/hal_isp.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/isp_hal_isp.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/isp_hal_isp.c$(DependSuffix): ../hal/isp/hal_isp.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/isp_hal_isp.c$(ObjectSuffix) -MF$(IntermediateDirectory)/isp_hal_isp.c$(DependSuffix) -MM "../hal/isp/hal_isp.c"

$(IntermediateDirectory)/isp_hal_isp.c$(PreprocessSuffix): ../hal/isp/hal_isp.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/isp_hal_isp.c$(PreprocessSuffix) "../hal/isp/hal_isp.c"

$(IntermediateDirectory)/dusb_hal_usb_api.c$(ObjectSuffix): ../hal/dusb/hal_usb_api.c $(IntermediateDirectory)/dusb_hal_usb_api.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/dusb/hal_usb_api.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/dusb_hal_usb_api.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/dusb_hal_usb_api.c$(DependSuffix): ../hal/dusb/hal_usb_api.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/dusb_hal_usb_api.c$(ObjectSuffix) -MF$(IntermediateDirectory)/dusb_hal_usb_api.c$(DependSuffix) -MM "../hal/dusb/hal_usb_api.c"

$(IntermediateDirectory)/dusb_hal_usb_api.c$(PreprocessSuffix): ../hal/dusb/hal_usb_api.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/dusb_hal_usb_api.c$(PreprocessSuffix) "../hal/dusb/hal_usb_api.c"

$(IntermediateDirectory)/dusb_hal_usb_dev_enum.c$(ObjectSuffix): ../hal/dusb/hal_usb_dev_enum.c $(IntermediateDirectory)/dusb_hal_usb_dev_enum.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/dusb/hal_usb_dev_enum.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/dusb_hal_usb_dev_enum.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/dusb_hal_usb_dev_enum.c$(DependSuffix): ../hal/dusb/hal_usb_dev_enum.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/dusb_hal_usb_dev_enum.c$(ObjectSuffix) -MF$(IntermediateDirectory)/dusb_hal_usb_dev_enum.c$(DependSuffix) -MM "../hal/dusb/hal_usb_dev_enum.c"

$(IntermediateDirectory)/dusb_hal_usb_dev_enum.c$(PreprocessSuffix): ../hal/dusb/hal_usb_dev_enum.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/dusb_hal_usb_dev_enum.c$(PreprocessSuffix) "../hal/dusb/hal_usb_dev_enum.c"

$(IntermediateDirectory)/dusb_hal_usb_msc.c$(ObjectSuffix): ../hal/dusb/hal_usb_msc.c $(IntermediateDirectory)/dusb_hal_usb_msc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/dusb/hal_usb_msc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/dusb_hal_usb_msc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/dusb_hal_usb_msc.c$(DependSuffix): ../hal/dusb/hal_usb_msc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/dusb_hal_usb_msc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/dusb_hal_usb_msc.c$(DependSuffix) -MM "../hal/dusb/hal_usb_msc.c"

$(IntermediateDirectory)/dusb_hal_usb_msc.c$(PreprocessSuffix): ../hal/dusb/hal_usb_msc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/dusb_hal_usb_msc.c$(PreprocessSuffix) "../hal/dusb/hal_usb_msc.c"

$(IntermediateDirectory)/dusb_hal_usb_uac.c$(ObjectSuffix): ../hal/dusb/hal_usb_uac.c $(IntermediateDirectory)/dusb_hal_usb_uac.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/dusb/hal_usb_uac.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/dusb_hal_usb_uac.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/dusb_hal_usb_uac.c$(DependSuffix): ../hal/dusb/hal_usb_uac.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/dusb_hal_usb_uac.c$(ObjectSuffix) -MF$(IntermediateDirectory)/dusb_hal_usb_uac.c$(DependSuffix) -MM "../hal/dusb/hal_usb_uac.c"

$(IntermediateDirectory)/dusb_hal_usb_uac.c$(PreprocessSuffix): ../hal/dusb/hal_usb_uac.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/dusb_hal_usb_uac.c$(PreprocessSuffix) "../hal/dusb/hal_usb_uac.c"

$(IntermediateDirectory)/dusb_hal_usb_uvc.c$(ObjectSuffix): ../hal/dusb/hal_usb_uvc.c $(IntermediateDirectory)/dusb_hal_usb_uvc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/dusb/hal_usb_uvc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/dusb_hal_usb_uvc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/dusb_hal_usb_uvc.c$(DependSuffix): ../hal/dusb/hal_usb_uvc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/dusb_hal_usb_uvc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/dusb_hal_usb_uvc.c$(DependSuffix) -MM "../hal/dusb/hal_usb_uvc.c"

$(IntermediateDirectory)/dusb_hal_usb_uvc.c$(PreprocessSuffix): ../hal/dusb/hal_usb_uvc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/dusb_hal_usb_uvc.c$(PreprocessSuffix) "../hal/dusb/hal_usb_uvc.c"

$(IntermediateDirectory)/husb_hal_usb_host_api.c$(ObjectSuffix): ../hal/husb/hal_usb_host_api.c $(IntermediateDirectory)/husb_hal_usb_host_api.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/husb/hal_usb_host_api.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/husb_hal_usb_host_api.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/husb_hal_usb_host_api.c$(DependSuffix): ../hal/husb/hal_usb_host_api.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/husb_hal_usb_host_api.c$(ObjectSuffix) -MF$(IntermediateDirectory)/husb_hal_usb_host_api.c$(DependSuffix) -MM "../hal/husb/hal_usb_host_api.c"

$(IntermediateDirectory)/husb_hal_usb_host_api.c$(PreprocessSuffix): ../hal/husb/hal_usb_host_api.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/husb_hal_usb_host_api.c$(PreprocessSuffix) "../hal/husb/hal_usb_host_api.c"

$(IntermediateDirectory)/husb_hal_usb_host_enum.c$(ObjectSuffix): ../hal/husb/hal_usb_host_enum.c $(IntermediateDirectory)/husb_hal_usb_host_enum.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/husb/hal_usb_host_enum.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/husb_hal_usb_host_enum.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/husb_hal_usb_host_enum.c$(DependSuffix): ../hal/husb/hal_usb_host_enum.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/husb_hal_usb_host_enum.c$(ObjectSuffix) -MF$(IntermediateDirectory)/husb_hal_usb_host_enum.c$(DependSuffix) -MM "../hal/husb/hal_usb_host_enum.c"

$(IntermediateDirectory)/husb_hal_usb_host_enum.c$(PreprocessSuffix): ../hal/husb/hal_usb_host_enum.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/husb_hal_usb_host_enum.c$(PreprocessSuffix) "../hal/husb/hal_usb_host_enum.c"

$(IntermediateDirectory)/husb_hal_usb_host_tpbulk.c$(ObjectSuffix): ../hal/husb/hal_usb_host_tpbulk.c $(IntermediateDirectory)/husb_hal_usb_host_tpbulk.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/husb/hal_usb_host_tpbulk.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/husb_hal_usb_host_tpbulk.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/husb_hal_usb_host_tpbulk.c$(DependSuffix): ../hal/husb/hal_usb_host_tpbulk.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/husb_hal_usb_host_tpbulk.c$(ObjectSuffix) -MF$(IntermediateDirectory)/husb_hal_usb_host_tpbulk.c$(DependSuffix) -MM "../hal/husb/hal_usb_host_tpbulk.c"

$(IntermediateDirectory)/husb_hal_usb_host_tpbulk.c$(PreprocessSuffix): ../hal/husb/hal_usb_host_tpbulk.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/husb_hal_usb_host_tpbulk.c$(PreprocessSuffix) "../hal/husb/hal_usb_host_tpbulk.c"

$(IntermediateDirectory)/husb_hal_usb_host_uvc.c$(ObjectSuffix): ../hal/husb/hal_usb_host_uvc.c $(IntermediateDirectory)/husb_hal_usb_host_uvc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/husb/hal_usb_host_uvc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/husb_hal_usb_host_uvc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/husb_hal_usb_host_uvc.c$(DependSuffix): ../hal/husb/hal_usb_host_uvc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/husb_hal_usb_host_uvc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/husb_hal_usb_host_uvc.c$(DependSuffix) -MM "../hal/husb/hal_usb_host_uvc.c"

$(IntermediateDirectory)/husb_hal_usb_host_uvc.c$(PreprocessSuffix): ../hal/husb/hal_usb_host_uvc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/husb_hal_usb_host_uvc.c$(PreprocessSuffix) "../hal/husb/hal_usb_host_uvc.c"

$(IntermediateDirectory)/husb_hal_usensor.c$(ObjectSuffix): ../hal/husb/hal_usensor.c $(IntermediateDirectory)/husb_hal_usensor.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/hal/husb/hal_usensor.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/husb_hal_usensor.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/husb_hal_usensor.c$(DependSuffix): ../hal/husb/hal_usensor.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/husb_hal_usensor.c$(ObjectSuffix) -MF$(IntermediateDirectory)/husb_hal_usensor.c$(DependSuffix) -MM "../hal/husb/hal_usensor.c"

$(IntermediateDirectory)/husb_hal_usensor.c$(PreprocessSuffix): ../hal/husb/hal_usensor.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/husb_hal_usensor.c$(PreprocessSuffix) "../hal/husb/hal_usensor.c"

$(IntermediateDirectory)/audio_audio_playback.c$(ObjectSuffix): ../multimedia/audio/audio_playback.c $(IntermediateDirectory)/audio_audio_playback.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/audio/audio_playback.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/audio_audio_playback.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/audio_audio_playback.c$(DependSuffix): ../multimedia/audio/audio_playback.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/audio_audio_playback.c$(ObjectSuffix) -MF$(IntermediateDirectory)/audio_audio_playback.c$(DependSuffix) -MM "../multimedia/audio/audio_playback.c"

$(IntermediateDirectory)/audio_audio_playback.c$(PreprocessSuffix): ../multimedia/audio/audio_playback.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/audio_audio_playback.c$(PreprocessSuffix) "../multimedia/audio/audio_playback.c"

$(IntermediateDirectory)/audio_audio_record.c$(ObjectSuffix): ../multimedia/audio/audio_record.c $(IntermediateDirectory)/audio_audio_record.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/audio/audio_record.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/audio_audio_record.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/audio_audio_record.c$(DependSuffix): ../multimedia/audio/audio_record.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/audio_audio_record.c$(ObjectSuffix) -MF$(IntermediateDirectory)/audio_audio_record.c$(DependSuffix) -MM "../multimedia/audio/audio_record.c"

$(IntermediateDirectory)/audio_audio_record.c$(PreprocessSuffix): ../multimedia/audio/audio_record.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/audio_audio_record.c$(PreprocessSuffix) "../multimedia/audio/audio_record.c"

$(IntermediateDirectory)/audio_ring_buffer.c$(ObjectSuffix): ../multimedia/audio/ring_buffer.c $(IntermediateDirectory)/audio_ring_buffer.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/audio/ring_buffer.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/audio_ring_buffer.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/audio_ring_buffer.c$(DependSuffix): ../multimedia/audio/ring_buffer.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/audio_ring_buffer.c$(ObjectSuffix) -MF$(IntermediateDirectory)/audio_ring_buffer.c$(DependSuffix) -MM "../multimedia/audio/ring_buffer.c"

$(IntermediateDirectory)/audio_ring_buffer.c$(PreprocessSuffix): ../multimedia/audio/ring_buffer.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/audio_ring_buffer.c$(PreprocessSuffix) "../multimedia/audio/ring_buffer.c"

$(IntermediateDirectory)/video_video_playback.c$(ObjectSuffix): ../multimedia/video/video_playback.c $(IntermediateDirectory)/video_video_playback.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/video/video_playback.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/video_video_playback.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/video_video_playback.c$(DependSuffix): ../multimedia/video/video_playback.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/video_video_playback.c$(ObjectSuffix) -MF$(IntermediateDirectory)/video_video_playback.c$(DependSuffix) -MM "../multimedia/video/video_playback.c"

$(IntermediateDirectory)/video_video_playback.c$(PreprocessSuffix): ../multimedia/video/video_playback.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/video_video_playback.c$(PreprocessSuffix) "../multimedia/video/video_playback.c"

$(IntermediateDirectory)/video_video_record.c$(ObjectSuffix): ../multimedia/video/video_record.c $(IntermediateDirectory)/video_video_record.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/video/video_record.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/video_video_record.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/video_video_record.c$(DependSuffix): ../multimedia/video/video_record.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/video_video_record.c$(ObjectSuffix) -MF$(IntermediateDirectory)/video_video_record.c$(DependSuffix) -MM "../multimedia/video/video_record.c"

$(IntermediateDirectory)/video_video_record.c$(PreprocessSuffix): ../multimedia/video/video_record.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/video_video_record.c$(PreprocessSuffix) "../multimedia/video/video_record.c"

$(IntermediateDirectory)/video_video_record_B.c$(ObjectSuffix): ../multimedia/video/video_record_B.c $(IntermediateDirectory)/video_video_record_B.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/video/video_record_B.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/video_video_record_B.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/video_video_record_B.c$(DependSuffix): ../multimedia/video/video_record_B.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/video_video_record_B.c$(ObjectSuffix) -MF$(IntermediateDirectory)/video_video_record_B.c$(DependSuffix) -MM "../multimedia/video/video_record_B.c"

$(IntermediateDirectory)/video_video_record_B.c$(PreprocessSuffix): ../multimedia/video/video_record_B.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/video_video_record_B.c$(PreprocessSuffix) "../multimedia/video/video_record_B.c"

$(IntermediateDirectory)/image_image_decode.c$(ObjectSuffix): ../multimedia/image/image_decode.c $(IntermediateDirectory)/image_image_decode.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/image/image_decode.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/image_image_decode.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/image_image_decode.c$(DependSuffix): ../multimedia/image/image_decode.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/image_image_decode.c$(ObjectSuffix) -MF$(IntermediateDirectory)/image_image_decode.c$(DependSuffix) -MM "../multimedia/image/image_decode.c"

$(IntermediateDirectory)/image_image_decode.c$(PreprocessSuffix): ../multimedia/image/image_decode.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/image_image_decode.c$(PreprocessSuffix) "../multimedia/image/image_decode.c"

$(IntermediateDirectory)/image_image_encode.c$(ObjectSuffix): ../multimedia/image/image_encode.c $(IntermediateDirectory)/image_image_encode.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/image/image_encode.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/image_image_encode.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/image_image_encode.c$(DependSuffix): ../multimedia/image/image_encode.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/image_image_encode.c$(ObjectSuffix) -MF$(IntermediateDirectory)/image_image_encode.c$(DependSuffix) -MM "../multimedia/image/image_encode.c"

$(IntermediateDirectory)/image_image_encode.c$(PreprocessSuffix): ../multimedia/image/image_encode.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/image_image_encode.c$(PreprocessSuffix) "../multimedia/image/image_encode.c"

$(IntermediateDirectory)/wav_alaw.c$(ObjectSuffix): ../multimedia/wav/alaw.c $(IntermediateDirectory)/wav_alaw.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/wav/alaw.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/wav_alaw.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/wav_alaw.c$(DependSuffix): ../multimedia/wav/alaw.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/wav_alaw.c$(ObjectSuffix) -MF$(IntermediateDirectory)/wav_alaw.c$(DependSuffix) -MM "../multimedia/wav/alaw.c"

$(IntermediateDirectory)/wav_alaw.c$(PreprocessSuffix): ../multimedia/wav/alaw.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/wav_alaw.c$(PreprocessSuffix) "../multimedia/wav/alaw.c"

$(IntermediateDirectory)/wav_imaadpcm.c$(ObjectSuffix): ../multimedia/wav/imaadpcm.c $(IntermediateDirectory)/wav_imaadpcm.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/wav/imaadpcm.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/wav_imaadpcm.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/wav_imaadpcm.c$(DependSuffix): ../multimedia/wav/imaadpcm.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/wav_imaadpcm.c$(ObjectSuffix) -MF$(IntermediateDirectory)/wav_imaadpcm.c$(DependSuffix) -MM "../multimedia/wav/imaadpcm.c"

$(IntermediateDirectory)/wav_imaadpcm.c$(PreprocessSuffix): ../multimedia/wav/imaadpcm.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/wav_imaadpcm.c$(PreprocessSuffix) "../multimedia/wav/imaadpcm.c"

$(IntermediateDirectory)/wav_pcm.c$(ObjectSuffix): ../multimedia/wav/pcm.c $(IntermediateDirectory)/wav_pcm.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/wav/pcm.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/wav_pcm.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/wav_pcm.c$(DependSuffix): ../multimedia/wav/pcm.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/wav_pcm.c$(ObjectSuffix) -MF$(IntermediateDirectory)/wav_pcm.c$(DependSuffix) -MM "../multimedia/wav/pcm.c"

$(IntermediateDirectory)/wav_pcm.c$(PreprocessSuffix): ../multimedia/wav/pcm.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/wav_pcm.c$(PreprocessSuffix) "../multimedia/wav/pcm.c"

$(IntermediateDirectory)/wav_ulaw.c$(ObjectSuffix): ../multimedia/wav/ulaw.c $(IntermediateDirectory)/wav_ulaw.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/wav/ulaw.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/wav_ulaw.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/wav_ulaw.c$(DependSuffix): ../multimedia/wav/ulaw.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/wav_ulaw.c$(ObjectSuffix) -MF$(IntermediateDirectory)/wav_ulaw.c$(DependSuffix) -MM "../multimedia/wav/ulaw.c"

$(IntermediateDirectory)/wav_ulaw.c$(PreprocessSuffix): ../multimedia/wav/ulaw.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/wav_ulaw.c$(PreprocessSuffix) "../multimedia/wav/ulaw.c"

$(IntermediateDirectory)/wav_wav.c$(ObjectSuffix): ../multimedia/wav/wav.c $(IntermediateDirectory)/wav_wav.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/wav/wav.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/wav_wav.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/wav_wav.c$(DependSuffix): ../multimedia/wav/wav.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/wav_wav.c$(ObjectSuffix) -MF$(IntermediateDirectory)/wav_wav.c$(DependSuffix) -MM "../multimedia/wav/wav.c"

$(IntermediateDirectory)/wav_wav.c$(PreprocessSuffix): ../multimedia/wav/wav.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/wav_wav.c$(PreprocessSuffix) "../multimedia/wav/wav.c"

$(IntermediateDirectory)/stream_stream.c$(ObjectSuffix): ../multimedia/stream/stream.c $(IntermediateDirectory)/stream_stream.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/stream/stream.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/stream_stream.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/stream_stream.c$(DependSuffix): ../multimedia/stream/stream.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/stream_stream.c$(ObjectSuffix) -MF$(IntermediateDirectory)/stream_stream.c$(DependSuffix) -MM "../multimedia/stream/stream.c"

$(IntermediateDirectory)/stream_stream.c$(PreprocessSuffix): ../multimedia/stream/stream.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/stream_stream.c$(PreprocessSuffix) "../multimedia/stream/stream.c"

$(IntermediateDirectory)/uartcom_uartcom.c$(ObjectSuffix): ../multimedia/uartcom/uartcom.c $(IntermediateDirectory)/uartcom_uartcom.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/uartcom/uartcom.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/uartcom_uartcom.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/uartcom_uartcom.c$(DependSuffix): ../multimedia/uartcom/uartcom.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/uartcom_uartcom.c$(ObjectSuffix) -MF$(IntermediateDirectory)/uartcom_uartcom.c$(DependSuffix) -MM "../multimedia/uartcom/uartcom.c"

$(IntermediateDirectory)/uartcom_uartcom.c$(PreprocessSuffix): ../multimedia/uartcom/uartcom.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/uartcom_uartcom.c$(PreprocessSuffix) "../multimedia/uartcom/uartcom.c"

$(IntermediateDirectory)/uartcom_uartCrc.c$(ObjectSuffix): ../multimedia/uartcom/uartCrc.c $(IntermediateDirectory)/uartcom_uartCrc.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/multimedia/uartcom/uartCrc.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/uartcom_uartCrc.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/uartcom_uartCrc.c$(DependSuffix): ../multimedia/uartcom/uartCrc.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/uartcom_uartCrc.c$(ObjectSuffix) -MF$(IntermediateDirectory)/uartcom_uartCrc.c$(DependSuffix) -MM "../multimedia/uartcom/uartCrc.c"

$(IntermediateDirectory)/uartcom_uartCrc.c$(PreprocessSuffix): ../multimedia/uartcom/uartCrc.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/uartcom_uartCrc.c$(PreprocessSuffix) "../multimedia/uartcom/uartCrc.c"

$(IntermediateDirectory)/gsensor_G_gma301.c$(ObjectSuffix): ../device/gsensor/G_gma301.c $(IntermediateDirectory)/gsensor_G_gma301.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/gsensor/G_gma301.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/gsensor_G_gma301.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/gsensor_G_gma301.c$(DependSuffix): ../device/gsensor/G_gma301.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/gsensor_G_gma301.c$(ObjectSuffix) -MF$(IntermediateDirectory)/gsensor_G_gma301.c$(DependSuffix) -MM "../device/gsensor/G_gma301.c"

$(IntermediateDirectory)/gsensor_G_gma301.c$(PreprocessSuffix): ../device/gsensor/G_gma301.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/gsensor_G_gma301.c$(PreprocessSuffix) "../device/gsensor/G_gma301.c"

$(IntermediateDirectory)/gsensor_gsensor.c$(ObjectSuffix): ../device/gsensor/gsensor.c $(IntermediateDirectory)/gsensor_gsensor.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/gsensor/gsensor.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/gsensor_gsensor.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/gsensor_gsensor.c$(DependSuffix): ../device/gsensor/gsensor.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/gsensor_gsensor.c$(ObjectSuffix) -MF$(IntermediateDirectory)/gsensor_gsensor.c$(DependSuffix) -MM "../device/gsensor/gsensor.c"

$(IntermediateDirectory)/gsensor_gsensor.c$(PreprocessSuffix): ../device/gsensor/gsensor.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/gsensor_gsensor.c$(PreprocessSuffix) "../device/gsensor/gsensor.c"

$(IntermediateDirectory)/gsensor_G_sc7a30e.c$(ObjectSuffix): ../device/gsensor/G_sc7a30e.c $(IntermediateDirectory)/gsensor_G_sc7a30e.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/gsensor/G_sc7a30e.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/gsensor_G_sc7a30e.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/gsensor_G_sc7a30e.c$(DependSuffix): ../device/gsensor/G_sc7a30e.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/gsensor_G_sc7a30e.c$(ObjectSuffix) -MF$(IntermediateDirectory)/gsensor_G_sc7a30e.c$(DependSuffix) -MM "../device/gsensor/G_sc7a30e.c"

$(IntermediateDirectory)/gsensor_G_sc7a30e.c$(PreprocessSuffix): ../device/gsensor/G_sc7a30e.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/gsensor_G_sc7a30e.c$(PreprocessSuffix) "../device/gsensor/G_sc7a30e.c"

$(IntermediateDirectory)/gsensor_g_da380.c$(ObjectSuffix): ../device/gsensor/g_da380.c $(IntermediateDirectory)/gsensor_g_da380.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/gsensor/g_da380.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/gsensor_g_da380.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/gsensor_g_da380.c$(DependSuffix): ../device/gsensor/g_da380.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/gsensor_g_da380.c$(ObjectSuffix) -MF$(IntermediateDirectory)/gsensor_g_da380.c$(DependSuffix) -MM "../device/gsensor/g_da380.c"

$(IntermediateDirectory)/gsensor_g_da380.c$(PreprocessSuffix): ../device/gsensor/g_da380.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/gsensor_g_da380.c$(PreprocessSuffix) "../device/gsensor/g_da380.c"

$(IntermediateDirectory)/cmos_sensor_cmos_sensor.c$(ObjectSuffix): ../device/cmos_sensor/cmos_sensor.c $(IntermediateDirectory)/cmos_sensor_cmos_sensor.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/cmos_sensor.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_cmos_sensor.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_cmos_sensor.c$(DependSuffix): ../device/cmos_sensor/cmos_sensor.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_cmos_sensor.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_cmos_sensor.c$(DependSuffix) -MM "../device/cmos_sensor/cmos_sensor.c"

$(IntermediateDirectory)/cmos_sensor_cmos_sensor.c$(PreprocessSuffix): ../device/cmos_sensor/cmos_sensor.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_cmos_sensor.c$(PreprocessSuffix) "../device/cmos_sensor/cmos_sensor.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3a03.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_BF3a03.c $(IntermediateDirectory)/cmos_sensor_SENSOR_BF3a03.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_BF3a03.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3a03.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3a03.c$(DependSuffix): ../device/cmos_sensor/SENSOR_BF3a03.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3a03.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3a03.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_BF3a03.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3a03.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_BF3a03.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF3a03.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_BF3a03.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF2013.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_BF2013.c $(IntermediateDirectory)/cmos_sensor_SENSOR_BF2013.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_BF2013.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_BF2013.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_BF2013.c$(DependSuffix): ../device/cmos_sensor/SENSOR_BF2013.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_BF2013.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_BF2013.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_BF2013.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF2013.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_BF2013.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF2013.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_BF2013.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3016.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_BF3016.c $(IntermediateDirectory)/cmos_sensor_SENSOR_BF3016.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_BF3016.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3016.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3016.c$(DependSuffix): ../device/cmos_sensor/SENSOR_BF3016.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3016.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3016.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_BF3016.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3016.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_BF3016.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF3016.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_BF3016.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3703.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_BF3703.c $(IntermediateDirectory)/cmos_sensor_SENSOR_BF3703.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_BF3703.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3703.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3703.c$(DependSuffix): ../device/cmos_sensor/SENSOR_BF3703.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3703.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3703.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_BF3703.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF3703.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_BF3703.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF3703.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_BF3703.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0307.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_GC0307.c $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0307.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_GC0307.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0307.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0307.c$(DependSuffix): ../device/cmos_sensor/SENSOR_GC0307.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0307.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0307.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_GC0307.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0307.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_GC0307.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0307.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_GC0307.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0308.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_GC0308.c $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0308.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_GC0308.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0308.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0308.c$(DependSuffix): ../device/cmos_sensor/SENSOR_GC0308.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0308.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0308.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_GC0308.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0308.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_GC0308.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0308.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_GC0308.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0309.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_GC0309.c $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0309.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_GC0309.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0309.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0309.c$(DependSuffix): ../device/cmos_sensor/SENSOR_GC0309.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0309.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0309.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_GC0309.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0309.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_GC0309.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0309.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_GC0309.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0328.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_GC0328.c $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0328.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_GC0328.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0328.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0328.c$(DependSuffix): ../device/cmos_sensor/SENSOR_GC0328.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0328.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0328.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_GC0328.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC0328.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_GC0328.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC0328.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_GC0328.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1004.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_GC1004.c $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1004.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_GC1004.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1004.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1004.c$(DependSuffix): ../device/cmos_sensor/SENSOR_GC1004.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1004.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1004.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_GC1004.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1004.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_GC1004.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1004.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_GC1004.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H42.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_H42.c $(IntermediateDirectory)/cmos_sensor_SENSOR_H42.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_H42.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_H42.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_H42.c$(DependSuffix): ../device/cmos_sensor/SENSOR_H42.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_H42.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_H42.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_H42.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H42.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_H42.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_H42.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_H42.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H7640.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_H7640.c $(IntermediateDirectory)/cmos_sensor_SENSOR_H7640.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_H7640.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_H7640.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_H7640.c$(DependSuffix): ../device/cmos_sensor/SENSOR_H7640.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_H7640.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_H7640.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_H7640.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H7640.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_H7640.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_H7640.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_H7640.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_HM1055.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_HM1055.c $(IntermediateDirectory)/cmos_sensor_SENSOR_HM1055.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_HM1055.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_HM1055.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_HM1055.c$(DependSuffix): ../device/cmos_sensor/SENSOR_HM1055.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_HM1055.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_HM1055.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_HM1055.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_HM1055.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_HM1055.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_HM1055.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_HM1055.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_IT03A1.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_IT03A1.c $(IntermediateDirectory)/cmos_sensor_SENSOR_IT03A1.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_IT03A1.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_IT03A1.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_IT03A1.c$(DependSuffix): ../device/cmos_sensor/SENSOR_IT03A1.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_IT03A1.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_IT03A1.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_IT03A1.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_IT03A1.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_IT03A1.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_IT03A1.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_IT03A1.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99141.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_NT99141.c $(IntermediateDirectory)/cmos_sensor_SENSOR_NT99141.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_NT99141.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99141.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99141.c$(DependSuffix): ../device/cmos_sensor/SENSOR_NT99141.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99141.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99141.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_NT99141.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99141.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_NT99141.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_NT99141.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_NT99141.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99142.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_NT99142.c $(IntermediateDirectory)/cmos_sensor_SENSOR_NT99142.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_NT99142.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99142.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99142.c$(DependSuffix): ../device/cmos_sensor/SENSOR_NT99142.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99142.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99142.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_NT99142.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_NT99142.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_NT99142.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_NT99142.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_NT99142.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7670.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_OV7670.c $(IntermediateDirectory)/cmos_sensor_SENSOR_OV7670.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_OV7670.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7670.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7670.c$(DependSuffix): ../device/cmos_sensor/SENSOR_OV7670.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7670.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7670.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_OV7670.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7670.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_OV7670.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_OV7670.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_OV7670.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7725.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_OV7725.c $(IntermediateDirectory)/cmos_sensor_SENSOR_OV7725.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_OV7725.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7725.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7725.c$(DependSuffix): ../device/cmos_sensor/SENSOR_OV7725.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7725.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7725.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_OV7725.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7725.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_OV7725.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_OV7725.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_OV7725.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9710.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_OV9710.c $(IntermediateDirectory)/cmos_sensor_SENSOR_OV9710.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_OV9710.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9710.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9710.c$(DependSuffix): ../device/cmos_sensor/SENSOR_OV9710.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9710.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9710.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_OV9710.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9710.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_OV9710.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_OV9710.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_OV9710.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9732.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_OV9732.c $(IntermediateDirectory)/cmos_sensor_SENSOR_OV9732.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_OV9732.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9732.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9732.c$(DependSuffix): ../device/cmos_sensor/SENSOR_OV9732.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9732.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9732.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_OV9732.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV9732.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_OV9732.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_OV9732.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_OV9732.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1045.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_SC1045.c $(IntermediateDirectory)/cmos_sensor_SENSOR_SC1045.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_SC1045.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1045.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1045.c$(DependSuffix): ../device/cmos_sensor/SENSOR_SC1045.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1045.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1045.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_SC1045.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1045.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_SC1045.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_SC1045.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_SC1045.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV100B.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_SIV100B.c $(IntermediateDirectory)/cmos_sensor_SENSOR_SIV100B.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_SIV100B.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV100B.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV100B.c$(DependSuffix): ../device/cmos_sensor/SENSOR_SIV100B.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV100B.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV100B.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_SIV100B.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV100B.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_SIV100B.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_SIV100B.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_SIV100B.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV120B.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_SIV120B.c $(IntermediateDirectory)/cmos_sensor_SENSOR_SIV120B.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_SIV120B.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV120B.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV120B.c$(DependSuffix): ../device/cmos_sensor/SENSOR_SIV120B.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV120B.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV120B.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_SIV120B.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV120B.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_SIV120B.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_SIV120B.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_SIV120B.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV121DS.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_SIV121DS.c $(IntermediateDirectory)/cmos_sensor_SENSOR_SIV121DS.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_SIV121DS.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV121DS.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV121DS.c$(DependSuffix): ../device/cmos_sensor/SENSOR_SIV121DS.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV121DS.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV121DS.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_SIV121DS.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SIV121DS.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_SIV121DS.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_SIV121DS.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_SIV121DS.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SP1409.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_SP1409.c $(IntermediateDirectory)/cmos_sensor_SENSOR_SP1409.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_SP1409.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_SP1409.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_SP1409.c$(DependSuffix): ../device/cmos_sensor/SENSOR_SP1409.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_SP1409.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_SP1409.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_SP1409.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SP1409.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_SP1409.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_SP1409.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_SP1409.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H62.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_H62.c $(IntermediateDirectory)/cmos_sensor_SENSOR_H62.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_H62.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_H62.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_H62.c$(DependSuffix): ../device/cmos_sensor/SENSOR_H62.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_H62.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_H62.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_H62.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H62.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_H62.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_H62.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_H62.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1034.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_GC1034.c $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1034.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_GC1034.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1034.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1034.c$(DependSuffix): ../device/cmos_sensor/SENSOR_GC1034.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1034.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1034.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_GC1034.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1034.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_GC1034.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1034.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_GC1034.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7736.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_OV7736.c $(IntermediateDirectory)/cmos_sensor_SENSOR_OV7736.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_OV7736.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7736.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7736.c$(DependSuffix): ../device/cmos_sensor/SENSOR_OV7736.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7736.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7736.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_OV7736.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_OV7736.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_OV7736.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_OV7736.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_OV7736.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SP140A.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_SP140A.c $(IntermediateDirectory)/cmos_sensor_SENSOR_SP140A.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_SP140A.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_SP140A.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_SP140A.c$(DependSuffix): ../device/cmos_sensor/SENSOR_SP140A.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_SP140A.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_SP140A.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_SP140A.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SP140A.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_SP140A.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_SP140A.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_SP140A.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1054.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_GC1054.c $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1054.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_GC1054.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1054.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1054.c$(DependSuffix): ../device/cmos_sensor/SENSOR_GC1054.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1054.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1054.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_GC1054.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1054.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_GC1054.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1054.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_GC1054.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1064.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_GC1064.c $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1064.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_GC1064.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1064.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1064.c$(DependSuffix): ../device/cmos_sensor/SENSOR_GC1064.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1064.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1064.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_GC1064.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_GC1064.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_GC1064.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_GC1064.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_GC1064.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H65.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_H65.c $(IntermediateDirectory)/cmos_sensor_SENSOR_H65.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_H65.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_H65.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_H65.c$(DependSuffix): ../device/cmos_sensor/SENSOR_H65.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_H65.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_H65.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_H65.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H65.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_H65.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_H65.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_H65.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1243.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_SC1243.c $(IntermediateDirectory)/cmos_sensor_SENSOR_SC1243.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_SC1243.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1243.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1243.c$(DependSuffix): ../device/cmos_sensor/SENSOR_SC1243.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1243.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1243.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_SC1243.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_SC1243.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_SC1243.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_SC1243.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_SC1243.c"

$(IntermediateDirectory)/cmos_sensor_SNESOR_FPX1002.c$(ObjectSuffix): ../device/cmos_sensor/SNESOR_FPX1002.c $(IntermediateDirectory)/cmos_sensor_SNESOR_FPX1002.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SNESOR_FPX1002.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SNESOR_FPX1002.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SNESOR_FPX1002.c$(DependSuffix): ../device/cmos_sensor/SNESOR_FPX1002.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SNESOR_FPX1002.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SNESOR_FPX1002.c$(DependSuffix) -MM "../device/cmos_sensor/SNESOR_FPX1002.c"

$(IntermediateDirectory)/cmos_sensor_SNESOR_FPX1002.c$(PreprocessSuffix): ../device/cmos_sensor/SNESOR_FPX1002.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SNESOR_FPX1002.c$(PreprocessSuffix) "../device/cmos_sensor/SNESOR_FPX1002.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H63P.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_H63P.c $(IntermediateDirectory)/cmos_sensor_SENSOR_H63P.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_H63P.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_H63P.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_H63P.c$(DependSuffix): ../device/cmos_sensor/SENSOR_H63P.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_H63P.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_H63P.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_H63P.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_H63P.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_H63P.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_H63P.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_H63P.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF20A6.c$(ObjectSuffix): ../device/cmos_sensor/SENSOR_BF20A6.c $(IntermediateDirectory)/cmos_sensor_SENSOR_BF20A6.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/cmos_sensor/SENSOR_BF20A6.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/cmos_sensor_SENSOR_BF20A6.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/cmos_sensor_SENSOR_BF20A6.c$(DependSuffix): ../device/cmos_sensor/SENSOR_BF20A6.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/cmos_sensor_SENSOR_BF20A6.c$(ObjectSuffix) -MF$(IntermediateDirectory)/cmos_sensor_SENSOR_BF20A6.c$(DependSuffix) -MM "../device/cmos_sensor/SENSOR_BF20A6.c"

$(IntermediateDirectory)/cmos_sensor_SENSOR_BF20A6.c$(PreprocessSuffix): ../device/cmos_sensor/SENSOR_BF20A6.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/cmos_sensor_SENSOR_BF20A6.c$(PreprocessSuffix) "../device/cmos_sensor/SENSOR_BF20A6.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_st7789.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_st7789.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_st7789.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_st7789.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_st7789.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_st7789.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_jl_lcd.c$(ObjectSuffix): ../device/tft_lcd/lcd_rgb_jl_lcd.c $(IntermediateDirectory)/tft_lcd_lcd_rgb_jl_lcd.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_rgb_jl_lcd.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_rgb_jl_lcd.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_rgb_jl_lcd.c$(DependSuffix): ../device/tft_lcd/lcd_rgb_jl_lcd.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_rgb_jl_lcd.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_rgb_jl_lcd.c$(DependSuffix) -MM "../device/tft_lcd/lcd_rgb_jl_lcd.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_jl_lcd.c$(PreprocessSuffix): ../device/tft_lcd/lcd_rgb_jl_lcd.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_rgb_jl_lcd.c$(PreprocessSuffix) "../device/tft_lcd/lcd_rgb_jl_lcd.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7282.c$(ObjectSuffix): ../device/tft_lcd/lcd_rgb_st7282.c $(IntermediateDirectory)/tft_lcd_lcd_rgb_st7282.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_rgb_st7282.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7282.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7282.c$(DependSuffix): ../device/tft_lcd/lcd_rgb_st7282.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7282.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7282.c$(DependSuffix) -MM "../device/tft_lcd/lcd_rgb_st7282.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7282.c$(PreprocessSuffix): ../device/tft_lcd/lcd_rgb_st7282.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_rgb_st7282.c$(PreprocessSuffix) "../device/tft_lcd/lcd_rgb_st7282.c"

$(IntermediateDirectory)/tft_lcd_tft_lcd.c$(ObjectSuffix): ../device/tft_lcd/tft_lcd.c $(IntermediateDirectory)/tft_lcd_tft_lcd.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/tft_lcd.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_tft_lcd.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_tft_lcd.c$(DependSuffix): ../device/tft_lcd/tft_lcd.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_tft_lcd.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_tft_lcd.c$(DependSuffix) -MM "../device/tft_lcd/tft_lcd.c"

$(IntermediateDirectory)/tft_lcd_tft_lcd.c$(PreprocessSuffix): ../device/tft_lcd/tft_lcd.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_tft_lcd.c$(PreprocessSuffix) "../device/tft_lcd/tft_lcd.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_5420.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_5420.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_5420.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_5420.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_5420.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_5420.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_5420.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_5420.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_5420.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_5420.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_5420.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_5420.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_5420.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_5420.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_r61509v.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_r61509v.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_r61509v.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_r61509v.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_r61509v.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_r61509v.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_r61509v.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_r61509v.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_r61509v.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_r61509v.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_r61509v.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_r61509v.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_r61509v.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_r61509v.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili8961.c$(ObjectSuffix): ../device/tft_lcd/lcd_rgb_ili8961.c $(IntermediateDirectory)/tft_lcd_lcd_rgb_ili8961.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_rgb_ili8961.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili8961.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili8961.c$(DependSuffix): ../device/tft_lcd/lcd_rgb_ili8961.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili8961.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili8961.c$(DependSuffix) -MM "../device/tft_lcd/lcd_rgb_ili8961.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili8961.c$(PreprocessSuffix): ../device/tft_lcd/lcd_rgb_ili8961.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_rgb_ili8961.c$(PreprocessSuffix) "../device/tft_lcd/lcd_rgb_ili8961.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9342c.c$(ObjectSuffix): ../device/tft_lcd/lcd_rgb_ili9342c.c $(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9342c.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_rgb_ili9342c.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9342c.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9342c.c$(DependSuffix): ../device/tft_lcd/lcd_rgb_ili9342c.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9342c.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9342c.c$(DependSuffix) -MM "../device/tft_lcd/lcd_rgb_ili9342c.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9342c.c$(PreprocessSuffix): ../device/tft_lcd/lcd_rgb_ili9342c.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9342c.c$(PreprocessSuffix) "../device/tft_lcd/lcd_rgb_ili9342c.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_ili9328.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_ili9328.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_ili9328.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_ili9328.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_ili9328.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_ili9328.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_ili9328.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_ili9328.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_ili9328.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_ili9328.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_ili9328.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_ili9328.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_ili9328.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_ili9328.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352b.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_hx8352b.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352b.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_hx8352b.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352b.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352b.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_hx8352b.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352b.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352b.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_hx8352b.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352b.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_hx8352b.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352b.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_hx8352b.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789v.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_st7789v.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789v.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_st7789v.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789v.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789v.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_st7789v.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789v.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789v.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_st7789v.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789v.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_st7789v.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_st7789v.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_st7789v.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352c.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_hx8352c.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352c.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_hx8352c.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352c.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352c.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_hx8352c.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352c.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352c.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_hx8352c.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352c.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_hx8352c.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8352c.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_hx8352c.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8357b.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_hx8357b.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8357b.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_hx8357b.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8357b.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8357b.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_hx8357b.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8357b.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8357b.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_hx8357b.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8357b.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_hx8357b.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_hx8357b.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_hx8357b.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9806e.c$(ObjectSuffix): ../device/tft_lcd/lcd_rgb_ili9806e.c $(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9806e.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_rgb_ili9806e.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9806e.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9806e.c$(DependSuffix): ../device/tft_lcd/lcd_rgb_ili9806e.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9806e.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9806e.c$(DependSuffix) -MM "../device/tft_lcd/lcd_rgb_ili9806e.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9806e.c$(PreprocessSuffix): ../device/tft_lcd/lcd_rgb_ili9806e.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_rgb_ili9806e.c$(PreprocessSuffix) "../device/tft_lcd/lcd_rgb_ili9806e.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_ota5182.c$(ObjectSuffix): ../device/tft_lcd/lcd_rgb_ota5182.c $(IntermediateDirectory)/tft_lcd_lcd_rgb_ota5182.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_rgb_ota5182.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_rgb_ota5182.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_rgb_ota5182.c$(DependSuffix): ../device/tft_lcd/lcd_rgb_ota5182.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_rgb_ota5182.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_rgb_ota5182.c$(DependSuffix) -MM "../device/tft_lcd/lcd_rgb_ota5182.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_ota5182.c$(PreprocessSuffix): ../device/tft_lcd/lcd_rgb_ota5182.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_rgb_ota5182.c$(PreprocessSuffix) "../device/tft_lcd/lcd_rgb_ota5182.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7701.c$(ObjectSuffix): ../device/tft_lcd/lcd_rgb_st7701.c $(IntermediateDirectory)/tft_lcd_lcd_rgb_st7701.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_rgb_st7701.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7701.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7701.c$(DependSuffix): ../device/tft_lcd/lcd_rgb_st7701.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7701.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7701.c$(DependSuffix) -MM "../device/tft_lcd/lcd_rgb_st7701.c"

$(IntermediateDirectory)/tft_lcd_lcd_rgb_st7701.c$(PreprocessSuffix): ../device/tft_lcd/lcd_rgb_st7701.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_rgb_st7701.c$(PreprocessSuffix) "../device/tft_lcd/lcd_rgb_st7701.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_lgdp4532.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_lgdp4532.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_lgdp4532.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_lgdp4532.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_lgdp4532.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_lgdp4532.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_lgdp4532.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_lgdp4532.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_lgdp4532.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_lgdp4532.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_lgdp4532.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_lgdp4532.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_lgdp4532.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_lgdp4532.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_9225G.c$(ObjectSuffix): ../device/tft_lcd/lcd_mcu_9225G.c $(IntermediateDirectory)/tft_lcd_lcd_mcu_9225G.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/tft_lcd/lcd_mcu_9225G.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/tft_lcd_lcd_mcu_9225G.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/tft_lcd_lcd_mcu_9225G.c$(DependSuffix): ../device/tft_lcd/lcd_mcu_9225G.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/tft_lcd_lcd_mcu_9225G.c$(ObjectSuffix) -MF$(IntermediateDirectory)/tft_lcd_lcd_mcu_9225G.c$(DependSuffix) -MM "../device/tft_lcd/lcd_mcu_9225G.c"

$(IntermediateDirectory)/tft_lcd_lcd_mcu_9225G.c$(PreprocessSuffix): ../device/tft_lcd/lcd_mcu_9225G.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/tft_lcd_lcd_mcu_9225G.c$(PreprocessSuffix) "../device/tft_lcd/lcd_mcu_9225G.c"

$(IntermediateDirectory)/usensor_237a_1.c$(ObjectSuffix): ../device/usensor/237a_1.c $(IntermediateDirectory)/usensor_237a_1.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/usensor/237a_1.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/usensor_237a_1.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/usensor_237a_1.c$(DependSuffix): ../device/usensor/237a_1.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/usensor_237a_1.c$(ObjectSuffix) -MF$(IntermediateDirectory)/usensor_237a_1.c$(DependSuffix) -MM "../device/usensor/237a_1.c"

$(IntermediateDirectory)/usensor_237a_1.c$(PreprocessSuffix): ../device/usensor/237a_1.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/usensor_237a_1.c$(PreprocessSuffix) "../device/usensor/237a_1.c"

$(IntermediateDirectory)/usensor_usensor.c$(ObjectSuffix): ../device/usensor/usensor.c $(IntermediateDirectory)/usensor_usensor.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/usensor/usensor.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/usensor_usensor.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/usensor_usensor.c$(DependSuffix): ../device/usensor/usensor.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/usensor_usensor.c$(ObjectSuffix) -MF$(IntermediateDirectory)/usensor_usensor.c$(DependSuffix) -MM "../device/usensor/usensor.c"

$(IntermediateDirectory)/usensor_usensor.c$(PreprocessSuffix): ../device/usensor/usensor.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/usensor_usensor.c$(PreprocessSuffix) "../device/usensor/usensor.c"

$(IntermediateDirectory)/usensor_237a_2.c$(ObjectSuffix): ../device/usensor/237a_2.c $(IntermediateDirectory)/usensor_237a_2.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/device/usensor/237a_2.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/usensor_237a_2.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/usensor_237a_2.c$(DependSuffix): ../device/usensor/237a_2.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/usensor_237a_2.c$(ObjectSuffix) -MF$(IntermediateDirectory)/usensor_237a_2.c$(DependSuffix) -MM "../device/usensor/237a_2.c"

$(IntermediateDirectory)/usensor_237a_2.c$(PreprocessSuffix): ../device/usensor/237a_2.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/usensor_237a_2.c$(PreprocessSuffix) "../device/usensor/237a_2.c"

$(IntermediateDirectory)/nvfs_nvfs.c$(ObjectSuffix): ../bwlib/nvfs/nvfs.c $(IntermediateDirectory)/nvfs_nvfs.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/nvfs/nvfs.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/nvfs_nvfs.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/nvfs_nvfs.c$(DependSuffix): ../bwlib/nvfs/nvfs.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/nvfs_nvfs.c$(ObjectSuffix) -MF$(IntermediateDirectory)/nvfs_nvfs.c$(DependSuffix) -MM "../bwlib/nvfs/nvfs.c"

$(IntermediateDirectory)/nvfs_nvfs.c$(PreprocessSuffix): ../bwlib/nvfs/nvfs.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/nvfs_nvfs.c$(PreprocessSuffix) "../bwlib/nvfs/nvfs.c"

$(IntermediateDirectory)/res_ascii.c$(ObjectSuffix): ../bwlib/Maxlib/res/ascii.c $(IntermediateDirectory)/res_ascii.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/ascii.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_ascii.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_ascii.c$(DependSuffix): ../bwlib/Maxlib/res/ascii.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_ascii.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_ascii.c$(DependSuffix) -MM "../bwlib/Maxlib/res/ascii.c"

$(IntermediateDirectory)/res_ascii.c$(PreprocessSuffix): ../bwlib/Maxlib/res/ascii.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_ascii.c$(PreprocessSuffix) "../bwlib/Maxlib/res/ascii.c"

$(IntermediateDirectory)/res_ascii_default.c$(ObjectSuffix): ../bwlib/Maxlib/res/ascii_default.c $(IntermediateDirectory)/res_ascii_default.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/ascii_default.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_ascii_default.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_ascii_default.c$(DependSuffix): ../bwlib/Maxlib/res/ascii_default.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_ascii_default.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_ascii_default.c$(DependSuffix) -MM "../bwlib/Maxlib/res/ascii_default.c"

$(IntermediateDirectory)/res_ascii_default.c$(PreprocessSuffix): ../bwlib/Maxlib/res/ascii_default.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_ascii_default.c$(PreprocessSuffix) "../bwlib/Maxlib/res/ascii_default.c"

$(IntermediateDirectory)/res_ascii_default_draw.c$(ObjectSuffix): ../bwlib/Maxlib/res/ascii_default_draw.c $(IntermediateDirectory)/res_ascii_default_draw.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/ascii_default_draw.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_ascii_default_draw.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_ascii_default_draw.c$(DependSuffix): ../bwlib/Maxlib/res/ascii_default_draw.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_ascii_default_draw.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_ascii_default_draw.c$(DependSuffix) -MM "../bwlib/Maxlib/res/ascii_default_draw.c"

$(IntermediateDirectory)/res_ascii_default_draw.c$(PreprocessSuffix): ../bwlib/Maxlib/res/ascii_default_draw.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_ascii_default_draw.c$(PreprocessSuffix) "../bwlib/Maxlib/res/ascii_default_draw.c"

$(IntermediateDirectory)/res_ascii_num2.c$(ObjectSuffix): ../bwlib/Maxlib/res/ascii_num2.c $(IntermediateDirectory)/res_ascii_num2.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/ascii_num2.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_ascii_num2.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_ascii_num2.c$(DependSuffix): ../bwlib/Maxlib/res/ascii_num2.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_ascii_num2.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_ascii_num2.c$(DependSuffix) -MM "../bwlib/Maxlib/res/ascii_num2.c"

$(IntermediateDirectory)/res_ascii_num2.c$(PreprocessSuffix): ../bwlib/Maxlib/res/ascii_num2.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_ascii_num2.c$(PreprocessSuffix) "../bwlib/Maxlib/res/ascii_num2.c"

$(IntermediateDirectory)/res_ascii_num2_draw.c$(ObjectSuffix): ../bwlib/Maxlib/res/ascii_num2_draw.c $(IntermediateDirectory)/res_ascii_num2_draw.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/ascii_num2_draw.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_ascii_num2_draw.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_ascii_num2_draw.c$(DependSuffix): ../bwlib/Maxlib/res/ascii_num2_draw.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_ascii_num2_draw.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_ascii_num2_draw.c$(DependSuffix) -MM "../bwlib/Maxlib/res/ascii_num2_draw.c"

$(IntermediateDirectory)/res_ascii_num2_draw.c$(PreprocessSuffix): ../bwlib/Maxlib/res/ascii_num2_draw.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_ascii_num2_draw.c$(PreprocessSuffix) "../bwlib/Maxlib/res/ascii_num2_draw.c"

$(IntermediateDirectory)/res_ascii_num3.c$(ObjectSuffix): ../bwlib/Maxlib/res/ascii_num3.c $(IntermediateDirectory)/res_ascii_num3.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/ascii_num3.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_ascii_num3.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_ascii_num3.c$(DependSuffix): ../bwlib/Maxlib/res/ascii_num3.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_ascii_num3.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_ascii_num3.c$(DependSuffix) -MM "../bwlib/Maxlib/res/ascii_num3.c"

$(IntermediateDirectory)/res_ascii_num3.c$(PreprocessSuffix): ../bwlib/Maxlib/res/ascii_num3.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_ascii_num3.c$(PreprocessSuffix) "../bwlib/Maxlib/res/ascii_num3.c"

$(IntermediateDirectory)/res_ascii_num3_draw.c$(ObjectSuffix): ../bwlib/Maxlib/res/ascii_num3_draw.c $(IntermediateDirectory)/res_ascii_num3_draw.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/ascii_num3_draw.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_ascii_num3_draw.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_ascii_num3_draw.c$(DependSuffix): ../bwlib/Maxlib/res/ascii_num3_draw.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_ascii_num3_draw.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_ascii_num3_draw.c$(DependSuffix) -MM "../bwlib/Maxlib/res/ascii_num3_draw.c"

$(IntermediateDirectory)/res_ascii_num3_draw.c$(PreprocessSuffix): ../bwlib/Maxlib/res/ascii_num3_draw.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_ascii_num3_draw.c$(PreprocessSuffix) "../bwlib/Maxlib/res/ascii_num3_draw.c"

$(IntermediateDirectory)/res_ascii_num4.c$(ObjectSuffix): ../bwlib/Maxlib/res/ascii_num4.c $(IntermediateDirectory)/res_ascii_num4.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/ascii_num4.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_ascii_num4.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_ascii_num4.c$(DependSuffix): ../bwlib/Maxlib/res/ascii_num4.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_ascii_num4.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_ascii_num4.c$(DependSuffix) -MM "../bwlib/Maxlib/res/ascii_num4.c"

$(IntermediateDirectory)/res_ascii_num4.c$(PreprocessSuffix): ../bwlib/Maxlib/res/ascii_num4.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_ascii_num4.c$(PreprocessSuffix) "../bwlib/Maxlib/res/ascii_num4.c"

$(IntermediateDirectory)/res_ascii_num4_draw.c$(ObjectSuffix): ../bwlib/Maxlib/res/ascii_num4_draw.c $(IntermediateDirectory)/res_ascii_num4_draw.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/ascii_num4_draw.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_ascii_num4_draw.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_ascii_num4_draw.c$(DependSuffix): ../bwlib/Maxlib/res/ascii_num4_draw.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_ascii_num4_draw.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_ascii_num4_draw.c$(DependSuffix) -MM "../bwlib/Maxlib/res/ascii_num4_draw.c"

$(IntermediateDirectory)/res_ascii_num4_draw.c$(PreprocessSuffix): ../bwlib/Maxlib/res/ascii_num4_draw.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_ascii_num4_draw.c$(PreprocessSuffix) "../bwlib/Maxlib/res/ascii_num4_draw.c"

$(IntermediateDirectory)/res_R.c$(ObjectSuffix): ../bwlib/Maxlib/res/R.c $(IntermediateDirectory)/res_R.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/jingcheng.huang/Desktop/project/waterMeter/firmware/bwlib/Maxlib/res/R.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/res_R.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/res_R.c$(DependSuffix): ../bwlib/Maxlib/res/R.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/res_R.c$(ObjectSuffix) -MF$(IntermediateDirectory)/res_R.c$(DependSuffix) -MM "../bwlib/Maxlib/res/R.c"

$(IntermediateDirectory)/res_R.c$(PreprocessSuffix): ../bwlib/Maxlib/res/R.c
	@$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/res_R.c$(PreprocessSuffix) "../bwlib/Maxlib/res/R.c"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


