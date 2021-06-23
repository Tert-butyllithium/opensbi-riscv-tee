
/media/prongs/S/secWorkspace/tina-d1-open/lichee/brandy-2.0/opensbi/build/platform/qemu/virt/firmware/fw_jump.elf:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_fw_start>:
    80000000:	00050433          	add	s0,a0,zero
    80000004:	000584b3          	add	s1,a1,zero
    80000008:	00060933          	add	s2,a2,zero
    8000000c:	604000ef          	jal	ra,80000610 <fw_boot_hart>
    80000010:	00050833          	add	a6,a0,zero
    80000014:	00040533          	add	a0,s0,zero
    80000018:	000485b3          	add	a1,s1,zero
    8000001c:	00090633          	add	a2,s2,zero
    80000020:	58fd                	li	a7,-1
    80000022:	01180463          	beq	a6,a7,8000002a <_try_lottery>
    80000026:	13051d63          	bne	a0,a6,80000160 <_wait_relocate_copy_done>

000000008000002a <_try_lottery>:
    8000002a:	00000817          	auipc	a6,0x0
    8000002e:	44e80813          	addi	a6,a6,1102 # 80000478 <_relocate_lottery>
    80000032:	4885                	li	a7,1
    80000034:	0118282f          	amoadd.w	a6,a7,(a6)
    80000038:	12081463          	bnez	a6,80000160 <_wait_relocate_copy_done>
    8000003c:	00000297          	auipc	t0,0x0
    80000040:	44c28293          	addi	t0,t0,1100 # 80000488 <_load_start>
    80000044:	00000317          	auipc	t1,0x0
    80000048:	fbc30313          	addi	t1,t1,-68 # 80000000 <_fw_start>
    8000004c:	0062b023          	sd	t1,0(t0)

0000000080000050 <_relocate>:
    80000050:	00000297          	auipc	t0,0x0
    80000054:	44028293          	addi	t0,t0,1088 # 80000490 <_link_start>
    80000058:	0002b283          	ld	t0,0(t0)
    8000005c:	00000317          	auipc	t1,0x0
    80000060:	43c30313          	addi	t1,t1,1084 # 80000498 <_link_end>
    80000064:	00033303          	ld	t1,0(t1)
    80000068:	00000397          	auipc	t2,0x0
    8000006c:	42038393          	addi	t2,t2,1056 # 80000488 <_load_start>
    80000070:	0003b383          	ld	t2,0(t2)
    80000074:	40530e33          	sub	t3,t1,t0
    80000078:	9e1e                	add	t3,t3,t2
    8000007a:	12728363          	beq	t0,t2,800001a0 <_relocate_done>
    8000007e:	00000e97          	auipc	t4,0x0
    80000082:	122e8e93          	addi	t4,t4,290 # 800001a0 <_relocate_done>
    80000086:	407e8eb3          	sub	t4,t4,t2
    8000008a:	9e96                	add	t4,t4,t0
    8000008c:	0653c663          	blt	t2,t0,800000f8 <_relocate_copy_to_upper>

0000000080000090 <_relocate_copy_to_lower>:
    80000090:	0463db63          	bge	t2,t1,800000e6 <_relocate_copy_to_lower_loop>
    80000094:	00000e17          	auipc	t3,0x0
    80000098:	3e4e0e13          	addi	t3,t3,996 # 80000478 <_relocate_lottery>
    8000009c:	007e4563          	blt	t3,t2,800000a6 <_relocate_copy_to_lower+0x16>
    800000a0:	006e5363          	bge	t3,t1,800000a6 <_relocate_copy_to_lower+0x16>
    800000a4:	a935                	j	800004e0 <_start_hang>
    800000a6:	00000e17          	auipc	t3,0x0
    800000aa:	3dae0e13          	addi	t3,t3,986 # 80000480 <_boot_status>
    800000ae:	007e4563          	blt	t3,t2,800000b8 <_relocate_copy_to_lower+0x28>
    800000b2:	006e5363          	bge	t3,t1,800000b8 <_relocate_copy_to_lower+0x28>
    800000b6:	a12d                	j	800004e0 <_start_hang>
    800000b8:	00000e17          	auipc	t3,0x0
    800000bc:	f98e0e13          	addi	t3,t3,-104 # 80000050 <_relocate>
    800000c0:	00000f17          	auipc	t5,0x0
    800000c4:	0e0f0f13          	addi	t5,t5,224 # 800001a0 <_relocate_done>
    800000c8:	007e4563          	blt	t3,t2,800000d2 <_relocate_copy_to_lower+0x42>
    800000cc:	006e5363          	bge	t3,t1,800000d2 <_relocate_copy_to_lower+0x42>
    800000d0:	a901                	j	800004e0 <_start_hang>
    800000d2:	007f4563          	blt	t5,t2,800000dc <_relocate_copy_to_lower+0x4c>
    800000d6:	006f5363          	bge	t5,t1,800000dc <_relocate_copy_to_lower+0x4c>
    800000da:	a119                	j	800004e0 <_start_hang>
    800000dc:	01c3c563          	blt	t2,t3,800000e6 <_relocate_copy_to_lower_loop>
    800000e0:	01e3d363          	bge	t2,t5,800000e6 <_relocate_copy_to_lower_loop>
    800000e4:	aef5                	j	800004e0 <_start_hang>

00000000800000e6 <_relocate_copy_to_lower_loop>:
    800000e6:	0003be03          	ld	t3,0(t2)
    800000ea:	01c2b023          	sd	t3,0(t0)
    800000ee:	02a1                	addi	t0,t0,8
    800000f0:	03a1                	addi	t2,t2,8
    800000f2:	fe62cae3          	blt	t0,t1,800000e6 <_relocate_copy_to_lower_loop>
    800000f6:	8e82                	jr	t4

00000000800000f8 <_relocate_copy_to_upper>:
    800000f8:	05c2db63          	bge	t0,t3,8000014e <_relocate_copy_to_upper_loop>
    800000fc:	00000397          	auipc	t2,0x0
    80000100:	37c38393          	addi	t2,t2,892 # 80000478 <_relocate_lottery>
    80000104:	0053c563          	blt	t2,t0,8000010e <_relocate_copy_to_upper+0x16>
    80000108:	01c3d363          	bge	t2,t3,8000010e <_relocate_copy_to_upper+0x16>
    8000010c:	aed1                	j	800004e0 <_start_hang>
    8000010e:	00000397          	auipc	t2,0x0
    80000112:	37238393          	addi	t2,t2,882 # 80000480 <_boot_status>
    80000116:	0053c563          	blt	t2,t0,80000120 <_relocate_copy_to_upper+0x28>
    8000011a:	01c3d363          	bge	t2,t3,80000120 <_relocate_copy_to_upper+0x28>
    8000011e:	a6c9                	j	800004e0 <_start_hang>
    80000120:	00000397          	auipc	t2,0x0
    80000124:	f3038393          	addi	t2,t2,-208 # 80000050 <_relocate>
    80000128:	00000f17          	auipc	t5,0x0
    8000012c:	078f0f13          	addi	t5,t5,120 # 800001a0 <_relocate_done>
    80000130:	0053c563          	blt	t2,t0,8000013a <_relocate_copy_to_upper+0x42>
    80000134:	01c3d363          	bge	t2,t3,8000013a <_relocate_copy_to_upper+0x42>
    80000138:	a665                	j	800004e0 <_start_hang>
    8000013a:	005f4563          	blt	t5,t0,80000144 <_relocate_copy_to_upper+0x4c>
    8000013e:	01cf5363          	bge	t5,t3,80000144 <_relocate_copy_to_upper+0x4c>
    80000142:	ae79                	j	800004e0 <_start_hang>
    80000144:	0072c563          	blt	t0,t2,8000014e <_relocate_copy_to_upper_loop>
    80000148:	01e2d363          	bge	t0,t5,8000014e <_relocate_copy_to_upper_loop>
    8000014c:	ae51                	j	800004e0 <_start_hang>

000000008000014e <_relocate_copy_to_upper_loop>:
    8000014e:	1e61                	addi	t3,t3,-8
    80000150:	1361                	addi	t1,t1,-8
    80000152:	000e3383          	ld	t2,0(t3)
    80000156:	00733023          	sd	t2,0(t1)
    8000015a:	fe62cae3          	blt	t0,t1,8000014e <_relocate_copy_to_upper_loop>
    8000015e:	8e82                	jr	t4

0000000080000160 <_wait_relocate_copy_done>:
    80000160:	00000297          	auipc	t0,0x0
    80000164:	ea028293          	addi	t0,t0,-352 # 80000000 <_fw_start>
    80000168:	00000317          	auipc	t1,0x0
    8000016c:	32830313          	addi	t1,t1,808 # 80000490 <_link_start>
    80000170:	00033303          	ld	t1,0(t1)
    80000174:	28628163          	beq	t0,t1,800003f6 <_wait_for_boot_hart>
    80000178:	00000397          	auipc	t2,0x0
    8000017c:	30838393          	addi	t2,t2,776 # 80000480 <_boot_status>
    80000180:	00000e17          	auipc	t3,0x0
    80000184:	276e0e13          	addi	t3,t3,630 # 800003f6 <_wait_for_boot_hart>
    80000188:	405e0e33          	sub	t3,t3,t0
    8000018c:	9e1a                	add	t3,t3,t1
    8000018e:	4e85                	li	t4,1
    80000190:	0003bf03          	ld	t5,0(t2)
    80000194:	0001                	nop
    80000196:	0001                	nop
    80000198:	0001                	nop
    8000019a:	ffdf4ae3          	blt	t5,t4,8000018e <_wait_relocate_copy_done+0x2e>
    8000019e:	8e02                	jr	t3

00000000800001a0 <_relocate_done>:
    800001a0:	00000297          	auipc	t0,0x0
    800001a4:	2e028293          	addi	t0,t0,736 # 80000480 <_boot_status>
    800001a8:	00000317          	auipc	t1,0x0
    800001ac:	2e830313          	addi	t1,t1,744 # 80000490 <_link_start>
    800001b0:	00033303          	ld	t1,0(t1)
    800001b4:	00000397          	auipc	t2,0x0
    800001b8:	2d438393          	addi	t2,t2,724 # 80000488 <_load_start>
    800001bc:	0003b383          	ld	t2,0(t2)
    800001c0:	406282b3          	sub	t0,t0,t1
    800001c4:	929e                	add	t0,t0,t2
    800001c6:	4305                	li	t1,1
    800001c8:	0062b023          	sd	t1,0(t0)
    800001cc:	0330000f          	fence	rw,rw
    800001d0:	4081                	li	ra,0
    800001d2:	3fe000ef          	jal	ra,800005d0 <_reset_regs>
    800001d6:	00050433          	add	s0,a0,zero
    800001da:	000584b3          	add	s1,a1,zero
    800001de:	00060933          	add	s2,a2,zero
    800001e2:	000689b3          	add	s3,a3,zero
    800001e6:	00070a33          	add	s4,a4,zero
    800001ea:	42e000ef          	jal	ra,80000618 <fw_save_info>
    800001ee:	00040533          	add	a0,s0,zero
    800001f2:	000485b3          	add	a1,s1,zero
    800001f6:	00090633          	add	a2,s2,zero
    800001fa:	000986b3          	add	a3,s3,zero
    800001fe:	000a0733          	add	a4,s4,zero
    80000202:	0000c717          	auipc	a4,0xc
    80000206:	44670713          	addi	a4,a4,1094 # 8000c648 <platform>
    8000020a:	05076b83          	lwu	s7,80(a4)
    8000020e:	05476c03          	lwu	s8,84(a4)
    80000212:	00030217          	auipc	tp,0x30
    80000216:	dee20213          	addi	tp,tp,-530 # 80030000 <_fw_end>
    8000021a:	038b87b3          	mul	a5,s7,s8
    8000021e:	923e                	add	tp,tp,a5
    80000220:	00020e33          	add	t3,tp,zero
    80000224:	4385                	li	t2,1
    80000226:	4301                	li	t1,0

0000000080000228 <_scratch_init>:
    80000228:	000e0233          	add	tp,t3,zero
    8000022c:	026c07b3          	mul	a5,s8,t1
    80000230:	40f20233          	sub	tp,tp,a5
    80000234:	20000793          	li	a5,512
    80000238:	40f20233          	sub	tp,tp,a5
    8000023c:	00000717          	auipc	a4,0x0
    80000240:	dc470713          	addi	a4,a4,-572 # 80000000 <_fw_start>
    80000244:	00030797          	auipc	a5,0x30
    80000248:	dbc78793          	addi	a5,a5,-580 # 80030000 <_fw_end>
    8000024c:	038b82b3          	mul	t0,s7,s8
    80000250:	9796                	add	a5,a5,t0
    80000252:	8f99                	sub	a5,a5,a4
    80000254:	00e23023          	sd	a4,0(tp) # 0 <_fw_start-0x80000000>
    80000258:	00f23423          	sd	a5,8(tp) # 8 <_fw_start-0x7ffffff8>
    8000025c:	00050433          	add	s0,a0,zero
    80000260:	000584b3          	add	s1,a1,zero
    80000264:	00060933          	add	s2,a2,zero
    80000268:	3c0000ef          	jal	ra,80000628 <fw_next_arg1>
    8000026c:	00a23823          	sd	a0,16(tp) # 10 <_fw_start-0x7ffffff0>
    80000270:	00040533          	add	a0,s0,zero
    80000274:	000485b3          	add	a1,s1,zero
    80000278:	00090633          	add	a2,s2,zero
    8000027c:	00050433          	add	s0,a0,zero
    80000280:	000584b3          	add	s1,a1,zero
    80000284:	00060933          	add	s2,a2,zero
    80000288:	3a8000ef          	jal	ra,80000630 <fw_next_addr>
    8000028c:	00a23c23          	sd	a0,24(tp) # 18 <_fw_start-0x7fffffe8>
    80000290:	00040533          	add	a0,s0,zero
    80000294:	000485b3          	add	a1,s1,zero
    80000298:	00090633          	add	a2,s2,zero
    8000029c:	00050433          	add	s0,a0,zero
    800002a0:	000584b3          	add	s1,a1,zero
    800002a4:	00060933          	add	s2,a2,zero
    800002a8:	398000ef          	jal	ra,80000640 <fw_next_mode>
    800002ac:	02a23023          	sd	a0,32(tp) # 20 <_fw_start-0x7fffffe0>
    800002b0:	00040533          	add	a0,s0,zero
    800002b4:	000485b3          	add	a1,s1,zero
    800002b8:	00090633          	add	a2,s2,zero
    800002bc:	00000717          	auipc	a4,0x0
    800002c0:	15270713          	addi	a4,a4,338 # 8000040e <_start_warm>
    800002c4:	02e23423          	sd	a4,40(tp) # 28 <_fw_start-0x7fffffd8>
    800002c8:	0000c717          	auipc	a4,0xc
    800002cc:	38070713          	addi	a4,a4,896 # 8000c648 <platform>
    800002d0:	02e23823          	sd	a4,48(tp) # 30 <_fw_start-0x7fffffd0>
    800002d4:	00000717          	auipc	a4,0x0
    800002d8:	1cc70713          	addi	a4,a4,460 # 800004a0 <_hartid_to_scratch>
    800002dc:	02e23c23          	sd	a4,56(tp) # 38 <_fw_start-0x7fffffc8>
    800002e0:	04023023          	sd	zero,64(tp) # 40 <_fw_start-0x7fffffc0>
    800002e4:	00050433          	add	s0,a0,zero
    800002e8:	000584b3          	add	s1,a1,zero
    800002ec:	00060933          	add	s2,a2,zero
    800002f0:	00000733          	add	a4,zero,zero
    800002f4:	354000ef          	jal	ra,80000648 <fw_options>
    800002f8:	8f49                	or	a4,a4,a0
    800002fa:	04e23423          	sd	a4,72(tp) # 48 <_fw_start-0x7fffffb8>
    800002fe:	00040533          	add	a0,s0,zero
    80000302:	000485b3          	add	a1,s1,zero
    80000306:	00090633          	add	a2,s2,zero
    8000030a:	931e                	add	t1,t1,t2
    8000030c:	f1734ee3          	blt	t1,s7,80000228 <_scratch_init>
    80000310:	0000f717          	auipc	a4,0xf
    80000314:	cf070713          	addi	a4,a4,-784 # 8000f000 <coldboot_lottery>
    80000318:	00030797          	auipc	a5,0x30
    8000031c:	a4078793          	addi	a5,a5,-1472 # 8002fd58 <_bss_end>

0000000080000320 <_bss_zero>:
    80000320:	00073023          	sd	zero,0(a4)
    80000324:	0721                	addi	a4,a4,8
    80000326:	fef74de3          	blt	a4,a5,80000320 <_bss_zero>
    8000032a:	00050433          	add	s0,a0,zero
    8000032e:	000584b3          	add	s1,a1,zero
    80000332:	00060933          	add	s2,a2,zero
    80000336:	2ea000ef          	jal	ra,80000620 <fw_prev_arg1>
    8000033a:	00050333          	add	t1,a0,zero
    8000033e:	00040533          	add	a0,s0,zero
    80000342:	000485b3          	add	a1,s1,zero
    80000346:	00090633          	add	a2,s2,zero
    8000034a:	00030463          	beqz	t1,80000352 <_prev_arg1_override_done>
    8000034e:	000305b3          	add	a1,t1,zero

0000000080000352 <_prev_arg1_override_done>:
    80000352:	c9c1                	beqz	a1,800003e2 <_fdt_reloc_done>
    80000354:	56e1                	li	a3,-8
    80000356:	0ff00713          	li	a4,255
    8000035a:	00050433          	add	s0,a0,zero
    8000035e:	000584b3          	add	s1,a1,zero
    80000362:	00060933          	add	s2,a2,zero
    80000366:	2c2000ef          	jal	ra,80000628 <fw_next_arg1>
    8000036a:	00050333          	add	t1,a0,zero
    8000036e:	00040533          	add	a0,s0,zero
    80000372:	000485b3          	add	a1,s1,zero
    80000376:	00090633          	add	a2,s2,zero
    8000037a:	06030463          	beqz	t1,800003e2 <_fdt_reloc_done>
    8000037e:	06b30263          	beq	t1,a1,800003e2 <_fdt_reloc_done>
    80000382:	00d37333          	and	t1,t1,a3
    80000386:	000582b3          	add	t0,a1,zero
    8000038a:	00d2f2b3          	and	t0,t0,a3
    8000038e:	0042e383          	lwu	t2,4(t0)
    80000392:	00038e33          	add	t3,t2,zero
    80000396:	010e5e13          	srli	t3,t3,0x10
    8000039a:	00ee7e33          	and	t3,t3,a4
    8000039e:	0e22                	slli	t3,t3,0x8
    800003a0:	00038eb3          	add	t4,t2,zero
    800003a4:	008ede93          	srli	t4,t4,0x8
    800003a8:	00eefeb3          	and	t4,t4,a4
    800003ac:	0ec2                	slli	t4,t4,0x10
    800003ae:	00038f33          	add	t5,t2,zero
    800003b2:	00ef7f33          	and	t5,t5,a4
    800003b6:	0f62                	slli	t5,t5,0x18
    800003b8:	0183d393          	srli	t2,t2,0x18
    800003bc:	00e3f3b3          	and	t2,t2,a4
    800003c0:	01c3e3b3          	or	t2,t2,t3
    800003c4:	01d3e3b3          	or	t2,t2,t4
    800003c8:	01e3e3b3          	or	t2,t2,t5
    800003cc:	939a                	add	t2,t2,t1
    800003ce:	00735a63          	bge	t1,t2,800003e2 <_fdt_reloc_done>

00000000800003d2 <_fdt_reloc_again>:
    800003d2:	0002be03          	ld	t3,0(t0)
    800003d6:	01c33023          	sd	t3,0(t1)
    800003da:	02a1                	addi	t0,t0,8
    800003dc:	0321                	addi	t1,t1,8
    800003de:	fe734ae3          	blt	t1,t2,800003d2 <_fdt_reloc_again>

00000000800003e2 <_fdt_reloc_done>:
    800003e2:	4289                	li	t0,2
    800003e4:	00000317          	auipc	t1,0x0
    800003e8:	09c30313          	addi	t1,t1,156 # 80000480 <_boot_status>
    800003ec:	00533023          	sd	t0,0(t1)
    800003f0:	0330000f          	fence	rw,rw
    800003f4:	a829                	j	8000040e <_start_warm>

00000000800003f6 <_wait_for_boot_hart>:
    800003f6:	4289                	li	t0,2
    800003f8:	00000317          	auipc	t1,0x0
    800003fc:	08830313          	addi	t1,t1,136 # 80000480 <_boot_status>
    80000400:	00033303          	ld	t1,0(t1)
    80000404:	0001                	nop
    80000406:	0001                	nop
    80000408:	0001                	nop
    8000040a:	fe6296e3          	bne	t0,t1,800003f6 <_wait_for_boot_hart>

000000008000040e <_start_warm>:
    8000040e:	4081                	li	ra,0
    80000410:	1c0000ef          	jal	ra,800005d0 <_reset_regs>
    80000414:	30401073          	csrw	mie,zero
    80000418:	34401073          	csrw	mip,zero
    8000041c:	0000c717          	auipc	a4,0xc
    80000420:	22c70713          	addi	a4,a4,556 # 8000c648 <platform>
    80000424:	05076b83          	lwu	s7,80(a4)
    80000428:	05476c03          	lwu	s8,84(a4)
    8000042c:	f1402b73          	csrr	s6,mhartid
    80000430:	0b7b5863          	bge	s6,s7,800004e0 <_start_hang>
    80000434:	00030217          	auipc	tp,0x30
    80000438:	bcc20213          	addi	tp,tp,-1076 # 80030000 <_fw_end>
    8000043c:	038b87b3          	mul	a5,s7,s8
    80000440:	923e                	add	tp,tp,a5
    80000442:	036c07b3          	mul	a5,s8,s6
    80000446:	40f20233          	sub	tp,tp,a5
    8000044a:	20000793          	li	a5,512
    8000044e:	40f20233          	sub	tp,tp,a5
    80000452:	34021073          	csrw	mscratch,tp
    80000456:	00020133          	add	sp,tp,zero
    8000045a:	00000717          	auipc	a4,0x0
    8000045e:	08e70713          	addi	a4,a4,142 # 800004e8 <_trap_handler>
    80000462:	30571073          	csrw	mtvec,a4
    80000466:	305027f3          	csrr	a5,mtvec
    8000046a:	fef71ee3          	bne	a4,a5,80000466 <_start_warm+0x58>
    8000046e:	34002573          	csrr	a0,mscratch
    80000472:	1ec000ef          	jal	ra,8000065e <sbi_init>
    80000476:	a0ad                	j	800004e0 <_start_hang>

0000000080000478 <_relocate_lottery>:
	...

0000000080000480 <_boot_status>:
	...

0000000080000488 <_load_start>:
    80000488:	0000                	unimp
    8000048a:	8000                	0x8000
    8000048c:	0000                	unimp
	...

0000000080000490 <_link_start>:
    80000490:	0000                	unimp
    80000492:	8000                	0x8000
    80000494:	0000                	unimp
	...

0000000080000498 <_link_end>:
    80000498:	0000                	unimp
    8000049a:	8170                	0x8170
    8000049c:	0000                	unimp
	...

00000000800004a0 <_hartid_to_scratch>:
    800004a0:	1121                	addi	sp,sp,-24
    800004a2:	e022                	sd	s0,0(sp)
    800004a4:	e426                	sd	s1,8(sp)
    800004a6:	e84a                	sd	s2,16(sp)
    800004a8:	0000c917          	auipc	s2,0xc
    800004ac:	1a090913          	addi	s2,s2,416 # 8000c648 <platform>
    800004b0:	05496403          	lwu	s0,84(s2)
    800004b4:	05096903          	lwu	s2,80(s2)
    800004b8:	02890933          	mul	s2,s2,s0
    800004bc:	00030497          	auipc	s1,0x30
    800004c0:	b4448493          	addi	s1,s1,-1212 # 80030000 <_fw_end>
    800004c4:	94ca                	add	s1,s1,s2
    800004c6:	02a40933          	mul	s2,s0,a0
    800004ca:	412484b3          	sub	s1,s1,s2
    800004ce:	20000913          	li	s2,512
    800004d2:	41248533          	sub	a0,s1,s2
    800004d6:	6402                	ld	s0,0(sp)
    800004d8:	64a2                	ld	s1,8(sp)
    800004da:	6942                	ld	s2,16(sp)
    800004dc:	0161                	addi	sp,sp,24
    800004de:	8082                	ret

00000000800004e0 <_start_hang>:
    800004e0:	10500073          	wfi
    800004e4:	bff5                	j	800004e0 <_start_hang>
    800004e6:	0001                	nop

00000000800004e8 <_trap_handler>:
    800004e8:	34021273          	csrrw	tp,mscratch,tp
    800004ec:	04523023          	sd	t0,64(tp) # 40 <_fw_start-0x7fffffc0>
    800004f0:	300022f3          	csrr	t0,mstatus
    800004f4:	00b2d293          	srli	t0,t0,0xb
    800004f8:	0032f293          	andi	t0,t0,3
    800004fc:	0032c293          	xori	t0,t0,3
    80000500:	00028763          	beqz	t0,8000050e <_trap_handler_m_mode>

0000000080000504 <_trap_handler_s_mode>:
    80000504:	000102b3          	add	t0,sp,zero
    80000508:	ee820113          	addi	sp,tp,-280 # fffffffffffffee8 <_enclave_end+0xffffffff7e8ffee8>
    8000050c:	a809                	j	8000051e <_trap_handler_all_mode>

000000008000050e <_trap_handler_m_mode>:
    8000050e:	000102b3          	add	t0,sp,zero
    80000512:	ee810113          	addi	sp,sp,-280

0000000080000516 <_trap_handler_u_mode>:
    80000516:	000102b3          	add	t0,sp,zero
    8000051a:	ee810113          	addi	sp,sp,-280

000000008000051e <_trap_handler_all_mode>:
    8000051e:	e816                	sd	t0,16(sp)
    80000520:	04023283          	ld	t0,64(tp) # 40 <_fw_start-0x7fffffc0>
    80000524:	f416                	sd	t0,40(sp)
    80000526:	34021273          	csrrw	tp,mscratch,tp
    8000052a:	341022f3          	csrr	t0,mepc
    8000052e:	e216                	sd	t0,256(sp)
    80000530:	300022f3          	csrr	t0,mstatus
    80000534:	e616                	sd	t0,264(sp)
    80000536:	ea02                	sd	zero,272(sp)
    80000538:	e002                	sd	zero,0(sp)
    8000053a:	e406                	sd	ra,8(sp)
    8000053c:	ec0e                	sd	gp,24(sp)
    8000053e:	f012                	sd	tp,32(sp)
    80000540:	f81a                	sd	t1,48(sp)
    80000542:	fc1e                	sd	t2,56(sp)
    80000544:	e0a2                	sd	s0,64(sp)
    80000546:	e4a6                	sd	s1,72(sp)
    80000548:	e8aa                	sd	a0,80(sp)
    8000054a:	ecae                	sd	a1,88(sp)
    8000054c:	f0b2                	sd	a2,96(sp)
    8000054e:	f4b6                	sd	a3,104(sp)
    80000550:	f8ba                	sd	a4,112(sp)
    80000552:	fcbe                	sd	a5,120(sp)
    80000554:	e142                	sd	a6,128(sp)
    80000556:	e546                	sd	a7,136(sp)
    80000558:	e94a                	sd	s2,144(sp)
    8000055a:	ed4e                	sd	s3,152(sp)
    8000055c:	f152                	sd	s4,160(sp)
    8000055e:	f556                	sd	s5,168(sp)
    80000560:	f95a                	sd	s6,176(sp)
    80000562:	fd5e                	sd	s7,184(sp)
    80000564:	e1e2                	sd	s8,192(sp)
    80000566:	e5e6                	sd	s9,200(sp)
    80000568:	e9ea                	sd	s10,208(sp)
    8000056a:	edee                	sd	s11,216(sp)
    8000056c:	f1f2                	sd	t3,224(sp)
    8000056e:	f5f6                	sd	t4,232(sp)
    80000570:	f9fa                	sd	t5,240(sp)
    80000572:	fdfe                	sd	t6,248(sp)
    80000574:	00010533          	add	a0,sp,zero
    80000578:	340025f3          	csrr	a1,mscratch
    8000057c:	189020ef          	jal	ra,80002f04 <sbi_trap_handler>
    80000580:	60a2                	ld	ra,8(sp)
    80000582:	61e2                	ld	gp,24(sp)
    80000584:	7202                	ld	tp,32(sp)
    80000586:	7342                	ld	t1,48(sp)
    80000588:	73e2                	ld	t2,56(sp)
    8000058a:	6406                	ld	s0,64(sp)
    8000058c:	64a6                	ld	s1,72(sp)
    8000058e:	6546                	ld	a0,80(sp)
    80000590:	65e6                	ld	a1,88(sp)
    80000592:	7606                	ld	a2,96(sp)
    80000594:	76a6                	ld	a3,104(sp)
    80000596:	7746                	ld	a4,112(sp)
    80000598:	77e6                	ld	a5,120(sp)
    8000059a:	680a                	ld	a6,128(sp)
    8000059c:	68aa                	ld	a7,136(sp)
    8000059e:	694a                	ld	s2,144(sp)
    800005a0:	69ea                	ld	s3,152(sp)
    800005a2:	7a0a                	ld	s4,160(sp)
    800005a4:	7aaa                	ld	s5,168(sp)
    800005a6:	7b4a                	ld	s6,176(sp)
    800005a8:	7bea                	ld	s7,184(sp)
    800005aa:	6c0e                	ld	s8,192(sp)
    800005ac:	6cae                	ld	s9,200(sp)
    800005ae:	6d4e                	ld	s10,208(sp)
    800005b0:	6dee                	ld	s11,216(sp)
    800005b2:	7e0e                	ld	t3,224(sp)
    800005b4:	7eae                	ld	t4,232(sp)
    800005b6:	7f4e                	ld	t5,240(sp)
    800005b8:	7fee                	ld	t6,248(sp)
    800005ba:	6292                	ld	t0,256(sp)
    800005bc:	34129073          	csrw	mepc,t0
    800005c0:	62b2                	ld	t0,264(sp)
    800005c2:	30029073          	csrw	mstatus,t0
    800005c6:	72a2                	ld	t0,40(sp)
    800005c8:	6142                	ld	sp,16(sp)
    800005ca:	30200073          	mret
    800005ce:	0001                	nop

00000000800005d0 <_reset_regs>:
    800005d0:	0000100f          	fence.i
    800005d4:	4101                	li	sp,0
    800005d6:	4181                	li	gp,0
    800005d8:	4201                	li	tp,0
    800005da:	4281                	li	t0,0
    800005dc:	4301                	li	t1,0
    800005de:	4381                	li	t2,0
    800005e0:	4401                	li	s0,0
    800005e2:	4481                	li	s1,0
    800005e4:	4681                	li	a3,0
    800005e6:	4701                	li	a4,0
    800005e8:	4781                	li	a5,0
    800005ea:	4801                	li	a6,0
    800005ec:	4881                	li	a7,0
    800005ee:	4901                	li	s2,0
    800005f0:	4981                	li	s3,0
    800005f2:	4a01                	li	s4,0
    800005f4:	4a81                	li	s5,0
    800005f6:	4b01                	li	s6,0
    800005f8:	4b81                	li	s7,0
    800005fa:	4c01                	li	s8,0
    800005fc:	4c81                	li	s9,0
    800005fe:	4d01                	li	s10,0
    80000600:	4d81                	li	s11,0
    80000602:	4e01                	li	t3,0
    80000604:	4e81                	li	t4,0
    80000606:	4f01                	li	t5,0
    80000608:	4f81                	li	t6,0
    8000060a:	34005073          	csrwi	mscratch,0
    8000060e:	8082                	ret

0000000080000610 <fw_boot_hart>:
    80000610:	557d                	li	a0,-1
    80000612:	8082                	ret
    80000614:	00000013          	nop

0000000080000618 <fw_save_info>:
    80000618:	8082                	ret
    8000061a:	0001                	nop
    8000061c:	00000013          	nop

0000000080000620 <fw_prev_arg1>:
    80000620:	00000533          	add	a0,zero,zero
    80000624:	8082                	ret
    80000626:	0001                	nop

0000000080000628 <fw_next_arg1>:
    80000628:	4110051b          	addiw	a0,zero,1041
    8000062c:	0556                	slli	a0,a0,0x15
    8000062e:	8082                	ret

0000000080000630 <fw_next_addr>:
    80000630:	00000517          	auipc	a0,0x0
    80000634:	02050513          	addi	a0,a0,32 # 80000650 <_jump_addr>
    80000638:	6108                	ld	a0,0(a0)
    8000063a:	8082                	ret
    8000063c:	00000013          	nop

0000000080000640 <fw_next_mode>:
    80000640:	4505                	li	a0,1
    80000642:	8082                	ret
    80000644:	00000013          	nop

0000000080000648 <fw_options>:
    80000648:	00000533          	add	a0,zero,zero
    8000064c:	8082                	ret
    8000064e:	0001                	nop

0000000080000650 <_jump_addr>:
    80000650:	0000                	unimp
    80000652:	8200                	0x8200
	...

000000008000065e <sbi_init>:
    8000065e:	7175                	addi	sp,sp,-144
    80000660:	e122                	sd	s0,128(sp)
    80000662:	fca6                	sd	s1,120(sp)
    80000664:	f8ca                	sd	s2,112(sp)
    80000666:	e506                	sd	ra,136(sp)
    80000668:	f4ce                	sd	s3,104(sp)
    8000066a:	f0d2                	sd	s4,96(sp)
    8000066c:	ecd6                	sd	s5,88(sp)
    8000066e:	e8da                	sd	s6,80(sp)
    80000670:	e4de                	sd	s7,72(sp)
    80000672:	e0e2                	sd	s8,64(sp)
    80000674:	0900                	addi	s0,sp,144
    80000676:	84aa                	mv	s1,a0
    80000678:	707060ef          	jal	ra,8000757e <sbi_current_hartid>
    8000067c:	0314c783          	lbu	a5,49(s1)
    80000680:	0304c703          	lbu	a4,48(s1)
    80000684:	0324c883          	lbu	a7,50(s1)
    80000688:	0334c803          	lbu	a6,51(s1)
    8000068c:	0344c603          	lbu	a2,52(s1)
    80000690:	07a2                	slli	a5,a5,0x8
    80000692:	8fd9                	or	a5,a5,a4
    80000694:	0354c683          	lbu	a3,53(s1)
    80000698:	08c2                	slli	a7,a7,0x10
    8000069a:	00f8e8b3          	or	a7,a7,a5
    8000069e:	0364c703          	lbu	a4,54(s1)
    800006a2:	0862                	slli	a6,a6,0x18
    800006a4:	0374c783          	lbu	a5,55(s1)
    800006a8:	01186833          	or	a6,a6,a7
    800006ac:	1602                	slli	a2,a2,0x20
    800006ae:	01066633          	or	a2,a2,a6
    800006b2:	16a2                	slli	a3,a3,0x28
    800006b4:	8ed1                	or	a3,a3,a2
    800006b6:	1742                	slli	a4,a4,0x30
    800006b8:	8f55                	or	a4,a4,a3
    800006ba:	17e2                	slli	a5,a5,0x38
    800006bc:	8fd9                	or	a5,a5,a4
    800006be:	0005091b          	sext.w	s2,a0
    800006c2:	cba9                	beqz	a5,80000714 <sbi_init+0xb6>
    800006c4:	0597c703          	lbu	a4,89(a5)
    800006c8:	0587c683          	lbu	a3,88(a5)
    800006cc:	05a7c803          	lbu	a6,90(a5)
    800006d0:	05b7c503          	lbu	a0,91(a5)
    800006d4:	05c7c583          	lbu	a1,92(a5)
    800006d8:	0722                	slli	a4,a4,0x8
    800006da:	8f55                	or	a4,a4,a3
    800006dc:	05d7c603          	lbu	a2,93(a5)
    800006e0:	0842                	slli	a6,a6,0x10
    800006e2:	05e7c683          	lbu	a3,94(a5)
    800006e6:	00e86833          	or	a6,a6,a4
    800006ea:	0562                	slli	a0,a0,0x18
    800006ec:	05f7c703          	lbu	a4,95(a5)
    800006f0:	01056533          	or	a0,a0,a6
    800006f4:	02059793          	slli	a5,a1,0x20
    800006f8:	00a7e5b3          	or	a1,a5,a0
    800006fc:	02861793          	slli	a5,a2,0x28
    80000700:	8fcd                	or	a5,a5,a1
    80000702:	16c2                	slli	a3,a3,0x30
    80000704:	8edd                	or	a3,a3,a5
    80000706:	1762                	slli	a4,a4,0x38
    80000708:	4785                	li	a5,1
    8000070a:	012797bb          	sllw	a5,a5,s2
    8000070e:	8f55                	or	a4,a4,a3
    80000710:	8ff9                	and	a5,a5,a4
    80000712:	e7b5                	bnez	a5,8000077e <sbi_init+0x120>
    80000714:	4585                	li	a1,1
    80000716:	0000f517          	auipc	a0,0xf
    8000071a:	8ea50513          	addi	a0,a0,-1814 # 8000f000 <coldboot_lottery>
    8000071e:	7ab030ef          	jal	ra,800046c8 <atomic_add_return>
    80000722:	4785                	li	a5,1
    80000724:	22f50163          	beq	a0,a5,80000946 <sbi_init+0x2e8>
    80000728:	0314c503          	lbu	a0,49(s1)
    8000072c:	0304c783          	lbu	a5,48(s1)
    80000730:	0324c583          	lbu	a1,50(s1)
    80000734:	0334c603          	lbu	a2,51(s1)
    80000738:	0344c683          	lbu	a3,52(s1)
    8000073c:	0522                	slli	a0,a0,0x8
    8000073e:	8d5d                	or	a0,a0,a5
    80000740:	0354c703          	lbu	a4,53(s1)
    80000744:	05c2                	slli	a1,a1,0x10
    80000746:	8dc9                	or	a1,a1,a0
    80000748:	0364c783          	lbu	a5,54(s1)
    8000074c:	0662                	slli	a2,a2,0x18
    8000074e:	0374c503          	lbu	a0,55(s1)
    80000752:	8e4d                	or	a2,a2,a1
    80000754:	1682                	slli	a3,a3,0x20
    80000756:	8ed1                	or	a3,a3,a2
    80000758:	1722                	slli	a4,a4,0x28
    8000075a:	8f55                	or	a4,a4,a3
    8000075c:	17c2                	slli	a5,a5,0x30
    8000075e:	8fd9                	or	a5,a5,a4
    80000760:	85ca                	mv	a1,s2
    80000762:	03851713          	slli	a4,a0,0x38
    80000766:	8526                	mv	a0,s1
    80000768:	00f769b3          	or	s3,a4,a5
    8000076c:	0000fa17          	auipc	s4,0xf
    80000770:	89ca0a13          	addi	s4,s4,-1892 # 8000f008 <init_count_offset>
    80000774:	65c070ef          	jal	ra,80007dd0 <sbi_hart_wait_for_coldboot>
    80000778:	000a3783          	ld	a5,0(s4)
    8000077c:	e399                	bnez	a5,80000782 <sbi_init+0x124>
    8000077e:	45a070ef          	jal	ra,80007bd8 <sbi_hart_hang>
    80000782:	4581                	li	a1,0
    80000784:	8526                	mv	a0,s1
    80000786:	0fe010ef          	jal	ra,80001884 <sbi_system_early_init>
    8000078a:	f975                	bnez	a0,8000077e <sbi_init+0x120>
    8000078c:	4601                	li	a2,0
    8000078e:	85ca                	mv	a1,s2
    80000790:	8526                	mv	a0,s1
    80000792:	79f060ef          	jal	ra,80007730 <sbi_hart_init>
    80000796:	f565                	bnez	a0,8000077e <sbi_init+0x120>
    80000798:	08098663          	beqz	s3,80000824 <sbi_init+0x1c6>
    8000079c:	0619c783          	lbu	a5,97(s3)
    800007a0:	0609c703          	lbu	a4,96(s3)
    800007a4:	0629c803          	lbu	a6,98(s3)
    800007a8:	0639c583          	lbu	a1,99(s3)
    800007ac:	0649c603          	lbu	a2,100(s3)
    800007b0:	07a2                	slli	a5,a5,0x8
    800007b2:	8fd9                	or	a5,a5,a4
    800007b4:	0659c683          	lbu	a3,101(s3)
    800007b8:	0842                	slli	a6,a6,0x10
    800007ba:	00f86833          	or	a6,a6,a5
    800007be:	0669c703          	lbu	a4,102(s3)
    800007c2:	05e2                	slli	a1,a1,0x18
    800007c4:	0105e5b3          	or	a1,a1,a6
    800007c8:	0679c783          	lbu	a5,103(s3)
    800007cc:	1602                	slli	a2,a2,0x20
    800007ce:	8e4d                	or	a2,a2,a1
    800007d0:	16a2                	slli	a3,a3,0x28
    800007d2:	8ed1                	or	a3,a3,a2
    800007d4:	1742                	slli	a4,a4,0x30
    800007d6:	8f55                	or	a4,a4,a3
    800007d8:	17e2                	slli	a5,a5,0x38
    800007da:	8fd9                	or	a5,a5,a4
    800007dc:	0597c883          	lbu	a7,89(a5)
    800007e0:	0587c703          	lbu	a4,88(a5)
    800007e4:	05a7c803          	lbu	a6,90(a5)
    800007e8:	05b7c583          	lbu	a1,91(a5)
    800007ec:	05c7c603          	lbu	a2,92(a5)
    800007f0:	08a2                	slli	a7,a7,0x8
    800007f2:	05d7c683          	lbu	a3,93(a5)
    800007f6:	00e8e8b3          	or	a7,a7,a4
    800007fa:	0842                	slli	a6,a6,0x10
    800007fc:	05e7c703          	lbu	a4,94(a5)
    80000800:	01186833          	or	a6,a6,a7
    80000804:	05e2                	slli	a1,a1,0x18
    80000806:	05f7c783          	lbu	a5,95(a5)
    8000080a:	0105e5b3          	or	a1,a1,a6
    8000080e:	1602                	slli	a2,a2,0x20
    80000810:	8e4d                	or	a2,a2,a1
    80000812:	16a2                	slli	a3,a3,0x28
    80000814:	8ed1                	or	a3,a3,a2
    80000816:	1742                	slli	a4,a4,0x30
    80000818:	8f55                	or	a4,a4,a3
    8000081a:	17e2                	slli	a5,a5,0x38
    8000081c:	8fd9                	or	a5,a5,a4
    8000081e:	c399                	beqz	a5,80000824 <sbi_init+0x1c6>
    80000820:	9782                	jalr	a5
    80000822:	fd31                	bnez	a0,8000077e <sbi_init+0x120>
    80000824:	4581                	li	a1,0
    80000826:	8526                	mv	a0,s1
    80000828:	4bf000ef          	jal	ra,800014e6 <sbi_ipi_init>
    8000082c:	f929                	bnez	a0,8000077e <sbi_init+0x120>
    8000082e:	4581                	li	a1,0
    80000830:	8526                	mv	a0,s1
    80000832:	02a020ef          	jal	ra,8000285c <sbi_tlb_init>
    80000836:	f521                	bnez	a0,8000077e <sbi_init+0x120>
    80000838:	4581                	li	a1,0
    8000083a:	8526                	mv	a0,s1
    8000083c:	131010ef          	jal	ra,8000216c <sbi_timer_init>
    80000840:	fd1d                	bnez	a0,8000077e <sbi_init+0x120>
    80000842:	4581                	li	a1,0
    80000844:	8526                	mv	a0,s1
    80000846:	124010ef          	jal	ra,8000196a <sbi_system_final_init>
    8000084a:	f915                	bnez	a0,8000077e <sbi_init+0x120>
    8000084c:	854a                	mv	a0,s2
    8000084e:	46a070ef          	jal	ra,80007cb8 <sbi_hart_mark_available>
    80000852:	000a3783          	ld	a5,0(s4)
    80000856:	02091513          	slli	a0,s2,0x20
    8000085a:	4701                	li	a4,0
    8000085c:	97a6                	add	a5,a5,s1
    8000085e:	6394                	ld	a3,0(a5)
    80000860:	9101                	srli	a0,a0,0x20
    80000862:	0685                	addi	a3,a3,1
    80000864:	e394                	sd	a3,0(a5)
    80000866:	0214cf83          	lbu	t6,33(s1)
    8000086a:	0194cf03          	lbu	t5,25(s1)
    8000086e:	0204c603          	lbu	a2,32(s1)
    80000872:	0184c683          	lbu	a3,24(s1)
    80000876:	0114ce83          	lbu	t4,17(s1)
    8000087a:	0224ca83          	lbu	s5,34(s1)
    8000087e:	01a4c083          	lbu	ra,26(s1)
    80000882:	0104c783          	lbu	a5,16(s1)
    80000886:	0124ca03          	lbu	s4,18(s1)
    8000088a:	0234c983          	lbu	s3,35(s1)
    8000088e:	01b4c903          	lbu	s2,27(s1)
    80000892:	0134c383          	lbu	t2,19(s1)
    80000896:	0244c283          	lbu	t0,36(s1)
    8000089a:	01c4ce03          	lbu	t3,28(s1)
    8000089e:	0fa2                	slli	t6,t6,0x8
    800008a0:	0f22                	slli	t5,t5,0x8
    800008a2:	00cfefb3          	or	t6,t6,a2
    800008a6:	00df6f33          	or	t5,t5,a3
    800008aa:	0144c303          	lbu	t1,20(s1)
    800008ae:	0254c883          	lbu	a7,37(s1)
    800008b2:	0ea2                	slli	t4,t4,0x8
    800008b4:	0ac2                	slli	s5,s5,0x10
    800008b6:	00c2                	slli	ra,ra,0x10
    800008b8:	00feeeb3          	or	t4,t4,a5
    800008bc:	01faeab3          	or	s5,s5,t6
    800008c0:	01e0e0b3          	or	ra,ra,t5
    800008c4:	0a42                	slli	s4,s4,0x10
    800008c6:	09e2                	slli	s3,s3,0x18
    800008c8:	0962                	slli	s2,s2,0x18
    800008ca:	01da6a33          	or	s4,s4,t4
    800008ce:	01d4c803          	lbu	a6,29(s1)
    800008d2:	0154c583          	lbu	a1,21(s1)
    800008d6:	0264c683          	lbu	a3,38(s1)
    800008da:	01e4c603          	lbu	a2,30(s1)
    800008de:	0164c783          	lbu	a5,22(s1)
    800008e2:	0274cf83          	lbu	t6,39(s1)
    800008e6:	01f4cf03          	lbu	t5,31(s1)
    800008ea:	0174ce83          	lbu	t4,23(s1)
    800008ee:	03e2                	slli	t2,t2,0x18
    800008f0:	0159e9b3          	or	s3,s3,s5
    800008f4:	1282                	slli	t0,t0,0x20
    800008f6:	001964b3          	or	s1,s2,ra
    800008fa:	1e02                	slli	t3,t3,0x20
    800008fc:	0143e3b3          	or	t2,t2,s4
    80000900:	1302                	slli	t1,t1,0x20
    80000902:	0132e2b3          	or	t0,t0,s3
    80000906:	18a2                	slli	a7,a7,0x28
    80000908:	009e6e33          	or	t3,t3,s1
    8000090c:	1822                	slli	a6,a6,0x28
    8000090e:	00736333          	or	t1,t1,t2
    80000912:	15a2                	slli	a1,a1,0x28
    80000914:	0065e5b3          	or	a1,a1,t1
    80000918:	0058e8b3          	or	a7,a7,t0
    8000091c:	16c2                	slli	a3,a3,0x30
    8000091e:	01c86833          	or	a6,a6,t3
    80000922:	1642                	slli	a2,a2,0x30
    80000924:	17c2                	slli	a5,a5,0x30
    80000926:	8fcd                	or	a5,a5,a1
    80000928:	0116e6b3          	or	a3,a3,a7
    8000092c:	1fe2                	slli	t6,t6,0x38
    8000092e:	01066633          	or	a2,a2,a6
    80000932:	1f62                	slli	t5,t5,0x38
    80000934:	038e9593          	slli	a1,t4,0x38
    80000938:	00dfe6b3          	or	a3,t6,a3
    8000093c:	00cf6633          	or	a2,t5,a2
    80000940:	8ddd                	or	a1,a1,a5
    80000942:	2a6070ef          	jal	ra,80007be8 <sbi_hart_switch_mode>
    80000946:	0314c503          	lbu	a0,49(s1)
    8000094a:	0304c783          	lbu	a5,48(s1)
    8000094e:	0324c583          	lbu	a1,50(s1)
    80000952:	0334c603          	lbu	a2,51(s1)
    80000956:	0344c683          	lbu	a3,52(s1)
    8000095a:	0522                	slli	a0,a0,0x8
    8000095c:	8d5d                	or	a0,a0,a5
    8000095e:	0354c703          	lbu	a4,53(s1)
    80000962:	05c2                	slli	a1,a1,0x10
    80000964:	8dc9                	or	a1,a1,a0
    80000966:	0364c783          	lbu	a5,54(s1)
    8000096a:	0662                	slli	a2,a2,0x18
    8000096c:	0374c503          	lbu	a0,55(s1)
    80000970:	8e4d                	or	a2,a2,a1
    80000972:	1682                	slli	a3,a3,0x20
    80000974:	8ed1                	or	a3,a3,a2
    80000976:	1722                	slli	a4,a4,0x28
    80000978:	8f55                	or	a4,a4,a3
    8000097a:	17c2                	slli	a5,a5,0x30
    8000097c:	8fd9                	or	a5,a5,a4
    8000097e:	0000b597          	auipc	a1,0xb
    80000982:	68258593          	addi	a1,a1,1666 # 8000c000 <fdt_move+0x44c>
    80000986:	03851713          	slli	a4,a0,0x38
    8000098a:	4521                	li	a0,8
    8000098c:	00f769b3          	or	s3,a4,a5
    80000990:	0000ea17          	auipc	s4,0xe
    80000994:	678a0a13          	addi	s4,s4,1656 # 8000f008 <init_count_offset>
    80000998:	5ed000ef          	jal	ra,80001784 <sbi_scratch_alloc_offset>
    8000099c:	00aa3023          	sd	a0,0(s4)
    800009a0:	dc050fe3          	beqz	a0,8000077e <sbi_init+0x120>
    800009a4:	4585                	li	a1,1
    800009a6:	8526                	mv	a0,s1
    800009a8:	6dd000ef          	jal	ra,80001884 <sbi_system_early_init>
    800009ac:	dc0519e3          	bnez	a0,8000077e <sbi_init+0x120>
    800009b0:	4605                	li	a2,1
    800009b2:	85ca                	mv	a1,s2
    800009b4:	8526                	mv	a0,s1
    800009b6:	57b060ef          	jal	ra,80007730 <sbi_hart_init>
    800009ba:	dc0512e3          	bnez	a0,8000077e <sbi_init+0x120>
    800009be:	8526                	mv	a0,s1
    800009c0:	2f7040ef          	jal	ra,800054b6 <sbi_console_init>
    800009c4:	da051de3          	bnez	a0,8000077e <sbi_init+0x120>
    800009c8:	08098563          	beqz	s3,80000a52 <sbi_init+0x3f4>
    800009cc:	0619c783          	lbu	a5,97(s3)
    800009d0:	0609c703          	lbu	a4,96(s3)
    800009d4:	0629c503          	lbu	a0,98(s3)
    800009d8:	0639c583          	lbu	a1,99(s3)
    800009dc:	0649c603          	lbu	a2,100(s3)
    800009e0:	07a2                	slli	a5,a5,0x8
    800009e2:	8fd9                	or	a5,a5,a4
    800009e4:	0659c683          	lbu	a3,101(s3)
    800009e8:	0542                	slli	a0,a0,0x10
    800009ea:	8d5d                	or	a0,a0,a5
    800009ec:	0669c703          	lbu	a4,102(s3)
    800009f0:	05e2                	slli	a1,a1,0x18
    800009f2:	8dc9                	or	a1,a1,a0
    800009f4:	0679c783          	lbu	a5,103(s3)
    800009f8:	1602                	slli	a2,a2,0x20
    800009fa:	8e4d                	or	a2,a2,a1
    800009fc:	16a2                	slli	a3,a3,0x28
    800009fe:	8ed1                	or	a3,a3,a2
    80000a00:	1742                	slli	a4,a4,0x30
    80000a02:	8f55                	or	a4,a4,a3
    80000a04:	17e2                	slli	a5,a5,0x38
    80000a06:	8fd9                	or	a5,a5,a4
    80000a08:	0597c803          	lbu	a6,89(a5)
    80000a0c:	0587c703          	lbu	a4,88(a5)
    80000a10:	05a7c503          	lbu	a0,90(a5)
    80000a14:	05b7c583          	lbu	a1,91(a5)
    80000a18:	05c7c603          	lbu	a2,92(a5)
    80000a1c:	0822                	slli	a6,a6,0x8
    80000a1e:	05d7c683          	lbu	a3,93(a5)
    80000a22:	00e86833          	or	a6,a6,a4
    80000a26:	0542                	slli	a0,a0,0x10
    80000a28:	05e7c703          	lbu	a4,94(a5)
    80000a2c:	01056533          	or	a0,a0,a6
    80000a30:	05e2                	slli	a1,a1,0x18
    80000a32:	05f7c783          	lbu	a5,95(a5)
    80000a36:	8dc9                	or	a1,a1,a0
    80000a38:	1602                	slli	a2,a2,0x20
    80000a3a:	8e4d                	or	a2,a2,a1
    80000a3c:	16a2                	slli	a3,a3,0x28
    80000a3e:	8ed1                	or	a3,a3,a2
    80000a40:	1742                	slli	a4,a4,0x30
    80000a42:	8f55                	or	a4,a4,a3
    80000a44:	17e2                	slli	a5,a5,0x38
    80000a46:	8fd9                	or	a5,a5,a4
    80000a48:	c789                	beqz	a5,80000a52 <sbi_init+0x3f4>
    80000a4a:	4505                	li	a0,1
    80000a4c:	9782                	jalr	a5
    80000a4e:	d20518e3          	bnez	a0,8000077e <sbi_init+0x120>
    80000a52:	4585                	li	a1,1
    80000a54:	8526                	mv	a0,s1
    80000a56:	291000ef          	jal	ra,800014e6 <sbi_ipi_init>
    80000a5a:	d20512e3          	bnez	a0,8000077e <sbi_init+0x120>
    80000a5e:	4585                	li	a1,1
    80000a60:	8526                	mv	a0,s1
    80000a62:	5fb010ef          	jal	ra,8000285c <sbi_tlb_init>
    80000a66:	d0051ce3          	bnez	a0,8000077e <sbi_init+0x120>
    80000a6a:	4585                	li	a1,1
    80000a6c:	8526                	mv	a0,s1
    80000a6e:	6fe010ef          	jal	ra,8000216c <sbi_timer_init>
    80000a72:	d00516e3          	bnez	a0,8000077e <sbi_init+0x120>
    80000a76:	31c050ef          	jal	ra,80005d92 <sbi_ecall_init>
    80000a7a:	d00512e3          	bnez	a0,8000077e <sbi_init+0x120>
    80000a7e:	4585                	li	a1,1
    80000a80:	8526                	mv	a0,s1
    80000a82:	6e9000ef          	jal	ra,8000196a <sbi_system_final_init>
    80000a86:	ce051ce3          	bnez	a0,8000077e <sbi_init+0x120>
    80000a8a:	0484c783          	lbu	a5,72(s1)
    80000a8e:	8b85                	andi	a5,a5,1
    80000a90:	c7f1                	beqz	a5,80000b5c <sbi_init+0x4fe>
    80000a92:	85ca                	mv	a1,s2
    80000a94:	8526                	mv	a0,s1
    80000a96:	4da070ef          	jal	ra,80007f70 <sbi_hart_wake_coldboot_harts>
    80000a9a:	854a                	mv	a0,s2
    80000a9c:	21c070ef          	jal	ra,80007cb8 <sbi_hart_mark_available>
    80000aa0:	000a3783          	ld	a5,0(s4)
    80000aa4:	02091513          	slli	a0,s2,0x20
    80000aa8:	4701                	li	a4,0
    80000aaa:	97a6                	add	a5,a5,s1
    80000aac:	6394                	ld	a3,0(a5)
    80000aae:	9101                	srli	a0,a0,0x20
    80000ab0:	0685                	addi	a3,a3,1
    80000ab2:	e394                	sd	a3,0(a5)
    80000ab4:	0214cf83          	lbu	t6,33(s1)
    80000ab8:	0194cf03          	lbu	t5,25(s1)
    80000abc:	0204c603          	lbu	a2,32(s1)
    80000ac0:	0184c683          	lbu	a3,24(s1)
    80000ac4:	0114ce83          	lbu	t4,17(s1)
    80000ac8:	0224ca83          	lbu	s5,34(s1)
    80000acc:	01a4ca03          	lbu	s4,26(s1)
    80000ad0:	0104c783          	lbu	a5,16(s1)
    80000ad4:	0124c983          	lbu	s3,18(s1)
    80000ad8:	0234c903          	lbu	s2,35(s1)
    80000adc:	01b4c083          	lbu	ra,27(s1)
    80000ae0:	0134c383          	lbu	t2,19(s1)
    80000ae4:	0244c283          	lbu	t0,36(s1)
    80000ae8:	01c4ce03          	lbu	t3,28(s1)
    80000aec:	0fa2                	slli	t6,t6,0x8
    80000aee:	0f22                	slli	t5,t5,0x8
    80000af0:	00cfefb3          	or	t6,t6,a2
    80000af4:	00df6f33          	or	t5,t5,a3
    80000af8:	0144c303          	lbu	t1,20(s1)
    80000afc:	0254c883          	lbu	a7,37(s1)
    80000b00:	0ea2                	slli	t4,t4,0x8
    80000b02:	0ac2                	slli	s5,s5,0x10
    80000b04:	0a42                	slli	s4,s4,0x10
    80000b06:	00feeeb3          	or	t4,t4,a5
    80000b0a:	01faeab3          	or	s5,s5,t6
    80000b0e:	01ea6a33          	or	s4,s4,t5
    80000b12:	09c2                	slli	s3,s3,0x10
    80000b14:	0962                	slli	s2,s2,0x18
    80000b16:	00e2                	slli	ra,ra,0x18
    80000b18:	01d9e9b3          	or	s3,s3,t4
    80000b1c:	01d4c803          	lbu	a6,29(s1)
    80000b20:	0154c583          	lbu	a1,21(s1)
    80000b24:	0264c683          	lbu	a3,38(s1)
    80000b28:	01e4c603          	lbu	a2,30(s1)
    80000b2c:	0164c783          	lbu	a5,22(s1)
    80000b30:	0274cf83          	lbu	t6,39(s1)
    80000b34:	01f4cf03          	lbu	t5,31(s1)
    80000b38:	0174ce83          	lbu	t4,23(s1)
    80000b3c:	03e2                	slli	t2,t2,0x18
    80000b3e:	015964b3          	or	s1,s2,s5
    80000b42:	1282                	slli	t0,t0,0x20
    80000b44:	0140e0b3          	or	ra,ra,s4
    80000b48:	1e02                	slli	t3,t3,0x20
    80000b4a:	0133e3b3          	or	t2,t2,s3
    80000b4e:	1302                	slli	t1,t1,0x20
    80000b50:	0092e2b3          	or	t0,t0,s1
    80000b54:	18a2                	slli	a7,a7,0x28
    80000b56:	001e6e33          	or	t3,t3,ra
    80000b5a:	bb4d                	j	8000090c <sbi_init+0x2ae>
    80000b5c:	0314c583          	lbu	a1,49(s1)
    80000b60:	0304c783          	lbu	a5,48(s1)
    80000b64:	0324c603          	lbu	a2,50(s1)
    80000b68:	0334c683          	lbu	a3,51(s1)
    80000b6c:	0344c703          	lbu	a4,52(s1)
    80000b70:	05a2                	slli	a1,a1,0x8
    80000b72:	8ddd                	or	a1,a1,a5
    80000b74:	0354ca83          	lbu	s5,53(s1)
    80000b78:	0642                	slli	a2,a2,0x10
    80000b7a:	8e4d                	or	a2,a2,a1
    80000b7c:	0364c783          	lbu	a5,54(s1)
    80000b80:	06e2                	slli	a3,a3,0x18
    80000b82:	8ed1                	or	a3,a3,a2
    80000b84:	0374c503          	lbu	a0,55(s1)
    80000b88:	1702                	slli	a4,a4,0x20
    80000b8a:	8f55                	or	a4,a4,a3
    80000b8c:	1aa2                	slli	s5,s5,0x28
    80000b8e:	00eaeab3          	or	s5,s5,a4
    80000b92:	17c2                	slli	a5,a5,0x30
    80000b94:	0157e7b3          	or	a5,a5,s5
    80000b98:	4581                	li	a1,0
    80000b9a:	4619                	li	a2,6
    80000b9c:	03851a93          	slli	s5,a0,0x38
    80000ba0:	0000b517          	auipc	a0,0xb
    80000ba4:	47050513          	addi	a0,a0,1136 # 8000c010 <fdt_move+0x45c>
    80000ba8:	00faeab3          	or	s5,s5,a5
    80000bac:	073040ef          	jal	ra,8000541e <sbi_printf>
    80000bb0:	0000b517          	auipc	a0,0xb
    80000bb4:	47850513          	addi	a0,a0,1144 # 8000c028 <fdt_move+0x474>
    80000bb8:	067040ef          	jal	ra,8000541e <sbi_printf>
    80000bbc:	6e4030ef          	jal	ra,800042a0 <misa_xlen>
    80000bc0:	85aa                	mv	a1,a0
    80000bc2:	16a05c63          	blez	a0,80000d3a <sbi_init+0x6dc>
    80000bc6:	4b41                	li	s6,16
    80000bc8:	00ab1b3b          	sllw	s6,s6,a0
    80000bcc:	04100993          	li	s3,65
    80000bd0:	f7040b93          	addi	s7,s0,-144
    80000bd4:	05b00c13          	li	s8,91
    80000bd8:	854e                	mv	a0,s3
    80000bda:	5ba030ef          	jal	ra,80004194 <misa_extension_imp>
    80000bde:	c501                	beqz	a0,80000be6 <sbi_init+0x588>
    80000be0:	013b8023          	sb	s3,0(s7)
    80000be4:	0b85                	addi	s7,s7,1
    80000be6:	2985                	addiw	s3,s3,1
    80000be8:	0ff9f993          	andi	s3,s3,255
    80000bec:	ff8996e3          	bne	s3,s8,80000bd8 <sbi_init+0x57a>
    80000bf0:	000b8023          	sb	zero,0(s7)
    80000bf4:	100a8e63          	beqz	s5,80000d10 <sbi_init+0x6b2>
    80000bf8:	008a8593          	addi	a1,s5,8
    80000bfc:	0000b517          	auipc	a0,0xb
    80000c00:	57450513          	addi	a0,a0,1396 # 8000c170 <fdt_move+0x5bc>
    80000c04:	01b040ef          	jal	ra,8000541e <sbi_printf>
    80000c08:	85da                	mv	a1,s6
    80000c0a:	f7040613          	addi	a2,s0,-144
    80000c0e:	0000b517          	auipc	a0,0xb
    80000c12:	58250513          	addi	a0,a0,1410 # 8000c190 <fdt_move+0x5dc>
    80000c16:	009040ef          	jal	ra,8000541e <sbi_printf>
    80000c1a:	051ac703          	lbu	a4,81(s5)
    80000c1e:	050ac683          	lbu	a3,80(s5)
    80000c22:	052ac783          	lbu	a5,82(s5)
    80000c26:	053ac583          	lbu	a1,83(s5)
    80000c2a:	0722                	slli	a4,a4,0x8
    80000c2c:	8f55                	or	a4,a4,a3
    80000c2e:	07c2                	slli	a5,a5,0x10
    80000c30:	8fd9                	or	a5,a5,a4
    80000c32:	05e2                	slli	a1,a1,0x18
    80000c34:	8ddd                	or	a1,a1,a5
    80000c36:	2581                	sext.w	a1,a1
    80000c38:	0000b517          	auipc	a0,0xb
    80000c3c:	58050513          	addi	a0,a0,1408 # 8000c1b8 <fdt_move+0x604>
    80000c40:	7de040ef          	jal	ra,8000541e <sbi_printf>
    80000c44:	85ca                	mv	a1,s2
    80000c46:	0000b517          	auipc	a0,0xb
    80000c4a:	59250513          	addi	a0,a0,1426 # 8000c1d8 <fdt_move+0x624>
    80000c4e:	7d0040ef          	jal	ra,8000541e <sbi_printf>
    80000c52:	0014c503          	lbu	a0,1(s1)
    80000c56:	0004c783          	lbu	a5,0(s1)
    80000c5a:	0024c583          	lbu	a1,2(s1)
    80000c5e:	0034c603          	lbu	a2,3(s1)
    80000c62:	0044c683          	lbu	a3,4(s1)
    80000c66:	0522                	slli	a0,a0,0x8
    80000c68:	0054c703          	lbu	a4,5(s1)
    80000c6c:	8d5d                	or	a0,a0,a5
    80000c6e:	05c2                	slli	a1,a1,0x10
    80000c70:	0064c783          	lbu	a5,6(s1)
    80000c74:	8dc9                	or	a1,a1,a0
    80000c76:	0662                	slli	a2,a2,0x18
    80000c78:	0074c503          	lbu	a0,7(s1)
    80000c7c:	8e4d                	or	a2,a2,a1
    80000c7e:	1682                	slli	a3,a3,0x20
    80000c80:	8ed1                	or	a3,a3,a2
    80000c82:	1722                	slli	a4,a4,0x28
    80000c84:	8f55                	or	a4,a4,a3
    80000c86:	17c2                	slli	a5,a5,0x30
    80000c88:	8fd9                	or	a5,a5,a4
    80000c8a:	03851593          	slli	a1,a0,0x38
    80000c8e:	8ddd                	or	a1,a1,a5
    80000c90:	0000b517          	auipc	a0,0xb
    80000c94:	56850513          	addi	a0,a0,1384 # 8000c1f8 <fdt_move+0x644>
    80000c98:	786040ef          	jal	ra,8000541e <sbi_printf>
    80000c9c:	0094c603          	lbu	a2,9(s1)
    80000ca0:	0084c503          	lbu	a0,8(s1)
    80000ca4:	00a4c683          	lbu	a3,10(s1)
    80000ca8:	00b4c703          	lbu	a4,11(s1)
    80000cac:	00c4c783          	lbu	a5,12(s1)
    80000cb0:	0622                	slli	a2,a2,0x8
    80000cb2:	8e49                	or	a2,a2,a0
    80000cb4:	00d4c583          	lbu	a1,13(s1)
    80000cb8:	06c2                	slli	a3,a3,0x10
    80000cba:	8ed1                	or	a3,a3,a2
    80000cbc:	0762                	slli	a4,a4,0x18
    80000cbe:	8f55                	or	a4,a4,a3
    80000cc0:	1782                	slli	a5,a5,0x20
    80000cc2:	8fd9                	or	a5,a5,a4
    80000cc4:	15a2                	slli	a1,a1,0x28
    80000cc6:	8ddd                	or	a1,a1,a5
    80000cc8:	05da                	slli	a1,a1,0x16
    80000cca:	9581                	srai	a1,a1,0x20
    80000ccc:	0000b517          	auipc	a0,0xb
    80000cd0:	54c50513          	addi	a0,a0,1356 # 8000c218 <fdt_move+0x664>
    80000cd4:	74a040ef          	jal	ra,8000541e <sbi_printf>
    80000cd8:	0c5040ef          	jal	ra,8000559c <sbi_ecall_version_major>
    80000cdc:	89aa                	mv	s3,a0
    80000cde:	0cd040ef          	jal	ra,800055aa <sbi_ecall_version_minor>
    80000ce2:	0005061b          	sext.w	a2,a0
    80000ce6:	0009859b          	sext.w	a1,s3
    80000cea:	0000b517          	auipc	a0,0xb
    80000cee:	54e50513          	addi	a0,a0,1358 # 8000c238 <fdt_move+0x684>
    80000cf2:	72c040ef          	jal	ra,8000541e <sbi_printf>
    80000cf6:	0000c517          	auipc	a0,0xc
    80000cfa:	bf250513          	addi	a0,a0,-1038 # 8000c8e8 <platform_ops+0x230>
    80000cfe:	720040ef          	jal	ra,8000541e <sbi_printf>
    80000d02:	8526                	mv	a0,s1
    80000d04:	08d060ef          	jal	ra,80007590 <sbi_hart_delegation_dump>
    80000d08:	8526                	mv	a0,s1
    80000d0a:	0dd060ef          	jal	ra,800075e6 <sbi_hart_pmp_dump>
    80000d0e:	b351                	j	80000a92 <sbi_init+0x434>
    80000d10:	0000b597          	auipc	a1,0xb
    80000d14:	54858593          	addi	a1,a1,1352 # 8000c258 <fdt_move+0x6a4>
    80000d18:	0000b517          	auipc	a0,0xb
    80000d1c:	45850513          	addi	a0,a0,1112 # 8000c170 <fdt_move+0x5bc>
    80000d20:	6fe040ef          	jal	ra,8000541e <sbi_printf>
    80000d24:	85da                	mv	a1,s6
    80000d26:	f7040613          	addi	a2,s0,-144
    80000d2a:	0000b517          	auipc	a0,0xb
    80000d2e:	46650513          	addi	a0,a0,1126 # 8000c190 <fdt_move+0x5dc>
    80000d32:	6ec040ef          	jal	ra,8000541e <sbi_printf>
    80000d36:	4581                	li	a1,0
    80000d38:	b701                	j	80000c38 <sbi_init+0x5da>
    80000d3a:	0000b517          	auipc	a0,0xb
    80000d3e:	41650513          	addi	a0,a0,1046 # 8000c150 <fdt_move+0x59c>
    80000d42:	6dc040ef          	jal	ra,8000541e <sbi_printf>
    80000d46:	bc25                	j	8000077e <sbi_init+0x120>

0000000080000d48 <sbi_init_count>:
    80000d48:	85aa                	mv	a1,a0
    80000d4a:	340027f3          	csrr	a5,mscratch
    80000d4e:	0317c303          	lbu	t1,49(a5)
    80000d52:	0307c703          	lbu	a4,48(a5)
    80000d56:	0327c883          	lbu	a7,50(a5)
    80000d5a:	0337c803          	lbu	a6,51(a5)
    80000d5e:	0347c603          	lbu	a2,52(a5)
    80000d62:	0322                	slli	t1,t1,0x8
    80000d64:	0357c683          	lbu	a3,53(a5)
    80000d68:	00e36333          	or	t1,t1,a4
    80000d6c:	08c2                	slli	a7,a7,0x10
    80000d6e:	0367c703          	lbu	a4,54(a5)
    80000d72:	0068e8b3          	or	a7,a7,t1
    80000d76:	0862                	slli	a6,a6,0x18
    80000d78:	0377c783          	lbu	a5,55(a5)
    80000d7c:	01186833          	or	a6,a6,a7
    80000d80:	1602                	slli	a2,a2,0x20
    80000d82:	01066633          	or	a2,a2,a6
    80000d86:	16a2                	slli	a3,a3,0x28
    80000d88:	8ed1                	or	a3,a3,a2
    80000d8a:	1742                	slli	a4,a4,0x30
    80000d8c:	8f55                	or	a4,a4,a3
    80000d8e:	17e2                	slli	a5,a5,0x38
    80000d90:	00e7e533          	or	a0,a5,a4
    80000d94:	c125                	beqz	a0,80000df4 <sbi_init_count+0xac>
    80000d96:	05154683          	lbu	a3,81(a0)
    80000d9a:	05054603          	lbu	a2,80(a0)
    80000d9e:	05254703          	lbu	a4,82(a0)
    80000da2:	05354783          	lbu	a5,83(a0)
    80000da6:	06a2                	slli	a3,a3,0x8
    80000da8:	8ed1                	or	a3,a3,a2
    80000daa:	0742                	slli	a4,a4,0x10
    80000dac:	8f55                	or	a4,a4,a3
    80000dae:	07e2                	slli	a5,a5,0x18
    80000db0:	8fd9                	or	a5,a5,a4
    80000db2:	2781                	sext.w	a5,a5
    80000db4:	02f5fe63          	bgeu	a1,a5,80000df0 <sbi_init_count+0xa8>
    80000db8:	1101                	addi	sp,sp,-32
    80000dba:	e822                	sd	s0,16(sp)
    80000dbc:	e426                	sd	s1,8(sp)
    80000dbe:	ec06                	sd	ra,24(sp)
    80000dc0:	1000                	addi	s0,sp,32
    80000dc2:	0000e497          	auipc	s1,0xe
    80000dc6:	24648493          	addi	s1,s1,582 # 8000f008 <init_count_offset>
    80000dca:	6088                	ld	a0,0(s1)
    80000dcc:	e511                	bnez	a0,80000dd8 <sbi_init_count+0x90>
    80000dce:	60e2                	ld	ra,24(sp)
    80000dd0:	6442                	ld	s0,16(sp)
    80000dd2:	64a2                	ld	s1,8(sp)
    80000dd4:	6105                	addi	sp,sp,32
    80000dd6:	8082                	ret
    80000dd8:	34002573          	csrr	a0,mscratch
    80000ddc:	79b060ef          	jal	ra,80007d76 <sbi_hart_id_to_scratch>
    80000de0:	609c                	ld	a5,0(s1)
    80000de2:	60e2                	ld	ra,24(sp)
    80000de4:	6442                	ld	s0,16(sp)
    80000de6:	953e                	add	a0,a0,a5
    80000de8:	6108                	ld	a0,0(a0)
    80000dea:	64a2                	ld	s1,8(sp)
    80000dec:	6105                	addi	sp,sp,32
    80000dee:	8082                	ret
    80000df0:	4501                	li	a0,0
    80000df2:	8082                	ret
    80000df4:	8082                	ret

0000000080000df6 <sbi_exit>:
    80000df6:	1101                	addi	sp,sp,-32
    80000df8:	e822                	sd	s0,16(sp)
    80000dfa:	e426                	sd	s1,8(sp)
    80000dfc:	e04a                	sd	s2,0(sp)
    80000dfe:	ec06                	sd	ra,24(sp)
    80000e00:	1000                	addi	s0,sp,32
    80000e02:	892a                	mv	s2,a0
    80000e04:	77a060ef          	jal	ra,8000757e <sbi_current_hartid>
    80000e08:	03194583          	lbu	a1,49(s2)
    80000e0c:	03094783          	lbu	a5,48(s2)
    80000e10:	03294603          	lbu	a2,50(s2)
    80000e14:	03394683          	lbu	a3,51(s2)
    80000e18:	03494703          	lbu	a4,52(s2)
    80000e1c:	05a2                	slli	a1,a1,0x8
    80000e1e:	8ddd                	or	a1,a1,a5
    80000e20:	03594483          	lbu	s1,53(s2)
    80000e24:	0642                	slli	a2,a2,0x10
    80000e26:	8e4d                	or	a2,a2,a1
    80000e28:	03694783          	lbu	a5,54(s2)
    80000e2c:	06e2                	slli	a3,a3,0x18
    80000e2e:	03794583          	lbu	a1,55(s2)
    80000e32:	8ed1                	or	a3,a3,a2
    80000e34:	1702                	slli	a4,a4,0x20
    80000e36:	8f55                	or	a4,a4,a3
    80000e38:	14a2                	slli	s1,s1,0x28
    80000e3a:	8cd9                	or	s1,s1,a4
    80000e3c:	17c2                	slli	a5,a5,0x30
    80000e3e:	8fc5                	or	a5,a5,s1
    80000e40:	03859493          	slli	s1,a1,0x38
    80000e44:	8cdd                	or	s1,s1,a5
    80000e46:	2501                	sext.w	a0,a0
    80000e48:	20048e63          	beqz	s1,80001064 <sbi_exit+0x26e>
    80000e4c:	0594c783          	lbu	a5,89(s1)
    80000e50:	0584c703          	lbu	a4,88(s1)
    80000e54:	05a4c803          	lbu	a6,90(s1)
    80000e58:	05b4c583          	lbu	a1,91(s1)
    80000e5c:	05c4c603          	lbu	a2,92(s1)
    80000e60:	07a2                	slli	a5,a5,0x8
    80000e62:	8fd9                	or	a5,a5,a4
    80000e64:	05d4c683          	lbu	a3,93(s1)
    80000e68:	0842                	slli	a6,a6,0x10
    80000e6a:	00f86833          	or	a6,a6,a5
    80000e6e:	05e4c703          	lbu	a4,94(s1)
    80000e72:	05e2                	slli	a1,a1,0x18
    80000e74:	05f4c783          	lbu	a5,95(s1)
    80000e78:	0105e5b3          	or	a1,a1,a6
    80000e7c:	1602                	slli	a2,a2,0x20
    80000e7e:	8e4d                	or	a2,a2,a1
    80000e80:	16a2                	slli	a3,a3,0x28
    80000e82:	8ed1                	or	a3,a3,a2
    80000e84:	1742                	slli	a4,a4,0x30
    80000e86:	8f55                	or	a4,a4,a3
    80000e88:	17e2                	slli	a5,a5,0x38
    80000e8a:	8fd9                	or	a5,a5,a4
    80000e8c:	4705                	li	a4,1
    80000e8e:	00a7173b          	sllw	a4,a4,a0
    80000e92:	8ff9                	and	a5,a5,a4
    80000e94:	1c079663          	bnez	a5,80001060 <sbi_exit+0x26a>
    80000e98:	663060ef          	jal	ra,80007cfa <sbi_hart_unmark_available>
    80000e9c:	0614c783          	lbu	a5,97(s1)
    80000ea0:	0604c703          	lbu	a4,96(s1)
    80000ea4:	0624c503          	lbu	a0,98(s1)
    80000ea8:	0634c583          	lbu	a1,99(s1)
    80000eac:	0644c603          	lbu	a2,100(s1)
    80000eb0:	07a2                	slli	a5,a5,0x8
    80000eb2:	8fd9                	or	a5,a5,a4
    80000eb4:	0654c683          	lbu	a3,101(s1)
    80000eb8:	0542                	slli	a0,a0,0x10
    80000eba:	8d5d                	or	a0,a0,a5
    80000ebc:	0664c703          	lbu	a4,102(s1)
    80000ec0:	05e2                	slli	a1,a1,0x18
    80000ec2:	8dc9                	or	a1,a1,a0
    80000ec4:	0674c783          	lbu	a5,103(s1)
    80000ec8:	1602                	slli	a2,a2,0x20
    80000eca:	8e4d                	or	a2,a2,a1
    80000ecc:	16a2                	slli	a3,a3,0x28
    80000ece:	8ed1                	or	a3,a3,a2
    80000ed0:	1742                	slli	a4,a4,0x30
    80000ed2:	8f55                	or	a4,a4,a3
    80000ed4:	17e2                	slli	a5,a5,0x38
    80000ed6:	8fd9                	or	a5,a5,a4
    80000ed8:	0117c803          	lbu	a6,17(a5)
    80000edc:	0107c703          	lbu	a4,16(a5)
    80000ee0:	0127c503          	lbu	a0,18(a5)
    80000ee4:	0137c583          	lbu	a1,19(a5)
    80000ee8:	0147c603          	lbu	a2,20(a5)
    80000eec:	0822                	slli	a6,a6,0x8
    80000eee:	0157c683          	lbu	a3,21(a5)
    80000ef2:	00e86833          	or	a6,a6,a4
    80000ef6:	0542                	slli	a0,a0,0x10
    80000ef8:	0167c703          	lbu	a4,22(a5)
    80000efc:	01056533          	or	a0,a0,a6
    80000f00:	05e2                	slli	a1,a1,0x18
    80000f02:	0177c783          	lbu	a5,23(a5)
    80000f06:	8dc9                	or	a1,a1,a0
    80000f08:	1602                	slli	a2,a2,0x20
    80000f0a:	8e4d                	or	a2,a2,a1
    80000f0c:	16a2                	slli	a3,a3,0x28
    80000f0e:	8ed1                	or	a3,a3,a2
    80000f10:	1742                	slli	a4,a4,0x30
    80000f12:	8f55                	or	a4,a4,a3
    80000f14:	17e2                	slli	a5,a5,0x38
    80000f16:	8fd9                	or	a5,a5,a4
    80000f18:	c391                	beqz	a5,80000f1c <sbi_exit+0x126>
    80000f1a:	9782                	jalr	a5
    80000f1c:	854a                	mv	a0,s2
    80000f1e:	368010ef          	jal	ra,80002286 <sbi_timer_exit>
    80000f22:	854a                	mv	a0,s2
    80000f24:	780000ef          	jal	ra,800016a4 <sbi_ipi_exit>
    80000f28:	0614c683          	lbu	a3,97(s1)
    80000f2c:	0604c283          	lbu	t0,96(s1)
    80000f30:	0624c603          	lbu	a2,98(s1)
    80000f34:	0634c583          	lbu	a1,99(s1)
    80000f38:	0644c503          	lbu	a0,100(s1)
    80000f3c:	00869313          	slli	t1,a3,0x8
    80000f40:	01061793          	slli	a5,a2,0x10
    80000f44:	0654c803          	lbu	a6,101(s1)
    80000f48:	00536333          	or	t1,t1,t0
    80000f4c:	0067e333          	or	t1,a5,t1
    80000f50:	0664c883          	lbu	a7,102(s1)
    80000f54:	01859793          	slli	a5,a1,0x18
    80000f58:	0067e7b3          	or	a5,a5,t1
    80000f5c:	0674c703          	lbu	a4,103(s1)
    80000f60:	02051313          	slli	t1,a0,0x20
    80000f64:	00f367b3          	or	a5,t1,a5
    80000f68:	02881313          	slli	t1,a6,0x28
    80000f6c:	00f36333          	or	t1,t1,a5
    80000f70:	03089793          	slli	a5,a7,0x30
    80000f74:	0067e333          	or	t1,a5,t1
    80000f78:	03871793          	slli	a5,a4,0x38
    80000f7c:	0067e7b3          	or	a5,a5,t1
    80000f80:	0617c383          	lbu	t2,97(a5)
    80000f84:	0607c303          	lbu	t1,96(a5)
    80000f88:	0627cf83          	lbu	t6,98(a5)
    80000f8c:	0637cf03          	lbu	t5,99(a5)
    80000f90:	0647ce83          	lbu	t4,100(a5)
    80000f94:	03a2                	slli	t2,t2,0x8
    80000f96:	0657ce03          	lbu	t3,101(a5)
    80000f9a:	0063e3b3          	or	t2,t2,t1
    80000f9e:	0fc2                	slli	t6,t6,0x10
    80000fa0:	0667c303          	lbu	t1,102(a5)
    80000fa4:	007fefb3          	or	t6,t6,t2
    80000fa8:	0f62                	slli	t5,t5,0x18
    80000faa:	0677c783          	lbu	a5,103(a5)
    80000fae:	01ff6f33          	or	t5,t5,t6
    80000fb2:	1e82                	slli	t4,t4,0x20
    80000fb4:	01eeeeb3          	or	t4,t4,t5
    80000fb8:	1e22                	slli	t3,t3,0x28
    80000fba:	01de6e33          	or	t3,t3,t4
    80000fbe:	1342                	slli	t1,t1,0x30
    80000fc0:	01c36333          	or	t1,t1,t3
    80000fc4:	17e2                	slli	a5,a5,0x38
    80000fc6:	0067e7b3          	or	a5,a5,t1
    80000fca:	c395                	beqz	a5,80000fee <sbi_exit+0x1f8>
    80000fcc:	9782                	jalr	a5
    80000fce:	0604c283          	lbu	t0,96(s1)
    80000fd2:	0614c683          	lbu	a3,97(s1)
    80000fd6:	0624c603          	lbu	a2,98(s1)
    80000fda:	0634c583          	lbu	a1,99(s1)
    80000fde:	0644c503          	lbu	a0,100(s1)
    80000fe2:	0654c803          	lbu	a6,101(s1)
    80000fe6:	0664c883          	lbu	a7,102(s1)
    80000fea:	0674c703          	lbu	a4,103(s1)
    80000fee:	00869793          	slli	a5,a3,0x8
    80000ff2:	0057e2b3          	or	t0,a5,t0
    80000ff6:	01061793          	slli	a5,a2,0x10
    80000ffa:	0057e7b3          	or	a5,a5,t0
    80000ffe:	05e2                	slli	a1,a1,0x18
    80001000:	8ddd                	or	a1,a1,a5
    80001002:	02051793          	slli	a5,a0,0x20
    80001006:	8fcd                	or	a5,a5,a1
    80001008:	1822                	slli	a6,a6,0x28
    8000100a:	00f867b3          	or	a5,a6,a5
    8000100e:	18c2                	slli	a7,a7,0x30
    80001010:	00f8e8b3          	or	a7,a7,a5
    80001014:	03871793          	slli	a5,a4,0x38
    80001018:	0117e7b3          	or	a5,a5,a7
    8000101c:	0197c803          	lbu	a6,25(a5)
    80001020:	0187c703          	lbu	a4,24(a5)
    80001024:	01a7c503          	lbu	a0,26(a5)
    80001028:	01b7c583          	lbu	a1,27(a5)
    8000102c:	01c7c603          	lbu	a2,28(a5)
    80001030:	0822                	slli	a6,a6,0x8
    80001032:	01d7c683          	lbu	a3,29(a5)
    80001036:	00e86833          	or	a6,a6,a4
    8000103a:	0542                	slli	a0,a0,0x10
    8000103c:	01e7c703          	lbu	a4,30(a5)
    80001040:	01056533          	or	a0,a0,a6
    80001044:	05e2                	slli	a1,a1,0x18
    80001046:	01f7c783          	lbu	a5,31(a5)
    8000104a:	8dc9                	or	a1,a1,a0
    8000104c:	1602                	slli	a2,a2,0x20
    8000104e:	8e4d                	or	a2,a2,a1
    80001050:	16a2                	slli	a3,a3,0x28
    80001052:	8ed1                	or	a3,a3,a2
    80001054:	1742                	slli	a4,a4,0x30
    80001056:	8f55                	or	a4,a4,a3
    80001058:	17e2                	slli	a5,a5,0x38
    8000105a:	8fd9                	or	a5,a5,a4
    8000105c:	c391                	beqz	a5,80001060 <sbi_exit+0x26a>
    8000105e:	9782                	jalr	a5
    80001060:	379060ef          	jal	ra,80007bd8 <sbi_hart_hang>
    80001064:	497060ef          	jal	ra,80007cfa <sbi_hart_unmark_available>
    80001068:	854a                	mv	a0,s2
    8000106a:	21c010ef          	jal	ra,80002286 <sbi_timer_exit>
    8000106e:	854a                	mv	a0,s2
    80001070:	634000ef          	jal	ra,800016a4 <sbi_ipi_exit>
    80001074:	b7f5                	j	80001060 <sbi_exit+0x26a>

0000000080001076 <sbi_ipi_process_smode>:
    80001076:	1141                	addi	sp,sp,-16
    80001078:	e422                	sd	s0,8(sp)
    8000107a:	0800                	addi	s0,sp,16
    8000107c:	34416073          	csrsi	mip,2
    80001080:	6422                	ld	s0,8(sp)
    80001082:	0141                	addi	sp,sp,16
    80001084:	8082                	ret

0000000080001086 <sbi_ipi_process_halt>:
    80001086:	1141                	addi	sp,sp,-16
    80001088:	e022                	sd	s0,0(sp)
    8000108a:	e406                	sd	ra,8(sp)
    8000108c:	0800                	addi	s0,sp,16
    8000108e:	d69ff0ef          	jal	ra,80000df6 <sbi_exit>

0000000080001092 <sbi_ipi_send_many>:
    80001092:	7119                	addi	sp,sp,-128
    80001094:	f8a2                	sd	s0,112(sp)
    80001096:	f4a6                	sd	s1,104(sp)
    80001098:	f0ca                	sd	s2,96(sp)
    8000109a:	ecce                	sd	s3,88(sp)
    8000109c:	e8d2                	sd	s4,80(sp)
    8000109e:	e4d6                	sd	s5,72(sp)
    800010a0:	fc5e                	sd	s7,56(sp)
    800010a2:	fc86                	sd	ra,120(sp)
    800010a4:	e0da                	sd	s6,64(sp)
    800010a6:	f862                	sd	s8,48(sp)
    800010a8:	f466                	sd	s9,40(sp)
    800010aa:	f06a                	sd	s10,32(sp)
    800010ac:	ec6e                	sd	s11,24(sp)
    800010ae:	0100                	addi	s0,sp,128
    800010b0:	89aa                	mv	s3,a0
    800010b2:	8a2e                	mv	s4,a1
    800010b4:	84b2                	mv	s1,a2
    800010b6:	8ab6                	mv	s5,a3
    800010b8:	8bba                	mv	s7,a4
    800010ba:	487060ef          	jal	ra,80007d40 <sbi_hart_available_mask>
    800010be:	02055793          	srli	a5,a0,0x20
    800010c2:	892a                	mv	s2,a0
    800010c4:	22079663          	bnez	a5,800012f0 <sbi_ipi_send_many+0x25e>
    800010c8:	02051793          	slli	a5,a0,0x20
    800010cc:	477d                	li	a4,31
    800010ce:	0307d693          	srli	a3,a5,0x30
    800010d2:	e299                	bnez	a3,800010d8 <sbi_ipi_send_many+0x46>
    800010d4:	3741                	addiw	a4,a4,-16
    800010d6:	07c2                	slli	a5,a5,0x10
    800010d8:	0387d693          	srli	a3,a5,0x38
    800010dc:	e299                	bnez	a3,800010e2 <sbi_ipi_send_many+0x50>
    800010de:	3761                	addiw	a4,a4,-8
    800010e0:	07a2                	slli	a5,a5,0x8
    800010e2:	03c7d693          	srli	a3,a5,0x3c
    800010e6:	e299                	bnez	a3,800010ec <sbi_ipi_send_many+0x5a>
    800010e8:	3771                	addiw	a4,a4,-4
    800010ea:	0792                	slli	a5,a5,0x4
    800010ec:	03e7d693          	srli	a3,a5,0x3e
    800010f0:	e299                	bnez	a3,800010f6 <sbi_ipi_send_many+0x64>
    800010f2:	3779                	addiw	a4,a4,-2
    800010f4:	078a                	slli	a5,a5,0x2
    800010f6:	0007c363          	bltz	a5,800010fc <sbi_ipi_send_many+0x6a>
    800010fa:	377d                	addiw	a4,a4,-1
    800010fc:	57fd                	li	a5,-1
    800010fe:	00f48d63          	beq	s1,a5,80001118 <sbi_ipi_send_many+0x86>
    80001102:	1e976b63          	bltu	a4,s1,800012f8 <sbi_ipi_send_many+0x266>
    80001106:	009a14b3          	sll	s1,s4,s1
    8000110a:	fff94793          	not	a5,s2
    8000110e:	8fe5                	and	a5,a5,s1
    80001110:	1e079463          	bnez	a5,800012f8 <sbi_ipi_send_many+0x266>
    80001114:	00997933          	and	s2,s2,s1
    80001118:	4d01                	li	s10,0
    8000111a:	1a090b63          	beqz	s2,800012d0 <sbi_ipi_send_many+0x23e>
    8000111e:	020a9793          	slli	a5,s5,0x20
    80001122:	01d7db13          	srli	s6,a5,0x1d
    80001126:	0000e717          	auipc	a4,0xe
    8000112a:	fca70713          	addi	a4,a4,-54 # 8000f0f0 <ipi_ops_array>
    8000112e:	000a879b          	sext.w	a5,s5
    80001132:	03f00c13          	li	s8,63
    80001136:	9b3a                	add	s6,s6,a4
    80001138:	0000ec97          	auipc	s9,0xe
    8000113c:	ed8c8c93          	addi	s9,s9,-296 # 8000f010 <ipi_data_off>
    80001140:	f8f43023          	sd	a5,-128(s0)
    80001144:	a031                	j	80001150 <sbi_ipi_send_many+0xbe>
    80001146:	00195913          	srli	s2,s2,0x1
    8000114a:	0d05                	addi	s10,s10,1
    8000114c:	18090263          	beqz	s2,800012d0 <sbi_ipi_send_many+0x23e>
    80001150:	00197713          	andi	a4,s2,1
    80001154:	db6d                	beqz	a4,80001146 <sbi_ipi_send_many+0xb4>
    80001156:	0319c503          	lbu	a0,49(s3)
    8000115a:	0309c703          	lbu	a4,48(s3)
    8000115e:	0329c583          	lbu	a1,50(s3)
    80001162:	0339c603          	lbu	a2,51(s3)
    80001166:	0349c683          	lbu	a3,52(s3)
    8000116a:	0522                	slli	a0,a0,0x8
    8000116c:	8d59                	or	a0,a0,a4
    8000116e:	0359c483          	lbu	s1,53(s3)
    80001172:	05c2                	slli	a1,a1,0x10
    80001174:	8dc9                	or	a1,a1,a0
    80001176:	0369c703          	lbu	a4,54(s3)
    8000117a:	0662                	slli	a2,a2,0x18
    8000117c:	0379c503          	lbu	a0,55(s3)
    80001180:	8e4d                	or	a2,a2,a1
    80001182:	1682                	slli	a3,a3,0x20
    80001184:	8ed1                	or	a3,a3,a2
    80001186:	14a2                	slli	s1,s1,0x28
    80001188:	8cd5                	or	s1,s1,a3
    8000118a:	1742                	slli	a4,a4,0x30
    8000118c:	8f45                	or	a4,a4,s1
    8000118e:	03851493          	slli	s1,a0,0x38
    80001192:	000d0d9b          	sext.w	s11,s10
    80001196:	8cd9                	or	s1,s1,a4
    80001198:	fb5c67e3          	bltu	s8,s5,80001146 <sbi_ipi_send_many+0xb4>
    8000119c:	000b3a03          	ld	s4,0(s6)
    800011a0:	fa0a03e3          	beqz	s4,80001146 <sbi_ipi_send_many+0xb4>
    800011a4:	c4b9                	beqz	s1,800011f2 <sbi_ipi_send_many+0x160>
    800011a6:	0594c703          	lbu	a4,89(s1)
    800011aa:	0584c683          	lbu	a3,88(s1)
    800011ae:	05a4c883          	lbu	a7,90(s1)
    800011b2:	05b4c803          	lbu	a6,91(s1)
    800011b6:	05c4c503          	lbu	a0,92(s1)
    800011ba:	0722                	slli	a4,a4,0x8
    800011bc:	8f55                	or	a4,a4,a3
    800011be:	05d4c583          	lbu	a1,93(s1)
    800011c2:	08c2                	slli	a7,a7,0x10
    800011c4:	00e8e8b3          	or	a7,a7,a4
    800011c8:	05e4c683          	lbu	a3,94(s1)
    800011cc:	0862                	slli	a6,a6,0x18
    800011ce:	05f4c703          	lbu	a4,95(s1)
    800011d2:	01186833          	or	a6,a6,a7
    800011d6:	1502                	slli	a0,a0,0x20
    800011d8:	01056533          	or	a0,a0,a6
    800011dc:	15a2                	slli	a1,a1,0x28
    800011de:	8dc9                	or	a1,a1,a0
    800011e0:	16c2                	slli	a3,a3,0x30
    800011e2:	8ecd                	or	a3,a3,a1
    800011e4:	1762                	slli	a4,a4,0x38
    800011e6:	4785                	li	a5,1
    800011e8:	8f55                	or	a4,a4,a3
    800011ea:	01b796bb          	sllw	a3,a5,s11
    800011ee:	8f75                	and	a4,a4,a3
    800011f0:	fb39                	bnez	a4,80001146 <sbi_ipi_send_many+0xb4>
    800011f2:	85ee                	mv	a1,s11
    800011f4:	854e                	mv	a0,s3
    800011f6:	381060ef          	jal	ra,80007d76 <sbi_hart_id_to_scratch>
    800011fa:	000cb703          	ld	a4,0(s9)
    800011fe:	020a3803          	ld	a6,32(s4)
    80001202:	85aa                	mv	a1,a0
    80001204:	972a                	add	a4,a4,a0
    80001206:	00080c63          	beqz	a6,8000121e <sbi_ipi_send_many+0x18c>
    8000120a:	86de                	mv	a3,s7
    8000120c:	866e                	mv	a2,s11
    8000120e:	854e                	mv	a0,s3
    80001210:	f8e43423          	sd	a4,-120(s0)
    80001214:	9802                	jalr	a6
    80001216:	f8843703          	ld	a4,-120(s0)
    8000121a:	f20546e3          	bltz	a0,80001146 <sbi_ipi_send_many+0xb4>
    8000121e:	f8043503          	ld	a0,-128(s0)
    80001222:	85ba                	mv	a1,a4
    80001224:	56e030ef          	jal	ra,80004792 <atomic_raw_set_bit>
    80001228:	0110000f          	fence	w,w
    8000122c:	c4d9                	beqz	s1,800012ba <sbi_ipi_send_many+0x228>
    8000122e:	0614c703          	lbu	a4,97(s1)
    80001232:	0604c683          	lbu	a3,96(s1)
    80001236:	0624c883          	lbu	a7,98(s1)
    8000123a:	0634c803          	lbu	a6,99(s1)
    8000123e:	0644c503          	lbu	a0,100(s1)
    80001242:	0722                	slli	a4,a4,0x8
    80001244:	8f55                	or	a4,a4,a3
    80001246:	0654c583          	lbu	a1,101(s1)
    8000124a:	08c2                	slli	a7,a7,0x10
    8000124c:	00e8e8b3          	or	a7,a7,a4
    80001250:	0664c683          	lbu	a3,102(s1)
    80001254:	0862                	slli	a6,a6,0x18
    80001256:	01186833          	or	a6,a6,a7
    8000125a:	0674c703          	lbu	a4,103(s1)
    8000125e:	1502                	slli	a0,a0,0x20
    80001260:	01056533          	or	a0,a0,a6
    80001264:	15a2                	slli	a1,a1,0x28
    80001266:	8dc9                	or	a1,a1,a0
    80001268:	16c2                	slli	a3,a3,0x30
    8000126a:	8ecd                	or	a3,a3,a1
    8000126c:	1762                	slli	a4,a4,0x38
    8000126e:	8f55                	or	a4,a4,a3
    80001270:	06974303          	lbu	t1,105(a4)
    80001274:	06874683          	lbu	a3,104(a4)
    80001278:	06a74883          	lbu	a7,106(a4)
    8000127c:	06b74803          	lbu	a6,107(a4)
    80001280:	06c74503          	lbu	a0,108(a4)
    80001284:	0322                	slli	t1,t1,0x8
    80001286:	06d74583          	lbu	a1,109(a4)
    8000128a:	00d36333          	or	t1,t1,a3
    8000128e:	08c2                	slli	a7,a7,0x10
    80001290:	06e74683          	lbu	a3,110(a4)
    80001294:	0068e8b3          	or	a7,a7,t1
    80001298:	0862                	slli	a6,a6,0x18
    8000129a:	06f74703          	lbu	a4,111(a4)
    8000129e:	01186833          	or	a6,a6,a7
    800012a2:	1502                	slli	a0,a0,0x20
    800012a4:	01056533          	or	a0,a0,a6
    800012a8:	15a2                	slli	a1,a1,0x28
    800012aa:	8dc9                	or	a1,a1,a0
    800012ac:	16c2                	slli	a3,a3,0x30
    800012ae:	8ecd                	or	a3,a3,a1
    800012b0:	1762                	slli	a4,a4,0x38
    800012b2:	8f55                	or	a4,a4,a3
    800012b4:	c319                	beqz	a4,800012ba <sbi_ipi_send_many+0x228>
    800012b6:	856e                	mv	a0,s11
    800012b8:	9702                	jalr	a4
    800012ba:	028a3703          	ld	a4,40(s4)
    800012be:	e80704e3          	beqz	a4,80001146 <sbi_ipi_send_many+0xb4>
    800012c2:	854e                	mv	a0,s3
    800012c4:	00195913          	srli	s2,s2,0x1
    800012c8:	9702                	jalr	a4
    800012ca:	0d05                	addi	s10,s10,1
    800012cc:	e80912e3          	bnez	s2,80001150 <sbi_ipi_send_many+0xbe>
    800012d0:	4501                	li	a0,0
    800012d2:	70e6                	ld	ra,120(sp)
    800012d4:	7446                	ld	s0,112(sp)
    800012d6:	74a6                	ld	s1,104(sp)
    800012d8:	7906                	ld	s2,96(sp)
    800012da:	69e6                	ld	s3,88(sp)
    800012dc:	6a46                	ld	s4,80(sp)
    800012de:	6aa6                	ld	s5,72(sp)
    800012e0:	6b06                	ld	s6,64(sp)
    800012e2:	7be2                	ld	s7,56(sp)
    800012e4:	7c42                	ld	s8,48(sp)
    800012e6:	7ca2                	ld	s9,40(sp)
    800012e8:	7d02                	ld	s10,32(sp)
    800012ea:	6de2                	ld	s11,24(sp)
    800012ec:	6109                	addi	sp,sp,128
    800012ee:	8082                	ret
    800012f0:	87aa                	mv	a5,a0
    800012f2:	03f00713          	li	a4,63
    800012f6:	bbe1                	j	800010ce <sbi_ipi_send_many+0x3c>
    800012f8:	5575                	li	a0,-3
    800012fa:	bfe1                	j	800012d2 <sbi_ipi_send_many+0x240>

00000000800012fc <sbi_ipi_event_create>:
    800012fc:	1141                	addi	sp,sp,-16
    800012fe:	e422                	sd	s0,8(sp)
    80001300:	0800                	addi	s0,sp,16
    80001302:	cd15                	beqz	a0,8000133e <sbi_ipi_event_create+0x42>
    80001304:	791c                	ld	a5,48(a0)
    80001306:	862a                	mv	a2,a0
    80001308:	cb9d                	beqz	a5,8000133e <sbi_ipi_event_create+0x42>
    8000130a:	0000e597          	auipc	a1,0xe
    8000130e:	de658593          	addi	a1,a1,-538 # 8000f0f0 <ipi_ops_array>
    80001312:	87ae                	mv	a5,a1
    80001314:	4501                	li	a0,0
    80001316:	04000693          	li	a3,64
    8000131a:	a021                	j	80001322 <sbi_ipi_event_create+0x26>
    8000131c:	2505                	addiw	a0,a0,1
    8000131e:	00d50c63          	beq	a0,a3,80001336 <sbi_ipi_event_create+0x3a>
    80001322:	6398                	ld	a4,0(a5)
    80001324:	07a1                	addi	a5,a5,8
    80001326:	fb7d                	bnez	a4,8000131c <sbi_ipi_event_create+0x20>
    80001328:	00351793          	slli	a5,a0,0x3
    8000132c:	95be                	add	a1,a1,a5
    8000132e:	e190                	sd	a2,0(a1)
    80001330:	6422                	ld	s0,8(sp)
    80001332:	0141                	addi	sp,sp,16
    80001334:	8082                	ret
    80001336:	6422                	ld	s0,8(sp)
    80001338:	5555                	li	a0,-11
    8000133a:	0141                	addi	sp,sp,16
    8000133c:	8082                	ret
    8000133e:	5575                	li	a0,-3
    80001340:	bfc5                	j	80001330 <sbi_ipi_event_create+0x34>

0000000080001342 <sbi_ipi_event_destroy>:
    80001342:	1141                	addi	sp,sp,-16
    80001344:	e422                	sd	s0,8(sp)
    80001346:	0800                	addi	s0,sp,16
    80001348:	03f00793          	li	a5,63
    8000134c:	00a7ed63          	bltu	a5,a0,80001366 <sbi_ipi_event_destroy+0x24>
    80001350:	02051793          	slli	a5,a0,0x20
    80001354:	01d7d513          	srli	a0,a5,0x1d
    80001358:	0000e797          	auipc	a5,0xe
    8000135c:	d9878793          	addi	a5,a5,-616 # 8000f0f0 <ipi_ops_array>
    80001360:	953e                	add	a0,a0,a5
    80001362:	00053023          	sd	zero,0(a0)
    80001366:	6422                	ld	s0,8(sp)
    80001368:	0141                	addi	sp,sp,16
    8000136a:	8082                	ret

000000008000136c <sbi_ipi_send_smode>:
    8000136c:	1141                	addi	sp,sp,-16
    8000136e:	e022                	sd	s0,0(sp)
    80001370:	e406                	sd	ra,8(sp)
    80001372:	0800                	addi	s0,sp,16
    80001374:	4701                	li	a4,0
    80001376:	0000d697          	auipc	a3,0xd
    8000137a:	c8e6a683          	lw	a3,-882(a3) # 8000e004 <ipi_smode_event>
    8000137e:	d15ff0ef          	jal	ra,80001092 <sbi_ipi_send_many>
    80001382:	60a2                	ld	ra,8(sp)
    80001384:	6402                	ld	s0,0(sp)
    80001386:	0141                	addi	sp,sp,16
    80001388:	8082                	ret

000000008000138a <sbi_ipi_clear_smode>:
    8000138a:	1141                	addi	sp,sp,-16
    8000138c:	e422                	sd	s0,8(sp)
    8000138e:	0800                	addi	s0,sp,16
    80001390:	34417073          	csrci	mip,2
    80001394:	6422                	ld	s0,8(sp)
    80001396:	0141                	addi	sp,sp,16
    80001398:	8082                	ret

000000008000139a <sbi_ipi_send_halt>:
    8000139a:	1141                	addi	sp,sp,-16
    8000139c:	e022                	sd	s0,0(sp)
    8000139e:	e406                	sd	ra,8(sp)
    800013a0:	0800                	addi	s0,sp,16
    800013a2:	4701                	li	a4,0
    800013a4:	0000d697          	auipc	a3,0xd
    800013a8:	c5c6a683          	lw	a3,-932(a3) # 8000e000 <ipi_halt_event>
    800013ac:	ce7ff0ef          	jal	ra,80001092 <sbi_ipi_send_many>
    800013b0:	60a2                	ld	ra,8(sp)
    800013b2:	6402                	ld	s0,0(sp)
    800013b4:	0141                	addi	sp,sp,16
    800013b6:	8082                	ret

00000000800013b8 <sbi_ipi_process>:
    800013b8:	7179                	addi	sp,sp,-48
    800013ba:	f022                	sd	s0,32(sp)
    800013bc:	e84a                	sd	s2,16(sp)
    800013be:	e44e                	sd	s3,8(sp)
    800013c0:	f406                	sd	ra,40(sp)
    800013c2:	ec26                	sd	s1,24(sp)
    800013c4:	e052                	sd	s4,0(sp)
    800013c6:	1800                	addi	s0,sp,48
    800013c8:	89aa                	mv	s3,a0
    800013ca:	03154503          	lbu	a0,49(a0)
    800013ce:	0309c783          	lbu	a5,48(s3)
    800013d2:	0329c583          	lbu	a1,50(s3)
    800013d6:	0339c603          	lbu	a2,51(s3)
    800013da:	0349c683          	lbu	a3,52(s3)
    800013de:	0522                	slli	a0,a0,0x8
    800013e0:	8d5d                	or	a0,a0,a5
    800013e2:	0359c703          	lbu	a4,53(s3)
    800013e6:	05c2                	slli	a1,a1,0x10
    800013e8:	0369c783          	lbu	a5,54(s3)
    800013ec:	8dc9                	or	a1,a1,a0
    800013ee:	0662                	slli	a2,a2,0x18
    800013f0:	0379c483          	lbu	s1,55(s3)
    800013f4:	8e4d                	or	a2,a2,a1
    800013f6:	1682                	slli	a3,a3,0x20
    800013f8:	8ed1                	or	a3,a3,a2
    800013fa:	1722                	slli	a4,a4,0x28
    800013fc:	8f55                	or	a4,a4,a3
    800013fe:	17c2                	slli	a5,a5,0x30
    80001400:	8fd9                	or	a5,a5,a4
    80001402:	14e2                	slli	s1,s1,0x38
    80001404:	8cdd                	or	s1,s1,a5
    80001406:	0000e917          	auipc	s2,0xe
    8000140a:	c0a93903          	ld	s2,-1014(s2) # 8000f010 <ipi_data_off>
    8000140e:	994e                	add	s2,s2,s3
    80001410:	16e060ef          	jal	ra,8000757e <sbi_current_hartid>
    80001414:	c4c9                	beqz	s1,8000149e <sbi_ipi_process+0xe6>
    80001416:	0614c783          	lbu	a5,97(s1)
    8000141a:	0604c703          	lbu	a4,96(s1)
    8000141e:	0624c803          	lbu	a6,98(s1)
    80001422:	0634c583          	lbu	a1,99(s1)
    80001426:	0644c603          	lbu	a2,100(s1)
    8000142a:	07a2                	slli	a5,a5,0x8
    8000142c:	8fd9                	or	a5,a5,a4
    8000142e:	0654c683          	lbu	a3,101(s1)
    80001432:	0842                	slli	a6,a6,0x10
    80001434:	00f86833          	or	a6,a6,a5
    80001438:	0664c703          	lbu	a4,102(s1)
    8000143c:	05e2                	slli	a1,a1,0x18
    8000143e:	0105e5b3          	or	a1,a1,a6
    80001442:	0674c783          	lbu	a5,103(s1)
    80001446:	1602                	slli	a2,a2,0x20
    80001448:	8e4d                	or	a2,a2,a1
    8000144a:	16a2                	slli	a3,a3,0x28
    8000144c:	8ed1                	or	a3,a3,a2
    8000144e:	1742                	slli	a4,a4,0x30
    80001450:	8f55                	or	a4,a4,a3
    80001452:	17e2                	slli	a5,a5,0x38
    80001454:	8fd9                	or	a5,a5,a4
    80001456:	0717c883          	lbu	a7,113(a5)
    8000145a:	0707c703          	lbu	a4,112(a5)
    8000145e:	0727c803          	lbu	a6,114(a5)
    80001462:	0737c583          	lbu	a1,115(a5)
    80001466:	0747c603          	lbu	a2,116(a5)
    8000146a:	08a2                	slli	a7,a7,0x8
    8000146c:	0757c683          	lbu	a3,117(a5)
    80001470:	00e8e8b3          	or	a7,a7,a4
    80001474:	0842                	slli	a6,a6,0x10
    80001476:	0767c703          	lbu	a4,118(a5)
    8000147a:	01186833          	or	a6,a6,a7
    8000147e:	05e2                	slli	a1,a1,0x18
    80001480:	0777c783          	lbu	a5,119(a5)
    80001484:	0105e5b3          	or	a1,a1,a6
    80001488:	1602                	slli	a2,a2,0x20
    8000148a:	8e4d                	or	a2,a2,a1
    8000148c:	16a2                	slli	a3,a3,0x28
    8000148e:	8ed1                	or	a3,a3,a2
    80001490:	1742                	slli	a4,a4,0x30
    80001492:	8f55                	or	a4,a4,a3
    80001494:	17e2                	slli	a5,a5,0x38
    80001496:	8fd9                	or	a5,a5,a4
    80001498:	c399                	beqz	a5,8000149e <sbi_ipi_process+0xe6>
    8000149a:	2501                	sext.w	a0,a0
    8000149c:	9782                	jalr	a5
    8000149e:	4581                	li	a1,0
    800014a0:	854a                	mv	a0,s2
    800014a2:	2c8030ef          	jal	ra,8000476a <atomic_raw_xchg_ulong>
    800014a6:	84aa                	mv	s1,a0
    800014a8:	c51d                	beqz	a0,800014d6 <sbi_ipi_process+0x11e>
    800014aa:	4901                	li	s2,0
    800014ac:	0000ea17          	auipc	s4,0xe
    800014b0:	c44a0a13          	addi	s4,s4,-956 # 8000f0f0 <ipi_ops_array>
    800014b4:	02091713          	slli	a4,s2,0x20
    800014b8:	01d75793          	srli	a5,a4,0x1d
    800014bc:	0014f713          	andi	a4,s1,1
    800014c0:	97d2                	add	a5,a5,s4
    800014c2:	8085                	srli	s1,s1,0x1
    800014c4:	c719                	beqz	a4,800014d2 <sbi_ipi_process+0x11a>
    800014c6:	639c                	ld	a5,0(a5)
    800014c8:	854e                	mv	a0,s3
    800014ca:	c781                	beqz	a5,800014d2 <sbi_ipi_process+0x11a>
    800014cc:	7b9c                	ld	a5,48(a5)
    800014ce:	c391                	beqz	a5,800014d2 <sbi_ipi_process+0x11a>
    800014d0:	9782                	jalr	a5
    800014d2:	2905                	addiw	s2,s2,1
    800014d4:	f0e5                	bnez	s1,800014b4 <sbi_ipi_process+0xfc>
    800014d6:	70a2                	ld	ra,40(sp)
    800014d8:	7402                	ld	s0,32(sp)
    800014da:	64e2                	ld	s1,24(sp)
    800014dc:	6942                	ld	s2,16(sp)
    800014de:	69a2                	ld	s3,8(sp)
    800014e0:	6a02                	ld	s4,0(sp)
    800014e2:	6145                	addi	sp,sp,48
    800014e4:	8082                	ret

00000000800014e6 <sbi_ipi_init>:
    800014e6:	1101                	addi	sp,sp,-32
    800014e8:	e822                	sd	s0,16(sp)
    800014ea:	e426                	sd	s1,8(sp)
    800014ec:	e04a                	sd	s2,0(sp)
    800014ee:	ec06                	sd	ra,24(sp)
    800014f0:	1000                	addi	s0,sp,32
    800014f2:	892e                	mv	s2,a1
    800014f4:	84aa                	mv	s1,a0
    800014f6:	10059563          	bnez	a1,80001600 <sbi_ipi_init+0x11a>
    800014fa:	0000e517          	auipc	a0,0xe
    800014fe:	b1653503          	ld	a0,-1258(a0) # 8000f010 <ipi_data_off>
    80001502:	18050d63          	beqz	a0,8000169c <sbi_ipi_init+0x1b6>
    80001506:	0000d717          	auipc	a4,0xd
    8000150a:	afe72703          	lw	a4,-1282(a4) # 8000e004 <ipi_smode_event>
    8000150e:	03f00793          	li	a5,63
    80001512:	16e7ee63          	bltu	a5,a4,8000168e <sbi_ipi_init+0x1a8>
    80001516:	0000d717          	auipc	a4,0xd
    8000151a:	aea72703          	lw	a4,-1302(a4) # 8000e000 <ipi_halt_event>
    8000151e:	16e7e863          	bltu	a5,a4,8000168e <sbi_ipi_init+0x1a8>
    80001522:	9526                	add	a0,a0,s1
    80001524:	00053023          	sd	zero,0(a0)
    80001528:	0314c783          	lbu	a5,49(s1)
    8000152c:	0304c703          	lbu	a4,48(s1)
    80001530:	0324c503          	lbu	a0,50(s1)
    80001534:	0334c583          	lbu	a1,51(s1)
    80001538:	0344c603          	lbu	a2,52(s1)
    8000153c:	07a2                	slli	a5,a5,0x8
    8000153e:	8fd9                	or	a5,a5,a4
    80001540:	0354c683          	lbu	a3,53(s1)
    80001544:	0542                	slli	a0,a0,0x10
    80001546:	8d5d                	or	a0,a0,a5
    80001548:	0364c703          	lbu	a4,54(s1)
    8000154c:	05e2                	slli	a1,a1,0x18
    8000154e:	0374c783          	lbu	a5,55(s1)
    80001552:	8dc9                	or	a1,a1,a0
    80001554:	1602                	slli	a2,a2,0x20
    80001556:	8e4d                	or	a2,a2,a1
    80001558:	16a2                	slli	a3,a3,0x28
    8000155a:	8ed1                	or	a3,a3,a2
    8000155c:	1742                	slli	a4,a4,0x30
    8000155e:	8f55                	or	a4,a4,a3
    80001560:	17e2                	slli	a5,a5,0x38
    80001562:	8fd9                	or	a5,a5,a4
    80001564:	c7c9                	beqz	a5,800015ee <sbi_ipi_init+0x108>
    80001566:	0617c803          	lbu	a6,97(a5)
    8000156a:	0607c703          	lbu	a4,96(a5)
    8000156e:	0627c503          	lbu	a0,98(a5)
    80001572:	0637c583          	lbu	a1,99(a5)
    80001576:	0647c603          	lbu	a2,100(a5)
    8000157a:	0822                	slli	a6,a6,0x8
    8000157c:	00e86833          	or	a6,a6,a4
    80001580:	0657c683          	lbu	a3,101(a5)
    80001584:	0542                	slli	a0,a0,0x10
    80001586:	01056533          	or	a0,a0,a6
    8000158a:	0667c703          	lbu	a4,102(a5)
    8000158e:	05e2                	slli	a1,a1,0x18
    80001590:	8dc9                	or	a1,a1,a0
    80001592:	0677c783          	lbu	a5,103(a5)
    80001596:	1602                	slli	a2,a2,0x20
    80001598:	8e4d                	or	a2,a2,a1
    8000159a:	16a2                	slli	a3,a3,0x28
    8000159c:	8ed1                	or	a3,a3,a2
    8000159e:	1742                	slli	a4,a4,0x30
    800015a0:	8f55                	or	a4,a4,a3
    800015a2:	17e2                	slli	a5,a5,0x38
    800015a4:	8fd9                	or	a5,a5,a4
    800015a6:	0797c803          	lbu	a6,121(a5)
    800015aa:	0787c703          	lbu	a4,120(a5)
    800015ae:	07a7c503          	lbu	a0,122(a5)
    800015b2:	07b7c583          	lbu	a1,123(a5)
    800015b6:	07c7c603          	lbu	a2,124(a5)
    800015ba:	0822                	slli	a6,a6,0x8
    800015bc:	07d7c683          	lbu	a3,125(a5)
    800015c0:	00e86833          	or	a6,a6,a4
    800015c4:	0542                	slli	a0,a0,0x10
    800015c6:	07e7c703          	lbu	a4,126(a5)
    800015ca:	01056533          	or	a0,a0,a6
    800015ce:	05e2                	slli	a1,a1,0x18
    800015d0:	07f7c783          	lbu	a5,127(a5)
    800015d4:	8dc9                	or	a1,a1,a0
    800015d6:	1602                	slli	a2,a2,0x20
    800015d8:	8e4d                	or	a2,a2,a1
    800015da:	16a2                	slli	a3,a3,0x28
    800015dc:	8ed1                	or	a3,a3,a2
    800015de:	1742                	slli	a4,a4,0x30
    800015e0:	8f55                	or	a4,a4,a3
    800015e2:	17e2                	slli	a5,a5,0x38
    800015e4:	8fd9                	or	a5,a5,a4
    800015e6:	c781                	beqz	a5,800015ee <sbi_ipi_init+0x108>
    800015e8:	854a                	mv	a0,s2
    800015ea:	9782                	jalr	a5
    800015ec:	e501                	bnez	a0,800015f4 <sbi_ipi_init+0x10e>
    800015ee:	30446073          	csrsi	mie,8
    800015f2:	4501                	li	a0,0
    800015f4:	60e2                	ld	ra,24(sp)
    800015f6:	6442                	ld	s0,16(sp)
    800015f8:	64a2                	ld	s1,8(sp)
    800015fa:	6902                	ld	s2,0(sp)
    800015fc:	6105                	addi	sp,sp,32
    800015fe:	8082                	ret
    80001600:	0000b597          	auipc	a1,0xb
    80001604:	c6058593          	addi	a1,a1,-928 # 8000c260 <fdt_move+0x6ac>
    80001608:	4521                	li	a0,8
    8000160a:	17a000ef          	jal	ra,80001784 <sbi_scratch_alloc_offset>
    8000160e:	0000e797          	auipc	a5,0xe
    80001612:	a0a7b123          	sd	a0,-1534(a5) # 8000f010 <ipi_data_off>
    80001616:	c159                	beqz	a0,8000169c <sbi_ipi_init+0x1b6>
    80001618:	0000d817          	auipc	a6,0xd
    8000161c:	a1080813          	addi	a6,a6,-1520 # 8000e028 <ipi_smode_ops>
    80001620:	03083783          	ld	a5,48(a6)
    80001624:	cfb5                	beqz	a5,800016a0 <sbi_ipi_init+0x1ba>
    80001626:	0000e697          	auipc	a3,0xe
    8000162a:	aca68693          	addi	a3,a3,-1334 # 8000f0f0 <ipi_ops_array>
    8000162e:	88b6                	mv	a7,a3
    80001630:	87b6                	mv	a5,a3
    80001632:	4701                	li	a4,0
    80001634:	04000593          	li	a1,64
    80001638:	a021                	j	80001640 <sbi_ipi_init+0x15a>
    8000163a:	2705                	addiw	a4,a4,1
    8000163c:	04b70963          	beq	a4,a1,8000168e <sbi_ipi_init+0x1a8>
    80001640:	6390                	ld	a2,0(a5)
    80001642:	07a1                	addi	a5,a5,8
    80001644:	fa7d                	bnez	a2,8000163a <sbi_ipi_init+0x154>
    80001646:	00371793          	slli	a5,a4,0x3
    8000164a:	06883603          	ld	a2,104(a6)
    8000164e:	97c6                	add	a5,a5,a7
    80001650:	0107b023          	sd	a6,0(a5)
    80001654:	0000d797          	auipc	a5,0xd
    80001658:	9ae7a823          	sw	a4,-1616(a5) # 8000e004 <ipi_smode_event>
    8000165c:	c231                	beqz	a2,800016a0 <sbi_ipi_init+0x1ba>
    8000165e:	4781                	li	a5,0
    80001660:	04000613          	li	a2,64
    80001664:	a021                	j	8000166c <sbi_ipi_init+0x186>
    80001666:	2785                	addiw	a5,a5,1
    80001668:	02c78363          	beq	a5,a2,8000168e <sbi_ipi_init+0x1a8>
    8000166c:	6298                	ld	a4,0(a3)
    8000166e:	06a1                	addi	a3,a3,8
    80001670:	fb7d                	bnez	a4,80001666 <sbi_ipi_init+0x180>
    80001672:	00379713          	slli	a4,a5,0x3
    80001676:	98ba                	add	a7,a7,a4
    80001678:	0000d717          	auipc	a4,0xd
    8000167c:	9e870713          	addi	a4,a4,-1560 # 8000e060 <ipi_halt_ops>
    80001680:	00e8b023          	sd	a4,0(a7)
    80001684:	0000d717          	auipc	a4,0xd
    80001688:	96f72e23          	sw	a5,-1668(a4) # 8000e000 <ipi_halt_event>
    8000168c:	bd59                	j	80001522 <sbi_ipi_init+0x3c>
    8000168e:	60e2                	ld	ra,24(sp)
    80001690:	6442                	ld	s0,16(sp)
    80001692:	64a2                	ld	s1,8(sp)
    80001694:	6902                	ld	s2,0(sp)
    80001696:	5555                	li	a0,-11
    80001698:	6105                	addi	sp,sp,32
    8000169a:	8082                	ret
    8000169c:	5551                	li	a0,-12
    8000169e:	bf99                	j	800015f4 <sbi_ipi_init+0x10e>
    800016a0:	5575                	li	a0,-3
    800016a2:	bf89                	j	800015f4 <sbi_ipi_init+0x10e>

00000000800016a4 <sbi_ipi_exit>:
    800016a4:	1101                	addi	sp,sp,-32
    800016a6:	e822                	sd	s0,16(sp)
    800016a8:	e426                	sd	s1,8(sp)
    800016aa:	ec06                	sd	ra,24(sp)
    800016ac:	1000                	addi	s0,sp,32
    800016ae:	84aa                	mv	s1,a0
    800016b0:	30447073          	csrci	mie,8
    800016b4:	d05ff0ef          	jal	ra,800013b8 <sbi_ipi_process>
    800016b8:	0314c783          	lbu	a5,49(s1)
    800016bc:	0304c703          	lbu	a4,48(s1)
    800016c0:	0324c503          	lbu	a0,50(s1)
    800016c4:	0334c583          	lbu	a1,51(s1)
    800016c8:	0344c603          	lbu	a2,52(s1)
    800016cc:	07a2                	slli	a5,a5,0x8
    800016ce:	8fd9                	or	a5,a5,a4
    800016d0:	0354c683          	lbu	a3,53(s1)
    800016d4:	0542                	slli	a0,a0,0x10
    800016d6:	8d5d                	or	a0,a0,a5
    800016d8:	0364c703          	lbu	a4,54(s1)
    800016dc:	05e2                	slli	a1,a1,0x18
    800016de:	0374c783          	lbu	a5,55(s1)
    800016e2:	8dc9                	or	a1,a1,a0
    800016e4:	1602                	slli	a2,a2,0x20
    800016e6:	8e4d                	or	a2,a2,a1
    800016e8:	16a2                	slli	a3,a3,0x28
    800016ea:	8ed1                	or	a3,a3,a2
    800016ec:	1742                	slli	a4,a4,0x30
    800016ee:	8f55                	or	a4,a4,a3
    800016f0:	17e2                	slli	a5,a5,0x38
    800016f2:	8fd9                	or	a5,a5,a4
    800016f4:	c3d9                	beqz	a5,8000177a <sbi_ipi_exit+0xd6>
    800016f6:	0617c803          	lbu	a6,97(a5)
    800016fa:	0607c703          	lbu	a4,96(a5)
    800016fe:	0627c503          	lbu	a0,98(a5)
    80001702:	0637c583          	lbu	a1,99(a5)
    80001706:	0647c603          	lbu	a2,100(a5)
    8000170a:	0822                	slli	a6,a6,0x8
    8000170c:	00e86833          	or	a6,a6,a4
    80001710:	0657c683          	lbu	a3,101(a5)
    80001714:	0542                	slli	a0,a0,0x10
    80001716:	01056533          	or	a0,a0,a6
    8000171a:	0667c703          	lbu	a4,102(a5)
    8000171e:	05e2                	slli	a1,a1,0x18
    80001720:	8dc9                	or	a1,a1,a0
    80001722:	0677c783          	lbu	a5,103(a5)
    80001726:	1602                	slli	a2,a2,0x20
    80001728:	8e4d                	or	a2,a2,a1
    8000172a:	16a2                	slli	a3,a3,0x28
    8000172c:	8ed1                	or	a3,a3,a2
    8000172e:	1742                	slli	a4,a4,0x30
    80001730:	8f55                	or	a4,a4,a3
    80001732:	17e2                	slli	a5,a5,0x38
    80001734:	8fd9                	or	a5,a5,a4
    80001736:	0817c803          	lbu	a6,129(a5)
    8000173a:	0807c703          	lbu	a4,128(a5)
    8000173e:	0827c503          	lbu	a0,130(a5)
    80001742:	0837c583          	lbu	a1,131(a5)
    80001746:	0847c603          	lbu	a2,132(a5)
    8000174a:	0822                	slli	a6,a6,0x8
    8000174c:	0857c683          	lbu	a3,133(a5)
    80001750:	00e86833          	or	a6,a6,a4
    80001754:	0542                	slli	a0,a0,0x10
    80001756:	0867c703          	lbu	a4,134(a5)
    8000175a:	01056533          	or	a0,a0,a6
    8000175e:	05e2                	slli	a1,a1,0x18
    80001760:	0877c783          	lbu	a5,135(a5)
    80001764:	8dc9                	or	a1,a1,a0
    80001766:	1602                	slli	a2,a2,0x20
    80001768:	8e4d                	or	a2,a2,a1
    8000176a:	16a2                	slli	a3,a3,0x28
    8000176c:	8ed1                	or	a3,a3,a2
    8000176e:	1742                	slli	a4,a4,0x30
    80001770:	8f55                	or	a4,a4,a3
    80001772:	17e2                	slli	a5,a5,0x38
    80001774:	8fd9                	or	a5,a5,a4
    80001776:	c391                	beqz	a5,8000177a <sbi_ipi_exit+0xd6>
    80001778:	9782                	jalr	a5
    8000177a:	60e2                	ld	ra,24(sp)
    8000177c:	6442                	ld	s0,16(sp)
    8000177e:	64a2                	ld	s1,8(sp)
    80001780:	6105                	addi	sp,sp,32
    80001782:	8082                	ret

0000000080001784 <sbi_scratch_alloc_offset>:
    80001784:	7139                	addi	sp,sp,-64
    80001786:	f822                	sd	s0,48(sp)
    80001788:	fc06                	sd	ra,56(sp)
    8000178a:	f426                	sd	s1,40(sp)
    8000178c:	f04a                	sd	s2,32(sp)
    8000178e:	ec4e                	sd	s3,24(sp)
    80001790:	e852                	sd	s4,16(sp)
    80001792:	e456                	sd	s5,8(sp)
    80001794:	0080                	addi	s0,sp,64
    80001796:	c951                	beqz	a0,8000182a <sbi_scratch_alloc_offset+0xa6>
    80001798:	00757793          	andi	a5,a0,7
    8000179c:	84aa                	mv	s1,a0
    8000179e:	c781                	beqz	a5,800017a6 <sbi_scratch_alloc_offset+0x22>
    800017a0:	ff857493          	andi	s1,a0,-8
    800017a4:	04a1                	addi	s1,s1,8
    800017a6:	0000e517          	auipc	a0,0xe
    800017aa:	87250513          	addi	a0,a0,-1934 # 8000f018 <extra_lock>
    800017ae:	0e4030ef          	jal	ra,80004892 <spin_lock>
    800017b2:	0000d797          	auipc	a5,0xd
    800017b6:	85678793          	addi	a5,a5,-1962 # 8000e008 <extra_offset>
    800017ba:	0007b903          	ld	s2,0(a5)
    800017be:	20000693          	li	a3,512
    800017c2:	0000e517          	auipc	a0,0xe
    800017c6:	85650513          	addi	a0,a0,-1962 # 8000f018 <extra_lock>
    800017ca:	00990733          	add	a4,s2,s1
    800017ce:	04e6ec63          	bltu	a3,a4,80001826 <sbi_scratch_alloc_offset+0xa2>
    800017d2:	e398                	sd	a4,0(a5)
    800017d4:	0dc030ef          	jal	ra,800048b0 <spin_unlock>
    800017d8:	04090963          	beqz	s2,8000182a <sbi_scratch_alloc_offset+0xa6>
    800017dc:	34002af3          	csrr	s5,mscratch
    800017e0:	031ac503          	lbu	a0,49(s5)
    800017e4:	030ac783          	lbu	a5,48(s5)
    800017e8:	032ac583          	lbu	a1,50(s5)
    800017ec:	033ac603          	lbu	a2,51(s5)
    800017f0:	034ac683          	lbu	a3,52(s5)
    800017f4:	0522                	slli	a0,a0,0x8
    800017f6:	8d5d                	or	a0,a0,a5
    800017f8:	035ac703          	lbu	a4,53(s5)
    800017fc:	05c2                	slli	a1,a1,0x10
    800017fe:	036ac783          	lbu	a5,54(s5)
    80001802:	8dc9                	or	a1,a1,a0
    80001804:	0662                	slli	a2,a2,0x18
    80001806:	037ac983          	lbu	s3,55(s5)
    8000180a:	8e4d                	or	a2,a2,a1
    8000180c:	1682                	slli	a3,a3,0x20
    8000180e:	8ed1                	or	a3,a3,a2
    80001810:	1722                	slli	a4,a4,0x28
    80001812:	8f55                	or	a4,a4,a3
    80001814:	17c2                	slli	a5,a5,0x30
    80001816:	8fd9                	or	a5,a5,a4
    80001818:	19e2                	slli	s3,s3,0x38
    8000181a:	00f9e9b3          	or	s3,s3,a5
    8000181e:	4a01                	li	s4,0
    80001820:	02099863          	bnez	s3,80001850 <sbi_scratch_alloc_offset+0xcc>
    80001824:	a021                	j	8000182c <sbi_scratch_alloc_offset+0xa8>
    80001826:	08a030ef          	jal	ra,800048b0 <spin_unlock>
    8000182a:	4901                	li	s2,0
    8000182c:	70e2                	ld	ra,56(sp)
    8000182e:	7442                	ld	s0,48(sp)
    80001830:	74a2                	ld	s1,40(sp)
    80001832:	69e2                	ld	s3,24(sp)
    80001834:	6a42                	ld	s4,16(sp)
    80001836:	6aa2                	ld	s5,8(sp)
    80001838:	854a                	mv	a0,s2
    8000183a:	7902                	ld	s2,32(sp)
    8000183c:	6121                	addi	sp,sp,64
    8000183e:	8082                	ret
    80001840:	536060ef          	jal	ra,80007d76 <sbi_hart_id_to_scratch>
    80001844:	8626                	mv	a2,s1
    80001846:	4581                	li	a1,0
    80001848:	954a                	add	a0,a0,s2
    8000184a:	6e2020ef          	jal	ra,80003f2c <sbi_memset>
    8000184e:	2a05                	addiw	s4,s4,1
    80001850:	0519c683          	lbu	a3,81(s3)
    80001854:	0509c603          	lbu	a2,80(s3)
    80001858:	0529c703          	lbu	a4,82(s3)
    8000185c:	0539c783          	lbu	a5,83(s3)
    80001860:	06a2                	slli	a3,a3,0x8
    80001862:	8ed1                	or	a3,a3,a2
    80001864:	0742                	slli	a4,a4,0x10
    80001866:	8f55                	or	a4,a4,a3
    80001868:	07e2                	slli	a5,a5,0x18
    8000186a:	8fd9                	or	a5,a5,a4
    8000186c:	2781                	sext.w	a5,a5
    8000186e:	85d2                	mv	a1,s4
    80001870:	8556                	mv	a0,s5
    80001872:	fcfa67e3          	bltu	s4,a5,80001840 <sbi_scratch_alloc_offset+0xbc>
    80001876:	bf5d                	j	8000182c <sbi_scratch_alloc_offset+0xa8>

0000000080001878 <sbi_scratch_free_offset>:
    80001878:	1141                	addi	sp,sp,-16
    8000187a:	e422                	sd	s0,8(sp)
    8000187c:	0800                	addi	s0,sp,16
    8000187e:	6422                	ld	s0,8(sp)
    80001880:	0141                	addi	sp,sp,16
    80001882:	8082                	ret

0000000080001884 <sbi_system_early_init>:
    80001884:	03154783          	lbu	a5,49(a0)
    80001888:	03054703          	lbu	a4,48(a0)
    8000188c:	03254883          	lbu	a7,50(a0)
    80001890:	03354803          	lbu	a6,51(a0)
    80001894:	03454603          	lbu	a2,52(a0)
    80001898:	07a2                	slli	a5,a5,0x8
    8000189a:	8fd9                	or	a5,a5,a4
    8000189c:	03554683          	lbu	a3,53(a0)
    800018a0:	08c2                	slli	a7,a7,0x10
    800018a2:	03654703          	lbu	a4,54(a0)
    800018a6:	00f8e8b3          	or	a7,a7,a5
    800018aa:	0862                	slli	a6,a6,0x18
    800018ac:	03754783          	lbu	a5,55(a0)
    800018b0:	1602                	slli	a2,a2,0x20
    800018b2:	01186533          	or	a0,a6,a7
    800018b6:	8e49                	or	a2,a2,a0
    800018b8:	16a2                	slli	a3,a3,0x28
    800018ba:	8ed1                	or	a3,a3,a2
    800018bc:	1742                	slli	a4,a4,0x30
    800018be:	8f55                	or	a4,a4,a3
    800018c0:	17e2                	slli	a5,a5,0x38
    800018c2:	8fd9                	or	a5,a5,a4
    800018c4:	c3cd                	beqz	a5,80001966 <sbi_system_early_init+0xe2>
    800018c6:	0617c883          	lbu	a7,97(a5)
    800018ca:	0607c703          	lbu	a4,96(a5)
    800018ce:	0627c803          	lbu	a6,98(a5)
    800018d2:	0637c503          	lbu	a0,99(a5)
    800018d6:	0647c603          	lbu	a2,100(a5)
    800018da:	08a2                	slli	a7,a7,0x8
    800018dc:	00e8e8b3          	or	a7,a7,a4
    800018e0:	0657c683          	lbu	a3,101(a5)
    800018e4:	0842                	slli	a6,a6,0x10
    800018e6:	01186833          	or	a6,a6,a7
    800018ea:	0667c703          	lbu	a4,102(a5)
    800018ee:	0562                	slli	a0,a0,0x18
    800018f0:	01056533          	or	a0,a0,a6
    800018f4:	0677c783          	lbu	a5,103(a5)
    800018f8:	1602                	slli	a2,a2,0x20
    800018fa:	8e49                	or	a2,a2,a0
    800018fc:	16a2                	slli	a3,a3,0x28
    800018fe:	8ed1                	or	a3,a3,a2
    80001900:	1742                	slli	a4,a4,0x30
    80001902:	8f55                	or	a4,a4,a3
    80001904:	17e2                	slli	a5,a5,0x38
    80001906:	8fd9                	or	a5,a5,a4
    80001908:	0017c303          	lbu	t1,1(a5)
    8000190c:	0007c703          	lbu	a4,0(a5)
    80001910:	0027c883          	lbu	a7,2(a5)
    80001914:	0037c803          	lbu	a6,3(a5)
    80001918:	0047c603          	lbu	a2,4(a5)
    8000191c:	0322                	slli	t1,t1,0x8
    8000191e:	0057c683          	lbu	a3,5(a5)
    80001922:	00e36333          	or	t1,t1,a4
    80001926:	08c2                	slli	a7,a7,0x10
    80001928:	0067c703          	lbu	a4,6(a5)
    8000192c:	0068e8b3          	or	a7,a7,t1
    80001930:	0862                	slli	a6,a6,0x18
    80001932:	0077c783          	lbu	a5,7(a5)
    80001936:	01186833          	or	a6,a6,a7
    8000193a:	1602                	slli	a2,a2,0x20
    8000193c:	01066633          	or	a2,a2,a6
    80001940:	16a2                	slli	a3,a3,0x28
    80001942:	8ed1                	or	a3,a3,a2
    80001944:	1742                	slli	a4,a4,0x30
    80001946:	8f55                	or	a4,a4,a3
    80001948:	17e2                	slli	a5,a5,0x38
    8000194a:	8fd9                	or	a5,a5,a4
    8000194c:	4501                	li	a0,0
    8000194e:	cb99                	beqz	a5,80001964 <sbi_system_early_init+0xe0>
    80001950:	1141                	addi	sp,sp,-16
    80001952:	e022                	sd	s0,0(sp)
    80001954:	e406                	sd	ra,8(sp)
    80001956:	0800                	addi	s0,sp,16
    80001958:	852e                	mv	a0,a1
    8000195a:	9782                	jalr	a5
    8000195c:	60a2                	ld	ra,8(sp)
    8000195e:	6402                	ld	s0,0(sp)
    80001960:	0141                	addi	sp,sp,16
    80001962:	8082                	ret
    80001964:	8082                	ret
    80001966:	4501                	li	a0,0
    80001968:	8082                	ret

000000008000196a <sbi_system_final_init>:
    8000196a:	03154783          	lbu	a5,49(a0)
    8000196e:	03054703          	lbu	a4,48(a0)
    80001972:	03254883          	lbu	a7,50(a0)
    80001976:	03354803          	lbu	a6,51(a0)
    8000197a:	03454603          	lbu	a2,52(a0)
    8000197e:	07a2                	slli	a5,a5,0x8
    80001980:	8fd9                	or	a5,a5,a4
    80001982:	03554683          	lbu	a3,53(a0)
    80001986:	08c2                	slli	a7,a7,0x10
    80001988:	03654703          	lbu	a4,54(a0)
    8000198c:	00f8e8b3          	or	a7,a7,a5
    80001990:	0862                	slli	a6,a6,0x18
    80001992:	03754783          	lbu	a5,55(a0)
    80001996:	1602                	slli	a2,a2,0x20
    80001998:	01186533          	or	a0,a6,a7
    8000199c:	8e49                	or	a2,a2,a0
    8000199e:	16a2                	slli	a3,a3,0x28
    800019a0:	8ed1                	or	a3,a3,a2
    800019a2:	1742                	slli	a4,a4,0x30
    800019a4:	8f55                	or	a4,a4,a3
    800019a6:	17e2                	slli	a5,a5,0x38
    800019a8:	8fd9                	or	a5,a5,a4
    800019aa:	c3cd                	beqz	a5,80001a4c <sbi_system_final_init+0xe2>
    800019ac:	0617c883          	lbu	a7,97(a5)
    800019b0:	0607c703          	lbu	a4,96(a5)
    800019b4:	0627c803          	lbu	a6,98(a5)
    800019b8:	0637c503          	lbu	a0,99(a5)
    800019bc:	0647c603          	lbu	a2,100(a5)
    800019c0:	08a2                	slli	a7,a7,0x8
    800019c2:	00e8e8b3          	or	a7,a7,a4
    800019c6:	0657c683          	lbu	a3,101(a5)
    800019ca:	0842                	slli	a6,a6,0x10
    800019cc:	01186833          	or	a6,a6,a7
    800019d0:	0667c703          	lbu	a4,102(a5)
    800019d4:	0562                	slli	a0,a0,0x18
    800019d6:	01056533          	or	a0,a0,a6
    800019da:	0677c783          	lbu	a5,103(a5)
    800019de:	1602                	slli	a2,a2,0x20
    800019e0:	8e49                	or	a2,a2,a0
    800019e2:	16a2                	slli	a3,a3,0x28
    800019e4:	8ed1                	or	a3,a3,a2
    800019e6:	1742                	slli	a4,a4,0x30
    800019e8:	8f55                	or	a4,a4,a3
    800019ea:	17e2                	slli	a5,a5,0x38
    800019ec:	8fd9                	or	a5,a5,a4
    800019ee:	0097c303          	lbu	t1,9(a5)
    800019f2:	0087c703          	lbu	a4,8(a5)
    800019f6:	00a7c883          	lbu	a7,10(a5)
    800019fa:	00b7c803          	lbu	a6,11(a5)
    800019fe:	00c7c603          	lbu	a2,12(a5)
    80001a02:	0322                	slli	t1,t1,0x8
    80001a04:	00d7c683          	lbu	a3,13(a5)
    80001a08:	00e36333          	or	t1,t1,a4
    80001a0c:	08c2                	slli	a7,a7,0x10
    80001a0e:	00e7c703          	lbu	a4,14(a5)
    80001a12:	0068e8b3          	or	a7,a7,t1
    80001a16:	0862                	slli	a6,a6,0x18
    80001a18:	00f7c783          	lbu	a5,15(a5)
    80001a1c:	01186833          	or	a6,a6,a7
    80001a20:	1602                	slli	a2,a2,0x20
    80001a22:	01066633          	or	a2,a2,a6
    80001a26:	16a2                	slli	a3,a3,0x28
    80001a28:	8ed1                	or	a3,a3,a2
    80001a2a:	1742                	slli	a4,a4,0x30
    80001a2c:	8f55                	or	a4,a4,a3
    80001a2e:	17e2                	slli	a5,a5,0x38
    80001a30:	8fd9                	or	a5,a5,a4
    80001a32:	4501                	li	a0,0
    80001a34:	cb99                	beqz	a5,80001a4a <sbi_system_final_init+0xe0>
    80001a36:	1141                	addi	sp,sp,-16
    80001a38:	e022                	sd	s0,0(sp)
    80001a3a:	e406                	sd	ra,8(sp)
    80001a3c:	0800                	addi	s0,sp,16
    80001a3e:	852e                	mv	a0,a1
    80001a40:	9782                	jalr	a5
    80001a42:	60a2                	ld	ra,8(sp)
    80001a44:	6402                	ld	s0,0(sp)
    80001a46:	0141                	addi	sp,sp,16
    80001a48:	8082                	ret
    80001a4a:	8082                	ret
    80001a4c:	4501                	li	a0,0
    80001a4e:	8082                	ret

0000000080001a50 <sbi_system_early_exit>:
    80001a50:	03154783          	lbu	a5,49(a0)
    80001a54:	03054703          	lbu	a4,48(a0)
    80001a58:	03254803          	lbu	a6,50(a0)
    80001a5c:	03354583          	lbu	a1,51(a0)
    80001a60:	03454603          	lbu	a2,52(a0)
    80001a64:	07a2                	slli	a5,a5,0x8
    80001a66:	8fd9                	or	a5,a5,a4
    80001a68:	03554683          	lbu	a3,53(a0)
    80001a6c:	0842                	slli	a6,a6,0x10
    80001a6e:	00f86833          	or	a6,a6,a5
    80001a72:	03654703          	lbu	a4,54(a0)
    80001a76:	05e2                	slli	a1,a1,0x18
    80001a78:	03754783          	lbu	a5,55(a0)
    80001a7c:	0105e5b3          	or	a1,a1,a6
    80001a80:	1602                	slli	a2,a2,0x20
    80001a82:	8e4d                	or	a2,a2,a1
    80001a84:	16a2                	slli	a3,a3,0x28
    80001a86:	8ed1                	or	a3,a3,a2
    80001a88:	1742                	slli	a4,a4,0x30
    80001a8a:	8f55                	or	a4,a4,a3
    80001a8c:	17e2                	slli	a5,a5,0x38
    80001a8e:	8fd9                	or	a5,a5,a4
    80001a90:	cbd9                	beqz	a5,80001b26 <sbi_system_early_exit+0xd6>
    80001a92:	0617c803          	lbu	a6,97(a5)
    80001a96:	0607c703          	lbu	a4,96(a5)
    80001a9a:	0627c503          	lbu	a0,98(a5)
    80001a9e:	0637c583          	lbu	a1,99(a5)
    80001aa2:	0647c603          	lbu	a2,100(a5)
    80001aa6:	0822                	slli	a6,a6,0x8
    80001aa8:	00e86833          	or	a6,a6,a4
    80001aac:	0657c683          	lbu	a3,101(a5)
    80001ab0:	0542                	slli	a0,a0,0x10
    80001ab2:	01056533          	or	a0,a0,a6
    80001ab6:	0667c703          	lbu	a4,102(a5)
    80001aba:	05e2                	slli	a1,a1,0x18
    80001abc:	8dc9                	or	a1,a1,a0
    80001abe:	0677c783          	lbu	a5,103(a5)
    80001ac2:	1602                	slli	a2,a2,0x20
    80001ac4:	8e4d                	or	a2,a2,a1
    80001ac6:	16a2                	slli	a3,a3,0x28
    80001ac8:	8ed1                	or	a3,a3,a2
    80001aca:	1742                	slli	a4,a4,0x30
    80001acc:	8f55                	or	a4,a4,a3
    80001ace:	17e2                	slli	a5,a5,0x38
    80001ad0:	8fd9                	or	a5,a5,a4
    80001ad2:	0117c803          	lbu	a6,17(a5)
    80001ad6:	0107c703          	lbu	a4,16(a5)
    80001ada:	0127c503          	lbu	a0,18(a5)
    80001ade:	0137c583          	lbu	a1,19(a5)
    80001ae2:	0147c603          	lbu	a2,20(a5)
    80001ae6:	0822                	slli	a6,a6,0x8
    80001ae8:	0157c683          	lbu	a3,21(a5)
    80001aec:	00e86833          	or	a6,a6,a4
    80001af0:	0542                	slli	a0,a0,0x10
    80001af2:	0167c703          	lbu	a4,22(a5)
    80001af6:	01056533          	or	a0,a0,a6
    80001afa:	05e2                	slli	a1,a1,0x18
    80001afc:	0177c783          	lbu	a5,23(a5)
    80001b00:	8dc9                	or	a1,a1,a0
    80001b02:	1602                	slli	a2,a2,0x20
    80001b04:	8e4d                	or	a2,a2,a1
    80001b06:	16a2                	slli	a3,a3,0x28
    80001b08:	8ed1                	or	a3,a3,a2
    80001b0a:	1742                	slli	a4,a4,0x30
    80001b0c:	8f55                	or	a4,a4,a3
    80001b0e:	17e2                	slli	a5,a5,0x38
    80001b10:	8fd9                	or	a5,a5,a4
    80001b12:	cb91                	beqz	a5,80001b26 <sbi_system_early_exit+0xd6>
    80001b14:	1141                	addi	sp,sp,-16
    80001b16:	e022                	sd	s0,0(sp)
    80001b18:	e406                	sd	ra,8(sp)
    80001b1a:	0800                	addi	s0,sp,16
    80001b1c:	9782                	jalr	a5
    80001b1e:	60a2                	ld	ra,8(sp)
    80001b20:	6402                	ld	s0,0(sp)
    80001b22:	0141                	addi	sp,sp,16
    80001b24:	8082                	ret
    80001b26:	8082                	ret

0000000080001b28 <sbi_system_final_exit>:
    80001b28:	03154783          	lbu	a5,49(a0)
    80001b2c:	03054703          	lbu	a4,48(a0)
    80001b30:	03254803          	lbu	a6,50(a0)
    80001b34:	03354583          	lbu	a1,51(a0)
    80001b38:	03454603          	lbu	a2,52(a0)
    80001b3c:	07a2                	slli	a5,a5,0x8
    80001b3e:	8fd9                	or	a5,a5,a4
    80001b40:	03554683          	lbu	a3,53(a0)
    80001b44:	0842                	slli	a6,a6,0x10
    80001b46:	00f86833          	or	a6,a6,a5
    80001b4a:	03654703          	lbu	a4,54(a0)
    80001b4e:	05e2                	slli	a1,a1,0x18
    80001b50:	03754783          	lbu	a5,55(a0)
    80001b54:	0105e5b3          	or	a1,a1,a6
    80001b58:	1602                	slli	a2,a2,0x20
    80001b5a:	8e4d                	or	a2,a2,a1
    80001b5c:	16a2                	slli	a3,a3,0x28
    80001b5e:	8ed1                	or	a3,a3,a2
    80001b60:	1742                	slli	a4,a4,0x30
    80001b62:	8f55                	or	a4,a4,a3
    80001b64:	17e2                	slli	a5,a5,0x38
    80001b66:	8fd9                	or	a5,a5,a4
    80001b68:	cbd9                	beqz	a5,80001bfe <sbi_system_final_exit+0xd6>
    80001b6a:	0617c803          	lbu	a6,97(a5)
    80001b6e:	0607c703          	lbu	a4,96(a5)
    80001b72:	0627c503          	lbu	a0,98(a5)
    80001b76:	0637c583          	lbu	a1,99(a5)
    80001b7a:	0647c603          	lbu	a2,100(a5)
    80001b7e:	0822                	slli	a6,a6,0x8
    80001b80:	00e86833          	or	a6,a6,a4
    80001b84:	0657c683          	lbu	a3,101(a5)
    80001b88:	0542                	slli	a0,a0,0x10
    80001b8a:	01056533          	or	a0,a0,a6
    80001b8e:	0667c703          	lbu	a4,102(a5)
    80001b92:	05e2                	slli	a1,a1,0x18
    80001b94:	8dc9                	or	a1,a1,a0
    80001b96:	0677c783          	lbu	a5,103(a5)
    80001b9a:	1602                	slli	a2,a2,0x20
    80001b9c:	8e4d                	or	a2,a2,a1
    80001b9e:	16a2                	slli	a3,a3,0x28
    80001ba0:	8ed1                	or	a3,a3,a2
    80001ba2:	1742                	slli	a4,a4,0x30
    80001ba4:	8f55                	or	a4,a4,a3
    80001ba6:	17e2                	slli	a5,a5,0x38
    80001ba8:	8fd9                	or	a5,a5,a4
    80001baa:	0197c803          	lbu	a6,25(a5)
    80001bae:	0187c703          	lbu	a4,24(a5)
    80001bb2:	01a7c503          	lbu	a0,26(a5)
    80001bb6:	01b7c583          	lbu	a1,27(a5)
    80001bba:	01c7c603          	lbu	a2,28(a5)
    80001bbe:	0822                	slli	a6,a6,0x8
    80001bc0:	01d7c683          	lbu	a3,29(a5)
    80001bc4:	00e86833          	or	a6,a6,a4
    80001bc8:	0542                	slli	a0,a0,0x10
    80001bca:	01e7c703          	lbu	a4,30(a5)
    80001bce:	01056533          	or	a0,a0,a6
    80001bd2:	05e2                	slli	a1,a1,0x18
    80001bd4:	01f7c783          	lbu	a5,31(a5)
    80001bd8:	8dc9                	or	a1,a1,a0
    80001bda:	1602                	slli	a2,a2,0x20
    80001bdc:	8e4d                	or	a2,a2,a1
    80001bde:	16a2                	slli	a3,a3,0x28
    80001be0:	8ed1                	or	a3,a3,a2
    80001be2:	1742                	slli	a4,a4,0x30
    80001be4:	8f55                	or	a4,a4,a3
    80001be6:	17e2                	slli	a5,a5,0x38
    80001be8:	8fd9                	or	a5,a5,a4
    80001bea:	cb91                	beqz	a5,80001bfe <sbi_system_final_exit+0xd6>
    80001bec:	1141                	addi	sp,sp,-16
    80001bee:	e022                	sd	s0,0(sp)
    80001bf0:	e406                	sd	ra,8(sp)
    80001bf2:	0800                	addi	s0,sp,16
    80001bf4:	9782                	jalr	a5
    80001bf6:	60a2                	ld	ra,8(sp)
    80001bf8:	6402                	ld	s0,0(sp)
    80001bfa:	0141                	addi	sp,sp,16
    80001bfc:	8082                	ret
    80001bfe:	8082                	ret

0000000080001c00 <sbi_system_reboot>:
    80001c00:	7179                	addi	sp,sp,-48
    80001c02:	f406                	sd	ra,40(sp)
    80001c04:	f022                	sd	s0,32(sp)
    80001c06:	ec26                	sd	s1,24(sp)
    80001c08:	1800                	addi	s0,sp,48
    80001c0a:	e84a                	sd	s2,16(sp)
    80001c0c:	e44e                	sd	s3,8(sp)
    80001c0e:	84aa                	mv	s1,a0
    80001c10:	892e                	mv	s2,a1
    80001c12:	16d050ef          	jal	ra,8000757e <sbi_current_hartid>
    80001c16:	0005099b          	sext.w	s3,a0
    80001c1a:	126060ef          	jal	ra,80007d40 <sbi_hart_available_mask>
    80001c1e:	4785                	li	a5,1
    80001c20:	013797b3          	sll	a5,a5,s3
    80001c24:	fff7c793          	not	a5,a5
    80001c28:	1782                	slli	a5,a5,0x20
    80001c2a:	9381                	srli	a5,a5,0x20
    80001c2c:	00a7f5b3          	and	a1,a5,a0
    80001c30:	4601                	li	a2,0
    80001c32:	8526                	mv	a0,s1
    80001c34:	f66ff0ef          	jal	ra,8000139a <sbi_ipi_send_halt>
    80001c38:	0314c783          	lbu	a5,49(s1)
    80001c3c:	0304c703          	lbu	a4,48(s1)
    80001c40:	0324c503          	lbu	a0,50(s1)
    80001c44:	0334c583          	lbu	a1,51(s1)
    80001c48:	0344c603          	lbu	a2,52(s1)
    80001c4c:	07a2                	slli	a5,a5,0x8
    80001c4e:	8fd9                	or	a5,a5,a4
    80001c50:	0354c683          	lbu	a3,53(s1)
    80001c54:	0542                	slli	a0,a0,0x10
    80001c56:	8d5d                	or	a0,a0,a5
    80001c58:	0364c703          	lbu	a4,54(s1)
    80001c5c:	05e2                	slli	a1,a1,0x18
    80001c5e:	0374c783          	lbu	a5,55(s1)
    80001c62:	8dc9                	or	a1,a1,a0
    80001c64:	1602                	slli	a2,a2,0x20
    80001c66:	8e4d                	or	a2,a2,a1
    80001c68:	16a2                	slli	a3,a3,0x28
    80001c6a:	8ed1                	or	a3,a3,a2
    80001c6c:	1742                	slli	a4,a4,0x30
    80001c6e:	8f55                	or	a4,a4,a3
    80001c70:	17e2                	slli	a5,a5,0x38
    80001c72:	8fd9                	or	a5,a5,a4
    80001c74:	c7c1                	beqz	a5,80001cfc <sbi_system_reboot+0xfc>
    80001c76:	0617c803          	lbu	a6,97(a5)
    80001c7a:	0607c703          	lbu	a4,96(a5)
    80001c7e:	0627c503          	lbu	a0,98(a5)
    80001c82:	0637c583          	lbu	a1,99(a5)
    80001c86:	0647c603          	lbu	a2,100(a5)
    80001c8a:	0822                	slli	a6,a6,0x8
    80001c8c:	00e86833          	or	a6,a6,a4
    80001c90:	0657c683          	lbu	a3,101(a5)
    80001c94:	0542                	slli	a0,a0,0x10
    80001c96:	01056533          	or	a0,a0,a6
    80001c9a:	0667c703          	lbu	a4,102(a5)
    80001c9e:	05e2                	slli	a1,a1,0x18
    80001ca0:	8dc9                	or	a1,a1,a0
    80001ca2:	0677c783          	lbu	a5,103(a5)
    80001ca6:	1602                	slli	a2,a2,0x20
    80001ca8:	8e4d                	or	a2,a2,a1
    80001caa:	16a2                	slli	a3,a3,0x28
    80001cac:	8ed1                	or	a3,a3,a2
    80001cae:	1742                	slli	a4,a4,0x30
    80001cb0:	8f55                	or	a4,a4,a3
    80001cb2:	17e2                	slli	a5,a5,0x38
    80001cb4:	8fd9                	or	a5,a5,a4
    80001cb6:	0b97c803          	lbu	a6,185(a5)
    80001cba:	0b87c703          	lbu	a4,184(a5)
    80001cbe:	0ba7c503          	lbu	a0,186(a5)
    80001cc2:	0bb7c583          	lbu	a1,187(a5)
    80001cc6:	0bc7c603          	lbu	a2,188(a5)
    80001cca:	0822                	slli	a6,a6,0x8
    80001ccc:	0bd7c683          	lbu	a3,189(a5)
    80001cd0:	00e86833          	or	a6,a6,a4
    80001cd4:	0542                	slli	a0,a0,0x10
    80001cd6:	0be7c703          	lbu	a4,190(a5)
    80001cda:	01056533          	or	a0,a0,a6
    80001cde:	05e2                	slli	a1,a1,0x18
    80001ce0:	0bf7c783          	lbu	a5,191(a5)
    80001ce4:	8dc9                	or	a1,a1,a0
    80001ce6:	1602                	slli	a2,a2,0x20
    80001ce8:	8e4d                	or	a2,a2,a1
    80001cea:	16a2                	slli	a3,a3,0x28
    80001cec:	8ed1                	or	a3,a3,a2
    80001cee:	1742                	slli	a4,a4,0x30
    80001cf0:	8f55                	or	a4,a4,a3
    80001cf2:	17e2                	slli	a5,a5,0x38
    80001cf4:	8fd9                	or	a5,a5,a4
    80001cf6:	c399                	beqz	a5,80001cfc <sbi_system_reboot+0xfc>
    80001cf8:	854a                	mv	a0,s2
    80001cfa:	9782                	jalr	a5
    80001cfc:	8526                	mv	a0,s1
    80001cfe:	8f8ff0ef          	jal	ra,80000df6 <sbi_exit>

0000000080001d02 <sbi_system_shutdown>:
    80001d02:	7179                	addi	sp,sp,-48
    80001d04:	f406                	sd	ra,40(sp)
    80001d06:	f022                	sd	s0,32(sp)
    80001d08:	ec26                	sd	s1,24(sp)
    80001d0a:	1800                	addi	s0,sp,48
    80001d0c:	e84a                	sd	s2,16(sp)
    80001d0e:	e44e                	sd	s3,8(sp)
    80001d10:	84aa                	mv	s1,a0
    80001d12:	892e                	mv	s2,a1
    80001d14:	06b050ef          	jal	ra,8000757e <sbi_current_hartid>
    80001d18:	0005099b          	sext.w	s3,a0
    80001d1c:	024060ef          	jal	ra,80007d40 <sbi_hart_available_mask>
    80001d20:	4785                	li	a5,1
    80001d22:	013797b3          	sll	a5,a5,s3
    80001d26:	fff7c793          	not	a5,a5
    80001d2a:	1782                	slli	a5,a5,0x20
    80001d2c:	9381                	srli	a5,a5,0x20
    80001d2e:	00a7f5b3          	and	a1,a5,a0
    80001d32:	4601                	li	a2,0
    80001d34:	8526                	mv	a0,s1
    80001d36:	e64ff0ef          	jal	ra,8000139a <sbi_ipi_send_halt>
    80001d3a:	0314c783          	lbu	a5,49(s1)
    80001d3e:	0304c703          	lbu	a4,48(s1)
    80001d42:	0324c503          	lbu	a0,50(s1)
    80001d46:	0334c583          	lbu	a1,51(s1)
    80001d4a:	0344c603          	lbu	a2,52(s1)
    80001d4e:	07a2                	slli	a5,a5,0x8
    80001d50:	8fd9                	or	a5,a5,a4
    80001d52:	0354c683          	lbu	a3,53(s1)
    80001d56:	0542                	slli	a0,a0,0x10
    80001d58:	8d5d                	or	a0,a0,a5
    80001d5a:	0364c703          	lbu	a4,54(s1)
    80001d5e:	05e2                	slli	a1,a1,0x18
    80001d60:	0374c783          	lbu	a5,55(s1)
    80001d64:	8dc9                	or	a1,a1,a0
    80001d66:	1602                	slli	a2,a2,0x20
    80001d68:	8e4d                	or	a2,a2,a1
    80001d6a:	16a2                	slli	a3,a3,0x28
    80001d6c:	8ed1                	or	a3,a3,a2
    80001d6e:	1742                	slli	a4,a4,0x30
    80001d70:	8f55                	or	a4,a4,a3
    80001d72:	17e2                	slli	a5,a5,0x38
    80001d74:	8fd9                	or	a5,a5,a4
    80001d76:	c7c1                	beqz	a5,80001dfe <sbi_system_shutdown+0xfc>
    80001d78:	0617c803          	lbu	a6,97(a5)
    80001d7c:	0607c703          	lbu	a4,96(a5)
    80001d80:	0627c503          	lbu	a0,98(a5)
    80001d84:	0637c583          	lbu	a1,99(a5)
    80001d88:	0647c603          	lbu	a2,100(a5)
    80001d8c:	0822                	slli	a6,a6,0x8
    80001d8e:	00e86833          	or	a6,a6,a4
    80001d92:	0657c683          	lbu	a3,101(a5)
    80001d96:	0542                	slli	a0,a0,0x10
    80001d98:	01056533          	or	a0,a0,a6
    80001d9c:	0667c703          	lbu	a4,102(a5)
    80001da0:	05e2                	slli	a1,a1,0x18
    80001da2:	8dc9                	or	a1,a1,a0
    80001da4:	0677c783          	lbu	a5,103(a5)
    80001da8:	1602                	slli	a2,a2,0x20
    80001daa:	8e4d                	or	a2,a2,a1
    80001dac:	16a2                	slli	a3,a3,0x28
    80001dae:	8ed1                	or	a3,a3,a2
    80001db0:	1742                	slli	a4,a4,0x30
    80001db2:	8f55                	or	a4,a4,a3
    80001db4:	17e2                	slli	a5,a5,0x38
    80001db6:	8fd9                	or	a5,a5,a4
    80001db8:	0c17c803          	lbu	a6,193(a5)
    80001dbc:	0c07c703          	lbu	a4,192(a5)
    80001dc0:	0c27c503          	lbu	a0,194(a5)
    80001dc4:	0c37c583          	lbu	a1,195(a5)
    80001dc8:	0c47c603          	lbu	a2,196(a5)
    80001dcc:	0822                	slli	a6,a6,0x8
    80001dce:	0c57c683          	lbu	a3,197(a5)
    80001dd2:	00e86833          	or	a6,a6,a4
    80001dd6:	0542                	slli	a0,a0,0x10
    80001dd8:	0c67c703          	lbu	a4,198(a5)
    80001ddc:	01056533          	or	a0,a0,a6
    80001de0:	05e2                	slli	a1,a1,0x18
    80001de2:	0c77c783          	lbu	a5,199(a5)
    80001de6:	8dc9                	or	a1,a1,a0
    80001de8:	1602                	slli	a2,a2,0x20
    80001dea:	8e4d                	or	a2,a2,a1
    80001dec:	16a2                	slli	a3,a3,0x28
    80001dee:	8ed1                	or	a3,a3,a2
    80001df0:	1742                	slli	a4,a4,0x30
    80001df2:	8f55                	or	a4,a4,a3
    80001df4:	17e2                	slli	a5,a5,0x38
    80001df6:	8fd9                	or	a5,a5,a4
    80001df8:	c399                	beqz	a5,80001dfe <sbi_system_shutdown+0xfc>
    80001dfa:	854a                	mv	a0,s2
    80001dfc:	9782                	jalr	a5
    80001dfe:	8526                	mv	a0,s1
    80001e00:	ff7fe0ef          	jal	ra,80000df6 <sbi_exit>

0000000080001e04 <get_ticks>:
    80001e04:	1141                	addi	sp,sp,-16
    80001e06:	e422                	sd	s0,8(sp)
    80001e08:	0800                	addi	s0,sp,16
    80001e0a:	c0102573          	rdtime	a0
    80001e0e:	6422                	ld	s0,8(sp)
    80001e10:	0141                	addi	sp,sp,16
    80001e12:	8082                	ret

0000000080001e14 <sbi_timer_value>:
    80001e14:	03154803          	lbu	a6,49(a0)
    80001e18:	03054783          	lbu	a5,48(a0)
    80001e1c:	03254583          	lbu	a1,50(a0)
    80001e20:	03354603          	lbu	a2,51(a0)
    80001e24:	03454683          	lbu	a3,52(a0)
    80001e28:	0822                	slli	a6,a6,0x8
    80001e2a:	03554703          	lbu	a4,53(a0)
    80001e2e:	00f86833          	or	a6,a6,a5
    80001e32:	05c2                	slli	a1,a1,0x10
    80001e34:	03654783          	lbu	a5,54(a0)
    80001e38:	0105e5b3          	or	a1,a1,a6
    80001e3c:	0662                	slli	a2,a2,0x18
    80001e3e:	03754503          	lbu	a0,55(a0)
    80001e42:	8e4d                	or	a2,a2,a1
    80001e44:	1682                	slli	a3,a3,0x20
    80001e46:	8ed1                	or	a3,a3,a2
    80001e48:	1722                	slli	a4,a4,0x28
    80001e4a:	8f55                	or	a4,a4,a3
    80001e4c:	17c2                	slli	a5,a5,0x30
    80001e4e:	8fd9                	or	a5,a5,a4
    80001e50:	1562                	slli	a0,a0,0x38
    80001e52:	8d5d                	or	a0,a0,a5
    80001e54:	04854783          	lbu	a5,72(a0)
    80001e58:	8b85                	andi	a5,a5,1
    80001e5a:	e781                	bnez	a5,80001e62 <sbi_timer_value+0x4e>
    80001e5c:	c0102573          	rdtime	a0
    80001e60:	8082                	ret
    80001e62:	cd41                	beqz	a0,80001efa <sbi_timer_value+0xe6>
    80001e64:	06154783          	lbu	a5,97(a0)
    80001e68:	06054703          	lbu	a4,96(a0)
    80001e6c:	06254803          	lbu	a6,98(a0)
    80001e70:	06354583          	lbu	a1,99(a0)
    80001e74:	06454603          	lbu	a2,100(a0)
    80001e78:	07a2                	slli	a5,a5,0x8
    80001e7a:	8fd9                	or	a5,a5,a4
    80001e7c:	06554683          	lbu	a3,101(a0)
    80001e80:	0842                	slli	a6,a6,0x10
    80001e82:	00f86833          	or	a6,a6,a5
    80001e86:	06654703          	lbu	a4,102(a0)
    80001e8a:	05e2                	slli	a1,a1,0x18
    80001e8c:	0105e5b3          	or	a1,a1,a6
    80001e90:	06754783          	lbu	a5,103(a0)
    80001e94:	1602                	slli	a2,a2,0x20
    80001e96:	8e4d                	or	a2,a2,a1
    80001e98:	16a2                	slli	a3,a3,0x28
    80001e9a:	8ed1                	or	a3,a3,a2
    80001e9c:	1742                	slli	a4,a4,0x30
    80001e9e:	8f55                	or	a4,a4,a3
    80001ea0:	17e2                	slli	a5,a5,0x38
    80001ea2:	8fd9                	or	a5,a5,a4
    80001ea4:	0917c803          	lbu	a6,145(a5)
    80001ea8:	0907c703          	lbu	a4,144(a5)
    80001eac:	0927c503          	lbu	a0,146(a5)
    80001eb0:	0937c583          	lbu	a1,147(a5)
    80001eb4:	0947c603          	lbu	a2,148(a5)
    80001eb8:	0822                	slli	a6,a6,0x8
    80001eba:	0957c683          	lbu	a3,149(a5)
    80001ebe:	00e86833          	or	a6,a6,a4
    80001ec2:	0542                	slli	a0,a0,0x10
    80001ec4:	0967c703          	lbu	a4,150(a5)
    80001ec8:	01056533          	or	a0,a0,a6
    80001ecc:	05e2                	slli	a1,a1,0x18
    80001ece:	8dc9                	or	a1,a1,a0
    80001ed0:	0977c783          	lbu	a5,151(a5)
    80001ed4:	1602                	slli	a2,a2,0x20
    80001ed6:	8e4d                	or	a2,a2,a1
    80001ed8:	16a2                	slli	a3,a3,0x28
    80001eda:	8ed1                	or	a3,a3,a2
    80001edc:	1742                	slli	a4,a4,0x30
    80001ede:	8f55                	or	a4,a4,a3
    80001ee0:	17e2                	slli	a5,a5,0x38
    80001ee2:	8fd9                	or	a5,a5,a4
    80001ee4:	4501                	li	a0,0
    80001ee6:	cb91                	beqz	a5,80001efa <sbi_timer_value+0xe6>
    80001ee8:	1141                	addi	sp,sp,-16
    80001eea:	e022                	sd	s0,0(sp)
    80001eec:	e406                	sd	ra,8(sp)
    80001eee:	0800                	addi	s0,sp,16
    80001ef0:	9782                	jalr	a5
    80001ef2:	60a2                	ld	ra,8(sp)
    80001ef4:	6402                	ld	s0,0(sp)
    80001ef6:	0141                	addi	sp,sp,16
    80001ef8:	8082                	ret
    80001efa:	8082                	ret

0000000080001efc <sbi_timer_virt_value>:
    80001efc:	1101                	addi	sp,sp,-32
    80001efe:	e822                	sd	s0,16(sp)
    80001f00:	e426                	sd	s1,8(sp)
    80001f02:	ec06                	sd	ra,24(sp)
    80001f04:	1000                	addi	s0,sp,32
    80001f06:	03154783          	lbu	a5,49(a0)
    80001f0a:	03054703          	lbu	a4,48(a0)
    80001f0e:	03254803          	lbu	a6,50(a0)
    80001f12:	03354583          	lbu	a1,51(a0)
    80001f16:	03454603          	lbu	a2,52(a0)
    80001f1a:	07a2                	slli	a5,a5,0x8
    80001f1c:	8fd9                	or	a5,a5,a4
    80001f1e:	03554683          	lbu	a3,53(a0)
    80001f22:	0842                	slli	a6,a6,0x10
    80001f24:	00f86833          	or	a6,a6,a5
    80001f28:	03654703          	lbu	a4,54(a0)
    80001f2c:	05e2                	slli	a1,a1,0x18
    80001f2e:	03754783          	lbu	a5,55(a0)
    80001f32:	0105e5b3          	or	a1,a1,a6
    80001f36:	1602                	slli	a2,a2,0x20
    80001f38:	8e4d                	or	a2,a2,a1
    80001f3a:	16a2                	slli	a3,a3,0x28
    80001f3c:	8ed1                	or	a3,a3,a2
    80001f3e:	1742                	slli	a4,a4,0x30
    80001f40:	8f55                	or	a4,a4,a3
    80001f42:	17e2                	slli	a5,a5,0x38
    80001f44:	8fd9                	or	a5,a5,a4
    80001f46:	0487c703          	lbu	a4,72(a5)
    80001f4a:	0000d497          	auipc	s1,0xd
    80001f4e:	0d64b483          	ld	s1,214(s1) # 8000f020 <time_delta_off>
    80001f52:	94aa                	add	s1,s1,a0
    80001f54:	8b05                	andi	a4,a4,1
    80001f56:	eb11                	bnez	a4,80001f6a <sbi_timer_virt_value+0x6e>
    80001f58:	c01027f3          	rdtime	a5
    80001f5c:	6088                	ld	a0,0(s1)
    80001f5e:	60e2                	ld	ra,24(sp)
    80001f60:	6442                	ld	s0,16(sp)
    80001f62:	64a2                	ld	s1,8(sp)
    80001f64:	953e                	add	a0,a0,a5
    80001f66:	6105                	addi	sp,sp,32
    80001f68:	8082                	ret
    80001f6a:	dbed                	beqz	a5,80001f5c <sbi_timer_virt_value+0x60>
    80001f6c:	0617c803          	lbu	a6,97(a5)
    80001f70:	0607c703          	lbu	a4,96(a5)
    80001f74:	0627c503          	lbu	a0,98(a5)
    80001f78:	0637c583          	lbu	a1,99(a5)
    80001f7c:	0647c603          	lbu	a2,100(a5)
    80001f80:	0822                	slli	a6,a6,0x8
    80001f82:	00e86833          	or	a6,a6,a4
    80001f86:	0657c683          	lbu	a3,101(a5)
    80001f8a:	0542                	slli	a0,a0,0x10
    80001f8c:	01056533          	or	a0,a0,a6
    80001f90:	0667c703          	lbu	a4,102(a5)
    80001f94:	05e2                	slli	a1,a1,0x18
    80001f96:	8dc9                	or	a1,a1,a0
    80001f98:	0677c783          	lbu	a5,103(a5)
    80001f9c:	1602                	slli	a2,a2,0x20
    80001f9e:	8e4d                	or	a2,a2,a1
    80001fa0:	16a2                	slli	a3,a3,0x28
    80001fa2:	8ed1                	or	a3,a3,a2
    80001fa4:	1742                	slli	a4,a4,0x30
    80001fa6:	8f55                	or	a4,a4,a3
    80001fa8:	17e2                	slli	a5,a5,0x38
    80001faa:	8fd9                	or	a5,a5,a4
    80001fac:	0917c703          	lbu	a4,145(a5)
    80001fb0:	0907c683          	lbu	a3,144(a5)
    80001fb4:	0927c803          	lbu	a6,146(a5)
    80001fb8:	0937c503          	lbu	a0,147(a5)
    80001fbc:	0947c583          	lbu	a1,148(a5)
    80001fc0:	0722                	slli	a4,a4,0x8
    80001fc2:	0957c603          	lbu	a2,149(a5)
    80001fc6:	8f55                	or	a4,a4,a3
    80001fc8:	0842                	slli	a6,a6,0x10
    80001fca:	0967c683          	lbu	a3,150(a5)
    80001fce:	00e86833          	or	a6,a6,a4
    80001fd2:	0562                	slli	a0,a0,0x18
    80001fd4:	0977c703          	lbu	a4,151(a5)
    80001fd8:	1582                	slli	a1,a1,0x20
    80001fda:	010567b3          	or	a5,a0,a6
    80001fde:	8ddd                	or	a1,a1,a5
    80001fe0:	02861793          	slli	a5,a2,0x28
    80001fe4:	00b7e633          	or	a2,a5,a1
    80001fe8:	03069793          	slli	a5,a3,0x30
    80001fec:	8fd1                	or	a5,a5,a2
    80001fee:	1762                	slli	a4,a4,0x38
    80001ff0:	8f5d                	or	a4,a4,a5
    80001ff2:	4781                	li	a5,0
    80001ff4:	d725                	beqz	a4,80001f5c <sbi_timer_virt_value+0x60>
    80001ff6:	9702                	jalr	a4
    80001ff8:	60e2                	ld	ra,24(sp)
    80001ffa:	6442                	ld	s0,16(sp)
    80001ffc:	87aa                	mv	a5,a0
    80001ffe:	6088                	ld	a0,0(s1)
    80002000:	64a2                	ld	s1,8(sp)
    80002002:	953e                	add	a0,a0,a5
    80002004:	6105                	addi	sp,sp,32
    80002006:	8082                	ret

0000000080002008 <sbi_timer_get_delta>:
    80002008:	1141                	addi	sp,sp,-16
    8000200a:	e422                	sd	s0,8(sp)
    8000200c:	0800                	addi	s0,sp,16
    8000200e:	6422                	ld	s0,8(sp)
    80002010:	0000d797          	auipc	a5,0xd
    80002014:	0107b783          	ld	a5,16(a5) # 8000f020 <time_delta_off>
    80002018:	953e                	add	a0,a0,a5
    8000201a:	6108                	ld	a0,0(a0)
    8000201c:	0141                	addi	sp,sp,16
    8000201e:	8082                	ret

0000000080002020 <sbi_timer_set_delta>:
    80002020:	1141                	addi	sp,sp,-16
    80002022:	e422                	sd	s0,8(sp)
    80002024:	0800                	addi	s0,sp,16
    80002026:	0000d797          	auipc	a5,0xd
    8000202a:	ffa7b783          	ld	a5,-6(a5) # 8000f020 <time_delta_off>
    8000202e:	953e                	add	a0,a0,a5
    80002030:	e10c                	sd	a1,0(a0)
    80002032:	6422                	ld	s0,8(sp)
    80002034:	0141                	addi	sp,sp,16
    80002036:	8082                	ret

0000000080002038 <sbi_timer_set_delta_upper>:
    80002038:	1141                	addi	sp,sp,-16
    8000203a:	e422                	sd	s0,8(sp)
    8000203c:	0800                	addi	s0,sp,16
    8000203e:	0000d797          	auipc	a5,0xd
    80002042:	fe27b783          	ld	a5,-30(a5) # 8000f020 <time_delta_off>
    80002046:	953e                	add	a0,a0,a5
    80002048:	c14c                	sw	a1,4(a0)
    8000204a:	6422                	ld	s0,8(sp)
    8000204c:	0141                	addi	sp,sp,16
    8000204e:	8082                	ret

0000000080002050 <sbi_timer_event_start>:
    80002050:	03154783          	lbu	a5,49(a0)
    80002054:	03054703          	lbu	a4,48(a0)
    80002058:	03254883          	lbu	a7,50(a0)
    8000205c:	03354803          	lbu	a6,51(a0)
    80002060:	03454603          	lbu	a2,52(a0)
    80002064:	07a2                	slli	a5,a5,0x8
    80002066:	8fd9                	or	a5,a5,a4
    80002068:	03554683          	lbu	a3,53(a0)
    8000206c:	08c2                	slli	a7,a7,0x10
    8000206e:	03654703          	lbu	a4,54(a0)
    80002072:	00f8e8b3          	or	a7,a7,a5
    80002076:	0862                	slli	a6,a6,0x18
    80002078:	03754783          	lbu	a5,55(a0)
    8000207c:	1602                	slli	a2,a2,0x20
    8000207e:	01186533          	or	a0,a6,a7
    80002082:	8e49                	or	a2,a2,a0
    80002084:	16a2                	slli	a3,a3,0x28
    80002086:	8ed1                	or	a3,a3,a2
    80002088:	1742                	slli	a4,a4,0x30
    8000208a:	8f55                	or	a4,a4,a3
    8000208c:	17e2                	slli	a5,a5,0x38
    8000208e:	8fd9                	or	a5,a5,a4
    80002090:	c7dd                	beqz	a5,8000213e <sbi_timer_event_start+0xee>
    80002092:	0617c883          	lbu	a7,97(a5)
    80002096:	0607c703          	lbu	a4,96(a5)
    8000209a:	0627c803          	lbu	a6,98(a5)
    8000209e:	852e                	mv	a0,a1
    800020a0:	0637c583          	lbu	a1,99(a5)
    800020a4:	0647c603          	lbu	a2,100(a5)
    800020a8:	08a2                	slli	a7,a7,0x8
    800020aa:	00e8e8b3          	or	a7,a7,a4
    800020ae:	0657c683          	lbu	a3,101(a5)
    800020b2:	0842                	slli	a6,a6,0x10
    800020b4:	01186833          	or	a6,a6,a7
    800020b8:	0667c703          	lbu	a4,102(a5)
    800020bc:	05e2                	slli	a1,a1,0x18
    800020be:	0105e5b3          	or	a1,a1,a6
    800020c2:	0677c783          	lbu	a5,103(a5)
    800020c6:	1602                	slli	a2,a2,0x20
    800020c8:	8e4d                	or	a2,a2,a1
    800020ca:	16a2                	slli	a3,a3,0x28
    800020cc:	8ed1                	or	a3,a3,a2
    800020ce:	1742                	slli	a4,a4,0x30
    800020d0:	8f55                	or	a4,a4,a3
    800020d2:	17e2                	slli	a5,a5,0x38
    800020d4:	8fd9                	or	a5,a5,a4
    800020d6:	0997c303          	lbu	t1,153(a5)
    800020da:	0987c703          	lbu	a4,152(a5)
    800020de:	09a7c883          	lbu	a7,154(a5)
    800020e2:	09b7c803          	lbu	a6,155(a5)
    800020e6:	09c7c603          	lbu	a2,156(a5)
    800020ea:	0322                	slli	t1,t1,0x8
    800020ec:	09d7c683          	lbu	a3,157(a5)
    800020f0:	00e36333          	or	t1,t1,a4
    800020f4:	08c2                	slli	a7,a7,0x10
    800020f6:	09e7c703          	lbu	a4,158(a5)
    800020fa:	0068e8b3          	or	a7,a7,t1
    800020fe:	0862                	slli	a6,a6,0x18
    80002100:	09f7c783          	lbu	a5,159(a5)
    80002104:	01186833          	or	a6,a6,a7
    80002108:	1602                	slli	a2,a2,0x20
    8000210a:	01066633          	or	a2,a2,a6
    8000210e:	16a2                	slli	a3,a3,0x28
    80002110:	8ed1                	or	a3,a3,a2
    80002112:	1742                	slli	a4,a4,0x30
    80002114:	8f55                	or	a4,a4,a3
    80002116:	17e2                	slli	a5,a5,0x38
    80002118:	8fd9                	or	a5,a5,a4
    8000211a:	c395                	beqz	a5,8000213e <sbi_timer_event_start+0xee>
    8000211c:	1141                	addi	sp,sp,-16
    8000211e:	e022                	sd	s0,0(sp)
    80002120:	e406                	sd	ra,8(sp)
    80002122:	0800                	addi	s0,sp,16
    80002124:	9782                	jalr	a5
    80002126:	02000793          	li	a5,32
    8000212a:	3447b073          	csrc	mip,a5
    8000212e:	08000793          	li	a5,128
    80002132:	3047a073          	csrs	mie,a5
    80002136:	60a2                	ld	ra,8(sp)
    80002138:	6402                	ld	s0,0(sp)
    8000213a:	0141                	addi	sp,sp,16
    8000213c:	8082                	ret
    8000213e:	02000793          	li	a5,32
    80002142:	3447b073          	csrc	mip,a5
    80002146:	08000793          	li	a5,128
    8000214a:	3047a073          	csrs	mie,a5
    8000214e:	8082                	ret

0000000080002150 <sbi_timer_process>:
    80002150:	1141                	addi	sp,sp,-16
    80002152:	e422                	sd	s0,8(sp)
    80002154:	0800                	addi	s0,sp,16
    80002156:	08000793          	li	a5,128
    8000215a:	3047b073          	csrc	mie,a5
    8000215e:	02000793          	li	a5,32
    80002162:	3447a073          	csrs	mip,a5
    80002166:	6422                	ld	s0,8(sp)
    80002168:	0141                	addi	sp,sp,16
    8000216a:	8082                	ret

000000008000216c <sbi_timer_init>:
    8000216c:	1101                	addi	sp,sp,-32
    8000216e:	e822                	sd	s0,16(sp)
    80002170:	e426                	sd	s1,8(sp)
    80002172:	e04a                	sd	s2,0(sp)
    80002174:	ec06                	sd	ra,24(sp)
    80002176:	1000                	addi	s0,sp,32
    80002178:	892e                	mv	s2,a1
    8000217a:	84aa                	mv	s1,a0
    8000217c:	e5fd                	bnez	a1,8000226a <sbi_timer_init+0xfe>
    8000217e:	0000d517          	auipc	a0,0xd
    80002182:	ea253503          	ld	a0,-350(a0) # 8000f020 <time_delta_off>
    80002186:	0e050e63          	beqz	a0,80002282 <sbi_timer_init+0x116>
    8000218a:	9526                	add	a0,a0,s1
    8000218c:	00053023          	sd	zero,0(a0)
    80002190:	0314c783          	lbu	a5,49(s1)
    80002194:	0304c703          	lbu	a4,48(s1)
    80002198:	0324c583          	lbu	a1,50(s1)
    8000219c:	0334c803          	lbu	a6,51(s1)
    800021a0:	0344c603          	lbu	a2,52(s1)
    800021a4:	07a2                	slli	a5,a5,0x8
    800021a6:	8fd9                	or	a5,a5,a4
    800021a8:	0354c683          	lbu	a3,53(s1)
    800021ac:	05c2                	slli	a1,a1,0x10
    800021ae:	8ddd                	or	a1,a1,a5
    800021b0:	0364c703          	lbu	a4,54(s1)
    800021b4:	0862                	slli	a6,a6,0x18
    800021b6:	0374c783          	lbu	a5,55(s1)
    800021ba:	00b86833          	or	a6,a6,a1
    800021be:	1602                	slli	a2,a2,0x20
    800021c0:	01066633          	or	a2,a2,a6
    800021c4:	16a2                	slli	a3,a3,0x28
    800021c6:	8ed1                	or	a3,a3,a2
    800021c8:	1742                	slli	a4,a4,0x30
    800021ca:	8f55                	or	a4,a4,a3
    800021cc:	17e2                	slli	a5,a5,0x38
    800021ce:	8fd9                	or	a5,a5,a4
    800021d0:	4501                	li	a0,0
    800021d2:	c7d1                	beqz	a5,8000225e <sbi_timer_init+0xf2>
    800021d4:	0617c883          	lbu	a7,97(a5)
    800021d8:	0607c703          	lbu	a4,96(a5)
    800021dc:	0627c803          	lbu	a6,98(a5)
    800021e0:	0637c583          	lbu	a1,99(a5)
    800021e4:	0647c603          	lbu	a2,100(a5)
    800021e8:	08a2                	slli	a7,a7,0x8
    800021ea:	00e8e8b3          	or	a7,a7,a4
    800021ee:	0657c683          	lbu	a3,101(a5)
    800021f2:	0842                	slli	a6,a6,0x10
    800021f4:	01186833          	or	a6,a6,a7
    800021f8:	0667c703          	lbu	a4,102(a5)
    800021fc:	05e2                	slli	a1,a1,0x18
    800021fe:	0105e5b3          	or	a1,a1,a6
    80002202:	0677c783          	lbu	a5,103(a5)
    80002206:	1602                	slli	a2,a2,0x20
    80002208:	8e4d                	or	a2,a2,a1
    8000220a:	16a2                	slli	a3,a3,0x28
    8000220c:	8ed1                	or	a3,a3,a2
    8000220e:	1742                	slli	a4,a4,0x30
    80002210:	8f55                	or	a4,a4,a3
    80002212:	17e2                	slli	a5,a5,0x38
    80002214:	8fd9                	or	a5,a5,a4
    80002216:	0a97c883          	lbu	a7,169(a5)
    8000221a:	0a87c703          	lbu	a4,168(a5)
    8000221e:	0aa7c803          	lbu	a6,170(a5)
    80002222:	0ab7c583          	lbu	a1,171(a5)
    80002226:	0ac7c603          	lbu	a2,172(a5)
    8000222a:	08a2                	slli	a7,a7,0x8
    8000222c:	0ad7c683          	lbu	a3,173(a5)
    80002230:	00e8e8b3          	or	a7,a7,a4
    80002234:	0842                	slli	a6,a6,0x10
    80002236:	0ae7c703          	lbu	a4,174(a5)
    8000223a:	01186833          	or	a6,a6,a7
    8000223e:	05e2                	slli	a1,a1,0x18
    80002240:	0af7c783          	lbu	a5,175(a5)
    80002244:	0105e5b3          	or	a1,a1,a6
    80002248:	1602                	slli	a2,a2,0x20
    8000224a:	8e4d                	or	a2,a2,a1
    8000224c:	16a2                	slli	a3,a3,0x28
    8000224e:	8ed1                	or	a3,a3,a2
    80002250:	1742                	slli	a4,a4,0x30
    80002252:	8f55                	or	a4,a4,a3
    80002254:	17e2                	slli	a5,a5,0x38
    80002256:	8fd9                	or	a5,a5,a4
    80002258:	c399                	beqz	a5,8000225e <sbi_timer_init+0xf2>
    8000225a:	854a                	mv	a0,s2
    8000225c:	9782                	jalr	a5
    8000225e:	60e2                	ld	ra,24(sp)
    80002260:	6442                	ld	s0,16(sp)
    80002262:	64a2                	ld	s1,8(sp)
    80002264:	6902                	ld	s2,0(sp)
    80002266:	6105                	addi	sp,sp,32
    80002268:	8082                	ret
    8000226a:	0000a597          	auipc	a1,0xa
    8000226e:	00658593          	addi	a1,a1,6 # 8000c270 <fdt_move+0x6bc>
    80002272:	4521                	li	a0,8
    80002274:	d10ff0ef          	jal	ra,80001784 <sbi_scratch_alloc_offset>
    80002278:	0000d797          	auipc	a5,0xd
    8000227c:	daa7b423          	sd	a0,-600(a5) # 8000f020 <time_delta_off>
    80002280:	f509                	bnez	a0,8000218a <sbi_timer_init+0x1e>
    80002282:	5551                	li	a0,-12
    80002284:	bfe9                	j	8000225e <sbi_timer_init+0xf2>

0000000080002286 <sbi_timer_exit>:
    80002286:	1101                	addi	sp,sp,-32
    80002288:	e822                	sd	s0,16(sp)
    8000228a:	e426                	sd	s1,8(sp)
    8000228c:	ec06                	sd	ra,24(sp)
    8000228e:	1000                	addi	s0,sp,32
    80002290:	03154783          	lbu	a5,49(a0)
    80002294:	84aa                	mv	s1,a0
    80002296:	03054703          	lbu	a4,48(a0)
    8000229a:	03254503          	lbu	a0,50(a0)
    8000229e:	0334c583          	lbu	a1,51(s1)
    800022a2:	0344c603          	lbu	a2,52(s1)
    800022a6:	07a2                	slli	a5,a5,0x8
    800022a8:	8fd9                	or	a5,a5,a4
    800022aa:	0354c683          	lbu	a3,53(s1)
    800022ae:	0542                	slli	a0,a0,0x10
    800022b0:	8d5d                	or	a0,a0,a5
    800022b2:	0364c703          	lbu	a4,54(s1)
    800022b6:	05e2                	slli	a1,a1,0x18
    800022b8:	0374c783          	lbu	a5,55(s1)
    800022bc:	8dc9                	or	a1,a1,a0
    800022be:	1602                	slli	a2,a2,0x20
    800022c0:	8e4d                	or	a2,a2,a1
    800022c2:	16a2                	slli	a3,a3,0x28
    800022c4:	8ed1                	or	a3,a3,a2
    800022c6:	1742                	slli	a4,a4,0x30
    800022c8:	8f55                	or	a4,a4,a3
    800022ca:	17e2                	slli	a5,a5,0x38
    800022cc:	8fd9                	or	a5,a5,a4
    800022ce:	c3d9                	beqz	a5,80002354 <sbi_timer_exit+0xce>
    800022d0:	0617c803          	lbu	a6,97(a5)
    800022d4:	0607c703          	lbu	a4,96(a5)
    800022d8:	0627c503          	lbu	a0,98(a5)
    800022dc:	0637c583          	lbu	a1,99(a5)
    800022e0:	0647c603          	lbu	a2,100(a5)
    800022e4:	0822                	slli	a6,a6,0x8
    800022e6:	00e86833          	or	a6,a6,a4
    800022ea:	0657c683          	lbu	a3,101(a5)
    800022ee:	0542                	slli	a0,a0,0x10
    800022f0:	01056533          	or	a0,a0,a6
    800022f4:	0667c703          	lbu	a4,102(a5)
    800022f8:	05e2                	slli	a1,a1,0x18
    800022fa:	8dc9                	or	a1,a1,a0
    800022fc:	0677c783          	lbu	a5,103(a5)
    80002300:	1602                	slli	a2,a2,0x20
    80002302:	8e4d                	or	a2,a2,a1
    80002304:	16a2                	slli	a3,a3,0x28
    80002306:	8ed1                	or	a3,a3,a2
    80002308:	1742                	slli	a4,a4,0x30
    8000230a:	8f55                	or	a4,a4,a3
    8000230c:	17e2                	slli	a5,a5,0x38
    8000230e:	8fd9                	or	a5,a5,a4
    80002310:	0a17c803          	lbu	a6,161(a5)
    80002314:	0a07c703          	lbu	a4,160(a5)
    80002318:	0a27c503          	lbu	a0,162(a5)
    8000231c:	0a37c583          	lbu	a1,163(a5)
    80002320:	0a47c603          	lbu	a2,164(a5)
    80002324:	0822                	slli	a6,a6,0x8
    80002326:	0a57c683          	lbu	a3,165(a5)
    8000232a:	00e86833          	or	a6,a6,a4
    8000232e:	0542                	slli	a0,a0,0x10
    80002330:	0a67c703          	lbu	a4,166(a5)
    80002334:	01056533          	or	a0,a0,a6
    80002338:	05e2                	slli	a1,a1,0x18
    8000233a:	0a77c783          	lbu	a5,167(a5)
    8000233e:	8dc9                	or	a1,a1,a0
    80002340:	1602                	slli	a2,a2,0x20
    80002342:	8e4d                	or	a2,a2,a1
    80002344:	16a2                	slli	a3,a3,0x28
    80002346:	8ed1                	or	a3,a3,a2
    80002348:	1742                	slli	a4,a4,0x30
    8000234a:	8f55                	or	a4,a4,a3
    8000234c:	17e2                	slli	a5,a5,0x38
    8000234e:	8fd9                	or	a5,a5,a4
    80002350:	c391                	beqz	a5,80002354 <sbi_timer_exit+0xce>
    80002352:	9782                	jalr	a5
    80002354:	02000793          	li	a5,32
    80002358:	3447b073          	csrc	mip,a5
    8000235c:	08000793          	li	a5,128
    80002360:	3047b073          	csrc	mie,a5
    80002364:	0314c783          	lbu	a5,49(s1)
    80002368:	0304c703          	lbu	a4,48(s1)
    8000236c:	0324c503          	lbu	a0,50(s1)
    80002370:	0334c583          	lbu	a1,51(s1)
    80002374:	0344c603          	lbu	a2,52(s1)
    80002378:	07a2                	slli	a5,a5,0x8
    8000237a:	8fd9                	or	a5,a5,a4
    8000237c:	0354c683          	lbu	a3,53(s1)
    80002380:	0542                	slli	a0,a0,0x10
    80002382:	8d5d                	or	a0,a0,a5
    80002384:	0364c703          	lbu	a4,54(s1)
    80002388:	05e2                	slli	a1,a1,0x18
    8000238a:	0374c783          	lbu	a5,55(s1)
    8000238e:	8dc9                	or	a1,a1,a0
    80002390:	1602                	slli	a2,a2,0x20
    80002392:	8e4d                	or	a2,a2,a1
    80002394:	16a2                	slli	a3,a3,0x28
    80002396:	8ed1                	or	a3,a3,a2
    80002398:	1742                	slli	a4,a4,0x30
    8000239a:	8f55                	or	a4,a4,a3
    8000239c:	17e2                	slli	a5,a5,0x38
    8000239e:	8fd9                	or	a5,a5,a4
    800023a0:	c3d9                	beqz	a5,80002426 <sbi_timer_exit+0x1a0>
    800023a2:	0617c803          	lbu	a6,97(a5)
    800023a6:	0607c703          	lbu	a4,96(a5)
    800023aa:	0627c503          	lbu	a0,98(a5)
    800023ae:	0637c583          	lbu	a1,99(a5)
    800023b2:	0647c603          	lbu	a2,100(a5)
    800023b6:	0822                	slli	a6,a6,0x8
    800023b8:	00e86833          	or	a6,a6,a4
    800023bc:	0657c683          	lbu	a3,101(a5)
    800023c0:	0542                	slli	a0,a0,0x10
    800023c2:	01056533          	or	a0,a0,a6
    800023c6:	0667c703          	lbu	a4,102(a5)
    800023ca:	05e2                	slli	a1,a1,0x18
    800023cc:	8dc9                	or	a1,a1,a0
    800023ce:	0677c783          	lbu	a5,103(a5)
    800023d2:	1602                	slli	a2,a2,0x20
    800023d4:	8e4d                	or	a2,a2,a1
    800023d6:	16a2                	slli	a3,a3,0x28
    800023d8:	8ed1                	or	a3,a3,a2
    800023da:	1742                	slli	a4,a4,0x30
    800023dc:	8f55                	or	a4,a4,a3
    800023de:	17e2                	slli	a5,a5,0x38
    800023e0:	8fd9                	or	a5,a5,a4
    800023e2:	0b17c803          	lbu	a6,177(a5)
    800023e6:	0b07c703          	lbu	a4,176(a5)
    800023ea:	0b27c503          	lbu	a0,178(a5)
    800023ee:	0b37c583          	lbu	a1,179(a5)
    800023f2:	0b47c603          	lbu	a2,180(a5)
    800023f6:	0822                	slli	a6,a6,0x8
    800023f8:	0b57c683          	lbu	a3,181(a5)
    800023fc:	00e86833          	or	a6,a6,a4
    80002400:	0542                	slli	a0,a0,0x10
    80002402:	0b67c703          	lbu	a4,182(a5)
    80002406:	01056533          	or	a0,a0,a6
    8000240a:	05e2                	slli	a1,a1,0x18
    8000240c:	0b77c783          	lbu	a5,183(a5)
    80002410:	8dc9                	or	a1,a1,a0
    80002412:	1602                	slli	a2,a2,0x20
    80002414:	8e4d                	or	a2,a2,a1
    80002416:	16a2                	slli	a3,a3,0x28
    80002418:	8ed1                	or	a3,a3,a2
    8000241a:	1742                	slli	a4,a4,0x30
    8000241c:	8f55                	or	a4,a4,a3
    8000241e:	17e2                	slli	a5,a5,0x38
    80002420:	8fd9                	or	a5,a5,a4
    80002422:	c391                	beqz	a5,80002426 <sbi_timer_exit+0x1a0>
    80002424:	9782                	jalr	a5
    80002426:	60e2                	ld	ra,24(sp)
    80002428:	6442                	ld	s0,16(sp)
    8000242a:	64a2                	ld	s1,8(sp)
    8000242c:	6105                	addi	sp,sp,32
    8000242e:	8082                	ret

0000000080002430 <sbi_tlb_local_flush>:
    80002430:	7139                	addi	sp,sp,-64
    80002432:	f822                	sd	s0,48(sp)
    80002434:	fc06                	sd	ra,56(sp)
    80002436:	f426                	sd	s1,40(sp)
    80002438:	f04a                	sd	s2,32(sp)
    8000243a:	ec4e                	sd	s3,24(sp)
    8000243c:	e852                	sd	s4,16(sp)
    8000243e:	e456                	sd	s5,8(sp)
    80002440:	0080                	addi	s0,sp,64
    80002442:	6d0c                	ld	a1,24(a0)
    80002444:	4799                	li	a5,6
    80002446:	12b7ec63          	bltu	a5,a1,8000257e <sbi_tlb_local_flush+0x14e>
    8000244a:	0000a697          	auipc	a3,0xa
    8000244e:	eb268693          	addi	a3,a3,-334 # 8000c2fc <fdt_move+0x748>
    80002452:	00259713          	slli	a4,a1,0x2
    80002456:	9736                	add	a4,a4,a3
    80002458:	431c                	lw	a5,0(a4)
    8000245a:	97b6                	add	a5,a5,a3
    8000245c:	8782                	jr	a5
    8000245e:	00053983          	ld	s3,0(a0)
    80002462:	00853903          	ld	s2,8(a0)
    80002466:	0129e7b3          	or	a5,s3,s2
    8000246a:	12078463          	beqz	a5,80002592 <sbi_tlb_local_flush+0x162>
    8000246e:	57fd                	li	a5,-1
    80002470:	01053a03          	ld	s4,16(a0)
    80002474:	12f90863          	beq	s2,a5,800025a4 <sbi_tlb_local_flush+0x174>
    80002478:	4481                	li	s1,0
    8000247a:	6a85                	lui	s5,0x1
    8000247c:	00090d63          	beqz	s2,80002496 <sbi_tlb_local_flush+0x66>
    80002480:	013485b3          	add	a1,s1,s3
    80002484:	8552                	mv	a0,s4
    80002486:	94d6                	add	s1,s1,s5
    80002488:	0d8050ef          	jal	ra,80007560 <__sbi_hfence_vvma_asid_va>
    8000248c:	ff24eae3          	bltu	s1,s2,80002480 <sbi_tlb_local_flush+0x50>
    80002490:	a019                	j	80002496 <sbi_tlb_local_flush+0x66>
    80002492:	0000100f          	fence.i
    80002496:	70e2                	ld	ra,56(sp)
    80002498:	7442                	ld	s0,48(sp)
    8000249a:	74a2                	ld	s1,40(sp)
    8000249c:	7902                	ld	s2,32(sp)
    8000249e:	69e2                	ld	s3,24(sp)
    800024a0:	6a42                	ld	s4,16(sp)
    800024a2:	6aa2                	ld	s5,8(sp)
    800024a4:	6121                	addi	sp,sp,64
    800024a6:	8082                	ret
    800024a8:	6114                	ld	a3,0(a0)
    800024aa:	6518                	ld	a4,8(a0)
    800024ac:	00e6e7b3          	or	a5,a3,a4
    800024b0:	cff1                	beqz	a5,8000258c <sbi_tlb_local_flush+0x15c>
    800024b2:	57fd                	li	a5,-1
    800024b4:	0cf70c63          	beq	a4,a5,8000258c <sbi_tlb_local_flush+0x15c>
    800024b8:	6605                	lui	a2,0x1
    800024ba:	df71                	beqz	a4,80002496 <sbi_tlb_local_flush+0x66>
    800024bc:	00b687b3          	add	a5,a3,a1
    800024c0:	12078073          	sfence.vma	a5
    800024c4:	95b2                	add	a1,a1,a2
    800024c6:	fee5ebe3          	bltu	a1,a4,800024bc <sbi_tlb_local_flush+0x8c>
    800024ca:	b7f1                	j	80002496 <sbi_tlb_local_flush+0x66>
    800024cc:	6110                	ld	a2,0(a0)
    800024ce:	6514                	ld	a3,8(a0)
    800024d0:	00d667b3          	or	a5,a2,a3
    800024d4:	cfc5                	beqz	a5,8000258c <sbi_tlb_local_flush+0x15c>
    800024d6:	57fd                	li	a5,-1
    800024d8:	690c                	ld	a1,16(a0)
    800024da:	0cf68263          	beq	a3,a5,8000259e <sbi_tlb_local_flush+0x16e>
    800024de:	4781                	li	a5,0
    800024e0:	6505                	lui	a0,0x1
    800024e2:	dad5                	beqz	a3,80002496 <sbi_tlb_local_flush+0x66>
    800024e4:	00c78733          	add	a4,a5,a2
    800024e8:	12b70073          	sfence.vma	a4,a1
    800024ec:	97aa                	add	a5,a5,a0
    800024ee:	fed7ebe3          	bltu	a5,a3,800024e4 <sbi_tlb_local_flush+0xb4>
    800024f2:	b755                	j	80002496 <sbi_tlb_local_flush+0x66>
    800024f4:	00053983          	ld	s3,0(a0) # 1000 <_fw_start-0x7ffff000>
    800024f8:	00853903          	ld	s2,8(a0)
    800024fc:	0129e7b3          	or	a5,s3,s2
    80002500:	cfc1                	beqz	a5,80002598 <sbi_tlb_local_flush+0x168>
    80002502:	57fd                	li	a5,-1
    80002504:	01053a03          	ld	s4,16(a0)
    80002508:	0af90263          	beq	s2,a5,800025ac <sbi_tlb_local_flush+0x17c>
    8000250c:	4481                	li	s1,0
    8000250e:	6a85                	lui	s5,0x1
    80002510:	f80903e3          	beqz	s2,80002496 <sbi_tlb_local_flush+0x66>
    80002514:	009985b3          	add	a1,s3,s1
    80002518:	8552                	mv	a0,s4
    8000251a:	94d6                	add	s1,s1,s5
    8000251c:	024050ef          	jal	ra,80007540 <__sbi_hfence_gvma_vmid_gpa>
    80002520:	ff24eae3          	bltu	s1,s2,80002514 <sbi_tlb_local_flush+0xe4>
    80002524:	bf8d                	j	80002496 <sbi_tlb_local_flush+0x66>
    80002526:	00053983          	ld	s3,0(a0)
    8000252a:	00853903          	ld	s2,8(a0)
    8000252e:	0129e7b3          	or	a5,s3,s2
    80002532:	c3a5                	beqz	a5,80002592 <sbi_tlb_local_flush+0x162>
    80002534:	57fd                	li	a5,-1
    80002536:	04f90e63          	beq	s2,a5,80002592 <sbi_tlb_local_flush+0x162>
    8000253a:	4481                	li	s1,0
    8000253c:	6a05                	lui	s4,0x1
    8000253e:	f4090ce3          	beqz	s2,80002496 <sbi_tlb_local_flush+0x66>
    80002542:	00998533          	add	a0,s3,s1
    80002546:	94d2                	add	s1,s1,s4
    80002548:	028050ef          	jal	ra,80007570 <__sbi_hfence_vvma_va>
    8000254c:	ff24ebe3          	bltu	s1,s2,80002542 <sbi_tlb_local_flush+0x112>
    80002550:	b799                	j	80002496 <sbi_tlb_local_flush+0x66>
    80002552:	00053983          	ld	s3,0(a0)
    80002556:	00853903          	ld	s2,8(a0)
    8000255a:	0129e7b3          	or	a5,s3,s2
    8000255e:	cf8d                	beqz	a5,80002598 <sbi_tlb_local_flush+0x168>
    80002560:	57fd                	li	a5,-1
    80002562:	02f90b63          	beq	s2,a5,80002598 <sbi_tlb_local_flush+0x168>
    80002566:	4481                	li	s1,0
    80002568:	6a05                	lui	s4,0x1
    8000256a:	f20906e3          	beqz	s2,80002496 <sbi_tlb_local_flush+0x66>
    8000256e:	00998533          	add	a0,s3,s1
    80002572:	94d2                	add	s1,s1,s4
    80002574:	7dd040ef          	jal	ra,80007550 <__sbi_hfence_gvma_gpa>
    80002578:	ff24ebe3          	bltu	s1,s2,8000256e <sbi_tlb_local_flush+0x13e>
    8000257c:	bf29                	j	80002496 <sbi_tlb_local_flush+0x66>
    8000257e:	0000a517          	auipc	a0,0xa
    80002582:	d0250513          	addi	a0,a0,-766 # 8000c280 <fdt_move+0x6cc>
    80002586:	699020ef          	jal	ra,8000541e <sbi_printf>
    8000258a:	b731                	j	80002496 <sbi_tlb_local_flush+0x66>
    8000258c:	12000073          	sfence.vma
    80002590:	b719                	j	80002496 <sbi_tlb_local_flush+0x66>
    80002592:	7e7040ef          	jal	ra,80007578 <__sbi_hfence_vvma_all>
    80002596:	b701                	j	80002496 <sbi_tlb_local_flush+0x66>
    80002598:	7c1040ef          	jal	ra,80007558 <__sbi_hfence_gvma_all>
    8000259c:	bded                	j	80002496 <sbi_tlb_local_flush+0x66>
    8000259e:	12b00073          	sfence.vma	zero,a1
    800025a2:	bdd5                	j	80002496 <sbi_tlb_local_flush+0x66>
    800025a4:	8552                	mv	a0,s4
    800025a6:	7c3040ef          	jal	ra,80007568 <__sbi_hfence_vvma_asid>
    800025aa:	b5f5                	j	80002496 <sbi_tlb_local_flush+0x66>
    800025ac:	8552                	mv	a0,s4
    800025ae:	79b040ef          	jal	ra,80007548 <__sbi_hfence_gvma_vmid>
    800025b2:	b5d5                	j	80002496 <sbi_tlb_local_flush+0x66>

00000000800025b4 <sbi_tlb_entry_process>:
    800025b4:	7139                	addi	sp,sp,-64
    800025b6:	f822                	sd	s0,48(sp)
    800025b8:	f426                	sd	s1,40(sp)
    800025ba:	e852                	sd	s4,16(sp)
    800025bc:	fc06                	sd	ra,56(sp)
    800025be:	f04a                	sd	s2,32(sp)
    800025c0:	ec4e                	sd	s3,24(sp)
    800025c2:	e456                	sd	s5,8(sp)
    800025c4:	0080                	addi	s0,sp,64
    800025c6:	84ae                	mv	s1,a1
    800025c8:	8a2a                	mv	s4,a0
    800025ca:	852e                	mv	a0,a1
    800025cc:	e65ff0ef          	jal	ra,80002430 <sbi_tlb_local_flush>
    800025d0:	7084                	ld	s1,32(s1)
    800025d2:	cc85                	beqz	s1,8000260a <sbi_tlb_entry_process+0x56>
    800025d4:	4981                	li	s3,0
    800025d6:	0000da97          	auipc	s5,0xd
    800025da:	a6aa8a93          	addi	s5,s5,-1430 # 8000f040 <tlb_sync_off>
    800025de:	a021                	j	800025e6 <sbi_tlb_entry_process+0x32>
    800025e0:	8085                	srli	s1,s1,0x1
    800025e2:	2985                	addiw	s3,s3,1
    800025e4:	c09d                	beqz	s1,8000260a <sbi_tlb_entry_process+0x56>
    800025e6:	0014f793          	andi	a5,s1,1
    800025ea:	dbfd                	beqz	a5,800025e0 <sbi_tlb_entry_process+0x2c>
    800025ec:	85ce                	mv	a1,s3
    800025ee:	8552                	mv	a0,s4
    800025f0:	786050ef          	jal	ra,80007d76 <sbi_hart_id_to_scratch>
    800025f4:	000ab903          	ld	s2,0(s5)
    800025f8:	992a                	add	s2,s2,a0
    800025fa:	4585                	li	a1,1
    800025fc:	854a                	mv	a0,s2
    800025fe:	16c020ef          	jal	ra,8000476a <atomic_raw_xchg_ulong>
    80002602:	fd65                	bnez	a0,800025fa <sbi_tlb_entry_process+0x46>
    80002604:	8085                	srli	s1,s1,0x1
    80002606:	2985                	addiw	s3,s3,1
    80002608:	fcf9                	bnez	s1,800025e6 <sbi_tlb_entry_process+0x32>
    8000260a:	70e2                	ld	ra,56(sp)
    8000260c:	7442                	ld	s0,48(sp)
    8000260e:	74a2                	ld	s1,40(sp)
    80002610:	7902                	ld	s2,32(sp)
    80002612:	69e2                	ld	s3,24(sp)
    80002614:	6a42                	ld	s4,16(sp)
    80002616:	6aa2                	ld	s5,8(sp)
    80002618:	6121                	addi	sp,sp,64
    8000261a:	8082                	ret

000000008000261c <sbi_tlb_process>:
    8000261c:	715d                	addi	sp,sp,-80
    8000261e:	e0a2                	sd	s0,64(sp)
    80002620:	fc26                	sd	s1,56(sp)
    80002622:	f84a                	sd	s2,48(sp)
    80002624:	e486                	sd	ra,72(sp)
    80002626:	0880                	addi	s0,sp,80
    80002628:	0000d917          	auipc	s2,0xd
    8000262c:	a1093903          	ld	s2,-1520(s2) # 8000f038 <tlb_fifo_off>
    80002630:	84aa                	mv	s1,a0
    80002632:	992a                	add	s2,s2,a0
    80002634:	a019                	j	8000263a <sbi_tlb_process+0x1e>
    80002636:	f7fff0ef          	jal	ra,800025b4 <sbi_tlb_entry_process>
    8000263a:	fb840593          	addi	a1,s0,-72
    8000263e:	854a                	mv	a0,s2
    80002640:	673040ef          	jal	ra,800074b2 <sbi_fifo_dequeue>
    80002644:	87aa                	mv	a5,a0
    80002646:	fb840593          	addi	a1,s0,-72
    8000264a:	8526                	mv	a0,s1
    8000264c:	d7ed                	beqz	a5,80002636 <sbi_tlb_process+0x1a>
    8000264e:	60a6                	ld	ra,72(sp)
    80002650:	6406                	ld	s0,64(sp)
    80002652:	74e2                	ld	s1,56(sp)
    80002654:	7942                	ld	s2,48(sp)
    80002656:	6161                	addi	sp,sp,80
    80002658:	8082                	ret

000000008000265a <sbi_tlb_update>:
    8000265a:	7175                	addi	sp,sp,-144
    8000265c:	e122                	sd	s0,128(sp)
    8000265e:	f8ca                	sd	s2,112(sp)
    80002660:	f4ce                	sd	s3,104(sp)
    80002662:	f0d2                	sd	s4,96(sp)
    80002664:	ecd6                	sd	s5,88(sp)
    80002666:	e8da                	sd	s6,80(sp)
    80002668:	e506                	sd	ra,136(sp)
    8000266a:	fca6                	sd	s1,120(sp)
    8000266c:	e4de                	sd	s7,72(sp)
    8000266e:	e0e2                	sd	s8,64(sp)
    80002670:	fc66                	sd	s9,56(sp)
    80002672:	0900                	addi	s0,sp,144
    80002674:	89b6                	mv	s3,a3
    80002676:	892a                	mv	s2,a0
    80002678:	8b2e                	mv	s6,a1
    8000267a:	8ab2                	mv	s5,a2
    8000267c:	703040ef          	jal	ra,8000757e <sbi_current_hartid>
    80002680:	0089b703          	ld	a4,8(s3)
    80002684:	0000d797          	auipc	a5,0xd
    80002688:	9a47b783          	ld	a5,-1628(a5) # 8000f028 <tlb_range_flush_limit>
    8000268c:	00050a1b          	sext.w	s4,a0
    80002690:	00e7f763          	bgeu	a5,a4,8000269e <sbi_tlb_update+0x44>
    80002694:	57fd                	li	a5,-1
    80002696:	0009b023          	sd	zero,0(s3)
    8000269a:	00f9b423          	sd	a5,8(s3)
    8000269e:	0b5a0063          	beq	s4,s5,8000273e <sbi_tlb_update+0xe4>
    800026a2:	0000dc17          	auipc	s8,0xd
    800026a6:	996c0c13          	addi	s8,s8,-1642 # 8000f038 <tlb_fifo_off>
    800026aa:	000c3b83          	ld	s7,0(s8)
    800026ae:	00000617          	auipc	a2,0x0
    800026b2:	11c60613          	addi	a2,a2,284 # 800027ca <sbi_tlb_update_cb>
    800026b6:	85ce                	mv	a1,s3
    800026b8:	9bda                	add	s7,s7,s6
    800026ba:	855e                	mv	a0,s7
    800026bc:	4d9040ef          	jal	ra,80007394 <sbi_fifo_inplace_update>
    800026c0:	872a                	mv	a4,a0
    800026c2:	4789                	li	a5,2
    800026c4:	4505                	li	a0,1
    800026c6:	0000ac97          	auipc	s9,0xa
    800026ca:	be2c8c93          	addi	s9,s9,-1054 # 8000c2a8 <fdt_move+0x6f4>
    800026ce:	04f70e63          	beq	a4,a5,8000272a <sbi_tlb_update+0xd0>
    800026d2:	60aa                	ld	ra,136(sp)
    800026d4:	640a                	ld	s0,128(sp)
    800026d6:	74e6                	ld	s1,120(sp)
    800026d8:	7946                	ld	s2,112(sp)
    800026da:	79a6                	ld	s3,104(sp)
    800026dc:	7a06                	ld	s4,96(sp)
    800026de:	6ae6                	ld	s5,88(sp)
    800026e0:	6b46                	ld	s6,80(sp)
    800026e2:	6ba6                	ld	s7,72(sp)
    800026e4:	6c06                	ld	s8,64(sp)
    800026e6:	7ce2                	ld	s9,56(sp)
    800026e8:	6149                	addi	sp,sp,144
    800026ea:	8082                	ret
    800026ec:	000c3483          	ld	s1,0(s8)
    800026f0:	94ca                	add	s1,s1,s2
    800026f2:	8526                	mv	a0,s1
    800026f4:	5bf040ef          	jal	ra,800074b2 <sbi_fifo_dequeue>
    800026f8:	87aa                	mv	a5,a0
    800026fa:	f7840593          	addi	a1,s0,-136
    800026fe:	854a                	mv	a0,s2
    80002700:	ef99                	bnez	a5,8000271e <sbi_tlb_update+0xc4>
    80002702:	eb3ff0ef          	jal	ra,800025b4 <sbi_tlb_entry_process>
    80002706:	f7840593          	addi	a1,s0,-136
    8000270a:	8526                	mv	a0,s1
    8000270c:	5a7040ef          	jal	ra,800074b2 <sbi_fifo_dequeue>
    80002710:	87aa                	mv	a5,a0
    80002712:	f7840593          	addi	a1,s0,-136
    80002716:	854a                	mv	a0,s2
    80002718:	e399                	bnez	a5,8000271e <sbi_tlb_update+0xc4>
    8000271a:	e9bff0ef          	jal	ra,800025b4 <sbi_tlb_entry_process>
    8000271e:	86d6                	mv	a3,s5
    80002720:	8652                	mv	a2,s4
    80002722:	85e6                	mv	a1,s9
    80002724:	855a                	mv	a0,s6
    80002726:	54f020ef          	jal	ra,80005474 <sbi_dprintf>
    8000272a:	85ce                	mv	a1,s3
    8000272c:	855e                	mv	a0,s7
    8000272e:	503040ef          	jal	ra,80007430 <sbi_fifo_enqueue>
    80002732:	f7840593          	addi	a1,s0,-136
    80002736:	fa054be3          	bltz	a0,800026ec <sbi_tlb_update+0x92>
    8000273a:	4501                	li	a0,0
    8000273c:	bf59                	j	800026d2 <sbi_tlb_update+0x78>
    8000273e:	854e                	mv	a0,s3
    80002740:	cf1ff0ef          	jal	ra,80002430 <sbi_tlb_local_flush>
    80002744:	557d                	li	a0,-1
    80002746:	b771                	j	800026d2 <sbi_tlb_update+0x78>

0000000080002748 <sbi_tlb_sync>:
    80002748:	711d                	addi	sp,sp,-96
    8000274a:	e8a2                	sd	s0,80(sp)
    8000274c:	e0ca                	sd	s2,64(sp)
    8000274e:	fc4e                	sd	s3,56(sp)
    80002750:	f852                	sd	s4,48(sp)
    80002752:	ec86                	sd	ra,88(sp)
    80002754:	e4a6                	sd	s1,72(sp)
    80002756:	1080                	addi	s0,sp,96
    80002758:	0000d997          	auipc	s3,0xd
    8000275c:	8e89b983          	ld	s3,-1816(s3) # 8000f040 <tlb_sync_off>
    80002760:	892a                	mv	s2,a0
    80002762:	99aa                	add	s3,s3,a0
    80002764:	0000da17          	auipc	s4,0xd
    80002768:	8d4a0a13          	addi	s4,s4,-1836 # 8000f038 <tlb_fifo_off>
    8000276c:	4581                	li	a1,0
    8000276e:	854e                	mv	a0,s3
    80002770:	7fb010ef          	jal	ra,8000476a <atomic_raw_xchg_ulong>
    80002774:	fa840593          	addi	a1,s0,-88
    80002778:	e129                	bnez	a0,800027ba <sbi_tlb_sync+0x72>
    8000277a:	000a3483          	ld	s1,0(s4)
    8000277e:	94ca                	add	s1,s1,s2
    80002780:	8526                	mv	a0,s1
    80002782:	531040ef          	jal	ra,800074b2 <sbi_fifo_dequeue>
    80002786:	87aa                	mv	a5,a0
    80002788:	fa840593          	addi	a1,s0,-88
    8000278c:	854a                	mv	a0,s2
    8000278e:	fff9                	bnez	a5,8000276c <sbi_tlb_sync+0x24>
    80002790:	e25ff0ef          	jal	ra,800025b4 <sbi_tlb_entry_process>
    80002794:	fa840593          	addi	a1,s0,-88
    80002798:	8526                	mv	a0,s1
    8000279a:	519040ef          	jal	ra,800074b2 <sbi_fifo_dequeue>
    8000279e:	87aa                	mv	a5,a0
    800027a0:	fa840593          	addi	a1,s0,-88
    800027a4:	854a                	mv	a0,s2
    800027a6:	f3f9                	bnez	a5,8000276c <sbi_tlb_sync+0x24>
    800027a8:	e0dff0ef          	jal	ra,800025b4 <sbi_tlb_entry_process>
    800027ac:	4581                	li	a1,0
    800027ae:	854e                	mv	a0,s3
    800027b0:	7bb010ef          	jal	ra,8000476a <atomic_raw_xchg_ulong>
    800027b4:	fa840593          	addi	a1,s0,-88
    800027b8:	d169                	beqz	a0,8000277a <sbi_tlb_sync+0x32>
    800027ba:	60e6                	ld	ra,88(sp)
    800027bc:	6446                	ld	s0,80(sp)
    800027be:	64a6                	ld	s1,72(sp)
    800027c0:	6906                	ld	s2,64(sp)
    800027c2:	79e2                	ld	s3,56(sp)
    800027c4:	7a42                	ld	s4,48(sp)
    800027c6:	6125                	addi	sp,sp,96
    800027c8:	8082                	ret

00000000800027ca <sbi_tlb_update_cb>:
    800027ca:	1141                	addi	sp,sp,-16
    800027cc:	e422                	sd	s0,8(sp)
    800027ce:	0800                	addi	s0,sp,16
    800027d0:	cd05                	beqz	a0,80002808 <sbi_tlb_update_cb+0x3e>
    800027d2:	c99d                	beqz	a1,80002808 <sbi_tlb_update_cb+0x3e>
    800027d4:	6d18                	ld	a4,24(a0)
    800027d6:	4685                	li	a3,1
    800027d8:	87aa                	mv	a5,a0
    800027da:	02d70b63          	beq	a4,a3,80002810 <sbi_tlb_update_cb+0x46>
    800027de:	e70d                	bnez	a4,80002808 <sbi_tlb_update_cb+0x3e>
    800027e0:	6d98                	ld	a4,24(a1)
    800027e2:	4509                	li	a0,2
    800027e4:	e31d                	bnez	a4,8000280a <sbi_tlb_update_cb+0x40>
    800027e6:	6390                	ld	a2,0(a5)
    800027e8:	6794                	ld	a3,8(a5)
    800027ea:	0005b803          	ld	a6,0(a1)
    800027ee:	6598                	ld	a4,8(a1)
    800027f0:	96b2                	add	a3,a3,a2
    800027f2:	9742                	add	a4,a4,a6
    800027f4:	02c87763          	bgeu	a6,a2,80002822 <sbi_tlb_update_cb+0x58>
    800027f8:	00d76963          	bltu	a4,a3,8000280a <sbi_tlb_update_cb+0x40>
    800027fc:	7198                	ld	a4,32(a1)
    800027fe:	739c                	ld	a5,32(a5)
    80002800:	4501                	li	a0,0
    80002802:	8fd9                	or	a5,a5,a4
    80002804:	f19c                	sd	a5,32(a1)
    80002806:	a011                	j	8000280a <sbi_tlb_update_cb+0x40>
    80002808:	4509                	li	a0,2
    8000280a:	6422                	ld	s0,8(sp)
    8000280c:	0141                	addi	sp,sp,16
    8000280e:	8082                	ret
    80002810:	6d94                	ld	a3,24(a1)
    80002812:	4509                	li	a0,2
    80002814:	fee69be3          	bne	a3,a4,8000280a <sbi_tlb_update_cb+0x40>
    80002818:	6b94                	ld	a3,16(a5)
    8000281a:	6998                	ld	a4,16(a1)
    8000281c:	fee697e3          	bne	a3,a4,8000280a <sbi_tlb_update_cb+0x40>
    80002820:	b7d9                	j	800027e6 <sbi_tlb_update_cb+0x1c>
    80002822:	00d77b63          	bgeu	a4,a3,80002838 <sbi_tlb_update_cb+0x6e>
    80002826:	e190                	sd	a2,0(a1)
    80002828:	6794                	ld	a3,8(a5)
    8000282a:	7198                	ld	a4,32(a1)
    8000282c:	4505                	li	a0,1
    8000282e:	e594                	sd	a3,8(a1)
    80002830:	739c                	ld	a5,32(a5)
    80002832:	8fd9                	or	a5,a5,a4
    80002834:	f19c                	sd	a5,32(a1)
    80002836:	bfd1                	j	8000280a <sbi_tlb_update_cb+0x40>
    80002838:	fd0619e3          	bne	a2,a6,8000280a <sbi_tlb_update_cb+0x40>
    8000283c:	b7c1                	j	800027fc <sbi_tlb_update_cb+0x32>

000000008000283e <sbi_tlb_request>:
    8000283e:	1141                	addi	sp,sp,-16
    80002840:	e022                	sd	s0,0(sp)
    80002842:	e406                	sd	ra,8(sp)
    80002844:	0800                	addi	s0,sp,16
    80002846:	8736                	mv	a4,a3
    80002848:	0000b697          	auipc	a3,0xb
    8000284c:	7c86a683          	lw	a3,1992(a3) # 8000e010 <tlb_event>
    80002850:	843fe0ef          	jal	ra,80001092 <sbi_ipi_send_many>
    80002854:	60a2                	ld	ra,8(sp)
    80002856:	6402                	ld	s0,0(sp)
    80002858:	0141                	addi	sp,sp,16
    8000285a:	8082                	ret

000000008000285c <sbi_tlb_init>:
    8000285c:	7139                	addi	sp,sp,-64
    8000285e:	f822                	sd	s0,48(sp)
    80002860:	f426                	sd	s1,40(sp)
    80002862:	fc06                	sd	ra,56(sp)
    80002864:	f04a                	sd	s2,32(sp)
    80002866:	ec4e                	sd	s3,24(sp)
    80002868:	e852                	sd	s4,16(sp)
    8000286a:	e456                	sd	s5,8(sp)
    8000286c:	e05a                	sd	s6,0(sp)
    8000286e:	0080                	addi	s0,sp,64
    80002870:	84aa                	mv	s1,a0
    80002872:	e1ad                	bnez	a1,800028d4 <sbi_tlb_init+0x78>
    80002874:	0000c797          	auipc	a5,0xc
    80002878:	7cc7b783          	ld	a5,1996(a5) # 8000f040 <tlb_sync_off>
    8000287c:	1c078763          	beqz	a5,80002a4a <sbi_tlb_init+0x1ee>
    80002880:	0000c517          	auipc	a0,0xc
    80002884:	7b853503          	ld	a0,1976(a0) # 8000f038 <tlb_fifo_off>
    80002888:	1c050163          	beqz	a0,80002a4a <sbi_tlb_init+0x1ee>
    8000288c:	0000c597          	auipc	a1,0xc
    80002890:	7a45b583          	ld	a1,1956(a1) # 8000f030 <tlb_fifo_mem_off>
    80002894:	1a058b63          	beqz	a1,80002a4a <sbi_tlb_init+0x1ee>
    80002898:	0000b697          	auipc	a3,0xb
    8000289c:	7786a683          	lw	a3,1912(a3) # 8000e010 <tlb_event>
    800028a0:	03f00713          	li	a4,63
    800028a4:	1ad76563          	bltu	a4,a3,80002a4e <sbi_tlb_init+0x1f2>
    800028a8:	97a6                	add	a5,a5,s1
    800028aa:	0007b023          	sd	zero,0(a5)
    800028ae:	02800693          	li	a3,40
    800028b2:	4621                	li	a2,8
    800028b4:	95a6                	add	a1,a1,s1
    800028b6:	9526                	add	a0,a0,s1
    800028b8:	1bb040ef          	jal	ra,80007272 <sbi_fifo_init>
    800028bc:	4901                	li	s2,0
    800028be:	70e2                	ld	ra,56(sp)
    800028c0:	7442                	ld	s0,48(sp)
    800028c2:	74a2                	ld	s1,40(sp)
    800028c4:	69e2                	ld	s3,24(sp)
    800028c6:	6a42                	ld	s4,16(sp)
    800028c8:	6aa2                	ld	s5,8(sp)
    800028ca:	6b02                	ld	s6,0(sp)
    800028cc:	854a                	mv	a0,s2
    800028ce:	7902                	ld	s2,32(sp)
    800028d0:	6121                	addi	sp,sp,64
    800028d2:	8082                	ret
    800028d4:	03154583          	lbu	a1,49(a0)
    800028d8:	03054783          	lbu	a5,48(a0)
    800028dc:	03254603          	lbu	a2,50(a0)
    800028e0:	03354683          	lbu	a3,51(a0)
    800028e4:	03454703          	lbu	a4,52(a0)
    800028e8:	05a2                	slli	a1,a1,0x8
    800028ea:	03554983          	lbu	s3,53(a0)
    800028ee:	8ddd                	or	a1,a1,a5
    800028f0:	0642                	slli	a2,a2,0x10
    800028f2:	03654783          	lbu	a5,54(a0)
    800028f6:	8e4d                	or	a2,a2,a1
    800028f8:	06e2                	slli	a3,a3,0x18
    800028fa:	03754583          	lbu	a1,55(a0)
    800028fe:	8ed1                	or	a3,a3,a2
    80002900:	1702                	slli	a4,a4,0x20
    80002902:	8f55                	or	a4,a4,a3
    80002904:	19a2                	slli	s3,s3,0x28
    80002906:	00e9e9b3          	or	s3,s3,a4
    8000290a:	17c2                	slli	a5,a5,0x30
    8000290c:	0137e7b3          	or	a5,a5,s3
    80002910:	4521                	li	a0,8
    80002912:	03859993          	slli	s3,a1,0x38
    80002916:	0000a597          	auipc	a1,0xa
    8000291a:	9b258593          	addi	a1,a1,-1614 # 8000c2c8 <fdt_move+0x714>
    8000291e:	00f9e9b3          	or	s3,s3,a5
    80002922:	0000ca17          	auipc	s4,0xc
    80002926:	71ea0a13          	addi	s4,s4,1822 # 8000f040 <tlb_sync_off>
    8000292a:	e5bfe0ef          	jal	ra,80001784 <sbi_scratch_alloc_offset>
    8000292e:	00aa3023          	sd	a0,0(s4)
    80002932:	10050c63          	beqz	a0,80002a4a <sbi_tlb_init+0x1ee>
    80002936:	0000a597          	auipc	a1,0xa
    8000293a:	9a258593          	addi	a1,a1,-1630 # 8000c2d8 <fdt_move+0x724>
    8000293e:	4561                	li	a0,24
    80002940:	e45fe0ef          	jal	ra,80001784 <sbi_scratch_alloc_offset>
    80002944:	0000ca97          	auipc	s5,0xc
    80002948:	6f4a8a93          	addi	s5,s5,1780 # 8000f038 <tlb_fifo_off>
    8000294c:	00aab023          	sd	a0,0(s5)
    80002950:	10050163          	beqz	a0,80002a52 <sbi_tlb_init+0x1f6>
    80002954:	0000a597          	auipc	a1,0xa
    80002958:	99458593          	addi	a1,a1,-1644 # 8000c2e8 <fdt_move+0x734>
    8000295c:	14000513          	li	a0,320
    80002960:	e25fe0ef          	jal	ra,80001784 <sbi_scratch_alloc_offset>
    80002964:	0000cb17          	auipc	s6,0xc
    80002968:	6ccb0b13          	addi	s6,s6,1740 # 8000f030 <tlb_fifo_mem_off>
    8000296c:	00ab3023          	sd	a0,0(s6)
    80002970:	0e050763          	beqz	a0,80002a5e <sbi_tlb_init+0x202>
    80002974:	0000b517          	auipc	a0,0xb
    80002978:	72450513          	addi	a0,a0,1828 # 8000e098 <tlb_ops>
    8000297c:	981fe0ef          	jal	ra,800012fc <sbi_ipi_event_create>
    80002980:	892a                	mv	s2,a0
    80002982:	0a054563          	bltz	a0,80002a2c <sbi_tlb_init+0x1d0>
    80002986:	0000b797          	auipc	a5,0xb
    8000298a:	68a7a523          	sw	a0,1674(a5) # 8000e010 <tlb_event>
    8000298e:	0a098c63          	beqz	s3,80002a46 <sbi_tlb_init+0x1ea>
    80002992:	0619c783          	lbu	a5,97(s3)
    80002996:	0609c703          	lbu	a4,96(s3)
    8000299a:	0629c503          	lbu	a0,98(s3)
    8000299e:	0639c583          	lbu	a1,99(s3)
    800029a2:	0649c603          	lbu	a2,100(s3)
    800029a6:	07a2                	slli	a5,a5,0x8
    800029a8:	8fd9                	or	a5,a5,a4
    800029aa:	0659c683          	lbu	a3,101(s3)
    800029ae:	0542                	slli	a0,a0,0x10
    800029b0:	8d5d                	or	a0,a0,a5
    800029b2:	0669c703          	lbu	a4,102(s3)
    800029b6:	05e2                	slli	a1,a1,0x18
    800029b8:	8dc9                	or	a1,a1,a0
    800029ba:	0679c783          	lbu	a5,103(s3)
    800029be:	1602                	slli	a2,a2,0x20
    800029c0:	8e4d                	or	a2,a2,a1
    800029c2:	16a2                	slli	a3,a3,0x28
    800029c4:	8ed1                	or	a3,a3,a2
    800029c6:	1742                	slli	a4,a4,0x30
    800029c8:	8f55                	or	a4,a4,a3
    800029ca:	17e2                	slli	a5,a5,0x38
    800029cc:	8fd9                	or	a5,a5,a4
    800029ce:	0897c803          	lbu	a6,137(a5)
    800029d2:	0887c703          	lbu	a4,136(a5)
    800029d6:	08a7c503          	lbu	a0,138(a5)
    800029da:	08b7c583          	lbu	a1,139(a5)
    800029de:	08c7c603          	lbu	a2,140(a5)
    800029e2:	0822                	slli	a6,a6,0x8
    800029e4:	08d7c683          	lbu	a3,141(a5)
    800029e8:	00e86833          	or	a6,a6,a4
    800029ec:	0542                	slli	a0,a0,0x10
    800029ee:	08e7c703          	lbu	a4,142(a5)
    800029f2:	01056533          	or	a0,a0,a6
    800029f6:	05e2                	slli	a1,a1,0x18
    800029f8:	08f7c783          	lbu	a5,143(a5)
    800029fc:	8dc9                	or	a1,a1,a0
    800029fe:	1602                	slli	a2,a2,0x20
    80002a00:	8e4d                	or	a2,a2,a1
    80002a02:	16a2                	slli	a3,a3,0x28
    80002a04:	8ed1                	or	a3,a3,a2
    80002a06:	1742                	slli	a4,a4,0x30
    80002a08:	8f55                	or	a4,a4,a3
    80002a0a:	17e2                	slli	a5,a5,0x38
    80002a0c:	8fd9                	or	a5,a5,a4
    80002a0e:	6705                	lui	a4,0x1
    80002a10:	c399                	beqz	a5,80002a16 <sbi_tlb_init+0x1ba>
    80002a12:	9782                	jalr	a5
    80002a14:	872a                	mv	a4,a0
    80002a16:	000a3783          	ld	a5,0(s4)
    80002a1a:	000ab503          	ld	a0,0(s5)
    80002a1e:	000b3583          	ld	a1,0(s6)
    80002a22:	0000c697          	auipc	a3,0xc
    80002a26:	60e6b323          	sd	a4,1542(a3) # 8000f028 <tlb_range_flush_limit>
    80002a2a:	bdbd                	j	800028a8 <sbi_tlb_init+0x4c>
    80002a2c:	000b3503          	ld	a0,0(s6)
    80002a30:	e49fe0ef          	jal	ra,80001878 <sbi_scratch_free_offset>
    80002a34:	000ab503          	ld	a0,0(s5)
    80002a38:	e41fe0ef          	jal	ra,80001878 <sbi_scratch_free_offset>
    80002a3c:	000a3503          	ld	a0,0(s4)
    80002a40:	e39fe0ef          	jal	ra,80001878 <sbi_scratch_free_offset>
    80002a44:	bdad                	j	800028be <sbi_tlb_init+0x62>
    80002a46:	6705                	lui	a4,0x1
    80002a48:	b7f9                	j	80002a16 <sbi_tlb_init+0x1ba>
    80002a4a:	5951                	li	s2,-12
    80002a4c:	bd8d                	j	800028be <sbi_tlb_init+0x62>
    80002a4e:	5955                	li	s2,-11
    80002a50:	b5bd                	j	800028be <sbi_tlb_init+0x62>
    80002a52:	000a3503          	ld	a0,0(s4)
    80002a56:	5951                	li	s2,-12
    80002a58:	e21fe0ef          	jal	ra,80001878 <sbi_scratch_free_offset>
    80002a5c:	b58d                	j	800028be <sbi_tlb_init+0x62>
    80002a5e:	000ab503          	ld	a0,0(s5)
    80002a62:	5951                	li	s2,-12
    80002a64:	e15fe0ef          	jal	ra,80001878 <sbi_scratch_free_offset>
    80002a68:	000a3503          	ld	a0,0(s4)
    80002a6c:	e0dfe0ef          	jal	ra,80001878 <sbi_scratch_free_offset>
    80002a70:	b5b9                	j	800028be <sbi_tlb_init+0x62>

0000000080002a72 <sbi_trap_redirect>:
    80002a72:	7179                	addi	sp,sp,-48
    80002a74:	f022                	sd	s0,32(sp)
    80002a76:	ec26                	sd	s1,24(sp)
    80002a78:	e44e                	sd	s3,8(sp)
    80002a7a:	f406                	sd	ra,40(sp)
    80002a7c:	e84a                	sd	s2,16(sp)
    80002a7e:	e052                	sd	s4,0(sp)
    80002a80:	1800                	addi	s0,sp,48
    80002a82:	10954783          	lbu	a5,265(a0)
    80002a86:	10854703          	lbu	a4,264(a0)
    80002a8a:	10a54803          	lbu	a6,266(a0)
    80002a8e:	84aa                	mv	s1,a0
    80002a90:	10b54503          	lbu	a0,267(a0)
    80002a94:	10c4c603          	lbu	a2,268(s1)
    80002a98:	07a2                	slli	a5,a5,0x8
    80002a9a:	8fd9                	or	a5,a5,a4
    80002a9c:	10d4c683          	lbu	a3,269(s1)
    80002aa0:	0842                	slli	a6,a6,0x10
    80002aa2:	00f86833          	or	a6,a6,a5
    80002aa6:	10e4c703          	lbu	a4,270(s1)
    80002aaa:	0562                	slli	a0,a0,0x18
    80002aac:	10f4c783          	lbu	a5,271(s1)
    80002ab0:	01056533          	or	a0,a0,a6
    80002ab4:	1602                	slli	a2,a2,0x20
    80002ab6:	8e49                	or	a2,a2,a0
    80002ab8:	16a2                	slli	a3,a3,0x28
    80002aba:	8ed1                	or	a3,a3,a2
    80002abc:	1742                	slli	a4,a4,0x30
    80002abe:	8f55                	or	a4,a4,a3
    80002ac0:	17e2                	slli	a5,a5,0x38
    80002ac2:	8fd9                	or	a5,a5,a4
    80002ac4:	00b7d993          	srli	s3,a5,0xb
    80002ac8:	0029f713          	andi	a4,s3,2
    80002acc:	42071a63          	bnez	a4,80002f00 <sbi_trap_redirect+0x48e>
    80002ad0:	939d                	srli	a5,a5,0x27
    80002ad2:	04800513          	li	a0,72
    80002ad6:	8a2e                	mv	s4,a1
    80002ad8:	0017f913          	andi	s2,a5,1
    80002adc:	6b8010ef          	jal	ra,80004194 <misa_extension_imp>
    80002ae0:	1094c703          	lbu	a4,265(s1)
    80002ae4:	1084c683          	lbu	a3,264(s1)
    80002ae8:	0039f993          	andi	s3,s3,3
    80002aec:	1c050c63          	beqz	a0,80002cc4 <sbi_trap_redirect+0x252>
    80002af0:	10a4c503          	lbu	a0,266(s1)
    80002af4:	10b4c583          	lbu	a1,267(s1)
    80002af8:	10c4c603          	lbu	a2,268(s1)
    80002afc:	0722                	slli	a4,a4,0x8
    80002afe:	8f55                	or	a4,a4,a3
    80002b00:	10d4c783          	lbu	a5,269(s1)
    80002b04:	0542                	slli	a0,a0,0x10
    80002b06:	8d59                	or	a0,a0,a4
    80002b08:	10e4c683          	lbu	a3,270(s1)
    80002b0c:	05e2                	slli	a1,a1,0x18
    80002b0e:	8dc9                	or	a1,a1,a0
    80002b10:	1602                	slli	a2,a2,0x20
    80002b12:	10f4c703          	lbu	a4,271(s1)
    80002b16:	8e4d                	or	a2,a2,a1
    80002b18:	17a2                	slli	a5,a5,0x28
    80002b1a:	8fd1                	or	a5,a5,a2
    80002b1c:	16c2                	slli	a3,a3,0x30
    80002b1e:	8edd                	or	a3,a3,a5
    80002b20:	57fd                	li	a5,-1
    80002b22:	1762                	slli	a4,a4,0x38
    80002b24:	179e                	slli	a5,a5,0x27
    80002b26:	8f55                	or	a4,a4,a3
    80002b28:	17fd                	addi	a5,a5,-1
    80002b2a:	8ff9                	and	a5,a5,a4
    80002b2c:	38090463          	beqz	s2,80002eb4 <sbi_trap_redirect+0x442>
    80002b30:	008a3703          	ld	a4,8(s4)
    80002b34:	46b5                	li	a3,13
    80002b36:	20e6eb63          	bltu	a3,a4,80002d4c <sbi_trap_redirect+0x2da>
    80002b3a:	46ad                	li	a3,11
    80002b3c:	20e6eb63          	bltu	a3,a4,80002d52 <sbi_trap_redirect+0x2e0>
    80002b40:	0187d51b          	srliw	a0,a5,0x18
    80002b44:	0087d893          	srli	a7,a5,0x8
    80002b48:	0107d813          	srli	a6,a5,0x10
    80002b4c:	0207d593          	srli	a1,a5,0x20
    80002b50:	0287d613          	srli	a2,a5,0x28
    80002b54:	0307d693          	srli	a3,a5,0x30
    80002b58:	0387d713          	srli	a4,a5,0x38
    80002b5c:	10a485a3          	sb	a0,267(s1)
    80002b60:	10f48423          	sb	a5,264(s1)
    80002b64:	111484a3          	sb	a7,265(s1)
    80002b68:	11048523          	sb	a6,266(s1)
    80002b6c:	10b48623          	sb	a1,268(s1)
    80002b70:	10c486a3          	sb	a2,269(s1)
    80002b74:	10d48723          	sb	a3,270(s1)
    80002b78:	10e487a3          	sb	a4,271(s1)
    80002b7c:	04800513          	li	a0,72
    80002b80:	614010ef          	jal	ra,80004194 <misa_extension_imp>
    80002b84:	cd05                	beqz	a0,80002bbc <sbi_trap_redirect+0x14a>
    80002b86:	600027f3          	csrr	a5,0x600
    80002b8a:	1094c703          	lbu	a4,265(s1)
    80002b8e:	cff7f793          	andi	a5,a5,-769
    80002b92:	0722                	slli	a4,a4,0x8
    80002b94:	10077713          	andi	a4,a4,256
    80002b98:	8f5d                	or	a4,a4,a5
    80002b9a:	00271793          	slli	a5,a4,0x2
    80002b9e:	2007f793          	andi	a5,a5,512
    80002ba2:	8fd9                	or	a5,a5,a4
    80002ba4:	0807e793          	ori	a5,a5,128
    80002ba8:	60079073          	csrw	0x600,a5
    80002bac:	018a3783          	ld	a5,24(s4)
    80002bb0:	64379073          	csrw	0x643,a5
    80002bb4:	020a3783          	ld	a5,32(s4)
    80002bb8:	64a79073          	csrw	0x64a,a5
    80002bbc:	010a3783          	ld	a5,16(s4)
    80002bc0:	14379073          	csrw	stval,a5
    80002bc4:	000a3783          	ld	a5,0(s4)
    80002bc8:	14179073          	csrw	sepc,a5
    80002bcc:	008a3783          	ld	a5,8(s4)
    80002bd0:	14279073          	csrw	scause,a5
    80002bd4:	10502873          	csrr	a6,stvec
    80002bd8:	1094c783          	lbu	a5,265(s1)
    80002bdc:	1084c703          	lbu	a4,264(s1)
    80002be0:	10a4c503          	lbu	a0,266(s1)
    80002be4:	10b4c583          	lbu	a1,267(s1)
    80002be8:	10c4c603          	lbu	a2,268(s1)
    80002bec:	07a2                	slli	a5,a5,0x8
    80002bee:	8fd9                	or	a5,a5,a4
    80002bf0:	10d4c683          	lbu	a3,269(s1)
    80002bf4:	0542                	slli	a0,a0,0x10
    80002bf6:	8d5d                	or	a0,a0,a5
    80002bf8:	10e4c703          	lbu	a4,270(s1)
    80002bfc:	05e2                	slli	a1,a1,0x18
    80002bfe:	8dc9                	or	a1,a1,a0
    80002c00:	10f4c783          	lbu	a5,271(s1)
    80002c04:	1602                	slli	a2,a2,0x20
    80002c06:	8e4d                	or	a2,a2,a1
    80002c08:	16a2                	slli	a3,a3,0x28
    80002c0a:	8ed1                	or	a3,a3,a2
    80002c0c:	1742                	slli	a4,a4,0x30
    80002c0e:	8f55                	or	a4,a4,a3
    80002c10:	17e2                	slli	a5,a5,0x38
    80002c12:	8fd9                	or	a5,a5,a4
    80002c14:	00885e93          	srli	t4,a6,0x8
    80002c18:	01085e13          	srli	t3,a6,0x10
    80002c1c:	0188531b          	srliw	t1,a6,0x18
    80002c20:	02085893          	srli	a7,a6,0x20
    80002c24:	02885513          	srli	a0,a6,0x28
    80002c28:	03085593          	srli	a1,a6,0x30
    80002c2c:	03885613          	srli	a2,a6,0x38
    80002c30:	7779                	lui	a4,0xffffe
    80002c32:	6ff70713          	addi	a4,a4,1791 # ffffffffffffe6ff <_enclave_end+0xffffffff7e8fe6ff>
    80002c36:	11048023          	sb	a6,256(s1)
    80002c3a:	11d480a3          	sb	t4,257(s1)
    80002c3e:	11c48123          	sb	t3,258(s1)
    80002c42:	106481a3          	sb	t1,259(s1)
    80002c46:	11148223          	sb	a7,260(s1)
    80002c4a:	10a482a3          	sb	a0,261(s1)
    80002c4e:	10b48323          	sb	a1,262(s1)
    80002c52:	10c483a3          	sb	a2,263(s1)
    80002c56:	4685                	li	a3,1
    80002c58:	8ff9                	and	a5,a5,a4
    80002c5a:	6705                	lui	a4,0x1
    80002c5c:	28d98e63          	beq	s3,a3,80002ef8 <sbi_trap_redirect+0x486>
    80002c60:	80070713          	addi	a4,a4,-2048 # 800 <_fw_start-0x7ffff800>
    80002c64:	8fd9                	or	a5,a5,a4
    80002c66:	0027f713          	andi	a4,a5,2
    80002c6a:	fdf7f793          	andi	a5,a5,-33
    80002c6e:	c319                	beqz	a4,80002c74 <sbi_trap_redirect+0x202>
    80002c70:	0207e793          	ori	a5,a5,32
    80002c74:	0107d513          	srli	a0,a5,0x10
    80002c78:	0fd7f893          	andi	a7,a5,253
    80002c7c:	0087d813          	srli	a6,a5,0x8
    80002c80:	0187d59b          	srliw	a1,a5,0x18
    80002c84:	0207d613          	srli	a2,a5,0x20
    80002c88:	0287d693          	srli	a3,a5,0x28
    80002c8c:	0307d713          	srli	a4,a5,0x30
    80002c90:	93e1                	srli	a5,a5,0x38
    80002c92:	10a48523          	sb	a0,266(s1)
    80002c96:	11148423          	sb	a7,264(s1)
    80002c9a:	110484a3          	sb	a6,265(s1)
    80002c9e:	10b485a3          	sb	a1,267(s1)
    80002ca2:	10c48623          	sb	a2,268(s1)
    80002ca6:	10d486a3          	sb	a3,269(s1)
    80002caa:	10e48723          	sb	a4,270(s1)
    80002cae:	10f487a3          	sb	a5,271(s1)
    80002cb2:	4501                	li	a0,0
    80002cb4:	70a2                	ld	ra,40(sp)
    80002cb6:	7402                	ld	s0,32(sp)
    80002cb8:	64e2                	ld	s1,24(sp)
    80002cba:	6942                	ld	s2,16(sp)
    80002cbc:	69a2                	ld	s3,8(sp)
    80002cbe:	6a02                	ld	s4,0(sp)
    80002cc0:	6145                	addi	sp,sp,48
    80002cc2:	8082                	ret
    80002cc4:	10a4c503          	lbu	a0,266(s1)
    80002cc8:	10b4c583          	lbu	a1,267(s1)
    80002ccc:	10c4c603          	lbu	a2,268(s1)
    80002cd0:	0722                	slli	a4,a4,0x8
    80002cd2:	8f55                	or	a4,a4,a3
    80002cd4:	10d4c783          	lbu	a5,269(s1)
    80002cd8:	0542                	slli	a0,a0,0x10
    80002cda:	8d59                	or	a0,a0,a4
    80002cdc:	10e4c683          	lbu	a3,270(s1)
    80002ce0:	05e2                	slli	a1,a1,0x18
    80002ce2:	8dc9                	or	a1,a1,a0
    80002ce4:	1602                	slli	a2,a2,0x20
    80002ce6:	8e4d                	or	a2,a2,a1
    80002ce8:	10f4c703          	lbu	a4,271(s1)
    80002cec:	17a2                	slli	a5,a5,0x28
    80002cee:	8fd1                	or	a5,a5,a2
    80002cf0:	16c2                	slli	a3,a3,0x30
    80002cf2:	8edd                	or	a3,a3,a5
    80002cf4:	57fd                	li	a5,-1
    80002cf6:	1762                	slli	a4,a4,0x38
    80002cf8:	179e                	slli	a5,a5,0x27
    80002cfa:	8f55                	or	a4,a4,a3
    80002cfc:	17fd                	addi	a5,a5,-1
    80002cfe:	8ff9                	and	a5,a5,a4
    80002d00:	0187d51b          	srliw	a0,a5,0x18
    80002d04:	0087d893          	srli	a7,a5,0x8
    80002d08:	0107d813          	srli	a6,a5,0x10
    80002d0c:	0207d593          	srli	a1,a5,0x20
    80002d10:	0287d613          	srli	a2,a5,0x28
    80002d14:	0307d693          	srli	a3,a5,0x30
    80002d18:	93e1                	srli	a5,a5,0x38
    80002d1a:	10a485a3          	sb	a0,267(s1)
    80002d1e:	10e48423          	sb	a4,264(s1)
    80002d22:	111484a3          	sb	a7,265(s1)
    80002d26:	11048523          	sb	a6,266(s1)
    80002d2a:	10b48623          	sb	a1,268(s1)
    80002d2e:	10c486a3          	sb	a2,269(s1)
    80002d32:	10d48723          	sb	a3,270(s1)
    80002d36:	10f487a3          	sb	a5,271(s1)
    80002d3a:	04800513          	li	a0,72
    80002d3e:	456010ef          	jal	ra,80004194 <misa_extension_imp>
    80002d42:	e6050de3          	beqz	a0,80002bbc <sbi_trap_redirect+0x14a>
    80002d46:	e6090be3          	beqz	s2,80002bbc <sbi_trap_redirect+0x14a>
    80002d4a:	bd35                	j	80002b86 <sbi_trap_redirect+0x114>
    80002d4c:	46bd                	li	a3,15
    80002d4e:	ded719e3          	bne	a4,a3,80002b40 <sbi_trap_redirect+0xce>
    80002d52:	4905                	li	s2,1
    80002d54:	02791713          	slli	a4,s2,0x27
    80002d58:	8f5d                	or	a4,a4,a5
    80002d5a:	00875893          	srli	a7,a4,0x8
    80002d5e:	01075813          	srli	a6,a4,0x10
    80002d62:	02075593          	srli	a1,a4,0x20
    80002d66:	02875613          	srli	a2,a4,0x28
    80002d6a:	03075693          	srli	a3,a4,0x30
    80002d6e:	0187551b          	srliw	a0,a4,0x18
    80002d72:	9361                	srli	a4,a4,0x38
    80002d74:	10f48423          	sb	a5,264(s1)
    80002d78:	10a485a3          	sb	a0,267(s1)
    80002d7c:	111484a3          	sb	a7,265(s1)
    80002d80:	11048523          	sb	a6,266(s1)
    80002d84:	10b48623          	sb	a1,268(s1)
    80002d88:	10c486a3          	sb	a2,269(s1)
    80002d8c:	10d48723          	sb	a3,270(s1)
    80002d90:	10e487a3          	sb	a4,271(s1)
    80002d94:	04800513          	li	a0,72
    80002d98:	3fc010ef          	jal	ra,80004194 <misa_extension_imp>
    80002d9c:	010a3783          	ld	a5,16(s4)
    80002da0:	24379073          	csrw	0x243,a5
    80002da4:	000a3783          	ld	a5,0(s4)
    80002da8:	24179073          	csrw	0x241,a5
    80002dac:	008a3783          	ld	a5,8(s4)
    80002db0:	24279073          	csrw	0x242,a5
    80002db4:	205026f3          	csrr	a3,0x205
    80002db8:	1094c703          	lbu	a4,265(s1)
    80002dbc:	1084c783          	lbu	a5,264(s1)
    80002dc0:	10a4c803          	lbu	a6,266(s1)
    80002dc4:	10b4c503          	lbu	a0,267(s1)
    80002dc8:	10c4c583          	lbu	a1,268(s1)
    80002dcc:	0722                	slli	a4,a4,0x8
    80002dce:	10d4c603          	lbu	a2,269(s1)
    80002dd2:	8f5d                	or	a4,a4,a5
    80002dd4:	0842                	slli	a6,a6,0x10
    80002dd6:	10e4c783          	lbu	a5,270(s1)
    80002dda:	00e86833          	or	a6,a6,a4
    80002dde:	0562                	slli	a0,a0,0x18
    80002de0:	10f4c703          	lbu	a4,271(s1)
    80002de4:	01056533          	or	a0,a0,a6
    80002de8:	1582                	slli	a1,a1,0x20
    80002dea:	8dc9                	or	a1,a1,a0
    80002dec:	1622                	slli	a2,a2,0x28
    80002dee:	8e4d                	or	a2,a2,a1
    80002df0:	17c2                	slli	a5,a5,0x30
    80002df2:	8fd1                	or	a5,a5,a2
    80002df4:	1762                	slli	a4,a4,0x38
    80002df6:	8f5d                	or	a4,a4,a5
    80002df8:	77f9                	lui	a5,0xffffe
    80002dfa:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <_enclave_end+0xffffffff7e8fe7ff>
    80002dfe:	8f7d                	and	a4,a4,a5
    80002e00:	6785                	lui	a5,0x1
    80002e02:	80078793          	addi	a5,a5,-2048 # 800 <_fw_start-0x7ffff800>
    80002e06:	8fd9                	or	a5,a5,a4
    80002e08:	0087d313          	srli	t1,a5,0x8
    80002e0c:	0107d893          	srli	a7,a5,0x10
    80002e10:	0187d81b          	srliw	a6,a5,0x18
    80002e14:	0207d513          	srli	a0,a5,0x20
    80002e18:	0287d593          	srli	a1,a5,0x28
    80002e1c:	0307d613          	srli	a2,a5,0x30
    80002e20:	0086da13          	srli	s4,a3,0x8
    80002e24:	0106d393          	srli	t2,a3,0x10
    80002e28:	0186d29b          	srliw	t0,a3,0x18
    80002e2c:	0206df93          	srli	t6,a3,0x20
    80002e30:	0286df13          	srli	t5,a3,0x28
    80002e34:	0306de93          	srli	t4,a3,0x30
    80002e38:	0386de13          	srli	t3,a3,0x38
    80002e3c:	93e1                	srli	a5,a5,0x38
    80002e3e:	10d48023          	sb	a3,256(s1)
    80002e42:	114480a3          	sb	s4,257(s1)
    80002e46:	10748123          	sb	t2,258(s1)
    80002e4a:	105481a3          	sb	t0,259(s1)
    80002e4e:	11f48223          	sb	t6,260(s1)
    80002e52:	11e482a3          	sb	t5,261(s1)
    80002e56:	11d48323          	sb	t4,262(s1)
    80002e5a:	11c483a3          	sb	t3,263(s1)
    80002e5e:	10e48423          	sb	a4,264(s1)
    80002e62:	106484a3          	sb	t1,265(s1)
    80002e66:	11148523          	sb	a7,266(s1)
    80002e6a:	110485a3          	sb	a6,267(s1)
    80002e6e:	10a48623          	sb	a0,268(s1)
    80002e72:	10b486a3          	sb	a1,269(s1)
    80002e76:	10c48723          	sb	a2,270(s1)
    80002e7a:	10f487a3          	sb	a5,271(s1)
    80002e7e:	200027f3          	csrr	a5,0x200
    80002e82:	eff7f793          	andi	a5,a5,-257
    80002e86:	01299463          	bne	s3,s2,80002e8e <sbi_trap_redirect+0x41c>
    80002e8a:	1007e793          	ori	a5,a5,256
    80002e8e:	0027f713          	andi	a4,a5,2
    80002e92:	fdf7f793          	andi	a5,a5,-33
    80002e96:	c319                	beqz	a4,80002e9c <sbi_trap_redirect+0x42a>
    80002e98:	0207e793          	ori	a5,a5,32
    80002e9c:	9bf5                	andi	a5,a5,-3
    80002e9e:	20079073          	csrw	0x200,a5
    80002ea2:	70a2                	ld	ra,40(sp)
    80002ea4:	7402                	ld	s0,32(sp)
    80002ea6:	64e2                	ld	s1,24(sp)
    80002ea8:	6942                	ld	s2,16(sp)
    80002eaa:	69a2                	ld	s3,8(sp)
    80002eac:	6a02                	ld	s4,0(sp)
    80002eae:	4501                	li	a0,0
    80002eb0:	6145                	addi	sp,sp,48
    80002eb2:	8082                	ret
    80002eb4:	0087d893          	srli	a7,a5,0x8
    80002eb8:	0107d813          	srli	a6,a5,0x10
    80002ebc:	0187d51b          	srliw	a0,a5,0x18
    80002ec0:	0207d593          	srli	a1,a5,0x20
    80002ec4:	0287d613          	srli	a2,a5,0x28
    80002ec8:	0307d693          	srli	a3,a5,0x30
    80002ecc:	93e1                	srli	a5,a5,0x38
    80002ece:	10a485a3          	sb	a0,267(s1)
    80002ed2:	10e48423          	sb	a4,264(s1)
    80002ed6:	111484a3          	sb	a7,265(s1)
    80002eda:	11048523          	sb	a6,266(s1)
    80002ede:	10b48623          	sb	a1,268(s1)
    80002ee2:	10c486a3          	sb	a2,269(s1)
    80002ee6:	10d48723          	sb	a3,270(s1)
    80002eea:	10f487a3          	sb	a5,271(s1)
    80002eee:	04800513          	li	a0,72
    80002ef2:	2a2010ef          	jal	ra,80004194 <misa_extension_imp>
    80002ef6:	b1d9                	j	80002bbc <sbi_trap_redirect+0x14a>
    80002ef8:	90070713          	addi	a4,a4,-1792
    80002efc:	8fd9                	or	a5,a5,a4
    80002efe:	b3a5                	j	80002c66 <sbi_trap_redirect+0x1f4>
    80002f00:	5579                	li	a0,-2
    80002f02:	bb4d                	j	80002cb4 <sbi_trap_redirect+0x242>

0000000080002f04 <sbi_trap_handler>:
    80002f04:	7119                	addi	sp,sp,-128
    80002f06:	f8a2                	sd	s0,112(sp)
    80002f08:	f4a6                	sd	s1,104(sp)
    80002f0a:	ecce                	sd	s3,88(sp)
    80002f0c:	e0da                	sd	s6,64(sp)
    80002f0e:	fc86                	sd	ra,120(sp)
    80002f10:	f0ca                	sd	s2,96(sp)
    80002f12:	e8d2                	sd	s4,80(sp)
    80002f14:	e4d6                	sd	s5,72(sp)
    80002f16:	fc5e                	sd	s7,56(sp)
    80002f18:	f862                	sd	s8,48(sp)
    80002f1a:	0100                	addi	s0,sp,128
    80002f1c:	84aa                	mv	s1,a0
    80002f1e:	8b2e                	mv	s6,a1
    80002f20:	65e040ef          	jal	ra,8000757e <sbi_current_hartid>
    80002f24:	0005099b          	sext.w	s3,a0
    80002f28:	34202973          	csrr	s2,mcause
    80002f2c:	8a4a                	mv	s4,s2
    80002f2e:	34302af3          	csrr	s5,mtval
    80002f32:	04800513          	li	a0,72
    80002f36:	25e010ef          	jal	ra,80004194 <misa_extension_imp>
    80002f3a:	c50d                	beqz	a0,80002f64 <sbi_trap_handler+0x60>
    80002f3c:	34b02bf3          	csrr	s7,0x34b
    80002f40:	34a02c73          	csrr	s8,0x34a
    80002f44:	02094463          	bltz	s2,80002f6c <sbi_trap_handler+0x68>
    80002f48:	47bd                	li	a5,15
    80002f4a:	5327e8e3          	bltu	a5,s2,80003c7a <sbi_trap_handler+0xd76>
    80002f4e:	00009717          	auipc	a4,0x9
    80002f52:	69a70713          	addi	a4,a4,1690 # 8000c5e8 <fdt_move+0xa34>
    80002f56:	00291893          	slli	a7,s2,0x2
    80002f5a:	98ba                	add	a7,a7,a4
    80002f5c:	0008a783          	lw	a5,0(a7)
    80002f60:	97ba                	add	a5,a5,a4
    80002f62:	8782                	jr	a5
    80002f64:	4c01                	li	s8,0
    80002f66:	4b81                	li	s7,0
    80002f68:	fe0950e3          	bgez	s2,80002f48 <sbi_trap_handler+0x44>
    80002f6c:	0906                	slli	s2,s2,0x1
    80002f6e:	00195a13          	srli	s4,s2,0x1
    80002f72:	478d                	li	a5,3
    80002f74:	64fa00e3          	beq	s4,a5,80003db4 <sbi_trap_handler+0xeb0>
    80002f78:	479d                	li	a5,7
    80002f7a:	02fa1163          	bne	s4,a5,80002f9c <sbi_trap_handler+0x98>
    80002f7e:	855a                	mv	a0,s6
    80002f80:	9d0ff0ef          	jal	ra,80002150 <sbi_timer_process>
    80002f84:	70e6                	ld	ra,120(sp)
    80002f86:	7446                	ld	s0,112(sp)
    80002f88:	74a6                	ld	s1,104(sp)
    80002f8a:	7906                	ld	s2,96(sp)
    80002f8c:	69e6                	ld	s3,88(sp)
    80002f8e:	6a46                	ld	s4,80(sp)
    80002f90:	6aa6                	ld	s5,72(sp)
    80002f92:	6b06                	ld	s6,64(sp)
    80002f94:	7be2                	ld	s7,56(sp)
    80002f96:	7c42                	ld	s8,48(sp)
    80002f98:	6109                	addi	sp,sp,128
    80002f9a:	8082                	ret
    80002f9c:	00009697          	auipc	a3,0x9
    80002fa0:	43c68693          	addi	a3,a3,1084 # 8000c3d8 <fdt_move+0x824>
    80002fa4:	5579                	li	a0,-2
    80002fa6:	872a                	mv	a4,a0
    80002fa8:	00009597          	auipc	a1,0x9
    80002fac:	68058593          	addi	a1,a1,1664 # 8000c628 <__func__.0>
    80002fb0:	864e                	mv	a2,s3
    80002fb2:	00009517          	auipc	a0,0x9
    80002fb6:	44650513          	addi	a0,a0,1094 # 8000c3f8 <fdt_move+0x844>
    80002fba:	464020ef          	jal	ra,8000541e <sbi_printf>
    80002fbe:	8756                	mv	a4,s5
    80002fc0:	86d2                	mv	a3,s4
    80002fc2:	864e                	mv	a2,s3
    80002fc4:	00009597          	auipc	a1,0x9
    80002fc8:	66458593          	addi	a1,a1,1636 # 8000c628 <__func__.0>
    80002fcc:	00009517          	auipc	a0,0x9
    80002fd0:	44c50513          	addi	a0,a0,1100 # 8000c418 <fdt_move+0x864>
    80002fd4:	44a020ef          	jal	ra,8000541e <sbi_printf>
    80002fd8:	04800513          	li	a0,72
    80002fdc:	1b8010ef          	jal	ra,80004194 <misa_extension_imp>
    80002fe0:	5c051fe3          	bnez	a0,80003dbe <sbi_trap_handler+0xeba>
    80002fe4:	1094cf03          	lbu	t5,265(s1)
    80002fe8:	1014ce83          	lbu	t4,257(s1)
    80002fec:	1084c703          	lbu	a4,264(s1)
    80002ff0:	1004c783          	lbu	a5,256(s1)
    80002ff4:	10a4ce03          	lbu	t3,266(s1)
    80002ff8:	1024c303          	lbu	t1,258(s1)
    80002ffc:	10b4c883          	lbu	a7,267(s1)
    80003000:	1034c803          	lbu	a6,259(s1)
    80003004:	10c4c503          	lbu	a0,268(s1)
    80003008:	1044c583          	lbu	a1,260(s1)
    8000300c:	0f22                	slli	t5,t5,0x8
    8000300e:	0ea2                	slli	t4,t4,0x8
    80003010:	00ef6f33          	or	t5,t5,a4
    80003014:	00feeeb3          	or	t4,t4,a5
    80003018:	10d4c603          	lbu	a2,269(s1)
    8000301c:	1054c683          	lbu	a3,261(s1)
    80003020:	0e42                	slli	t3,t3,0x10
    80003022:	0342                	slli	t1,t1,0x10
    80003024:	01ee6e33          	or	t3,t3,t5
    80003028:	01d36333          	or	t1,t1,t4
    8000302c:	10e4c703          	lbu	a4,270(s1)
    80003030:	1064c783          	lbu	a5,262(s1)
    80003034:	08e2                	slli	a7,a7,0x18
    80003036:	0862                	slli	a6,a6,0x18
    80003038:	01c8e8b3          	or	a7,a7,t3
    8000303c:	00686833          	or	a6,a6,t1
    80003040:	1074ce83          	lbu	t4,263(s1)
    80003044:	10f4cf03          	lbu	t5,271(s1)
    80003048:	1502                	slli	a0,a0,0x20
    8000304a:	1582                	slli	a1,a1,0x20
    8000304c:	01156533          	or	a0,a0,a7
    80003050:	0105e5b3          	or	a1,a1,a6
    80003054:	1622                	slli	a2,a2,0x28
    80003056:	16a2                	slli	a3,a3,0x28
    80003058:	8e49                	or	a2,a2,a0
    8000305a:	8ecd                	or	a3,a3,a1
    8000305c:	1742                	slli	a4,a4,0x30
    8000305e:	17c2                	slli	a5,a5,0x30
    80003060:	8fd5                	or	a5,a5,a3
    80003062:	1f62                	slli	t5,t5,0x38
    80003064:	038e9693          	slli	a3,t4,0x38
    80003068:	8f51                	or	a4,a4,a2
    8000306a:	00ef6733          	or	a4,t5,a4
    8000306e:	8edd                	or	a3,a3,a5
    80003070:	864e                	mv	a2,s3
    80003072:	00009597          	auipc	a1,0x9
    80003076:	5b658593          	addi	a1,a1,1462 # 8000c628 <__func__.0>
    8000307a:	00009517          	auipc	a0,0x9
    8000307e:	3fe50513          	addi	a0,a0,1022 # 8000c478 <fdt_move+0x8c4>
    80003082:	39c020ef          	jal	ra,8000541e <sbi_printf>
    80003086:	0114cf03          	lbu	t5,17(s1)
    8000308a:	0094ce83          	lbu	t4,9(s1)
    8000308e:	0104c703          	lbu	a4,16(s1)
    80003092:	0084c783          	lbu	a5,8(s1)
    80003096:	0124ce03          	lbu	t3,18(s1)
    8000309a:	00a4c303          	lbu	t1,10(s1)
    8000309e:	0134c883          	lbu	a7,19(s1)
    800030a2:	00b4c803          	lbu	a6,11(s1)
    800030a6:	0144c503          	lbu	a0,20(s1)
    800030aa:	00c4c583          	lbu	a1,12(s1)
    800030ae:	0f22                	slli	t5,t5,0x8
    800030b0:	0ea2                	slli	t4,t4,0x8
    800030b2:	00ef6f33          	or	t5,t5,a4
    800030b6:	00feeeb3          	or	t4,t4,a5
    800030ba:	0154c603          	lbu	a2,21(s1)
    800030be:	00d4c683          	lbu	a3,13(s1)
    800030c2:	0e42                	slli	t3,t3,0x10
    800030c4:	0342                	slli	t1,t1,0x10
    800030c6:	01ee6e33          	or	t3,t3,t5
    800030ca:	01d36333          	or	t1,t1,t4
    800030ce:	0164c783          	lbu	a5,22(s1)
    800030d2:	00e4c703          	lbu	a4,14(s1)
    800030d6:	08e2                	slli	a7,a7,0x18
    800030d8:	0862                	slli	a6,a6,0x18
    800030da:	01c8e8b3          	or	a7,a7,t3
    800030de:	00686833          	or	a6,a6,t1
    800030e2:	0174cf03          	lbu	t5,23(s1)
    800030e6:	00f4ce83          	lbu	t4,15(s1)
    800030ea:	1502                	slli	a0,a0,0x20
    800030ec:	1582                	slli	a1,a1,0x20
    800030ee:	01156533          	or	a0,a0,a7
    800030f2:	0105e5b3          	or	a1,a1,a6
    800030f6:	1622                	slli	a2,a2,0x28
    800030f8:	16a2                	slli	a3,a3,0x28
    800030fa:	8e49                	or	a2,a2,a0
    800030fc:	8ecd                	or	a3,a3,a1
    800030fe:	17c2                	slli	a5,a5,0x30
    80003100:	1742                	slli	a4,a4,0x30
    80003102:	8fd1                	or	a5,a5,a2
    80003104:	038f1813          	slli	a6,t5,0x38
    80003108:	1ee2                	slli	t4,t4,0x38
    8000310a:	8f55                	or	a4,a4,a3
    8000310c:	00f86833          	or	a6,a6,a5
    80003110:	00eee733          	or	a4,t4,a4
    80003114:	00009797          	auipc	a5,0x9
    80003118:	39478793          	addi	a5,a5,916 # 8000c4a8 <fdt_move+0x8f4>
    8000311c:	00009697          	auipc	a3,0x9
    80003120:	39468693          	addi	a3,a3,916 # 8000c4b0 <fdt_move+0x8fc>
    80003124:	864e                	mv	a2,s3
    80003126:	00009597          	auipc	a1,0x9
    8000312a:	50258593          	addi	a1,a1,1282 # 8000c628 <__func__.0>
    8000312e:	00009517          	auipc	a0,0x9
    80003132:	38a50513          	addi	a0,a0,906 # 8000c4b8 <fdt_move+0x904>
    80003136:	2e8020ef          	jal	ra,8000541e <sbi_printf>
    8000313a:	0214cf03          	lbu	t5,33(s1)
    8000313e:	0194ce83          	lbu	t4,25(s1)
    80003142:	0204c703          	lbu	a4,32(s1)
    80003146:	0184c783          	lbu	a5,24(s1)
    8000314a:	0224ce03          	lbu	t3,34(s1)
    8000314e:	01a4c303          	lbu	t1,26(s1)
    80003152:	0234c883          	lbu	a7,35(s1)
    80003156:	01b4c803          	lbu	a6,27(s1)
    8000315a:	0244c503          	lbu	a0,36(s1)
    8000315e:	01c4c583          	lbu	a1,28(s1)
    80003162:	0f22                	slli	t5,t5,0x8
    80003164:	0ea2                	slli	t4,t4,0x8
    80003166:	00ef6f33          	or	t5,t5,a4
    8000316a:	00feeeb3          	or	t4,t4,a5
    8000316e:	0254c603          	lbu	a2,37(s1)
    80003172:	01d4c683          	lbu	a3,29(s1)
    80003176:	0e42                	slli	t3,t3,0x10
    80003178:	0342                	slli	t1,t1,0x10
    8000317a:	01ee6e33          	or	t3,t3,t5
    8000317e:	01d36333          	or	t1,t1,t4
    80003182:	0264c783          	lbu	a5,38(s1)
    80003186:	01e4c703          	lbu	a4,30(s1)
    8000318a:	08e2                	slli	a7,a7,0x18
    8000318c:	0862                	slli	a6,a6,0x18
    8000318e:	01c8e8b3          	or	a7,a7,t3
    80003192:	00686833          	or	a6,a6,t1
    80003196:	0274cf03          	lbu	t5,39(s1)
    8000319a:	01f4ce83          	lbu	t4,31(s1)
    8000319e:	1502                	slli	a0,a0,0x20
    800031a0:	1582                	slli	a1,a1,0x20
    800031a2:	01156533          	or	a0,a0,a7
    800031a6:	0105e5b3          	or	a1,a1,a6
    800031aa:	1622                	slli	a2,a2,0x28
    800031ac:	16a2                	slli	a3,a3,0x28
    800031ae:	8e49                	or	a2,a2,a0
    800031b0:	8ecd                	or	a3,a3,a1
    800031b2:	17c2                	slli	a5,a5,0x30
    800031b4:	1742                	slli	a4,a4,0x30
    800031b6:	8fd1                	or	a5,a5,a2
    800031b8:	038f1813          	slli	a6,t5,0x38
    800031bc:	1ee2                	slli	t4,t4,0x38
    800031be:	8f55                	or	a4,a4,a3
    800031c0:	00f86833          	or	a6,a6,a5
    800031c4:	00eee733          	or	a4,t4,a4
    800031c8:	00009797          	auipc	a5,0x9
    800031cc:	31878793          	addi	a5,a5,792 # 8000c4e0 <fdt_move+0x92c>
    800031d0:	00009697          	auipc	a3,0x9
    800031d4:	31868693          	addi	a3,a3,792 # 8000c4e8 <fdt_move+0x934>
    800031d8:	864e                	mv	a2,s3
    800031da:	00009597          	auipc	a1,0x9
    800031de:	44e58593          	addi	a1,a1,1102 # 8000c628 <__func__.0>
    800031e2:	00009517          	auipc	a0,0x9
    800031e6:	2d650513          	addi	a0,a0,726 # 8000c4b8 <fdt_move+0x904>
    800031ea:	234020ef          	jal	ra,8000541e <sbi_printf>
    800031ee:	0494cf03          	lbu	t5,73(s1)
    800031f2:	0414ce83          	lbu	t4,65(s1)
    800031f6:	0484c703          	lbu	a4,72(s1)
    800031fa:	0404c783          	lbu	a5,64(s1)
    800031fe:	04a4ce03          	lbu	t3,74(s1)
    80003202:	0424c303          	lbu	t1,66(s1)
    80003206:	04b4c883          	lbu	a7,75(s1)
    8000320a:	0434c803          	lbu	a6,67(s1)
    8000320e:	04c4c503          	lbu	a0,76(s1)
    80003212:	0444c583          	lbu	a1,68(s1)
    80003216:	0f22                	slli	t5,t5,0x8
    80003218:	0ea2                	slli	t4,t4,0x8
    8000321a:	00ef6f33          	or	t5,t5,a4
    8000321e:	00feeeb3          	or	t4,t4,a5
    80003222:	04d4c603          	lbu	a2,77(s1)
    80003226:	0454c683          	lbu	a3,69(s1)
    8000322a:	0e42                	slli	t3,t3,0x10
    8000322c:	0342                	slli	t1,t1,0x10
    8000322e:	01ee6e33          	or	t3,t3,t5
    80003232:	01d36333          	or	t1,t1,t4
    80003236:	04e4c783          	lbu	a5,78(s1)
    8000323a:	0464c703          	lbu	a4,70(s1)
    8000323e:	08e2                	slli	a7,a7,0x18
    80003240:	0862                	slli	a6,a6,0x18
    80003242:	01c8e8b3          	or	a7,a7,t3
    80003246:	00686833          	or	a6,a6,t1
    8000324a:	04f4cf03          	lbu	t5,79(s1)
    8000324e:	0474ce83          	lbu	t4,71(s1)
    80003252:	1502                	slli	a0,a0,0x20
    80003254:	1582                	slli	a1,a1,0x20
    80003256:	01156533          	or	a0,a0,a7
    8000325a:	0105e5b3          	or	a1,a1,a6
    8000325e:	1622                	slli	a2,a2,0x28
    80003260:	16a2                	slli	a3,a3,0x28
    80003262:	8e49                	or	a2,a2,a0
    80003264:	8ecd                	or	a3,a3,a1
    80003266:	17c2                	slli	a5,a5,0x30
    80003268:	1742                	slli	a4,a4,0x30
    8000326a:	8fd1                	or	a5,a5,a2
    8000326c:	038f1813          	slli	a6,t5,0x38
    80003270:	1ee2                	slli	t4,t4,0x38
    80003272:	8f55                	or	a4,a4,a3
    80003274:	00f86833          	or	a6,a6,a5
    80003278:	00eee733          	or	a4,t4,a4
    8000327c:	00009797          	auipc	a5,0x9
    80003280:	27478793          	addi	a5,a5,628 # 8000c4f0 <fdt_move+0x93c>
    80003284:	00009697          	auipc	a3,0x9
    80003288:	27468693          	addi	a3,a3,628 # 8000c4f8 <fdt_move+0x944>
    8000328c:	864e                	mv	a2,s3
    8000328e:	00009597          	auipc	a1,0x9
    80003292:	39a58593          	addi	a1,a1,922 # 8000c628 <__func__.0>
    80003296:	00009517          	auipc	a0,0x9
    8000329a:	22250513          	addi	a0,a0,546 # 8000c4b8 <fdt_move+0x904>
    8000329e:	180020ef          	jal	ra,8000541e <sbi_printf>
    800032a2:	0594cf03          	lbu	t5,89(s1)
    800032a6:	0514ce83          	lbu	t4,81(s1)
    800032aa:	0584c703          	lbu	a4,88(s1)
    800032ae:	0504c783          	lbu	a5,80(s1)
    800032b2:	05a4ce03          	lbu	t3,90(s1)
    800032b6:	0524c303          	lbu	t1,82(s1)
    800032ba:	05b4c883          	lbu	a7,91(s1)
    800032be:	0534c803          	lbu	a6,83(s1)
    800032c2:	05c4c503          	lbu	a0,92(s1)
    800032c6:	0544c583          	lbu	a1,84(s1)
    800032ca:	0f22                	slli	t5,t5,0x8
    800032cc:	0ea2                	slli	t4,t4,0x8
    800032ce:	00ef6f33          	or	t5,t5,a4
    800032d2:	00feeeb3          	or	t4,t4,a5
    800032d6:	05d4c603          	lbu	a2,93(s1)
    800032da:	0554c683          	lbu	a3,85(s1)
    800032de:	0e42                	slli	t3,t3,0x10
    800032e0:	0342                	slli	t1,t1,0x10
    800032e2:	01ee6e33          	or	t3,t3,t5
    800032e6:	01d36333          	or	t1,t1,t4
    800032ea:	05e4c783          	lbu	a5,94(s1)
    800032ee:	0564c703          	lbu	a4,86(s1)
    800032f2:	08e2                	slli	a7,a7,0x18
    800032f4:	0862                	slli	a6,a6,0x18
    800032f6:	01c8e8b3          	or	a7,a7,t3
    800032fa:	00686833          	or	a6,a6,t1
    800032fe:	05f4cf03          	lbu	t5,95(s1)
    80003302:	0574ce83          	lbu	t4,87(s1)
    80003306:	1502                	slli	a0,a0,0x20
    80003308:	1582                	slli	a1,a1,0x20
    8000330a:	01156533          	or	a0,a0,a7
    8000330e:	0105e5b3          	or	a1,a1,a6
    80003312:	1622                	slli	a2,a2,0x28
    80003314:	16a2                	slli	a3,a3,0x28
    80003316:	8e49                	or	a2,a2,a0
    80003318:	8ecd                	or	a3,a3,a1
    8000331a:	17c2                	slli	a5,a5,0x30
    8000331c:	1742                	slli	a4,a4,0x30
    8000331e:	8fd1                	or	a5,a5,a2
    80003320:	038f1813          	slli	a6,t5,0x38
    80003324:	1ee2                	slli	t4,t4,0x38
    80003326:	8f55                	or	a4,a4,a3
    80003328:	00f86833          	or	a6,a6,a5
    8000332c:	00eee733          	or	a4,t4,a4
    80003330:	00009797          	auipc	a5,0x9
    80003334:	1d078793          	addi	a5,a5,464 # 8000c500 <fdt_move+0x94c>
    80003338:	00009697          	auipc	a3,0x9
    8000333c:	1d068693          	addi	a3,a3,464 # 8000c508 <fdt_move+0x954>
    80003340:	864e                	mv	a2,s3
    80003342:	00009597          	auipc	a1,0x9
    80003346:	2e658593          	addi	a1,a1,742 # 8000c628 <__func__.0>
    8000334a:	00009517          	auipc	a0,0x9
    8000334e:	16e50513          	addi	a0,a0,366 # 8000c4b8 <fdt_move+0x904>
    80003352:	0cc020ef          	jal	ra,8000541e <sbi_printf>
    80003356:	0694cf03          	lbu	t5,105(s1)
    8000335a:	0614ce83          	lbu	t4,97(s1)
    8000335e:	0684c703          	lbu	a4,104(s1)
    80003362:	0604c783          	lbu	a5,96(s1)
    80003366:	06a4ce03          	lbu	t3,106(s1)
    8000336a:	0624c303          	lbu	t1,98(s1)
    8000336e:	06b4c883          	lbu	a7,107(s1)
    80003372:	0634c803          	lbu	a6,99(s1)
    80003376:	06c4c503          	lbu	a0,108(s1)
    8000337a:	0644c583          	lbu	a1,100(s1)
    8000337e:	0f22                	slli	t5,t5,0x8
    80003380:	0ea2                	slli	t4,t4,0x8
    80003382:	00ef6f33          	or	t5,t5,a4
    80003386:	00feeeb3          	or	t4,t4,a5
    8000338a:	06d4c603          	lbu	a2,109(s1)
    8000338e:	0654c683          	lbu	a3,101(s1)
    80003392:	0e42                	slli	t3,t3,0x10
    80003394:	0342                	slli	t1,t1,0x10
    80003396:	01ee6e33          	or	t3,t3,t5
    8000339a:	01d36333          	or	t1,t1,t4
    8000339e:	06e4c783          	lbu	a5,110(s1)
    800033a2:	0664c703          	lbu	a4,102(s1)
    800033a6:	08e2                	slli	a7,a7,0x18
    800033a8:	0862                	slli	a6,a6,0x18
    800033aa:	01c8e8b3          	or	a7,a7,t3
    800033ae:	00686833          	or	a6,a6,t1
    800033b2:	06f4cf03          	lbu	t5,111(s1)
    800033b6:	0674ce83          	lbu	t4,103(s1)
    800033ba:	1502                	slli	a0,a0,0x20
    800033bc:	1582                	slli	a1,a1,0x20
    800033be:	01156533          	or	a0,a0,a7
    800033c2:	0105e5b3          	or	a1,a1,a6
    800033c6:	1622                	slli	a2,a2,0x28
    800033c8:	16a2                	slli	a3,a3,0x28
    800033ca:	8e49                	or	a2,a2,a0
    800033cc:	8ecd                	or	a3,a3,a1
    800033ce:	17c2                	slli	a5,a5,0x30
    800033d0:	1742                	slli	a4,a4,0x30
    800033d2:	8fd1                	or	a5,a5,a2
    800033d4:	038f1813          	slli	a6,t5,0x38
    800033d8:	1ee2                	slli	t4,t4,0x38
    800033da:	8f55                	or	a4,a4,a3
    800033dc:	00f86833          	or	a6,a6,a5
    800033e0:	00eee733          	or	a4,t4,a4
    800033e4:	00009797          	auipc	a5,0x9
    800033e8:	12c78793          	addi	a5,a5,300 # 8000c510 <fdt_move+0x95c>
    800033ec:	00009697          	auipc	a3,0x9
    800033f0:	12c68693          	addi	a3,a3,300 # 8000c518 <fdt_move+0x964>
    800033f4:	864e                	mv	a2,s3
    800033f6:	00009597          	auipc	a1,0x9
    800033fa:	23258593          	addi	a1,a1,562 # 8000c628 <__func__.0>
    800033fe:	00009517          	auipc	a0,0x9
    80003402:	0ba50513          	addi	a0,a0,186 # 8000c4b8 <fdt_move+0x904>
    80003406:	018020ef          	jal	ra,8000541e <sbi_printf>
    8000340a:	0794cf03          	lbu	t5,121(s1)
    8000340e:	0714ce83          	lbu	t4,113(s1)
    80003412:	0784c703          	lbu	a4,120(s1)
    80003416:	0704c783          	lbu	a5,112(s1)
    8000341a:	07a4ce03          	lbu	t3,122(s1)
    8000341e:	0724c303          	lbu	t1,114(s1)
    80003422:	07b4c883          	lbu	a7,123(s1)
    80003426:	0734c803          	lbu	a6,115(s1)
    8000342a:	07c4c503          	lbu	a0,124(s1)
    8000342e:	0744c583          	lbu	a1,116(s1)
    80003432:	0f22                	slli	t5,t5,0x8
    80003434:	0ea2                	slli	t4,t4,0x8
    80003436:	00ef6f33          	or	t5,t5,a4
    8000343a:	00feeeb3          	or	t4,t4,a5
    8000343e:	07d4c603          	lbu	a2,125(s1)
    80003442:	0754c683          	lbu	a3,117(s1)
    80003446:	0e42                	slli	t3,t3,0x10
    80003448:	0342                	slli	t1,t1,0x10
    8000344a:	01ee6e33          	or	t3,t3,t5
    8000344e:	01d36333          	or	t1,t1,t4
    80003452:	07e4c783          	lbu	a5,126(s1)
    80003456:	0764c703          	lbu	a4,118(s1)
    8000345a:	08e2                	slli	a7,a7,0x18
    8000345c:	0862                	slli	a6,a6,0x18
    8000345e:	01c8e8b3          	or	a7,a7,t3
    80003462:	00686833          	or	a6,a6,t1
    80003466:	07f4cf03          	lbu	t5,127(s1)
    8000346a:	0774ce83          	lbu	t4,119(s1)
    8000346e:	1502                	slli	a0,a0,0x20
    80003470:	1582                	slli	a1,a1,0x20
    80003472:	01156533          	or	a0,a0,a7
    80003476:	0105e5b3          	or	a1,a1,a6
    8000347a:	1622                	slli	a2,a2,0x28
    8000347c:	16a2                	slli	a3,a3,0x28
    8000347e:	8e49                	or	a2,a2,a0
    80003480:	8ecd                	or	a3,a3,a1
    80003482:	17c2                	slli	a5,a5,0x30
    80003484:	1742                	slli	a4,a4,0x30
    80003486:	8fd1                	or	a5,a5,a2
    80003488:	038f1813          	slli	a6,t5,0x38
    8000348c:	1ee2                	slli	t4,t4,0x38
    8000348e:	8f55                	or	a4,a4,a3
    80003490:	00f86833          	or	a6,a6,a5
    80003494:	00eee733          	or	a4,t4,a4
    80003498:	00009797          	auipc	a5,0x9
    8000349c:	08878793          	addi	a5,a5,136 # 8000c520 <fdt_move+0x96c>
    800034a0:	00009697          	auipc	a3,0x9
    800034a4:	08868693          	addi	a3,a3,136 # 8000c528 <fdt_move+0x974>
    800034a8:	864e                	mv	a2,s3
    800034aa:	00009597          	auipc	a1,0x9
    800034ae:	17e58593          	addi	a1,a1,382 # 8000c628 <__func__.0>
    800034b2:	00009517          	auipc	a0,0x9
    800034b6:	00650513          	addi	a0,a0,6 # 8000c4b8 <fdt_move+0x904>
    800034ba:	765010ef          	jal	ra,8000541e <sbi_printf>
    800034be:	0894cf03          	lbu	t5,137(s1)
    800034c2:	0814ce83          	lbu	t4,129(s1)
    800034c6:	0884c703          	lbu	a4,136(s1)
    800034ca:	0804c783          	lbu	a5,128(s1)
    800034ce:	08a4ce03          	lbu	t3,138(s1)
    800034d2:	0824c303          	lbu	t1,130(s1)
    800034d6:	08b4c883          	lbu	a7,139(s1)
    800034da:	0834c803          	lbu	a6,131(s1)
    800034de:	08c4c503          	lbu	a0,140(s1)
    800034e2:	0844c583          	lbu	a1,132(s1)
    800034e6:	0f22                	slli	t5,t5,0x8
    800034e8:	0ea2                	slli	t4,t4,0x8
    800034ea:	00ef6f33          	or	t5,t5,a4
    800034ee:	00feeeb3          	or	t4,t4,a5
    800034f2:	08d4c603          	lbu	a2,141(s1)
    800034f6:	0854c683          	lbu	a3,133(s1)
    800034fa:	0e42                	slli	t3,t3,0x10
    800034fc:	0342                	slli	t1,t1,0x10
    800034fe:	01ee6e33          	or	t3,t3,t5
    80003502:	01d36333          	or	t1,t1,t4
    80003506:	08e4c783          	lbu	a5,142(s1)
    8000350a:	0864c703          	lbu	a4,134(s1)
    8000350e:	08e2                	slli	a7,a7,0x18
    80003510:	0862                	slli	a6,a6,0x18
    80003512:	01c8e8b3          	or	a7,a7,t3
    80003516:	00686833          	or	a6,a6,t1
    8000351a:	08f4cf03          	lbu	t5,143(s1)
    8000351e:	0874ce83          	lbu	t4,135(s1)
    80003522:	1502                	slli	a0,a0,0x20
    80003524:	1582                	slli	a1,a1,0x20
    80003526:	01156533          	or	a0,a0,a7
    8000352a:	0105e5b3          	or	a1,a1,a6
    8000352e:	1622                	slli	a2,a2,0x28
    80003530:	16a2                	slli	a3,a3,0x28
    80003532:	8e49                	or	a2,a2,a0
    80003534:	8ecd                	or	a3,a3,a1
    80003536:	17c2                	slli	a5,a5,0x30
    80003538:	1742                	slli	a4,a4,0x30
    8000353a:	8fd1                	or	a5,a5,a2
    8000353c:	038f1813          	slli	a6,t5,0x38
    80003540:	1ee2                	slli	t4,t4,0x38
    80003542:	8f55                	or	a4,a4,a3
    80003544:	00f86833          	or	a6,a6,a5
    80003548:	00eee733          	or	a4,t4,a4
    8000354c:	00009797          	auipc	a5,0x9
    80003550:	fe478793          	addi	a5,a5,-28 # 8000c530 <fdt_move+0x97c>
    80003554:	00009697          	auipc	a3,0x9
    80003558:	fe468693          	addi	a3,a3,-28 # 8000c538 <fdt_move+0x984>
    8000355c:	864e                	mv	a2,s3
    8000355e:	00009597          	auipc	a1,0x9
    80003562:	0ca58593          	addi	a1,a1,202 # 8000c628 <__func__.0>
    80003566:	00009517          	auipc	a0,0x9
    8000356a:	f5250513          	addi	a0,a0,-174 # 8000c4b8 <fdt_move+0x904>
    8000356e:	6b1010ef          	jal	ra,8000541e <sbi_printf>
    80003572:	0994cf03          	lbu	t5,153(s1)
    80003576:	0914ce83          	lbu	t4,145(s1)
    8000357a:	0984c703          	lbu	a4,152(s1)
    8000357e:	0904c783          	lbu	a5,144(s1)
    80003582:	09a4ce03          	lbu	t3,154(s1)
    80003586:	0924c303          	lbu	t1,146(s1)
    8000358a:	09b4c883          	lbu	a7,155(s1)
    8000358e:	0934c803          	lbu	a6,147(s1)
    80003592:	09c4c503          	lbu	a0,156(s1)
    80003596:	0944c583          	lbu	a1,148(s1)
    8000359a:	0f22                	slli	t5,t5,0x8
    8000359c:	0ea2                	slli	t4,t4,0x8
    8000359e:	00ef6f33          	or	t5,t5,a4
    800035a2:	00feeeb3          	or	t4,t4,a5
    800035a6:	09d4c603          	lbu	a2,157(s1)
    800035aa:	0954c683          	lbu	a3,149(s1)
    800035ae:	0e42                	slli	t3,t3,0x10
    800035b0:	0342                	slli	t1,t1,0x10
    800035b2:	01ee6e33          	or	t3,t3,t5
    800035b6:	01d36333          	or	t1,t1,t4
    800035ba:	09e4c783          	lbu	a5,158(s1)
    800035be:	0964c703          	lbu	a4,150(s1)
    800035c2:	08e2                	slli	a7,a7,0x18
    800035c4:	0862                	slli	a6,a6,0x18
    800035c6:	01c8e8b3          	or	a7,a7,t3
    800035ca:	00686833          	or	a6,a6,t1
    800035ce:	09f4cf03          	lbu	t5,159(s1)
    800035d2:	0974ce83          	lbu	t4,151(s1)
    800035d6:	1502                	slli	a0,a0,0x20
    800035d8:	1582                	slli	a1,a1,0x20
    800035da:	01156533          	or	a0,a0,a7
    800035de:	0105e5b3          	or	a1,a1,a6
    800035e2:	1622                	slli	a2,a2,0x28
    800035e4:	16a2                	slli	a3,a3,0x28
    800035e6:	8e49                	or	a2,a2,a0
    800035e8:	8ecd                	or	a3,a3,a1
    800035ea:	17c2                	slli	a5,a5,0x30
    800035ec:	1742                	slli	a4,a4,0x30
    800035ee:	8fd1                	or	a5,a5,a2
    800035f0:	038f1813          	slli	a6,t5,0x38
    800035f4:	1ee2                	slli	t4,t4,0x38
    800035f6:	8f55                	or	a4,a4,a3
    800035f8:	00f86833          	or	a6,a6,a5
    800035fc:	00eee733          	or	a4,t4,a4
    80003600:	00009797          	auipc	a5,0x9
    80003604:	f4078793          	addi	a5,a5,-192 # 8000c540 <fdt_move+0x98c>
    80003608:	00009697          	auipc	a3,0x9
    8000360c:	f4068693          	addi	a3,a3,-192 # 8000c548 <fdt_move+0x994>
    80003610:	864e                	mv	a2,s3
    80003612:	00009597          	auipc	a1,0x9
    80003616:	01658593          	addi	a1,a1,22 # 8000c628 <__func__.0>
    8000361a:	00009517          	auipc	a0,0x9
    8000361e:	e9e50513          	addi	a0,a0,-354 # 8000c4b8 <fdt_move+0x904>
    80003622:	5fd010ef          	jal	ra,8000541e <sbi_printf>
    80003626:	0a94cf03          	lbu	t5,169(s1)
    8000362a:	0a14ce83          	lbu	t4,161(s1)
    8000362e:	0a84c703          	lbu	a4,168(s1)
    80003632:	0a04c783          	lbu	a5,160(s1)
    80003636:	0aa4ce03          	lbu	t3,170(s1)
    8000363a:	0a24c303          	lbu	t1,162(s1)
    8000363e:	0ab4c883          	lbu	a7,171(s1)
    80003642:	0a34c803          	lbu	a6,163(s1)
    80003646:	0ac4c503          	lbu	a0,172(s1)
    8000364a:	0a44c583          	lbu	a1,164(s1)
    8000364e:	0f22                	slli	t5,t5,0x8
    80003650:	0ea2                	slli	t4,t4,0x8
    80003652:	00ef6f33          	or	t5,t5,a4
    80003656:	00feeeb3          	or	t4,t4,a5
    8000365a:	0ad4c603          	lbu	a2,173(s1)
    8000365e:	0a54c683          	lbu	a3,165(s1)
    80003662:	0e42                	slli	t3,t3,0x10
    80003664:	0342                	slli	t1,t1,0x10
    80003666:	01ee6e33          	or	t3,t3,t5
    8000366a:	01d36333          	or	t1,t1,t4
    8000366e:	0ae4c783          	lbu	a5,174(s1)
    80003672:	0a64c703          	lbu	a4,166(s1)
    80003676:	08e2                	slli	a7,a7,0x18
    80003678:	0862                	slli	a6,a6,0x18
    8000367a:	01c8e8b3          	or	a7,a7,t3
    8000367e:	00686833          	or	a6,a6,t1
    80003682:	0af4cf03          	lbu	t5,175(s1)
    80003686:	0a74ce83          	lbu	t4,167(s1)
    8000368a:	1502                	slli	a0,a0,0x20
    8000368c:	1582                	slli	a1,a1,0x20
    8000368e:	01156533          	or	a0,a0,a7
    80003692:	0105e5b3          	or	a1,a1,a6
    80003696:	1622                	slli	a2,a2,0x28
    80003698:	16a2                	slli	a3,a3,0x28
    8000369a:	8e49                	or	a2,a2,a0
    8000369c:	8ecd                	or	a3,a3,a1
    8000369e:	17c2                	slli	a5,a5,0x30
    800036a0:	1742                	slli	a4,a4,0x30
    800036a2:	8fd1                	or	a5,a5,a2
    800036a4:	038f1813          	slli	a6,t5,0x38
    800036a8:	1ee2                	slli	t4,t4,0x38
    800036aa:	8f55                	or	a4,a4,a3
    800036ac:	00f86833          	or	a6,a6,a5
    800036b0:	00eee733          	or	a4,t4,a4
    800036b4:	00009797          	auipc	a5,0x9
    800036b8:	e9c78793          	addi	a5,a5,-356 # 8000c550 <fdt_move+0x99c>
    800036bc:	00009697          	auipc	a3,0x9
    800036c0:	e9c68693          	addi	a3,a3,-356 # 8000c558 <fdt_move+0x9a4>
    800036c4:	864e                	mv	a2,s3
    800036c6:	00009597          	auipc	a1,0x9
    800036ca:	f6258593          	addi	a1,a1,-158 # 8000c628 <__func__.0>
    800036ce:	00009517          	auipc	a0,0x9
    800036d2:	dea50513          	addi	a0,a0,-534 # 8000c4b8 <fdt_move+0x904>
    800036d6:	549010ef          	jal	ra,8000541e <sbi_printf>
    800036da:	0b94cf03          	lbu	t5,185(s1)
    800036de:	0b14ce83          	lbu	t4,177(s1)
    800036e2:	0b84c703          	lbu	a4,184(s1)
    800036e6:	0b04c783          	lbu	a5,176(s1)
    800036ea:	0ba4ce03          	lbu	t3,186(s1)
    800036ee:	0b24c303          	lbu	t1,178(s1)
    800036f2:	0bb4c883          	lbu	a7,187(s1)
    800036f6:	0b34c803          	lbu	a6,179(s1)
    800036fa:	0bc4c503          	lbu	a0,188(s1)
    800036fe:	0b44c583          	lbu	a1,180(s1)
    80003702:	0f22                	slli	t5,t5,0x8
    80003704:	0ea2                	slli	t4,t4,0x8
    80003706:	00ef6f33          	or	t5,t5,a4
    8000370a:	00feeeb3          	or	t4,t4,a5
    8000370e:	0bd4c603          	lbu	a2,189(s1)
    80003712:	0b54c683          	lbu	a3,181(s1)
    80003716:	0e42                	slli	t3,t3,0x10
    80003718:	0342                	slli	t1,t1,0x10
    8000371a:	01ee6e33          	or	t3,t3,t5
    8000371e:	01d36333          	or	t1,t1,t4
    80003722:	0be4c783          	lbu	a5,190(s1)
    80003726:	0b64c703          	lbu	a4,182(s1)
    8000372a:	08e2                	slli	a7,a7,0x18
    8000372c:	0862                	slli	a6,a6,0x18
    8000372e:	01c8e8b3          	or	a7,a7,t3
    80003732:	00686833          	or	a6,a6,t1
    80003736:	0bf4cf03          	lbu	t5,191(s1)
    8000373a:	0b74ce83          	lbu	t4,183(s1)
    8000373e:	1502                	slli	a0,a0,0x20
    80003740:	1582                	slli	a1,a1,0x20
    80003742:	01156533          	or	a0,a0,a7
    80003746:	0105e5b3          	or	a1,a1,a6
    8000374a:	1622                	slli	a2,a2,0x28
    8000374c:	16a2                	slli	a3,a3,0x28
    8000374e:	8e49                	or	a2,a2,a0
    80003750:	8ecd                	or	a3,a3,a1
    80003752:	17c2                	slli	a5,a5,0x30
    80003754:	1742                	slli	a4,a4,0x30
    80003756:	8fd1                	or	a5,a5,a2
    80003758:	038f1813          	slli	a6,t5,0x38
    8000375c:	1ee2                	slli	t4,t4,0x38
    8000375e:	8f55                	or	a4,a4,a3
    80003760:	00f86833          	or	a6,a6,a5
    80003764:	00eee733          	or	a4,t4,a4
    80003768:	00009797          	auipc	a5,0x9
    8000376c:	df878793          	addi	a5,a5,-520 # 8000c560 <fdt_move+0x9ac>
    80003770:	00009697          	auipc	a3,0x9
    80003774:	df868693          	addi	a3,a3,-520 # 8000c568 <fdt_move+0x9b4>
    80003778:	864e                	mv	a2,s3
    8000377a:	00009597          	auipc	a1,0x9
    8000377e:	eae58593          	addi	a1,a1,-338 # 8000c628 <__func__.0>
    80003782:	00009517          	auipc	a0,0x9
    80003786:	d3650513          	addi	a0,a0,-714 # 8000c4b8 <fdt_move+0x904>
    8000378a:	495010ef          	jal	ra,8000541e <sbi_printf>
    8000378e:	0c94cf03          	lbu	t5,201(s1)
    80003792:	0c14ce83          	lbu	t4,193(s1)
    80003796:	0c84c703          	lbu	a4,200(s1)
    8000379a:	0c04c783          	lbu	a5,192(s1)
    8000379e:	0ca4ce03          	lbu	t3,202(s1)
    800037a2:	0c24c303          	lbu	t1,194(s1)
    800037a6:	0cb4c883          	lbu	a7,203(s1)
    800037aa:	0c34c803          	lbu	a6,195(s1)
    800037ae:	0cc4c503          	lbu	a0,204(s1)
    800037b2:	0c44c583          	lbu	a1,196(s1)
    800037b6:	0f22                	slli	t5,t5,0x8
    800037b8:	0ea2                	slli	t4,t4,0x8
    800037ba:	00ef6f33          	or	t5,t5,a4
    800037be:	00feeeb3          	or	t4,t4,a5
    800037c2:	0cd4c603          	lbu	a2,205(s1)
    800037c6:	0c54c683          	lbu	a3,197(s1)
    800037ca:	0e42                	slli	t3,t3,0x10
    800037cc:	0342                	slli	t1,t1,0x10
    800037ce:	01ee6e33          	or	t3,t3,t5
    800037d2:	01d36333          	or	t1,t1,t4
    800037d6:	0ce4c783          	lbu	a5,206(s1)
    800037da:	0c64c703          	lbu	a4,198(s1)
    800037de:	08e2                	slli	a7,a7,0x18
    800037e0:	0862                	slli	a6,a6,0x18
    800037e2:	01c8e8b3          	or	a7,a7,t3
    800037e6:	00686833          	or	a6,a6,t1
    800037ea:	0cf4cf03          	lbu	t5,207(s1)
    800037ee:	0c74ce83          	lbu	t4,199(s1)
    800037f2:	1502                	slli	a0,a0,0x20
    800037f4:	1582                	slli	a1,a1,0x20
    800037f6:	01156533          	or	a0,a0,a7
    800037fa:	0105e5b3          	or	a1,a1,a6
    800037fe:	1622                	slli	a2,a2,0x28
    80003800:	16a2                	slli	a3,a3,0x28
    80003802:	8e49                	or	a2,a2,a0
    80003804:	8ecd                	or	a3,a3,a1
    80003806:	17c2                	slli	a5,a5,0x30
    80003808:	1742                	slli	a4,a4,0x30
    8000380a:	8fd1                	or	a5,a5,a2
    8000380c:	038f1813          	slli	a6,t5,0x38
    80003810:	1ee2                	slli	t4,t4,0x38
    80003812:	8f55                	or	a4,a4,a3
    80003814:	00f86833          	or	a6,a6,a5
    80003818:	00eee733          	or	a4,t4,a4
    8000381c:	00009797          	auipc	a5,0x9
    80003820:	d5478793          	addi	a5,a5,-684 # 8000c570 <fdt_move+0x9bc>
    80003824:	00009697          	auipc	a3,0x9
    80003828:	d5468693          	addi	a3,a3,-684 # 8000c578 <fdt_move+0x9c4>
    8000382c:	864e                	mv	a2,s3
    8000382e:	00009597          	auipc	a1,0x9
    80003832:	dfa58593          	addi	a1,a1,-518 # 8000c628 <__func__.0>
    80003836:	00009517          	auipc	a0,0x9
    8000383a:	c8250513          	addi	a0,a0,-894 # 8000c4b8 <fdt_move+0x904>
    8000383e:	3e1010ef          	jal	ra,8000541e <sbi_printf>
    80003842:	0d94cf03          	lbu	t5,217(s1)
    80003846:	0d14ce83          	lbu	t4,209(s1)
    8000384a:	0d84c703          	lbu	a4,216(s1)
    8000384e:	0d04c783          	lbu	a5,208(s1)
    80003852:	0da4ce03          	lbu	t3,218(s1)
    80003856:	0d24c303          	lbu	t1,210(s1)
    8000385a:	0db4c883          	lbu	a7,219(s1)
    8000385e:	0d34c803          	lbu	a6,211(s1)
    80003862:	0dc4c503          	lbu	a0,220(s1)
    80003866:	0d44c583          	lbu	a1,212(s1)
    8000386a:	0f22                	slli	t5,t5,0x8
    8000386c:	0ea2                	slli	t4,t4,0x8
    8000386e:	00ef6f33          	or	t5,t5,a4
    80003872:	00feeeb3          	or	t4,t4,a5
    80003876:	0dd4c603          	lbu	a2,221(s1)
    8000387a:	0d54c683          	lbu	a3,213(s1)
    8000387e:	0e42                	slli	t3,t3,0x10
    80003880:	0342                	slli	t1,t1,0x10
    80003882:	01ee6e33          	or	t3,t3,t5
    80003886:	01d36333          	or	t1,t1,t4
    8000388a:	0de4c783          	lbu	a5,222(s1)
    8000388e:	0d64c703          	lbu	a4,214(s1)
    80003892:	08e2                	slli	a7,a7,0x18
    80003894:	0862                	slli	a6,a6,0x18
    80003896:	01c8e8b3          	or	a7,a7,t3
    8000389a:	00686833          	or	a6,a6,t1
    8000389e:	0df4cf03          	lbu	t5,223(s1)
    800038a2:	0d74ce83          	lbu	t4,215(s1)
    800038a6:	1502                	slli	a0,a0,0x20
    800038a8:	1582                	slli	a1,a1,0x20
    800038aa:	01156533          	or	a0,a0,a7
    800038ae:	0105e5b3          	or	a1,a1,a6
    800038b2:	1622                	slli	a2,a2,0x28
    800038b4:	16a2                	slli	a3,a3,0x28
    800038b6:	8e49                	or	a2,a2,a0
    800038b8:	8ecd                	or	a3,a3,a1
    800038ba:	17c2                	slli	a5,a5,0x30
    800038bc:	1742                	slli	a4,a4,0x30
    800038be:	8fd1                	or	a5,a5,a2
    800038c0:	038f1813          	slli	a6,t5,0x38
    800038c4:	1ee2                	slli	t4,t4,0x38
    800038c6:	8f55                	or	a4,a4,a3
    800038c8:	00f86833          	or	a6,a6,a5
    800038cc:	00eee733          	or	a4,t4,a4
    800038d0:	00009797          	auipc	a5,0x9
    800038d4:	cb078793          	addi	a5,a5,-848 # 8000c580 <fdt_move+0x9cc>
    800038d8:	00009697          	auipc	a3,0x9
    800038dc:	cb068693          	addi	a3,a3,-848 # 8000c588 <fdt_move+0x9d4>
    800038e0:	864e                	mv	a2,s3
    800038e2:	00009597          	auipc	a1,0x9
    800038e6:	d4658593          	addi	a1,a1,-698 # 8000c628 <__func__.0>
    800038ea:	00009517          	auipc	a0,0x9
    800038ee:	bce50513          	addi	a0,a0,-1074 # 8000c4b8 <fdt_move+0x904>
    800038f2:	32d010ef          	jal	ra,8000541e <sbi_printf>
    800038f6:	0314cf03          	lbu	t5,49(s1)
    800038fa:	0294ce83          	lbu	t4,41(s1)
    800038fe:	0304c703          	lbu	a4,48(s1)
    80003902:	0284c783          	lbu	a5,40(s1)
    80003906:	0324ce03          	lbu	t3,50(s1)
    8000390a:	02a4c303          	lbu	t1,42(s1)
    8000390e:	0334c883          	lbu	a7,51(s1)
    80003912:	02b4c803          	lbu	a6,43(s1)
    80003916:	0344c503          	lbu	a0,52(s1)
    8000391a:	02c4c583          	lbu	a1,44(s1)
    8000391e:	0f22                	slli	t5,t5,0x8
    80003920:	0ea2                	slli	t4,t4,0x8
    80003922:	00ef6f33          	or	t5,t5,a4
    80003926:	00feeeb3          	or	t4,t4,a5
    8000392a:	0354c603          	lbu	a2,53(s1)
    8000392e:	02d4c683          	lbu	a3,45(s1)
    80003932:	0e42                	slli	t3,t3,0x10
    80003934:	0342                	slli	t1,t1,0x10
    80003936:	01ee6e33          	or	t3,t3,t5
    8000393a:	01d36333          	or	t1,t1,t4
    8000393e:	0364c783          	lbu	a5,54(s1)
    80003942:	02e4c703          	lbu	a4,46(s1)
    80003946:	08e2                	slli	a7,a7,0x18
    80003948:	0862                	slli	a6,a6,0x18
    8000394a:	01c8e8b3          	or	a7,a7,t3
    8000394e:	00686833          	or	a6,a6,t1
    80003952:	0374cf03          	lbu	t5,55(s1)
    80003956:	02f4ce83          	lbu	t4,47(s1)
    8000395a:	1502                	slli	a0,a0,0x20
    8000395c:	1582                	slli	a1,a1,0x20
    8000395e:	01156533          	or	a0,a0,a7
    80003962:	0105e5b3          	or	a1,a1,a6
    80003966:	1622                	slli	a2,a2,0x28
    80003968:	16a2                	slli	a3,a3,0x28
    8000396a:	8e49                	or	a2,a2,a0
    8000396c:	8ecd                	or	a3,a3,a1
    8000396e:	17c2                	slli	a5,a5,0x30
    80003970:	1742                	slli	a4,a4,0x30
    80003972:	8fd1                	or	a5,a5,a2
    80003974:	038f1813          	slli	a6,t5,0x38
    80003978:	1ee2                	slli	t4,t4,0x38
    8000397a:	8f55                	or	a4,a4,a3
    8000397c:	00f86833          	or	a6,a6,a5
    80003980:	00eee733          	or	a4,t4,a4
    80003984:	00009797          	auipc	a5,0x9
    80003988:	c0c78793          	addi	a5,a5,-1012 # 8000c590 <fdt_move+0x9dc>
    8000398c:	00009697          	auipc	a3,0x9
    80003990:	c0c68693          	addi	a3,a3,-1012 # 8000c598 <fdt_move+0x9e4>
    80003994:	864e                	mv	a2,s3
    80003996:	00009597          	auipc	a1,0x9
    8000399a:	c9258593          	addi	a1,a1,-878 # 8000c628 <__func__.0>
    8000399e:	00009517          	auipc	a0,0x9
    800039a2:	b1a50513          	addi	a0,a0,-1254 # 8000c4b8 <fdt_move+0x904>
    800039a6:	279010ef          	jal	ra,8000541e <sbi_printf>
    800039aa:	0e14cf03          	lbu	t5,225(s1)
    800039ae:	0394ce83          	lbu	t4,57(s1)
    800039b2:	0e04c703          	lbu	a4,224(s1)
    800039b6:	0384c783          	lbu	a5,56(s1)
    800039ba:	0e24ce03          	lbu	t3,226(s1)
    800039be:	03a4c303          	lbu	t1,58(s1)
    800039c2:	0e34c883          	lbu	a7,227(s1)
    800039c6:	03b4c803          	lbu	a6,59(s1)
    800039ca:	0e44c503          	lbu	a0,228(s1)
    800039ce:	03c4c583          	lbu	a1,60(s1)
    800039d2:	0f22                	slli	t5,t5,0x8
    800039d4:	0ea2                	slli	t4,t4,0x8
    800039d6:	00ef6f33          	or	t5,t5,a4
    800039da:	00feeeb3          	or	t4,t4,a5
    800039de:	0e54c603          	lbu	a2,229(s1)
    800039e2:	03d4c683          	lbu	a3,61(s1)
    800039e6:	0e42                	slli	t3,t3,0x10
    800039e8:	0342                	slli	t1,t1,0x10
    800039ea:	01ee6e33          	or	t3,t3,t5
    800039ee:	01d36333          	or	t1,t1,t4
    800039f2:	0e64c783          	lbu	a5,230(s1)
    800039f6:	03e4c703          	lbu	a4,62(s1)
    800039fa:	08e2                	slli	a7,a7,0x18
    800039fc:	0862                	slli	a6,a6,0x18
    800039fe:	01c8e8b3          	or	a7,a7,t3
    80003a02:	00686833          	or	a6,a6,t1
    80003a06:	0e74cf03          	lbu	t5,231(s1)
    80003a0a:	03f4ce83          	lbu	t4,63(s1)
    80003a0e:	1502                	slli	a0,a0,0x20
    80003a10:	1582                	slli	a1,a1,0x20
    80003a12:	01156533          	or	a0,a0,a7
    80003a16:	0105e5b3          	or	a1,a1,a6
    80003a1a:	1622                	slli	a2,a2,0x28
    80003a1c:	16a2                	slli	a3,a3,0x28
    80003a1e:	8e49                	or	a2,a2,a0
    80003a20:	8ecd                	or	a3,a3,a1
    80003a22:	17c2                	slli	a5,a5,0x30
    80003a24:	1742                	slli	a4,a4,0x30
    80003a26:	8fd1                	or	a5,a5,a2
    80003a28:	038f1813          	slli	a6,t5,0x38
    80003a2c:	1ee2                	slli	t4,t4,0x38
    80003a2e:	8f55                	or	a4,a4,a3
    80003a30:	00f86833          	or	a6,a6,a5
    80003a34:	00eee733          	or	a4,t4,a4
    80003a38:	00009797          	auipc	a5,0x9
    80003a3c:	b6878793          	addi	a5,a5,-1176 # 8000c5a0 <fdt_move+0x9ec>
    80003a40:	00009697          	auipc	a3,0x9
    80003a44:	b6868693          	addi	a3,a3,-1176 # 8000c5a8 <fdt_move+0x9f4>
    80003a48:	864e                	mv	a2,s3
    80003a4a:	00009597          	auipc	a1,0x9
    80003a4e:	bde58593          	addi	a1,a1,-1058 # 8000c628 <__func__.0>
    80003a52:	00009517          	auipc	a0,0x9
    80003a56:	a6650513          	addi	a0,a0,-1434 # 8000c4b8 <fdt_move+0x904>
    80003a5a:	1c5010ef          	jal	ra,8000541e <sbi_printf>
    80003a5e:	0f14cf03          	lbu	t5,241(s1)
    80003a62:	0e94ce83          	lbu	t4,233(s1)
    80003a66:	0f04c703          	lbu	a4,240(s1)
    80003a6a:	0e84c783          	lbu	a5,232(s1)
    80003a6e:	0f24ce03          	lbu	t3,242(s1)
    80003a72:	0ea4c303          	lbu	t1,234(s1)
    80003a76:	0f34c883          	lbu	a7,243(s1)
    80003a7a:	0eb4c803          	lbu	a6,235(s1)
    80003a7e:	0f44c503          	lbu	a0,244(s1)
    80003a82:	0ec4c583          	lbu	a1,236(s1)
    80003a86:	0f22                	slli	t5,t5,0x8
    80003a88:	0ea2                	slli	t4,t4,0x8
    80003a8a:	00ef6f33          	or	t5,t5,a4
    80003a8e:	00feeeb3          	or	t4,t4,a5
    80003a92:	0f54c603          	lbu	a2,245(s1)
    80003a96:	0ed4c683          	lbu	a3,237(s1)
    80003a9a:	0e42                	slli	t3,t3,0x10
    80003a9c:	0342                	slli	t1,t1,0x10
    80003a9e:	01ee6e33          	or	t3,t3,t5
    80003aa2:	01d36333          	or	t1,t1,t4
    80003aa6:	0f64c783          	lbu	a5,246(s1)
    80003aaa:	0ee4c703          	lbu	a4,238(s1)
    80003aae:	08e2                	slli	a7,a7,0x18
    80003ab0:	0862                	slli	a6,a6,0x18
    80003ab2:	00686833          	or	a6,a6,t1
    80003ab6:	0f74cf03          	lbu	t5,247(s1)
    80003aba:	01c8e8b3          	or	a7,a7,t3
    80003abe:	0ef4ce83          	lbu	t4,239(s1)
    80003ac2:	1502                	slli	a0,a0,0x20
    80003ac4:	1582                	slli	a1,a1,0x20
    80003ac6:	01156533          	or	a0,a0,a7
    80003aca:	0105e5b3          	or	a1,a1,a6
    80003ace:	1622                	slli	a2,a2,0x28
    80003ad0:	16a2                	slli	a3,a3,0x28
    80003ad2:	8e49                	or	a2,a2,a0
    80003ad4:	8ecd                	or	a3,a3,a1
    80003ad6:	17c2                	slli	a5,a5,0x30
    80003ad8:	1742                	slli	a4,a4,0x30
    80003ada:	8fd1                	or	a5,a5,a2
    80003adc:	038f1813          	slli	a6,t5,0x38
    80003ae0:	1ee2                	slli	t4,t4,0x38
    80003ae2:	8f55                	or	a4,a4,a3
    80003ae4:	00f86833          	or	a6,a6,a5
    80003ae8:	00eee733          	or	a4,t4,a4
    80003aec:	00009797          	auipc	a5,0x9
    80003af0:	ac478793          	addi	a5,a5,-1340 # 8000c5b0 <fdt_move+0x9fc>
    80003af4:	00009697          	auipc	a3,0x9
    80003af8:	ac468693          	addi	a3,a3,-1340 # 8000c5b8 <fdt_move+0xa04>
    80003afc:	864e                	mv	a2,s3
    80003afe:	00009597          	auipc	a1,0x9
    80003b02:	b2a58593          	addi	a1,a1,-1238 # 8000c628 <__func__.0>
    80003b06:	00009517          	auipc	a0,0x9
    80003b0a:	9b250513          	addi	a0,a0,-1614 # 8000c4b8 <fdt_move+0x904>
    80003b0e:	111010ef          	jal	ra,8000541e <sbi_printf>
    80003b12:	0f94c503          	lbu	a0,249(s1)
    80003b16:	0f84c783          	lbu	a5,248(s1)
    80003b1a:	0fa4c583          	lbu	a1,250(s1)
    80003b1e:	0fb4c603          	lbu	a2,251(s1)
    80003b22:	0fc4c683          	lbu	a3,252(s1)
    80003b26:	0522                	slli	a0,a0,0x8
    80003b28:	8d5d                	or	a0,a0,a5
    80003b2a:	0fd4c703          	lbu	a4,253(s1)
    80003b2e:	05c2                	slli	a1,a1,0x10
    80003b30:	8dc9                	or	a1,a1,a0
    80003b32:	0fe4c783          	lbu	a5,254(s1)
    80003b36:	0662                	slli	a2,a2,0x18
    80003b38:	8e4d                	or	a2,a2,a1
    80003b3a:	0ff4c503          	lbu	a0,255(s1)
    80003b3e:	1682                	slli	a3,a3,0x20
    80003b40:	8ed1                	or	a3,a3,a2
    80003b42:	1722                	slli	a4,a4,0x28
    80003b44:	8f55                	or	a4,a4,a3
    80003b46:	17c2                	slli	a5,a5,0x30
    80003b48:	8fd9                	or	a5,a5,a4
    80003b4a:	03851713          	slli	a4,a0,0x38
    80003b4e:	8f5d                	or	a4,a4,a5
    80003b50:	00009697          	auipc	a3,0x9
    80003b54:	a7068693          	addi	a3,a3,-1424 # 8000c5c0 <fdt_move+0xa0c>
    80003b58:	864e                	mv	a2,s3
    80003b5a:	00009597          	auipc	a1,0x9
    80003b5e:	ace58593          	addi	a1,a1,-1330 # 8000c628 <__func__.0>
    80003b62:	00009517          	auipc	a0,0x9
    80003b66:	a6650513          	addi	a0,a0,-1434 # 8000c5c8 <fdt_move+0xa14>
    80003b6a:	0b5010ef          	jal	ra,8000541e <sbi_printf>
    80003b6e:	06a040ef          	jal	ra,80007bd8 <sbi_hart_hang>
    80003b72:	855a                	mv	a0,s6
    80003b74:	028040ef          	jal	ra,80007b9c <sbi_hart_get_trap_info>
    80003b78:	10a4c783          	lbu	a5,266(s1)
    80003b7c:	8385                	srli	a5,a5,0x1
    80003b7e:	8b85                	andi	a5,a5,1
    80003b80:	1c078463          	beqz	a5,80003d48 <sbi_trap_handler+0xe44>
    80003b84:	1014c783          	lbu	a5,257(s1)
    80003b88:	1004c703          	lbu	a4,256(s1)
    80003b8c:	1024c803          	lbu	a6,258(s1)
    80003b90:	1034c583          	lbu	a1,259(s1)
    80003b94:	1044c603          	lbu	a2,260(s1)
    80003b98:	07a2                	slli	a5,a5,0x8
    80003b9a:	8fd9                	or	a5,a5,a4
    80003b9c:	1054c683          	lbu	a3,261(s1)
    80003ba0:	0842                	slli	a6,a6,0x10
    80003ba2:	00f86833          	or	a6,a6,a5
    80003ba6:	1064c703          	lbu	a4,262(s1)
    80003baa:	05e2                	slli	a1,a1,0x18
    80003bac:	1074c783          	lbu	a5,263(s1)
    80003bb0:	0105e5b3          	or	a1,a1,a6
    80003bb4:	1602                	slli	a2,a2,0x20
    80003bb6:	8e4d                	or	a2,a2,a1
    80003bb8:	16a2                	slli	a3,a3,0x28
    80003bba:	8ed1                	or	a3,a3,a2
    80003bbc:	1742                	slli	a4,a4,0x30
    80003bbe:	8f55                	or	a4,a4,a3
    80003bc0:	17e2                	slli	a5,a5,0x38
    80003bc2:	8fd9                	or	a5,a5,a4
    80003bc4:	873e                	mv	a4,a5
    80003bc6:	1a050f63          	beqz	a0,80003d84 <sbi_trap_handler+0xe80>
    80003bca:	e11c                	sd	a5,0(a0)
    80003bcc:	1014c783          	lbu	a5,257(s1)
    80003bd0:	1004c703          	lbu	a4,256(s1)
    80003bd4:	1024c803          	lbu	a6,258(s1)
    80003bd8:	1034c583          	lbu	a1,259(s1)
    80003bdc:	1044c603          	lbu	a2,260(s1)
    80003be0:	07a2                	slli	a5,a5,0x8
    80003be2:	1054c683          	lbu	a3,261(s1)
    80003be6:	8fd9                	or	a5,a5,a4
    80003be8:	0842                	slli	a6,a6,0x10
    80003bea:	1064c703          	lbu	a4,262(s1)
    80003bee:	00f86833          	or	a6,a6,a5
    80003bf2:	05e2                	slli	a1,a1,0x18
    80003bf4:	1074c783          	lbu	a5,263(s1)
    80003bf8:	0105e5b3          	or	a1,a1,a6
    80003bfc:	1602                	slli	a2,a2,0x20
    80003bfe:	8e4d                	or	a2,a2,a1
    80003c00:	16a2                	slli	a3,a3,0x28
    80003c02:	8ed1                	or	a3,a3,a2
    80003c04:	1742                	slli	a4,a4,0x30
    80003c06:	8f55                	or	a4,a4,a3
    80003c08:	17e2                	slli	a5,a5,0x38
    80003c0a:	8fd9                	or	a5,a5,a4
    80003c0c:	0791                	addi	a5,a5,4
    80003c0e:	0087d313          	srli	t1,a5,0x8
    80003c12:	0107d893          	srli	a7,a5,0x10
    80003c16:	0187d81b          	srliw	a6,a5,0x18
    80003c1a:	0207d593          	srli	a1,a5,0x20
    80003c1e:	0287d613          	srli	a2,a5,0x28
    80003c22:	0307d693          	srli	a3,a5,0x30
    80003c26:	0387d713          	srli	a4,a5,0x38
    80003c2a:	10f48023          	sb	a5,256(s1)
    80003c2e:	106480a3          	sb	t1,257(s1)
    80003c32:	11148123          	sb	a7,258(s1)
    80003c36:	110481a3          	sb	a6,259(s1)
    80003c3a:	10b48223          	sb	a1,260(s1)
    80003c3e:	10c482a3          	sb	a2,261(s1)
    80003c42:	10d48323          	sb	a3,262(s1)
    80003c46:	10e483a3          	sb	a4,263(s1)
    80003c4a:	01253423          	sd	s2,8(a0)
    80003c4e:	01553823          	sd	s5,16(a0)
    80003c52:	01753c23          	sd	s7,24(a0)
    80003c56:	03853023          	sd	s8,32(a0)
    80003c5a:	b2aff06f          	j	80002f84 <sbi_trap_handler+0x80>
    80003c5e:	86da                	mv	a3,s6
    80003c60:	8626                	mv	a2,s1
    80003c62:	85ca                	mv	a1,s2
    80003c64:	854e                	mv	a0,s3
    80003c66:	231010ef          	jal	ra,80005696 <sbi_ecall_handler>
    80003c6a:	00008697          	auipc	a3,0x8
    80003c6e:	72e68693          	addi	a3,a3,1838 # 8000c398 <fdt_move+0x7e4>
    80003c72:	b0050963          	beqz	a0,80002f84 <sbi_trap_handler+0x80>
    80003c76:	b30ff06f          	j	80002fa6 <sbi_trap_handler+0xa2>
    80003c7a:	1014c783          	lbu	a5,257(s1)
    80003c7e:	1004c703          	lbu	a4,256(s1)
    80003c82:	1024c503          	lbu	a0,258(s1)
    80003c86:	1034c583          	lbu	a1,259(s1)
    80003c8a:	1044c603          	lbu	a2,260(s1)
    80003c8e:	07a2                	slli	a5,a5,0x8
    80003c90:	1054c683          	lbu	a3,261(s1)
    80003c94:	8fd9                	or	a5,a5,a4
    80003c96:	0542                	slli	a0,a0,0x10
    80003c98:	1064c703          	lbu	a4,262(s1)
    80003c9c:	8d5d                	or	a0,a0,a5
    80003c9e:	05e2                	slli	a1,a1,0x18
    80003ca0:	1074c783          	lbu	a5,263(s1)
    80003ca4:	8dc9                	or	a1,a1,a0
    80003ca6:	1602                	slli	a2,a2,0x20
    80003ca8:	8e4d                	or	a2,a2,a1
    80003caa:	16a2                	slli	a3,a3,0x28
    80003cac:	8ed1                	or	a3,a3,a2
    80003cae:	1742                	slli	a4,a4,0x30
    80003cb0:	8f55                	or	a4,a4,a3
    80003cb2:	17e2                	slli	a5,a5,0x38
    80003cb4:	8fd9                	or	a5,a5,a4
    80003cb6:	865a                	mv	a2,s6
    80003cb8:	f8840593          	addi	a1,s0,-120
    80003cbc:	8526                	mv	a0,s1
    80003cbe:	f8f43423          	sd	a5,-120(s0)
    80003cc2:	f9243823          	sd	s2,-112(s0)
    80003cc6:	f9543c23          	sd	s5,-104(s0)
    80003cca:	fb743023          	sd	s7,-96(s0)
    80003cce:	fb843423          	sd	s8,-88(s0)
    80003cd2:	da1fe0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80003cd6:	00008697          	auipc	a3,0x8
    80003cda:	64268693          	addi	a3,a3,1602 # 8000c318 <fdt_move+0x764>
    80003cde:	aa050363          	beqz	a0,80002f84 <sbi_trap_handler+0x80>
    80003ce2:	ac4ff06f          	j	80002fa6 <sbi_trap_handler+0xa2>
    80003ce6:	86de                	mv	a3,s7
    80003ce8:	885a                	mv	a6,s6
    80003cea:	87a6                	mv	a5,s1
    80003cec:	8762                	mv	a4,s8
    80003cee:	8656                	mv	a2,s5
    80003cf0:	4591                	li	a1,4
    80003cf2:	854e                	mv	a0,s3
    80003cf4:	01f040ef          	jal	ra,80008512 <sbi_misaligned_load_handler>
    80003cf8:	00008697          	auipc	a3,0x8
    80003cfc:	66068693          	addi	a3,a3,1632 # 8000c358 <fdt_move+0x7a4>
    80003d00:	a8050263          	beqz	a0,80002f84 <sbi_trap_handler+0x80>
    80003d04:	aa2ff06f          	j	80002fa6 <sbi_trap_handler+0xa2>
    80003d08:	86de                	mv	a3,s7
    80003d0a:	885a                	mv	a6,s6
    80003d0c:	87a6                	mv	a5,s1
    80003d0e:	8762                	mv	a4,s8
    80003d10:	8656                	mv	a2,s5
    80003d12:	4599                	li	a1,6
    80003d14:	854e                	mv	a0,s3
    80003d16:	347040ef          	jal	ra,8000885c <sbi_misaligned_store_handler>
    80003d1a:	00008697          	auipc	a3,0x8
    80003d1e:	65e68693          	addi	a3,a3,1630 # 8000c378 <fdt_move+0x7c4>
    80003d22:	a6050163          	beqz	a0,80002f84 <sbi_trap_handler+0x80>
    80003d26:	a80ff06f          	j	80002fa6 <sbi_trap_handler+0xa2>
    80003d2a:	86a6                	mv	a3,s1
    80003d2c:	875a                	mv	a4,s6
    80003d2e:	8656                	mv	a2,s5
    80003d30:	4589                	li	a1,2
    80003d32:	854e                	mv	a0,s3
    80003d34:	65e040ef          	jal	ra,80008392 <sbi_illegal_insn_handler>
    80003d38:	00008697          	auipc	a3,0x8
    80003d3c:	5f868693          	addi	a3,a3,1528 # 8000c330 <fdt_move+0x77c>
    80003d40:	a4050263          	beqz	a0,80002f84 <sbi_trap_handler+0x80>
    80003d44:	a62ff06f          	j	80002fa6 <sbi_trap_handler+0xa2>
    80003d48:	1014c703          	lbu	a4,257(s1)
    80003d4c:	1004c783          	lbu	a5,256(s1)
    80003d50:	1024c503          	lbu	a0,258(s1)
    80003d54:	1034c583          	lbu	a1,259(s1)
    80003d58:	1044c603          	lbu	a2,260(s1)
    80003d5c:	0722                	slli	a4,a4,0x8
    80003d5e:	8f5d                	or	a4,a4,a5
    80003d60:	1054c683          	lbu	a3,261(s1)
    80003d64:	0542                	slli	a0,a0,0x10
    80003d66:	8d59                	or	a0,a0,a4
    80003d68:	1064c783          	lbu	a5,262(s1)
    80003d6c:	05e2                	slli	a1,a1,0x18
    80003d6e:	1074c703          	lbu	a4,263(s1)
    80003d72:	8dc9                	or	a1,a1,a0
    80003d74:	1602                	slli	a2,a2,0x20
    80003d76:	8e4d                	or	a2,a2,a1
    80003d78:	16a2                	slli	a3,a3,0x28
    80003d7a:	8ed1                	or	a3,a3,a2
    80003d7c:	17c2                	slli	a5,a5,0x30
    80003d7e:	8fd5                	or	a5,a5,a3
    80003d80:	1762                	slli	a4,a4,0x38
    80003d82:	8f5d                	or	a4,a4,a5
    80003d84:	865a                	mv	a2,s6
    80003d86:	f8840593          	addi	a1,s0,-120
    80003d8a:	8526                	mv	a0,s1
    80003d8c:	f8e43423          	sd	a4,-120(s0)
    80003d90:	f9243823          	sd	s2,-112(s0)
    80003d94:	f9543c23          	sd	s5,-104(s0)
    80003d98:	fb743023          	sd	s7,-96(s0)
    80003d9c:	fb843423          	sd	s8,-88(s0)
    80003da0:	cd3fe0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80003da4:	00008697          	auipc	a3,0x8
    80003da8:	60c68693          	addi	a3,a3,1548 # 8000c3b0 <fdt_move+0x7fc>
    80003dac:	9c050c63          	beqz	a0,80002f84 <sbi_trap_handler+0x80>
    80003db0:	9f6ff06f          	j	80002fa6 <sbi_trap_handler+0xa2>
    80003db4:	855a                	mv	a0,s6
    80003db6:	e02fd0ef          	jal	ra,800013b8 <sbi_ipi_process>
    80003dba:	9caff06f          	j	80002f84 <sbi_trap_handler+0x80>
    80003dbe:	8762                	mv	a4,s8
    80003dc0:	86de                	mv	a3,s7
    80003dc2:	864e                	mv	a2,s3
    80003dc4:	00009597          	auipc	a1,0x9
    80003dc8:	86458593          	addi	a1,a1,-1948 # 8000c628 <__func__.0>
    80003dcc:	00008517          	auipc	a0,0x8
    80003dd0:	67c50513          	addi	a0,a0,1660 # 8000c448 <fdt_move+0x894>
    80003dd4:	64a010ef          	jal	ra,8000541e <sbi_printf>
    80003dd8:	a0cff06f          	j	80002fe4 <sbi_trap_handler+0xe0>

0000000080003ddc <sbi_strcmp>:
    80003ddc:	1141                	addi	sp,sp,-16
    80003dde:	e422                	sd	s0,8(sp)
    80003de0:	0800                	addi	s0,sp,16
    80003de2:	00054783          	lbu	a5,0(a0)
    80003de6:	0005c703          	lbu	a4,0(a1)
    80003dea:	00f70963          	beq	a4,a5,80003dfc <sbi_strcmp+0x20>
    80003dee:	a839                	j	80003e0c <sbi_strcmp+0x30>
    80003df0:	00054783          	lbu	a5,0(a0)
    80003df4:	0005c703          	lbu	a4,0(a1)
    80003df8:	00e79a63          	bne	a5,a4,80003e0c <sbi_strcmp+0x30>
    80003dfc:	0505                	addi	a0,a0,1
    80003dfe:	0585                	addi	a1,a1,1
    80003e00:	fbe5                	bnez	a5,80003df0 <sbi_strcmp+0x14>
    80003e02:	6422                	ld	s0,8(sp)
    80003e04:	4501                	li	a0,0
    80003e06:	9d19                	subw	a0,a0,a4
    80003e08:	0141                	addi	sp,sp,16
    80003e0a:	8082                	ret
    80003e0c:	6422                	ld	s0,8(sp)
    80003e0e:	0007851b          	sext.w	a0,a5
    80003e12:	9d19                	subw	a0,a0,a4
    80003e14:	0141                	addi	sp,sp,16
    80003e16:	8082                	ret

0000000080003e18 <sbi_strlen>:
    80003e18:	1141                	addi	sp,sp,-16
    80003e1a:	e422                	sd	s0,8(sp)
    80003e1c:	0800                	addi	s0,sp,16
    80003e1e:	00054783          	lbu	a5,0(a0)
    80003e22:	cf81                	beqz	a5,80003e3a <sbi_strlen+0x22>
    80003e24:	872a                	mv	a4,a0
    80003e26:	4501                	li	a0,0
    80003e28:	0505                	addi	a0,a0,1
    80003e2a:	00a707b3          	add	a5,a4,a0
    80003e2e:	0007c783          	lbu	a5,0(a5)
    80003e32:	fbfd                	bnez	a5,80003e28 <sbi_strlen+0x10>
    80003e34:	6422                	ld	s0,8(sp)
    80003e36:	0141                	addi	sp,sp,16
    80003e38:	8082                	ret
    80003e3a:	6422                	ld	s0,8(sp)
    80003e3c:	4501                	li	a0,0
    80003e3e:	0141                	addi	sp,sp,16
    80003e40:	8082                	ret

0000000080003e42 <sbi_strnlen>:
    80003e42:	1141                	addi	sp,sp,-16
    80003e44:	e422                	sd	s0,8(sp)
    80003e46:	0800                	addi	s0,sp,16
    80003e48:	00054783          	lbu	a5,0(a0)
    80003e4c:	c395                	beqz	a5,80003e70 <sbi_strnlen+0x2e>
    80003e4e:	c18d                	beqz	a1,80003e70 <sbi_strnlen+0x2e>
    80003e50:	86aa                	mv	a3,a0
    80003e52:	4501                	li	a0,0
    80003e54:	a019                	j	80003e5a <sbi_strnlen+0x18>
    80003e56:	00e57a63          	bgeu	a0,a4,80003e6a <sbi_strnlen+0x28>
    80003e5a:	0505                	addi	a0,a0,1
    80003e5c:	00a687b3          	add	a5,a3,a0
    80003e60:	0007c783          	lbu	a5,0(a5)
    80003e64:	40a58733          	sub	a4,a1,a0
    80003e68:	f7fd                	bnez	a5,80003e56 <sbi_strnlen+0x14>
    80003e6a:	6422                	ld	s0,8(sp)
    80003e6c:	0141                	addi	sp,sp,16
    80003e6e:	8082                	ret
    80003e70:	6422                	ld	s0,8(sp)
    80003e72:	4501                	li	a0,0
    80003e74:	0141                	addi	sp,sp,16
    80003e76:	8082                	ret

0000000080003e78 <sbi_strcpy>:
    80003e78:	1141                	addi	sp,sp,-16
    80003e7a:	e422                	sd	s0,8(sp)
    80003e7c:	0800                	addi	s0,sp,16
    80003e7e:	0005c783          	lbu	a5,0(a1)
    80003e82:	cb89                	beqz	a5,80003e94 <sbi_strcpy+0x1c>
    80003e84:	872a                	mv	a4,a0
    80003e86:	00f70023          	sb	a5,0(a4)
    80003e8a:	0015c783          	lbu	a5,1(a1)
    80003e8e:	0585                	addi	a1,a1,1
    80003e90:	0705                	addi	a4,a4,1
    80003e92:	fbf5                	bnez	a5,80003e86 <sbi_strcpy+0xe>
    80003e94:	6422                	ld	s0,8(sp)
    80003e96:	0141                	addi	sp,sp,16
    80003e98:	8082                	ret

0000000080003e9a <sbi_strncpy>:
    80003e9a:	1141                	addi	sp,sp,-16
    80003e9c:	e422                	sd	s0,8(sp)
    80003e9e:	0800                	addi	s0,sp,16
    80003ea0:	ce09                	beqz	a2,80003eba <sbi_strncpy+0x20>
    80003ea2:	962a                	add	a2,a2,a0
    80003ea4:	87aa                	mv	a5,a0
    80003ea6:	a029                	j	80003eb0 <sbi_strncpy+0x16>
    80003ea8:	fee78fa3          	sb	a4,-1(a5)
    80003eac:	00c78763          	beq	a5,a2,80003eba <sbi_strncpy+0x20>
    80003eb0:	0005c703          	lbu	a4,0(a1)
    80003eb4:	0785                	addi	a5,a5,1
    80003eb6:	0585                	addi	a1,a1,1
    80003eb8:	fb65                	bnez	a4,80003ea8 <sbi_strncpy+0xe>
    80003eba:	6422                	ld	s0,8(sp)
    80003ebc:	0141                	addi	sp,sp,16
    80003ebe:	8082                	ret

0000000080003ec0 <sbi_strchr>:
    80003ec0:	1141                	addi	sp,sp,-16
    80003ec2:	e422                	sd	s0,8(sp)
    80003ec4:	0800                	addi	s0,sp,16
    80003ec6:	00054783          	lbu	a5,0(a0)
    80003eca:	cb89                	beqz	a5,80003edc <sbi_strchr+0x1c>
    80003ecc:	0ff5f593          	andi	a1,a1,255
    80003ed0:	00f58763          	beq	a1,a5,80003ede <sbi_strchr+0x1e>
    80003ed4:	00154783          	lbu	a5,1(a0)
    80003ed8:	0505                	addi	a0,a0,1
    80003eda:	fbfd                	bnez	a5,80003ed0 <sbi_strchr+0x10>
    80003edc:	4501                	li	a0,0
    80003ede:	6422                	ld	s0,8(sp)
    80003ee0:	0141                	addi	sp,sp,16
    80003ee2:	8082                	ret

0000000080003ee4 <sbi_strrchr>:
    80003ee4:	1141                	addi	sp,sp,-16
    80003ee6:	e422                	sd	s0,8(sp)
    80003ee8:	0800                	addi	s0,sp,16
    80003eea:	00054783          	lbu	a5,0(a0)
    80003eee:	872a                	mv	a4,a0
    80003ef0:	0ff5f593          	andi	a1,a1,255
    80003ef4:	c395                	beqz	a5,80003f18 <sbi_strrchr+0x34>
    80003ef6:	4781                	li	a5,0
    80003ef8:	0785                	addi	a5,a5,1
    80003efa:	00f70533          	add	a0,a4,a5
    80003efe:	00054683          	lbu	a3,0(a0)
    80003f02:	fafd                	bnez	a3,80003ef8 <sbi_strrchr+0x14>
    80003f04:	87b6                	mv	a5,a3
    80003f06:	02a77163          	bgeu	a4,a0,80003f28 <sbi_strrchr+0x44>
    80003f0a:	00f58a63          	beq	a1,a5,80003f1e <sbi_strrchr+0x3a>
    80003f0e:	157d                	addi	a0,a0,-1
    80003f10:	00054783          	lbu	a5,0(a0)
    80003f14:	fea71be3          	bne	a4,a0,80003f0a <sbi_strrchr+0x26>
    80003f18:	4501                	li	a0,0
    80003f1a:	00b78563          	beq	a5,a1,80003f24 <sbi_strrchr+0x40>
    80003f1e:	6422                	ld	s0,8(sp)
    80003f20:	0141                	addi	sp,sp,16
    80003f22:	8082                	ret
    80003f24:	853a                	mv	a0,a4
    80003f26:	bfe5                	j	80003f1e <sbi_strrchr+0x3a>
    80003f28:	872a                	mv	a4,a0
    80003f2a:	b7fd                	j	80003f18 <sbi_strrchr+0x34>

0000000080003f2c <sbi_memset>:
    80003f2c:	1141                	addi	sp,sp,-16
    80003f2e:	e422                	sd	s0,8(sp)
    80003f30:	0800                	addi	s0,sp,16
    80003f32:	00c50733          	add	a4,a0,a2
    80003f36:	ca09                	beqz	a2,80003f48 <sbi_memset+0x1c>
    80003f38:	0ff5f593          	andi	a1,a1,255
    80003f3c:	87aa                	mv	a5,a0
    80003f3e:	0785                	addi	a5,a5,1
    80003f40:	feb78fa3          	sb	a1,-1(a5)
    80003f44:	fee79de3          	bne	a5,a4,80003f3e <sbi_memset+0x12>
    80003f48:	6422                	ld	s0,8(sp)
    80003f4a:	0141                	addi	sp,sp,16
    80003f4c:	8082                	ret

0000000080003f4e <sbi_memcpy>:
    80003f4e:	1141                	addi	sp,sp,-16
    80003f50:	e422                	sd	s0,8(sp)
    80003f52:	0800                	addi	s0,sp,16
    80003f54:	ca19                	beqz	a2,80003f6a <sbi_memcpy+0x1c>
    80003f56:	962a                	add	a2,a2,a0
    80003f58:	87aa                	mv	a5,a0
    80003f5a:	0005c703          	lbu	a4,0(a1)
    80003f5e:	0785                	addi	a5,a5,1
    80003f60:	0585                	addi	a1,a1,1
    80003f62:	fee78fa3          	sb	a4,-1(a5)
    80003f66:	fec79ae3          	bne	a5,a2,80003f5a <sbi_memcpy+0xc>
    80003f6a:	6422                	ld	s0,8(sp)
    80003f6c:	0141                	addi	sp,sp,16
    80003f6e:	8082                	ret

0000000080003f70 <sbi_memmove>:
    80003f70:	1141                	addi	sp,sp,-16
    80003f72:	e422                	sd	s0,8(sp)
    80003f74:	0800                	addi	s0,sp,16
    80003f76:	00b50f63          	beq	a0,a1,80003f94 <sbi_memmove+0x24>
    80003f7a:	02b57063          	bgeu	a0,a1,80003f9a <sbi_memmove+0x2a>
    80003f7e:	ca19                	beqz	a2,80003f94 <sbi_memmove+0x24>
    80003f80:	962a                	add	a2,a2,a0
    80003f82:	87aa                	mv	a5,a0
    80003f84:	0005c703          	lbu	a4,0(a1)
    80003f88:	0785                	addi	a5,a5,1
    80003f8a:	0585                	addi	a1,a1,1
    80003f8c:	fee78fa3          	sb	a4,-1(a5)
    80003f90:	fec79ae3          	bne	a5,a2,80003f84 <sbi_memmove+0x14>
    80003f94:	6422                	ld	s0,8(sp)
    80003f96:	0141                	addi	sp,sp,16
    80003f98:	8082                	ret
    80003f9a:	fff60713          	addi	a4,a2,-1
    80003f9e:	00e507b3          	add	a5,a0,a4
    80003fa2:	95ba                	add	a1,a1,a4
    80003fa4:	da65                	beqz	a2,80003f94 <sbi_memmove+0x24>
    80003fa6:	fff50693          	addi	a3,a0,-1
    80003faa:	0005c703          	lbu	a4,0(a1)
    80003fae:	17fd                	addi	a5,a5,-1
    80003fb0:	15fd                	addi	a1,a1,-1
    80003fb2:	00e780a3          	sb	a4,1(a5)
    80003fb6:	fef69ae3          	bne	a3,a5,80003faa <sbi_memmove+0x3a>
    80003fba:	6422                	ld	s0,8(sp)
    80003fbc:	0141                	addi	sp,sp,16
    80003fbe:	8082                	ret

0000000080003fc0 <sbi_memcmp>:
    80003fc0:	1141                	addi	sp,sp,-16
    80003fc2:	e422                	sd	s0,8(sp)
    80003fc4:	0800                	addi	s0,sp,16
    80003fc6:	c215                	beqz	a2,80003fea <sbi_memcmp+0x2a>
    80003fc8:	962e                	add	a2,a2,a1
    80003fca:	a019                	j	80003fd0 <sbi_memcmp+0x10>
    80003fcc:	00c58f63          	beq	a1,a2,80003fea <sbi_memcmp+0x2a>
    80003fd0:	00054783          	lbu	a5,0(a0)
    80003fd4:	0005c703          	lbu	a4,0(a1)
    80003fd8:	0505                	addi	a0,a0,1
    80003fda:	0585                	addi	a1,a1,1
    80003fdc:	fee788e3          	beq	a5,a4,80003fcc <sbi_memcmp+0xc>
    80003fe0:	6422                	ld	s0,8(sp)
    80003fe2:	40e7853b          	subw	a0,a5,a4
    80003fe6:	0141                	addi	sp,sp,16
    80003fe8:	8082                	ret
    80003fea:	6422                	ld	s0,8(sp)
    80003fec:	4501                	li	a0,0
    80003fee:	0141                	addi	sp,sp,16
    80003ff0:	8082                	ret

0000000080003ff2 <sbi_memchr>:
    80003ff2:	1141                	addi	sp,sp,-16
    80003ff4:	e422                	sd	s0,8(sp)
    80003ff6:	0800                	addi	s0,sp,16
    80003ff8:	c20d                	beqz	a2,8000401a <sbi_memchr+0x28>
    80003ffa:	87aa                	mv	a5,a0
    80003ffc:	0ff5f593          	andi	a1,a1,255
    80004000:	962a                	add	a2,a2,a0
    80004002:	a019                	j	80004008 <sbi_memchr+0x16>
    80004004:	00f60b63          	beq	a2,a5,8000401a <sbi_memchr+0x28>
    80004008:	0007c703          	lbu	a4,0(a5)
    8000400c:	853e                	mv	a0,a5
    8000400e:	0785                	addi	a5,a5,1
    80004010:	feb71ae3          	bne	a4,a1,80004004 <sbi_memchr+0x12>
    80004014:	6422                	ld	s0,8(sp)
    80004016:	0141                	addi	sp,sp,16
    80004018:	8082                	ret
    8000401a:	6422                	ld	s0,8(sp)
    8000401c:	4501                	li	a0,0
    8000401e:	0141                	addi	sp,sp,16
    80004020:	8082                	ret

0000000080004022 <virt_pmp_region_count>:
    80004022:	1141                	addi	sp,sp,-16
    80004024:	e422                	sd	s0,8(sp)
    80004026:	0800                	addi	s0,sp,16
    80004028:	6422                	ld	s0,8(sp)
    8000402a:	4505                	li	a0,1
    8000402c:	0141                	addi	sp,sp,16
    8000402e:	8082                	ret

0000000080004030 <virt_pmp_region_info>:
    80004030:	1141                	addi	sp,sp,-16
    80004032:	e422                	sd	s0,8(sp)
    80004034:	0800                	addi	s0,sp,16
    80004036:	ed81                	bnez	a1,8000404e <virt_pmp_region_info+0x1e>
    80004038:	479d                	li	a5,7
    8000403a:	e21c                	sd	a5,0(a2)
    8000403c:	0006b023          	sd	zero,0(a3)
    80004040:	04000793          	li	a5,64
    80004044:	e31c                	sd	a5,0(a4)
    80004046:	4501                	li	a0,0
    80004048:	6422                	ld	s0,8(sp)
    8000404a:	0141                	addi	sp,sp,16
    8000404c:	8082                	ret
    8000404e:	557d                	li	a0,-1
    80004050:	bfe5                	j	80004048 <virt_pmp_region_info+0x18>

0000000080004052 <virt_system_down>:
    80004052:	1141                	addi	sp,sp,-16
    80004054:	e422                	sd	s0,8(sp)
    80004056:	0800                	addi	s0,sp,16
    80004058:	0140000f          	fence	w,o
    8000405c:	6795                	lui	a5,0x5
    8000405e:	5557879b          	addiw	a5,a5,1365
    80004062:	00100737          	lui	a4,0x100
    80004066:	00f71023          	sh	a5,0(a4) # 100000 <_fw_start-0x7ff00000>
    8000406a:	6422                	ld	s0,8(sp)
    8000406c:	4501                	li	a0,0
    8000406e:	0141                	addi	sp,sp,16
    80004070:	8082                	ret

0000000080004072 <virt_timer_init>:
    80004072:	1141                	addi	sp,sp,-16
    80004074:	e022                	sd	s0,0(sp)
    80004076:	e406                	sd	ra,8(sp)
    80004078:	0800                	addi	s0,sp,16
    8000407a:	c901                	beqz	a0,8000408a <virt_timer_init+0x18>
    8000407c:	4605                	li	a2,1
    8000407e:	45a1                	li	a1,8
    80004080:	02000537          	lui	a0,0x2000
    80004084:	20c050ef          	jal	ra,80009290 <clint_cold_timer_init>
    80004088:	e119                	bnez	a0,8000408e <virt_timer_init+0x1c>
    8000408a:	1b6050ef          	jal	ra,80009240 <clint_warm_timer_init>
    8000408e:	60a2                	ld	ra,8(sp)
    80004090:	6402                	ld	s0,0(sp)
    80004092:	0141                	addi	sp,sp,16
    80004094:	8082                	ret

0000000080004096 <virt_ipi_init>:
    80004096:	1141                	addi	sp,sp,-16
    80004098:	e022                	sd	s0,0(sp)
    8000409a:	e406                	sd	ra,8(sp)
    8000409c:	0800                	addi	s0,sp,16
    8000409e:	c519                	beqz	a0,800040ac <virt_ipi_init+0x16>
    800040a0:	45a1                	li	a1,8
    800040a2:	02000537          	lui	a0,0x2000
    800040a6:	0ca050ef          	jal	ra,80009170 <clint_cold_ipi_init>
    800040aa:	e119                	bnez	a0,800040b0 <virt_ipi_init+0x1a>
    800040ac:	076050ef          	jal	ra,80009122 <clint_warm_ipi_init>
    800040b0:	60a2                	ld	ra,8(sp)
    800040b2:	6402                	ld	s0,0(sp)
    800040b4:	0141                	addi	sp,sp,16
    800040b6:	8082                	ret

00000000800040b8 <virt_irqchip_init>:
    800040b8:	1101                	addi	sp,sp,-32
    800040ba:	e822                	sd	s0,16(sp)
    800040bc:	e426                	sd	s1,8(sp)
    800040be:	e04a                	sd	s2,0(sp)
    800040c0:	ec06                	sd	ra,24(sp)
    800040c2:	1000                	addi	s0,sp,32
    800040c4:	892a                	mv	s2,a0
    800040c6:	4b8030ef          	jal	ra,8000757e <sbi_current_hartid>
    800040ca:	0005049b          	sext.w	s1,a0
    800040ce:	00090a63          	beqz	s2,800040e2 <virt_irqchip_init+0x2a>
    800040d2:	4621                	li	a2,8
    800040d4:	07f00593          	li	a1,127
    800040d8:	0c000537          	lui	a0,0xc000
    800040dc:	682050ef          	jal	ra,8000975e <plic_cold_irqchip_init>
    800040e0:	e901                	bnez	a0,800040f0 <virt_irqchip_init+0x38>
    800040e2:	0014959b          	slliw	a1,s1,0x1
    800040e6:	0015861b          	addiw	a2,a1,1
    800040ea:	8526                	mv	a0,s1
    800040ec:	58c050ef          	jal	ra,80009678 <plic_warm_irqchip_init>
    800040f0:	60e2                	ld	ra,24(sp)
    800040f2:	6442                	ld	s0,16(sp)
    800040f4:	64a2                	ld	s1,8(sp)
    800040f6:	6902                	ld	s2,0(sp)
    800040f8:	6105                	addi	sp,sp,32
    800040fa:	8082                	ret

00000000800040fc <virt_console_init>:
    800040fc:	1141                	addi	sp,sp,-16
    800040fe:	e022                	sd	s0,0(sp)
    80004100:	e406                	sd	ra,8(sp)
    80004102:	0800                	addi	s0,sp,16
    80004104:	6671                	lui	a2,0x1c
    80004106:	4705                	li	a4,1
    80004108:	4681                	li	a3,0
    8000410a:	20060613          	addi	a2,a2,512 # 1c200 <_fw_start-0x7ffe3e00>
    8000410e:	001c25b7          	lui	a1,0x1c2
    80004112:	10000537          	lui	a0,0x10000
    80004116:	3e2050ef          	jal	ra,800094f8 <uart8250_init>
    8000411a:	60a2                	ld	ra,8(sp)
    8000411c:	6402                	ld	s0,0(sp)
    8000411e:	0141                	addi	sp,sp,16
    80004120:	8082                	ret

0000000080004122 <virt_final_init>:
    80004122:	e119                	bnez	a0,80004128 <virt_final_init+0x6>
    80004124:	4501                	li	a0,0
    80004126:	8082                	ret
    80004128:	1141                	addi	sp,sp,-16
    8000412a:	e022                	sd	s0,0(sp)
    8000412c:	e406                	sd	ra,8(sp)
    8000412e:	0800                	addi	s0,sp,16
    80004130:	340027f3          	csrr	a5,mscratch
    80004134:	0117c803          	lbu	a6,17(a5) # 5011 <_fw_start-0x7fffafef>
    80004138:	0107c503          	lbu	a0,16(a5)
    8000413c:	0127c583          	lbu	a1,18(a5)
    80004140:	0137c603          	lbu	a2,19(a5)
    80004144:	0147c683          	lbu	a3,20(a5)
    80004148:	0822                	slli	a6,a6,0x8
    8000414a:	0157c703          	lbu	a4,21(a5)
    8000414e:	00a86833          	or	a6,a6,a0
    80004152:	05c2                	slli	a1,a1,0x10
    80004154:	0167c503          	lbu	a0,22(a5)
    80004158:	0105e5b3          	or	a1,a1,a6
    8000415c:	0662                	slli	a2,a2,0x18
    8000415e:	0177c803          	lbu	a6,23(a5)
    80004162:	1682                	slli	a3,a3,0x20
    80004164:	00b667b3          	or	a5,a2,a1
    80004168:	8edd                	or	a3,a3,a5
    8000416a:	02871793          	slli	a5,a4,0x28
    8000416e:	00d7e733          	or	a4,a5,a3
    80004172:	03051793          	slli	a5,a0,0x30
    80004176:	8fd9                	or	a5,a5,a4
    80004178:	03881513          	slli	a0,a6,0x38
    8000417c:	8d5d                	or	a0,a0,a5
    8000417e:	00008597          	auipc	a1,0x8
    80004182:	4ba58593          	addi	a1,a1,1210 # 8000c638 <__func__.0+0x10>
    80004186:	45c050ef          	jal	ra,800095e2 <plic_fdt_fixup>
    8000418a:	60a2                	ld	ra,8(sp)
    8000418c:	6402                	ld	s0,0(sp)
    8000418e:	4501                	li	a0,0
    80004190:	0141                	addi	sp,sp,16
    80004192:	8082                	ret

0000000080004194 <misa_extension_imp>:
    80004194:	30102773          	csrr	a4,misa
    80004198:	cb19                	beqz	a4,800041ae <misa_extension_imp+0x1a>
    8000419a:	4685                	li	a3,1
    8000419c:	fbf5051b          	addiw	a0,a0,-65
    800041a0:	00a6953b          	sllw	a0,a3,a0
    800041a4:	8f69                	and	a4,a4,a0
    800041a6:	0007069b          	sext.w	a3,a4
    800041aa:	8536                	mv	a0,a3
    800041ac:	8082                	ret
    800041ae:	34002773          	csrr	a4,mscratch
    800041b2:	03174783          	lbu	a5,49(a4)
    800041b6:	03074683          	lbu	a3,48(a4)
    800041ba:	03274883          	lbu	a7,50(a4)
    800041be:	03374803          	lbu	a6,51(a4)
    800041c2:	03474583          	lbu	a1,52(a4)
    800041c6:	07a2                	slli	a5,a5,0x8
    800041c8:	03574603          	lbu	a2,53(a4)
    800041cc:	8fd5                	or	a5,a5,a3
    800041ce:	08c2                	slli	a7,a7,0x10
    800041d0:	03674683          	lbu	a3,54(a4)
    800041d4:	00f8e8b3          	or	a7,a7,a5
    800041d8:	0862                	slli	a6,a6,0x18
    800041da:	03774783          	lbu	a5,55(a4)
    800041de:	1582                	slli	a1,a1,0x20
    800041e0:	01186733          	or	a4,a6,a7
    800041e4:	8dd9                	or	a1,a1,a4
    800041e6:	02861713          	slli	a4,a2,0x28
    800041ea:	00b76633          	or	a2,a4,a1
    800041ee:	03069713          	slli	a4,a3,0x30
    800041f2:	8f51                	or	a4,a4,a2
    800041f4:	17e2                	slli	a5,a5,0x38
    800041f6:	8fd9                	or	a5,a5,a4
    800041f8:	4681                	li	a3,0
    800041fa:	dbc5                	beqz	a5,800041aa <misa_extension_imp+0x16>
    800041fc:	0617c703          	lbu	a4,97(a5)
    80004200:	0607c603          	lbu	a2,96(a5)
    80004204:	0627c303          	lbu	t1,98(a5)
    80004208:	0637c883          	lbu	a7,99(a5)
    8000420c:	0647c803          	lbu	a6,100(a5)
    80004210:	0722                	slli	a4,a4,0x8
    80004212:	0657c583          	lbu	a1,101(a5)
    80004216:	8f51                	or	a4,a4,a2
    80004218:	0342                	slli	t1,t1,0x10
    8000421a:	0667c603          	lbu	a2,102(a5)
    8000421e:	00e36333          	or	t1,t1,a4
    80004222:	08e2                	slli	a7,a7,0x18
    80004224:	0677c703          	lbu	a4,103(a5)
    80004228:	1802                	slli	a6,a6,0x20
    8000422a:	0068e7b3          	or	a5,a7,t1
    8000422e:	00f86833          	or	a6,a6,a5
    80004232:	02859793          	slli	a5,a1,0x28
    80004236:	0107e5b3          	or	a1,a5,a6
    8000423a:	03061793          	slli	a5,a2,0x30
    8000423e:	8fcd                	or	a5,a5,a1
    80004240:	1762                	slli	a4,a4,0x38
    80004242:	8f5d                	or	a4,a4,a5
    80004244:	02174783          	lbu	a5,33(a4)
    80004248:	02074603          	lbu	a2,32(a4)
    8000424c:	02274303          	lbu	t1,34(a4)
    80004250:	02374883          	lbu	a7,35(a4)
    80004254:	02474803          	lbu	a6,36(a4)
    80004258:	07a2                	slli	a5,a5,0x8
    8000425a:	02574583          	lbu	a1,37(a4)
    8000425e:	8fd1                	or	a5,a5,a2
    80004260:	0342                	slli	t1,t1,0x10
    80004262:	02674603          	lbu	a2,38(a4)
    80004266:	00f36333          	or	t1,t1,a5
    8000426a:	08e2                	slli	a7,a7,0x18
    8000426c:	02774783          	lbu	a5,39(a4)
    80004270:	1802                	slli	a6,a6,0x20
    80004272:	0068e733          	or	a4,a7,t1
    80004276:	00e86833          	or	a6,a6,a4
    8000427a:	02859713          	slli	a4,a1,0x28
    8000427e:	010765b3          	or	a1,a4,a6
    80004282:	03061713          	slli	a4,a2,0x30
    80004286:	8f4d                	or	a4,a4,a1
    80004288:	17e2                	slli	a5,a5,0x38
    8000428a:	8fd9                	or	a5,a5,a4
    8000428c:	df99                	beqz	a5,800041aa <misa_extension_imp+0x16>
    8000428e:	1141                	addi	sp,sp,-16
    80004290:	e022                	sd	s0,0(sp)
    80004292:	e406                	sd	ra,8(sp)
    80004294:	0800                	addi	s0,sp,16
    80004296:	9782                	jalr	a5
    80004298:	60a2                	ld	ra,8(sp)
    8000429a:	6402                	ld	s0,0(sp)
    8000429c:	0141                	addi	sp,sp,16
    8000429e:	8082                	ret

00000000800042a0 <misa_xlen>:
    800042a0:	301027f3          	csrr	a5,misa
    800042a4:	cf91                	beqz	a5,800042c0 <misa_xlen+0x20>
    800042a6:	301022f3          	csrr	t0,misa
    800042aa:	0002a313          	slti	t1,t0,0
    800042ae:	0306                	slli	t1,t1,0x1
    800042b0:	0286                	slli	t0,t0,0x1
    800042b2:	0002a293          	slti	t0,t0,0
    800042b6:	00628533          	add	a0,t0,t1
    800042ba:	c17d                	beqz	a0,800043a0 <misa_xlen+0x100>
    800042bc:	2501                	sext.w	a0,a0
    800042be:	8082                	ret
    800042c0:	34002773          	csrr	a4,mscratch
    800042c4:	03174783          	lbu	a5,49(a4)
    800042c8:	03074683          	lbu	a3,48(a4)
    800042cc:	03274803          	lbu	a6,50(a4)
    800042d0:	03374503          	lbu	a0,51(a4)
    800042d4:	03474583          	lbu	a1,52(a4)
    800042d8:	07a2                	slli	a5,a5,0x8
    800042da:	03574603          	lbu	a2,53(a4)
    800042de:	8fd5                	or	a5,a5,a3
    800042e0:	0842                	slli	a6,a6,0x10
    800042e2:	03674683          	lbu	a3,54(a4)
    800042e6:	00f86833          	or	a6,a6,a5
    800042ea:	0562                	slli	a0,a0,0x18
    800042ec:	03774783          	lbu	a5,55(a4)
    800042f0:	1582                	slli	a1,a1,0x20
    800042f2:	01056733          	or	a4,a0,a6
    800042f6:	8dd9                	or	a1,a1,a4
    800042f8:	02861713          	slli	a4,a2,0x28
    800042fc:	00b76633          	or	a2,a4,a1
    80004300:	03069713          	slli	a4,a3,0x30
    80004304:	8f51                	or	a4,a4,a2
    80004306:	17e2                	slli	a5,a5,0x38
    80004308:	8fd9                	or	a5,a5,a4
    8000430a:	cbd9                	beqz	a5,800043a0 <misa_xlen+0x100>
    8000430c:	0617c803          	lbu	a6,97(a5)
    80004310:	0607c703          	lbu	a4,96(a5)
    80004314:	0627c503          	lbu	a0,98(a5)
    80004318:	0637c583          	lbu	a1,99(a5)
    8000431c:	0647c603          	lbu	a2,100(a5)
    80004320:	0822                	slli	a6,a6,0x8
    80004322:	00e86833          	or	a6,a6,a4
    80004326:	0657c683          	lbu	a3,101(a5)
    8000432a:	0542                	slli	a0,a0,0x10
    8000432c:	01056533          	or	a0,a0,a6
    80004330:	0667c703          	lbu	a4,102(a5)
    80004334:	05e2                	slli	a1,a1,0x18
    80004336:	8dc9                	or	a1,a1,a0
    80004338:	0677c783          	lbu	a5,103(a5)
    8000433c:	1602                	slli	a2,a2,0x20
    8000433e:	8e4d                	or	a2,a2,a1
    80004340:	16a2                	slli	a3,a3,0x28
    80004342:	8ed1                	or	a3,a3,a2
    80004344:	1742                	slli	a4,a4,0x30
    80004346:	8f55                	or	a4,a4,a3
    80004348:	17e2                	slli	a5,a5,0x38
    8000434a:	8fd9                	or	a5,a5,a4
    8000434c:	0297c803          	lbu	a6,41(a5)
    80004350:	0287c703          	lbu	a4,40(a5)
    80004354:	02a7c503          	lbu	a0,42(a5)
    80004358:	02b7c583          	lbu	a1,43(a5)
    8000435c:	02c7c603          	lbu	a2,44(a5)
    80004360:	0822                	slli	a6,a6,0x8
    80004362:	02d7c683          	lbu	a3,45(a5)
    80004366:	00e86833          	or	a6,a6,a4
    8000436a:	0542                	slli	a0,a0,0x10
    8000436c:	02e7c703          	lbu	a4,46(a5)
    80004370:	01056533          	or	a0,a0,a6
    80004374:	05e2                	slli	a1,a1,0x18
    80004376:	02f7c783          	lbu	a5,47(a5)
    8000437a:	8dc9                	or	a1,a1,a0
    8000437c:	1602                	slli	a2,a2,0x20
    8000437e:	8e4d                	or	a2,a2,a1
    80004380:	16a2                	slli	a3,a3,0x28
    80004382:	8ed1                	or	a3,a3,a2
    80004384:	1742                	slli	a4,a4,0x30
    80004386:	8f55                	or	a4,a4,a3
    80004388:	17e2                	slli	a5,a5,0x38
    8000438a:	8fd9                	or	a5,a5,a4
    8000438c:	cb91                	beqz	a5,800043a0 <misa_xlen+0x100>
    8000438e:	1141                	addi	sp,sp,-16
    80004390:	e022                	sd	s0,0(sp)
    80004392:	e406                	sd	ra,8(sp)
    80004394:	0800                	addi	s0,sp,16
    80004396:	9782                	jalr	a5
    80004398:	60a2                	ld	ra,8(sp)
    8000439a:	6402                	ld	s0,0(sp)
    8000439c:	0141                	addi	sp,sp,16
    8000439e:	8082                	ret
    800043a0:	557d                	li	a0,-1
    800043a2:	8082                	ret

00000000800043a4 <csr_read_num>:
    800043a4:	1141                	addi	sp,sp,-16
    800043a6:	e422                	sd	s0,8(sp)
    800043a8:	c605051b          	addiw	a0,a0,-928
    800043ac:	0800                	addi	s0,sp,16
    800043ae:	0005071b          	sext.w	a4,a0
    800043b2:	47fd                	li	a5,31
    800043b4:	00e7ee63          	bltu	a5,a4,800043d0 <csr_read_num+0x2c>
    800043b8:	02051793          	slli	a5,a0,0x20
    800043bc:	00008717          	auipc	a4,0x8
    800043c0:	3d470713          	addi	a4,a4,980 # 8000c790 <platform_ops+0xd8>
    800043c4:	01e7d513          	srli	a0,a5,0x1e
    800043c8:	953a                	add	a0,a0,a4
    800043ca:	411c                	lw	a5,0(a0)
    800043cc:	97ba                	add	a5,a5,a4
    800043ce:	8782                	jr	a5
    800043d0:	4501                	li	a0,0
    800043d2:	6422                	ld	s0,8(sp)
    800043d4:	0141                	addi	sp,sp,16
    800043d6:	8082                	ret
    800043d8:	3bf02573          	csrr	a0,pmpaddr15
    800043dc:	bfdd                	j	800043d2 <csr_read_num+0x2e>
    800043de:	3be02573          	csrr	a0,pmpaddr14
    800043e2:	bfc5                	j	800043d2 <csr_read_num+0x2e>
    800043e4:	3bd02573          	csrr	a0,pmpaddr13
    800043e8:	b7ed                	j	800043d2 <csr_read_num+0x2e>
    800043ea:	3bc02573          	csrr	a0,pmpaddr12
    800043ee:	b7d5                	j	800043d2 <csr_read_num+0x2e>
    800043f0:	3bb02573          	csrr	a0,pmpaddr11
    800043f4:	bff9                	j	800043d2 <csr_read_num+0x2e>
    800043f6:	3ba02573          	csrr	a0,pmpaddr10
    800043fa:	bfe1                	j	800043d2 <csr_read_num+0x2e>
    800043fc:	3b902573          	csrr	a0,pmpaddr9
    80004400:	bfc9                	j	800043d2 <csr_read_num+0x2e>
    80004402:	3b802573          	csrr	a0,pmpaddr8
    80004406:	b7f1                	j	800043d2 <csr_read_num+0x2e>
    80004408:	3b702573          	csrr	a0,pmpaddr7
    8000440c:	b7d9                	j	800043d2 <csr_read_num+0x2e>
    8000440e:	3b602573          	csrr	a0,pmpaddr6
    80004412:	b7c1                	j	800043d2 <csr_read_num+0x2e>
    80004414:	3b502573          	csrr	a0,pmpaddr5
    80004418:	bf6d                	j	800043d2 <csr_read_num+0x2e>
    8000441a:	3b402573          	csrr	a0,pmpaddr4
    8000441e:	bf55                	j	800043d2 <csr_read_num+0x2e>
    80004420:	3b302573          	csrr	a0,pmpaddr3
    80004424:	b77d                	j	800043d2 <csr_read_num+0x2e>
    80004426:	3b202573          	csrr	a0,pmpaddr2
    8000442a:	b765                	j	800043d2 <csr_read_num+0x2e>
    8000442c:	3b102573          	csrr	a0,pmpaddr1
    80004430:	b74d                	j	800043d2 <csr_read_num+0x2e>
    80004432:	3b002573          	csrr	a0,pmpaddr0
    80004436:	bf71                	j	800043d2 <csr_read_num+0x2e>
    80004438:	3a302573          	csrr	a0,pmpcfg3
    8000443c:	bf59                	j	800043d2 <csr_read_num+0x2e>
    8000443e:	3a202573          	csrr	a0,pmpcfg2
    80004442:	bf41                	j	800043d2 <csr_read_num+0x2e>
    80004444:	3a102573          	csrr	a0,pmpcfg1
    80004448:	b769                	j	800043d2 <csr_read_num+0x2e>
    8000444a:	3a002573          	csrr	a0,pmpcfg0
    8000444e:	b751                	j	800043d2 <csr_read_num+0x2e>

0000000080004450 <csr_write_num>:
    80004450:	1141                	addi	sp,sp,-16
    80004452:	e422                	sd	s0,8(sp)
    80004454:	c605051b          	addiw	a0,a0,-928
    80004458:	0800                	addi	s0,sp,16
    8000445a:	0005071b          	sext.w	a4,a0
    8000445e:	47fd                	li	a5,31
    80004460:	02e7e063          	bltu	a5,a4,80004480 <csr_write_num+0x30>
    80004464:	02051793          	slli	a5,a0,0x20
    80004468:	00008717          	auipc	a4,0x8
    8000446c:	3a870713          	addi	a4,a4,936 # 8000c810 <platform_ops+0x158>
    80004470:	01e7d513          	srli	a0,a5,0x1e
    80004474:	953a                	add	a0,a0,a4
    80004476:	411c                	lw	a5,0(a0)
    80004478:	97ba                	add	a5,a5,a4
    8000447a:	8782                	jr	a5
    8000447c:	3bf59073          	csrw	pmpaddr15,a1
    80004480:	6422                	ld	s0,8(sp)
    80004482:	0141                	addi	sp,sp,16
    80004484:	8082                	ret
    80004486:	3be59073          	csrw	pmpaddr14,a1
    8000448a:	bfdd                	j	80004480 <csr_write_num+0x30>
    8000448c:	3bd59073          	csrw	pmpaddr13,a1
    80004490:	bfc5                	j	80004480 <csr_write_num+0x30>
    80004492:	3bc59073          	csrw	pmpaddr12,a1
    80004496:	b7ed                	j	80004480 <csr_write_num+0x30>
    80004498:	3bb59073          	csrw	pmpaddr11,a1
    8000449c:	b7d5                	j	80004480 <csr_write_num+0x30>
    8000449e:	3ba59073          	csrw	pmpaddr10,a1
    800044a2:	bff9                	j	80004480 <csr_write_num+0x30>
    800044a4:	3b959073          	csrw	pmpaddr9,a1
    800044a8:	bfe1                	j	80004480 <csr_write_num+0x30>
    800044aa:	3b859073          	csrw	pmpaddr8,a1
    800044ae:	bfc9                	j	80004480 <csr_write_num+0x30>
    800044b0:	3b759073          	csrw	pmpaddr7,a1
    800044b4:	b7f1                	j	80004480 <csr_write_num+0x30>
    800044b6:	3b659073          	csrw	pmpaddr6,a1
    800044ba:	b7d9                	j	80004480 <csr_write_num+0x30>
    800044bc:	3b559073          	csrw	pmpaddr5,a1
    800044c0:	b7c1                	j	80004480 <csr_write_num+0x30>
    800044c2:	3b459073          	csrw	pmpaddr4,a1
    800044c6:	bf6d                	j	80004480 <csr_write_num+0x30>
    800044c8:	3b359073          	csrw	pmpaddr3,a1
    800044cc:	bf55                	j	80004480 <csr_write_num+0x30>
    800044ce:	3b259073          	csrw	pmpaddr2,a1
    800044d2:	b77d                	j	80004480 <csr_write_num+0x30>
    800044d4:	3b159073          	csrw	pmpaddr1,a1
    800044d8:	b765                	j	80004480 <csr_write_num+0x30>
    800044da:	3b059073          	csrw	pmpaddr0,a1
    800044de:	b74d                	j	80004480 <csr_write_num+0x30>
    800044e0:	3a359073          	csrw	pmpcfg3,a1
    800044e4:	bf71                	j	80004480 <csr_write_num+0x30>
    800044e6:	3a259073          	csrw	pmpcfg2,a1
    800044ea:	bf59                	j	80004480 <csr_write_num+0x30>
    800044ec:	3a159073          	csrw	pmpcfg1,a1
    800044f0:	bf41                	j	80004480 <csr_write_num+0x30>
    800044f2:	3a059073          	csrw	pmpcfg0,a1
    800044f6:	b769                	j	80004480 <csr_write_num+0x30>

00000000800044f8 <pmp_set>:
    800044f8:	47bd                	li	a5,15
    800044fa:	0ca7ea63          	bltu	a5,a0,800045ce <pmp_set+0xd6>
    800044fe:	715d                	addi	sp,sp,-80
    80004500:	e0a2                	sd	s0,64(sp)
    80004502:	ec56                	sd	s5,24(sp)
    80004504:	e486                	sd	ra,72(sp)
    80004506:	fc26                	sd	s1,56(sp)
    80004508:	f84a                	sd	s2,48(sp)
    8000450a:	f44e                	sd	s3,40(sp)
    8000450c:	f052                	sd	s4,32(sp)
    8000450e:	e85a                	sd	s6,16(sp)
    80004510:	e45e                	sd	s7,8(sp)
    80004512:	0880                	addi	s0,sp,80
    80004514:	ffe68793          	addi	a5,a3,-2
    80004518:	03e00713          	li	a4,62
    8000451c:	8ab6                	mv	s5,a3
    8000451e:	0af76a63          	bltu	a4,a5,800045d2 <pmp_set+0xda>
    80004522:	00255a1b          	srliw	s4,a0,0x2
    80004526:	3a0a0a1b          	addiw	s4,s4,928
    8000452a:	00351b1b          	slliw	s6,a0,0x3
    8000452e:	84ae                	mv	s1,a1
    80004530:	ffea7a13          	andi	s4,s4,-2
    80004534:	038b7b13          	andi	s6,s6,56
    80004538:	0ff00593          	li	a1,255
    8000453c:	4789                	li	a5,2
    8000453e:	8932                	mv	s2,a2
    80004540:	2a01                	sext.w	s4,s4
    80004542:	3b05099b          	addiw	s3,a0,944
    80004546:	01659bb3          	sll	s7,a1,s6
    8000454a:	06f68463          	beq	a3,a5,800045b2 <pmp_set+0xba>
    8000454e:	8552                	mv	a0,s4
    80004550:	e55ff0ef          	jal	ra,800043a4 <csr_read_num>
    80004554:	0184e593          	ori	a1,s1,24
    80004558:	016594b3          	sll	s1,a1,s6
    8000455c:	8ca9                	xor	s1,s1,a0
    8000455e:	0174f4b3          	and	s1,s1,s7
    80004562:	04000793          	li	a5,64
    80004566:	8ca9                	xor	s1,s1,a0
    80004568:	55fd                	li	a1,-1
    8000456a:	02fa8163          	beq	s5,a5,8000458c <pmp_set+0x94>
    8000456e:	4585                	li	a1,1
    80004570:	3af9                	addiw	s5,s5,-2
    80004572:	01559ab3          	sll	s5,a1,s5
    80004576:	415007b3          	neg	a5,s5
    8000457a:	00295913          	srli	s2,s2,0x2
    8000457e:	fffa8593          	addi	a1,s5,-1
    80004582:	0127f933          	and	s2,a5,s2
    80004586:	8185                	srli	a1,a1,0x1
    80004588:	0125e5b3          	or	a1,a1,s2
    8000458c:	854e                	mv	a0,s3
    8000458e:	ec3ff0ef          	jal	ra,80004450 <csr_write_num>
    80004592:	8552                	mv	a0,s4
    80004594:	85a6                	mv	a1,s1
    80004596:	ebbff0ef          	jal	ra,80004450 <csr_write_num>
    8000459a:	4501                	li	a0,0
    8000459c:	60a6                	ld	ra,72(sp)
    8000459e:	6406                	ld	s0,64(sp)
    800045a0:	74e2                	ld	s1,56(sp)
    800045a2:	7942                	ld	s2,48(sp)
    800045a4:	79a2                	ld	s3,40(sp)
    800045a6:	7a02                	ld	s4,32(sp)
    800045a8:	6ae2                	ld	s5,24(sp)
    800045aa:	6b42                	ld	s6,16(sp)
    800045ac:	6ba2                	ld	s7,8(sp)
    800045ae:	6161                	addi	sp,sp,80
    800045b0:	8082                	ret
    800045b2:	8552                	mv	a0,s4
    800045b4:	df1ff0ef          	jal	ra,800043a4 <csr_read_num>
    800045b8:	0104e593          	ori	a1,s1,16
    800045bc:	016594b3          	sll	s1,a1,s6
    800045c0:	8ca9                	xor	s1,s1,a0
    800045c2:	0174f4b3          	and	s1,s1,s7
    800045c6:	8ca9                	xor	s1,s1,a0
    800045c8:	00295593          	srli	a1,s2,0x2
    800045cc:	b7c1                	j	8000458c <pmp_set+0x94>
    800045ce:	5575                	li	a0,-3
    800045d0:	8082                	ret
    800045d2:	5575                	li	a0,-3
    800045d4:	b7e1                	j	8000459c <pmp_set+0xa4>

00000000800045d6 <pmp_get>:
    800045d6:	473d                	li	a4,15
    800045d8:	0ca76463          	bltu	a4,a0,800046a0 <pmp_get+0xca>
    800045dc:	7139                	addi	sp,sp,-64
    800045de:	f822                	sd	s0,48(sp)
    800045e0:	ec4e                	sd	s3,24(sp)
    800045e2:	fc06                	sd	ra,56(sp)
    800045e4:	f426                	sd	s1,40(sp)
    800045e6:	f04a                	sd	s2,32(sp)
    800045e8:	e852                	sd	s4,16(sp)
    800045ea:	e456                	sd	s5,8(sp)
    800045ec:	0080                	addi	s0,sp,64
    800045ee:	89ae                	mv	s3,a1
    800045f0:	c5d5                	beqz	a1,8000469c <pmp_get+0xc6>
    800045f2:	8a32                	mv	s4,a2
    800045f4:	c645                	beqz	a2,8000469c <pmp_get+0xc6>
    800045f6:	8ab6                	mv	s5,a3
    800045f8:	c2d5                	beqz	a3,8000469c <pmp_get+0xc6>
    800045fa:	87aa                	mv	a5,a0
    800045fc:	0025551b          	srliw	a0,a0,0x2
    80004600:	0006b023          	sd	zero,0(a3)
    80004604:	3a05051b          	addiw	a0,a0,928
    80004608:	00063023          	sd	zero,0(a2)
    8000460c:	9979                	andi	a0,a0,-2
    8000460e:	0005b023          	sd	zero,0(a1)
    80004612:	2501                	sext.w	a0,a0
    80004614:	0037991b          	slliw	s2,a5,0x3
    80004618:	3b07849b          	addiw	s1,a5,944
    8000461c:	d89ff0ef          	jal	ra,800043a4 <csr_read_num>
    80004620:	03897913          	andi	s2,s2,56
    80004624:	0ff00793          	li	a5,255
    80004628:	012797b3          	sll	a5,a5,s2
    8000462c:	8fe9                	and	a5,a5,a0
    8000462e:	0127d933          	srl	s2,a5,s2
    80004632:	01897713          	andi	a4,s2,24
    80004636:	47e1                	li	a5,24
    80004638:	8526                	mv	a0,s1
    8000463a:	02f70663          	beq	a4,a5,80004666 <pmp_get+0x90>
    8000463e:	d67ff0ef          	jal	ra,800043a4 <csr_read_num>
    80004642:	050a                	slli	a0,a0,0x2
    80004644:	4689                	li	a3,2
    80004646:	0129b023          	sd	s2,0(s3)
    8000464a:	00aa3023          	sd	a0,0(s4)
    8000464e:	00dab023          	sd	a3,0(s5)
    80004652:	4501                	li	a0,0
    80004654:	70e2                	ld	ra,56(sp)
    80004656:	7442                	ld	s0,48(sp)
    80004658:	74a2                	ld	s1,40(sp)
    8000465a:	7902                	ld	s2,32(sp)
    8000465c:	69e2                	ld	s3,24(sp)
    8000465e:	6a42                	ld	s4,16(sp)
    80004660:	6aa2                	ld	s5,8(sp)
    80004662:	6121                	addi	sp,sp,64
    80004664:	8082                	ret
    80004666:	d3fff0ef          	jal	ra,800043a4 <csr_read_num>
    8000466a:	1ff56593          	ori	a1,a0,511
    8000466e:	57fd                	li	a5,-1
    80004670:	02f58263          	beq	a1,a5,80004694 <pmp_get+0xbe>
    80004674:	fff5c713          	not	a4,a1
    80004678:	4781                	li	a5,0
    8000467a:	8305                	srli	a4,a4,0x1
    8000467c:	00177613          	andi	a2,a4,1
    80004680:	86be                	mv	a3,a5
    80004682:	0785                	addi	a5,a5,1
    80004684:	da7d                	beqz	a2,8000467a <pmp_get+0xa4>
    80004686:	557d                	li	a0,-1
    80004688:	00f51533          	sll	a0,a0,a5
    8000468c:	8d6d                	and	a0,a0,a1
    8000468e:	050a                	slli	a0,a0,0x2
    80004690:	0691                	addi	a3,a3,4
    80004692:	bf55                	j	80004646 <pmp_get+0x70>
    80004694:	04000693          	li	a3,64
    80004698:	4501                	li	a0,0
    8000469a:	b775                	j	80004646 <pmp_get+0x70>
    8000469c:	5575                	li	a0,-3
    8000469e:	bf5d                	j	80004654 <pmp_get+0x7e>
    800046a0:	5575                	li	a0,-3
    800046a2:	8082                	ret

00000000800046a4 <atomic_read>:
    800046a4:	1141                	addi	sp,sp,-16
    800046a6:	e422                	sd	s0,8(sp)
    800046a8:	0800                	addi	s0,sp,16
    800046aa:	6108                	ld	a0,0(a0)
    800046ac:	0aa0000f          	fence	ir,ir
    800046b0:	6422                	ld	s0,8(sp)
    800046b2:	0141                	addi	sp,sp,16
    800046b4:	8082                	ret

00000000800046b6 <atomic_write>:
    800046b6:	1141                	addi	sp,sp,-16
    800046b8:	e422                	sd	s0,8(sp)
    800046ba:	0800                	addi	s0,sp,16
    800046bc:	e10c                	sd	a1,0(a0)
    800046be:	0550000f          	fence	ow,ow
    800046c2:	6422                	ld	s0,8(sp)
    800046c4:	0141                	addi	sp,sp,16
    800046c6:	8082                	ret

00000000800046c8 <atomic_add_return>:
    800046c8:	1141                	addi	sp,sp,-16
    800046ca:	e422                	sd	s0,8(sp)
    800046cc:	0800                	addi	s0,sp,16
    800046ce:	06b527af          	amoadd.w.aqrl	a5,a1,(a0)
    800046d2:	6422                	ld	s0,8(sp)
    800046d4:	00f58533          	add	a0,a1,a5
    800046d8:	0141                	addi	sp,sp,16
    800046da:	8082                	ret

00000000800046dc <atomic_sub_return>:
    800046dc:	1141                	addi	sp,sp,-16
    800046de:	e422                	sd	s0,8(sp)
    800046e0:	0800                	addi	s0,sp,16
    800046e2:	40b007b3          	neg	a5,a1
    800046e6:	06f527af          	amoadd.w.aqrl	a5,a5,(a0)
    800046ea:	6422                	ld	s0,8(sp)
    800046ec:	40b78533          	sub	a0,a5,a1
    800046f0:	0141                	addi	sp,sp,16
    800046f2:	8082                	ret

00000000800046f4 <arch_atomic_cmpxchg>:
    800046f4:	1141                	addi	sp,sp,-16
    800046f6:	e422                	sd	s0,8(sp)
    800046f8:	0800                	addi	s0,sp,16
    800046fa:	87aa                	mv	a5,a0
    800046fc:	0f50000f          	fence	iorw,ow
    80004700:	1407b52f          	lr.d.aq	a0,(a5)
    80004704:	00b51563          	bne	a0,a1,8000470e <arch_atomic_cmpxchg+0x1a>
    80004708:	1cc7b72f          	sc.d.aq	a4,a2,(a5)
    8000470c:	fb75                	bnez	a4,80004700 <arch_atomic_cmpxchg+0xc>
    8000470e:	6422                	ld	s0,8(sp)
    80004710:	0141                	addi	sp,sp,16
    80004712:	8082                	ret

0000000080004714 <arch_atomic_xchg>:
    80004714:	7179                	addi	sp,sp,-48
    80004716:	f422                	sd	s0,40(sp)
    80004718:	1800                	addi	s0,sp,48
    8000471a:	fcb43c23          	sd	a1,-40(s0)
    8000471e:	fd843783          	ld	a5,-40(s0)
    80004722:	fef43023          	sd	a5,-32(s0)
    80004726:	fe043783          	ld	a5,-32(s0)
    8000472a:	0ef537af          	amoswap.d.aqrl	a5,a5,(a0)
    8000472e:	fef43423          	sd	a5,-24(s0)
    80004732:	fe843503          	ld	a0,-24(s0)
    80004736:	7422                	ld	s0,40(sp)
    80004738:	6145                	addi	sp,sp,48
    8000473a:	8082                	ret

000000008000473c <atomic_raw_xchg_uint>:
    8000473c:	1101                	addi	sp,sp,-32
    8000473e:	ec22                	sd	s0,24(sp)
    80004740:	1000                	addi	s0,sp,32
    80004742:	feb42223          	sw	a1,-28(s0)
    80004746:	fe442783          	lw	a5,-28(s0)
    8000474a:	2781                	sext.w	a5,a5
    8000474c:	fef42423          	sw	a5,-24(s0)
    80004750:	fe842783          	lw	a5,-24(s0)
    80004754:	2781                	sext.w	a5,a5
    80004756:	0ef527af          	amoswap.w.aqrl	a5,a5,(a0)
    8000475a:	fef42623          	sw	a5,-20(s0)
    8000475e:	fec42503          	lw	a0,-20(s0)
    80004762:	6462                	ld	s0,24(sp)
    80004764:	2501                	sext.w	a0,a0
    80004766:	6105                	addi	sp,sp,32
    80004768:	8082                	ret

000000008000476a <atomic_raw_xchg_ulong>:
    8000476a:	7179                	addi	sp,sp,-48
    8000476c:	f422                	sd	s0,40(sp)
    8000476e:	1800                	addi	s0,sp,48
    80004770:	fcb43c23          	sd	a1,-40(s0)
    80004774:	fd843783          	ld	a5,-40(s0)
    80004778:	fef43023          	sd	a5,-32(s0)
    8000477c:	fe043783          	ld	a5,-32(s0)
    80004780:	0ef537af          	amoswap.d.aqrl	a5,a5,(a0)
    80004784:	fef43423          	sd	a5,-24(s0)
    80004788:	fe843503          	ld	a0,-24(s0)
    8000478c:	7422                	ld	s0,40(sp)
    8000478e:	6145                	addi	sp,sp,48
    80004790:	8082                	ret

0000000080004792 <atomic_raw_set_bit>:
    80004792:	41f5579b          	sraiw	a5,a0,0x1f
    80004796:	01a7d79b          	srliw	a5,a5,0x1a
    8000479a:	9d3d                	addw	a0,a0,a5
    8000479c:	1141                	addi	sp,sp,-16
    8000479e:	03f57713          	andi	a4,a0,63
    800047a2:	4065551b          	sraiw	a0,a0,0x6
    800047a6:	e422                	sd	s0,8(sp)
    800047a8:	9f1d                	subw	a4,a4,a5
    800047aa:	0800                	addi	s0,sp,16
    800047ac:	050e                	slli	a0,a0,0x3
    800047ae:	4785                	li	a5,1
    800047b0:	00e797b3          	sll	a5,a5,a4
    800047b4:	952e                	add	a0,a0,a1
    800047b6:	46f537af          	amoor.d.aqrl	a5,a5,(a0)
    800047ba:	6422                	ld	s0,8(sp)
    800047bc:	0007851b          	sext.w	a0,a5
    800047c0:	0141                	addi	sp,sp,16
    800047c2:	8082                	ret

00000000800047c4 <atomic_raw_clear_bit>:
    800047c4:	41f5579b          	sraiw	a5,a0,0x1f
    800047c8:	01a7d79b          	srliw	a5,a5,0x1a
    800047cc:	9d3d                	addw	a0,a0,a5
    800047ce:	03f57713          	andi	a4,a0,63
    800047d2:	1141                	addi	sp,sp,-16
    800047d4:	9f1d                	subw	a4,a4,a5
    800047d6:	4065551b          	sraiw	a0,a0,0x6
    800047da:	4785                	li	a5,1
    800047dc:	e422                	sd	s0,8(sp)
    800047de:	00e797b3          	sll	a5,a5,a4
    800047e2:	0800                	addi	s0,sp,16
    800047e4:	050e                	slli	a0,a0,0x3
    800047e6:	952e                	add	a0,a0,a1
    800047e8:	fff7c793          	not	a5,a5
    800047ec:	66f537af          	amoand.d.aqrl	a5,a5,(a0)
    800047f0:	6422                	ld	s0,8(sp)
    800047f2:	0007851b          	sext.w	a0,a5
    800047f6:	0141                	addi	sp,sp,16
    800047f8:	8082                	ret

00000000800047fa <atomic_set_bit>:
    800047fa:	41f5579b          	sraiw	a5,a0,0x1f
    800047fe:	01a7d79b          	srliw	a5,a5,0x1a
    80004802:	9d3d                	addw	a0,a0,a5
    80004804:	1141                	addi	sp,sp,-16
    80004806:	03f57713          	andi	a4,a0,63
    8000480a:	4065551b          	sraiw	a0,a0,0x6
    8000480e:	e422                	sd	s0,8(sp)
    80004810:	9f1d                	subw	a4,a4,a5
    80004812:	0800                	addi	s0,sp,16
    80004814:	050e                	slli	a0,a0,0x3
    80004816:	4785                	li	a5,1
    80004818:	00e797b3          	sll	a5,a5,a4
    8000481c:	952e                	add	a0,a0,a1
    8000481e:	46f537af          	amoor.d.aqrl	a5,a5,(a0)
    80004822:	6422                	ld	s0,8(sp)
    80004824:	0007851b          	sext.w	a0,a5
    80004828:	0141                	addi	sp,sp,16
    8000482a:	8082                	ret

000000008000482c <atomic_clear_bit>:
    8000482c:	41f5579b          	sraiw	a5,a0,0x1f
    80004830:	01a7d79b          	srliw	a5,a5,0x1a
    80004834:	9d3d                	addw	a0,a0,a5
    80004836:	03f57713          	andi	a4,a0,63
    8000483a:	1141                	addi	sp,sp,-16
    8000483c:	9f1d                	subw	a4,a4,a5
    8000483e:	4065551b          	sraiw	a0,a0,0x6
    80004842:	4785                	li	a5,1
    80004844:	e422                	sd	s0,8(sp)
    80004846:	00e797b3          	sll	a5,a5,a4
    8000484a:	0800                	addi	s0,sp,16
    8000484c:	050e                	slli	a0,a0,0x3
    8000484e:	952e                	add	a0,a0,a1
    80004850:	fff7c793          	not	a5,a5
    80004854:	66f537af          	amoand.d.aqrl	a5,a5,(a0)
    80004858:	6422                	ld	s0,8(sp)
    8000485a:	0007851b          	sext.w	a0,a5
    8000485e:	0141                	addi	sp,sp,16
    80004860:	8082                	ret

0000000080004862 <spin_lock_check>:
    80004862:	1141                	addi	sp,sp,-16
    80004864:	e422                	sd	s0,8(sp)
    80004866:	0800                	addi	s0,sp,16
    80004868:	6108                	ld	a0,0(a0)
    8000486a:	6422                	ld	s0,8(sp)
    8000486c:	00a03533          	snez	a0,a0
    80004870:	0141                	addi	sp,sp,16
    80004872:	8082                	ret

0000000080004874 <spin_trylock>:
    80004874:	1141                	addi	sp,sp,-16
    80004876:	e422                	sd	s0,8(sp)
    80004878:	0800                	addi	s0,sp,16
    8000487a:	4785                	li	a5,1
    8000487c:	08f527af          	amoswap.w	a5,a5,(a0)
    80004880:	0230000f          	fence	r,rw
    80004884:	6422                	ld	s0,8(sp)
    80004886:	0007851b          	sext.w	a0,a5
    8000488a:	00153513          	seqz	a0,a0
    8000488e:	0141                	addi	sp,sp,16
    80004890:	8082                	ret

0000000080004892 <spin_lock>:
    80004892:	1141                	addi	sp,sp,-16
    80004894:	e422                	sd	s0,8(sp)
    80004896:	0800                	addi	s0,sp,16
    80004898:	4705                	li	a4,1
    8000489a:	611c                	ld	a5,0(a0)
    8000489c:	fffd                	bnez	a5,8000489a <spin_lock+0x8>
    8000489e:	08e527af          	amoswap.w	a5,a4,(a0)
    800048a2:	0230000f          	fence	r,rw
    800048a6:	2781                	sext.w	a5,a5
    800048a8:	fbed                	bnez	a5,8000489a <spin_lock+0x8>
    800048aa:	6422                	ld	s0,8(sp)
    800048ac:	0141                	addi	sp,sp,16
    800048ae:	8082                	ret

00000000800048b0 <spin_unlock>:
    800048b0:	1141                	addi	sp,sp,-16
    800048b2:	e422                	sd	s0,8(sp)
    800048b4:	0800                	addi	s0,sp,16
    800048b6:	0310000f          	fence	rw,w
    800048ba:	6422                	ld	s0,8(sp)
    800048bc:	00053023          	sd	zero,0(a0) # 10000000 <_fw_start-0x70000000>
    800048c0:	0141                	addi	sp,sp,16
    800048c2:	8082                	ret

00000000800048c4 <sbi_isprintable>:
    800048c4:	1141                	addi	sp,sp,-16
    800048c6:	e422                	sd	s0,8(sp)
    800048c8:	fe05071b          	addiw	a4,a0,-32
    800048cc:	0800                	addi	s0,sp,16
    800048ce:	0ff77713          	andi	a4,a4,255
    800048d2:	05e00693          	li	a3,94
    800048d6:	02e6f363          	bgeu	a3,a4,800048fc <sbi_isprintable+0x38>
    800048da:	ff45071b          	addiw	a4,a0,-12
    800048de:	87aa                	mv	a5,a0
    800048e0:	0ff77713          	andi	a4,a4,255
    800048e4:	4505                	li	a0,1
    800048e6:	00e57863          	bgeu	a0,a4,800048f6 <sbi_isprintable+0x32>
    800048ea:	ff77851b          	addiw	a0,a5,-9
    800048ee:	0ff57513          	andi	a0,a0,255
    800048f2:	00253513          	sltiu	a0,a0,2
    800048f6:	6422                	ld	s0,8(sp)
    800048f8:	0141                	addi	sp,sp,16
    800048fa:	8082                	ret
    800048fc:	6422                	ld	s0,8(sp)
    800048fe:	4505                	li	a0,1
    80004900:	0141                	addi	sp,sp,16
    80004902:	8082                	ret

0000000080004904 <sbi_getc>:
    80004904:	0000a717          	auipc	a4,0xa
    80004908:	74c73703          	ld	a4,1868(a4) # 8000f050 <console_plat>
    8000490c:	cf51                	beqz	a4,800049a8 <sbi_getc+0xa4>
    8000490e:	06174783          	lbu	a5,97(a4)
    80004912:	06074683          	lbu	a3,96(a4)
    80004916:	06274803          	lbu	a6,98(a4)
    8000491a:	06374503          	lbu	a0,99(a4)
    8000491e:	06474583          	lbu	a1,100(a4)
    80004922:	07a2                	slli	a5,a5,0x8
    80004924:	06574603          	lbu	a2,101(a4)
    80004928:	8fd5                	or	a5,a5,a3
    8000492a:	0842                	slli	a6,a6,0x10
    8000492c:	06674683          	lbu	a3,102(a4)
    80004930:	00f86833          	or	a6,a6,a5
    80004934:	0562                	slli	a0,a0,0x18
    80004936:	06774783          	lbu	a5,103(a4)
    8000493a:	1582                	slli	a1,a1,0x20
    8000493c:	01056733          	or	a4,a0,a6
    80004940:	8dd9                	or	a1,a1,a4
    80004942:	02861713          	slli	a4,a2,0x28
    80004946:	00b76633          	or	a2,a4,a1
    8000494a:	03069713          	slli	a4,a3,0x30
    8000494e:	8f51                	or	a4,a4,a2
    80004950:	17e2                	slli	a5,a5,0x38
    80004952:	8fd9                	or	a5,a5,a4
    80004954:	0497c803          	lbu	a6,73(a5)
    80004958:	0487c703          	lbu	a4,72(a5)
    8000495c:	04a7c503          	lbu	a0,74(a5)
    80004960:	04b7c583          	lbu	a1,75(a5)
    80004964:	04c7c603          	lbu	a2,76(a5)
    80004968:	0822                	slli	a6,a6,0x8
    8000496a:	04d7c683          	lbu	a3,77(a5)
    8000496e:	00e86833          	or	a6,a6,a4
    80004972:	0542                	slli	a0,a0,0x10
    80004974:	04e7c703          	lbu	a4,78(a5)
    80004978:	01056533          	or	a0,a0,a6
    8000497c:	05e2                	slli	a1,a1,0x18
    8000497e:	04f7c783          	lbu	a5,79(a5)
    80004982:	8dc9                	or	a1,a1,a0
    80004984:	1602                	slli	a2,a2,0x20
    80004986:	8e4d                	or	a2,a2,a1
    80004988:	16a2                	slli	a3,a3,0x28
    8000498a:	8ed1                	or	a3,a3,a2
    8000498c:	1742                	slli	a4,a4,0x30
    8000498e:	8f55                	or	a4,a4,a3
    80004990:	17e2                	slli	a5,a5,0x38
    80004992:	8fd9                	or	a5,a5,a4
    80004994:	cb91                	beqz	a5,800049a8 <sbi_getc+0xa4>
    80004996:	1141                	addi	sp,sp,-16
    80004998:	e022                	sd	s0,0(sp)
    8000499a:	e406                	sd	ra,8(sp)
    8000499c:	0800                	addi	s0,sp,16
    8000499e:	9782                	jalr	a5
    800049a0:	60a2                	ld	ra,8(sp)
    800049a2:	6402                	ld	s0,0(sp)
    800049a4:	0141                	addi	sp,sp,16
    800049a6:	8082                	ret
    800049a8:	557d                	li	a0,-1
    800049aa:	8082                	ret

00000000800049ac <sbi_putc>:
    800049ac:	1101                	addi	sp,sp,-32
    800049ae:	e822                	sd	s0,16(sp)
    800049b0:	e426                	sd	s1,8(sp)
    800049b2:	e04a                	sd	s2,0(sp)
    800049b4:	ec06                	sd	ra,24(sp)
    800049b6:	1000                	addi	s0,sp,32
    800049b8:	0000a917          	auipc	s2,0xa
    800049bc:	69890913          	addi	s2,s2,1688 # 8000f050 <console_plat>
    800049c0:	4729                	li	a4,10
    800049c2:	00093783          	ld	a5,0(s2)
    800049c6:	84aa                	mv	s1,a0
    800049c8:	08e50c63          	beq	a0,a4,80004a60 <sbi_putc+0xb4>
    800049cc:	c7c1                	beqz	a5,80004a54 <sbi_putc+0xa8>
    800049ce:	0617c803          	lbu	a6,97(a5)
    800049d2:	0607c703          	lbu	a4,96(a5)
    800049d6:	0627c503          	lbu	a0,98(a5)
    800049da:	0637c583          	lbu	a1,99(a5)
    800049de:	0647c603          	lbu	a2,100(a5)
    800049e2:	0822                	slli	a6,a6,0x8
    800049e4:	00e86833          	or	a6,a6,a4
    800049e8:	0657c683          	lbu	a3,101(a5)
    800049ec:	0542                	slli	a0,a0,0x10
    800049ee:	01056533          	or	a0,a0,a6
    800049f2:	0667c703          	lbu	a4,102(a5)
    800049f6:	05e2                	slli	a1,a1,0x18
    800049f8:	8dc9                	or	a1,a1,a0
    800049fa:	0677c783          	lbu	a5,103(a5)
    800049fe:	1602                	slli	a2,a2,0x20
    80004a00:	8e4d                	or	a2,a2,a1
    80004a02:	16a2                	slli	a3,a3,0x28
    80004a04:	8ed1                	or	a3,a3,a2
    80004a06:	1742                	slli	a4,a4,0x30
    80004a08:	8f55                	or	a4,a4,a3
    80004a0a:	17e2                	slli	a5,a5,0x38
    80004a0c:	8fd9                	or	a5,a5,a4
    80004a0e:	0417c803          	lbu	a6,65(a5)
    80004a12:	0407c703          	lbu	a4,64(a5)
    80004a16:	0427c503          	lbu	a0,66(a5)
    80004a1a:	0437c583          	lbu	a1,67(a5)
    80004a1e:	0447c603          	lbu	a2,68(a5)
    80004a22:	0822                	slli	a6,a6,0x8
    80004a24:	0457c683          	lbu	a3,69(a5)
    80004a28:	00e86833          	or	a6,a6,a4
    80004a2c:	0542                	slli	a0,a0,0x10
    80004a2e:	0467c703          	lbu	a4,70(a5)
    80004a32:	01056533          	or	a0,a0,a6
    80004a36:	05e2                	slli	a1,a1,0x18
    80004a38:	0477c783          	lbu	a5,71(a5)
    80004a3c:	8dc9                	or	a1,a1,a0
    80004a3e:	1602                	slli	a2,a2,0x20
    80004a40:	8e4d                	or	a2,a2,a1
    80004a42:	16a2                	slli	a3,a3,0x28
    80004a44:	8ed1                	or	a3,a3,a2
    80004a46:	1742                	slli	a4,a4,0x30
    80004a48:	8f55                	or	a4,a4,a3
    80004a4a:	17e2                	slli	a5,a5,0x38
    80004a4c:	8fd9                	or	a5,a5,a4
    80004a4e:	c399                	beqz	a5,80004a54 <sbi_putc+0xa8>
    80004a50:	8526                	mv	a0,s1
    80004a52:	9782                	jalr	a5
    80004a54:	60e2                	ld	ra,24(sp)
    80004a56:	6442                	ld	s0,16(sp)
    80004a58:	64a2                	ld	s1,8(sp)
    80004a5a:	6902                	ld	s2,0(sp)
    80004a5c:	6105                	addi	sp,sp,32
    80004a5e:	8082                	ret
    80004a60:	dbf5                	beqz	a5,80004a54 <sbi_putc+0xa8>
    80004a62:	0617c803          	lbu	a6,97(a5)
    80004a66:	0607c703          	lbu	a4,96(a5)
    80004a6a:	0627c503          	lbu	a0,98(a5)
    80004a6e:	0637c583          	lbu	a1,99(a5)
    80004a72:	0647c603          	lbu	a2,100(a5)
    80004a76:	0822                	slli	a6,a6,0x8
    80004a78:	00e86833          	or	a6,a6,a4
    80004a7c:	0657c683          	lbu	a3,101(a5)
    80004a80:	0542                	slli	a0,a0,0x10
    80004a82:	01056533          	or	a0,a0,a6
    80004a86:	0667c703          	lbu	a4,102(a5)
    80004a8a:	05e2                	slli	a1,a1,0x18
    80004a8c:	8dc9                	or	a1,a1,a0
    80004a8e:	0677c783          	lbu	a5,103(a5)
    80004a92:	1602                	slli	a2,a2,0x20
    80004a94:	8e4d                	or	a2,a2,a1
    80004a96:	16a2                	slli	a3,a3,0x28
    80004a98:	8ed1                	or	a3,a3,a2
    80004a9a:	1742                	slli	a4,a4,0x30
    80004a9c:	8f55                	or	a4,a4,a3
    80004a9e:	17e2                	slli	a5,a5,0x38
    80004aa0:	8fd9                	or	a5,a5,a4
    80004aa2:	0417c803          	lbu	a6,65(a5)
    80004aa6:	0407c703          	lbu	a4,64(a5)
    80004aaa:	0427c503          	lbu	a0,66(a5)
    80004aae:	0437c583          	lbu	a1,67(a5)
    80004ab2:	0447c603          	lbu	a2,68(a5)
    80004ab6:	0822                	slli	a6,a6,0x8
    80004ab8:	0457c683          	lbu	a3,69(a5)
    80004abc:	00e86833          	or	a6,a6,a4
    80004ac0:	0542                	slli	a0,a0,0x10
    80004ac2:	0467c703          	lbu	a4,70(a5)
    80004ac6:	01056533          	or	a0,a0,a6
    80004aca:	05e2                	slli	a1,a1,0x18
    80004acc:	0477c783          	lbu	a5,71(a5)
    80004ad0:	8dc9                	or	a1,a1,a0
    80004ad2:	1602                	slli	a2,a2,0x20
    80004ad4:	8e4d                	or	a2,a2,a1
    80004ad6:	16a2                	slli	a3,a3,0x28
    80004ad8:	8ed1                	or	a3,a3,a2
    80004ada:	1742                	slli	a4,a4,0x30
    80004adc:	8f55                	or	a4,a4,a3
    80004ade:	17e2                	slli	a5,a5,0x38
    80004ae0:	8fd9                	or	a5,a5,a4
    80004ae2:	dbad                	beqz	a5,80004a54 <sbi_putc+0xa8>
    80004ae4:	4535                	li	a0,13
    80004ae6:	9782                	jalr	a5
    80004ae8:	00093783          	ld	a5,0(s2)
    80004aec:	b5c5                	j	800049cc <sbi_putc+0x20>

0000000080004aee <printc>:
    80004aee:	c515                	beqz	a0,80004b1a <printc+0x2c>
    80004af0:	611c                	ld	a5,0(a0)
    80004af2:	cf89                	beqz	a5,80004b0c <printc+0x1e>
    80004af4:	cd89                	beqz	a1,80004b0e <printc+0x20>
    80004af6:	4198                	lw	a4,0(a1)
    80004af8:	cb19                	beqz	a4,80004b0e <printc+0x20>
    80004afa:	00c78023          	sb	a2,0(a5)
    80004afe:	611c                	ld	a5,0(a0)
    80004b00:	0785                	addi	a5,a5,1
    80004b02:	e11c                	sd	a5,0(a0)
    80004b04:	419c                	lw	a5,0(a1)
    80004b06:	37fd                	addiw	a5,a5,-1
    80004b08:	c19c                	sw	a5,0(a1)
    80004b0a:	8082                	ret
    80004b0c:	8082                	ret
    80004b0e:	00c78023          	sb	a2,0(a5)
    80004b12:	611c                	ld	a5,0(a0)
    80004b14:	0785                	addi	a5,a5,1
    80004b16:	e11c                	sd	a5,0(a0)
    80004b18:	8082                	ret
    80004b1a:	1141                	addi	sp,sp,-16
    80004b1c:	e022                	sd	s0,0(sp)
    80004b1e:	e406                	sd	ra,8(sp)
    80004b20:	0800                	addi	s0,sp,16
    80004b22:	8532                	mv	a0,a2
    80004b24:	e89ff0ef          	jal	ra,800049ac <sbi_putc>
    80004b28:	60a2                	ld	ra,8(sp)
    80004b2a:	6402                	ld	s0,0(sp)
    80004b2c:	0141                	addi	sp,sp,16
    80004b2e:	8082                	ret

0000000080004b30 <prints>:
    80004b30:	715d                	addi	sp,sp,-80
    80004b32:	e0a2                	sd	s0,64(sp)
    80004b34:	fc26                	sd	s1,56(sp)
    80004b36:	f84a                	sd	s2,48(sp)
    80004b38:	f44e                	sd	s3,40(sp)
    80004b3a:	f052                	sd	s4,32(sp)
    80004b3c:	e486                	sd	ra,72(sp)
    80004b3e:	ec56                	sd	s5,24(sp)
    80004b40:	e85a                	sd	s6,16(sp)
    80004b42:	e45e                	sd	s7,8(sp)
    80004b44:	0880                	addi	s0,sp,80
    80004b46:	84aa                	mv	s1,a0
    80004b48:	8932                	mv	s2,a2
    80004b4a:	00064503          	lbu	a0,0(a2)
    80004b4e:	8a36                	mv	s4,a3
    80004b50:	89ae                	mv	s3,a1
    80004b52:	10d05a63          	blez	a3,80004c66 <prints+0x136>
    80004b56:	12050863          	beqz	a0,80004c86 <prints+0x156>
    80004b5a:	87b2                	mv	a5,a2
    80004b5c:	4605                	li	a2,1
    80004b5e:	4126063b          	subw	a2,a2,s2
    80004b62:	0017c683          	lbu	a3,1(a5)
    80004b66:	00f60abb          	addw	s5,a2,a5
    80004b6a:	0785                	addi	a5,a5,1
    80004b6c:	fafd                	bnez	a3,80004b62 <prints+0x32>
    80004b6e:	094ace63          	blt	s5,s4,80004c0a <prints+0xda>
    80004b72:	00277a13          	andi	s4,a4,2
    80004b76:	0e0a1f63          	bnez	s4,80004c74 <prints+0x144>
    80004b7a:	00177a93          	andi	s5,a4,1
    80004b7e:	000a8363          	beqz	s5,80004b84 <prints+0x54>
    80004b82:	4a81                	li	s5,0
    80004b84:	412a8abb          	subw	s5,s5,s2
    80004b88:	02000b93          	li	s7,32
    80004b8c:	2a85                	addiw	s5,s5,1
    80004b8e:	c8cd                	beqz	s1,80004c40 <prints+0x110>
    80004b90:	609c                	ld	a5,0(s1)
    80004b92:	c385                	beqz	a5,80004bb2 <prints+0x82>
    80004b94:	0a098963          	beqz	s3,80004c46 <prints+0x116>
    80004b98:	0009a703          	lw	a4,0(s3)
    80004b9c:	c74d                	beqz	a4,80004c46 <prints+0x116>
    80004b9e:	00a78023          	sb	a0,0(a5)
    80004ba2:	609c                	ld	a5,0(s1)
    80004ba4:	0785                	addi	a5,a5,1
    80004ba6:	e09c                	sd	a5,0(s1)
    80004ba8:	0009a783          	lw	a5,0(s3)
    80004bac:	37fd                	addiw	a5,a5,-1
    80004bae:	00f9a023          	sw	a5,0(s3)
    80004bb2:	00194503          	lbu	a0,1(s2)
    80004bb6:	012a8b3b          	addw	s6,s5,s2
    80004bba:	0905                	addi	s2,s2,1
    80004bbc:	f969                	bnez	a0,80004b8e <prints+0x5e>
    80004bbe:	0d405663          	blez	s4,80004c8a <prints+0x15a>
    80004bc2:	8952                	mv	s2,s4
    80004bc4:	ccc9                	beqz	s1,80004c5e <prints+0x12e>
    80004bc6:	609c                	ld	a5,0(s1)
    80004bc8:	c385                	beqz	a5,80004be8 <prints+0xb8>
    80004bca:	08098463          	beqz	s3,80004c52 <prints+0x122>
    80004bce:	0009a703          	lw	a4,0(s3)
    80004bd2:	c341                	beqz	a4,80004c52 <prints+0x122>
    80004bd4:	01778023          	sb	s7,0(a5)
    80004bd8:	609c                	ld	a5,0(s1)
    80004bda:	0785                	addi	a5,a5,1
    80004bdc:	e09c                	sd	a5,0(s1)
    80004bde:	0009a783          	lw	a5,0(s3)
    80004be2:	37fd                	addiw	a5,a5,-1
    80004be4:	00f9a023          	sw	a5,0(s3)
    80004be8:	397d                	addiw	s2,s2,-1
    80004bea:	fc091de3          	bnez	s2,80004bc4 <prints+0x94>
    80004bee:	014b0abb          	addw	s5,s6,s4
    80004bf2:	60a6                	ld	ra,72(sp)
    80004bf4:	6406                	ld	s0,64(sp)
    80004bf6:	74e2                	ld	s1,56(sp)
    80004bf8:	7942                	ld	s2,48(sp)
    80004bfa:	79a2                	ld	s3,40(sp)
    80004bfc:	7a02                	ld	s4,32(sp)
    80004bfe:	6b42                	ld	s6,16(sp)
    80004c00:	6ba2                	ld	s7,8(sp)
    80004c02:	8556                	mv	a0,s5
    80004c04:	6ae2                	ld	s5,24(sp)
    80004c06:	6161                	addi	sp,sp,80
    80004c08:	8082                	ret
    80004c0a:	415a0abb          	subw	s5,s4,s5
    80004c0e:	00277793          	andi	a5,a4,2
    80004c12:	02000b93          	li	s7,32
    80004c16:	efa1                	bnez	a5,80004c6e <prints+0x13e>
    80004c18:	8b05                	andi	a4,a4,1
    80004c1a:	8a56                	mv	s4,s5
    80004c1c:	e32d                	bnez	a4,80004c7e <prints+0x14e>
    80004c1e:	07505863          	blez	s5,80004c8e <prints+0x15e>
    80004c22:	3a7d                	addiw	s4,s4,-1
    80004c24:	865e                	mv	a2,s7
    80004c26:	85ce                	mv	a1,s3
    80004c28:	8526                	mv	a0,s1
    80004c2a:	ec5ff0ef          	jal	ra,80004aee <printc>
    80004c2e:	fe0a1ae3          	bnez	s4,80004c22 <prints+0xf2>
    80004c32:	00094503          	lbu	a0,0(s2)
    80004c36:	dd55                	beqz	a0,80004bf2 <prints+0xc2>
    80004c38:	412a8abb          	subw	s5,s5,s2
    80004c3c:	2a85                	addiw	s5,s5,1
    80004c3e:	f8a9                	bnez	s1,80004b90 <prints+0x60>
    80004c40:	d6dff0ef          	jal	ra,800049ac <sbi_putc>
    80004c44:	b7bd                	j	80004bb2 <prints+0x82>
    80004c46:	00a78023          	sb	a0,0(a5)
    80004c4a:	609c                	ld	a5,0(s1)
    80004c4c:	0785                	addi	a5,a5,1
    80004c4e:	e09c                	sd	a5,0(s1)
    80004c50:	b78d                	j	80004bb2 <prints+0x82>
    80004c52:	01778023          	sb	s7,0(a5)
    80004c56:	609c                	ld	a5,0(s1)
    80004c58:	0785                	addi	a5,a5,1
    80004c5a:	e09c                	sd	a5,0(s1)
    80004c5c:	b771                	j	80004be8 <prints+0xb8>
    80004c5e:	855e                	mv	a0,s7
    80004c60:	d4dff0ef          	jal	ra,800049ac <sbi_putc>
    80004c64:	b751                	j	80004be8 <prints+0xb8>
    80004c66:	02000b93          	li	s7,32
    80004c6a:	4a81                	li	s5,0
    80004c6c:	b7e9                	j	80004c36 <prints+0x106>
    80004c6e:	03000b93          	li	s7,48
    80004c72:	b75d                	j	80004c18 <prints+0xe8>
    80004c74:	03000b93          	li	s7,48
    80004c78:	4a81                	li	s5,0
    80004c7a:	4a01                	li	s4,0
    80004c7c:	bf75                	j	80004c38 <prints+0x108>
    80004c7e:	4a81                	li	s5,0
    80004c80:	fd45                	bnez	a0,80004c38 <prints+0x108>
    80004c82:	4b01                	li	s6,0
    80004c84:	bf2d                	j	80004bbe <prints+0x8e>
    80004c86:	8ab6                	mv	s5,a3
    80004c88:	b759                	j	80004c0e <prints+0xde>
    80004c8a:	8ada                	mv	s5,s6
    80004c8c:	b79d                	j	80004bf2 <prints+0xc2>
    80004c8e:	4a81                	li	s5,0
    80004c90:	b75d                	j	80004c36 <prints+0x106>

0000000080004c92 <printi>:
    80004c92:	7119                	addi	sp,sp,-128
    80004c94:	f8a2                	sd	s0,112(sp)
    80004c96:	fc86                	sd	ra,120(sp)
    80004c98:	f4a6                	sd	s1,104(sp)
    80004c9a:	f0ca                	sd	s2,96(sp)
    80004c9c:	0100                	addi	s0,sp,128
    80004c9e:	8e36                	mv	t3,a3
    80004ca0:	8332                	mv	t1,a2
    80004ca2:	86be                	mv	a3,a5
    80004ca4:	00487f13          	andi	t5,a6,4
    80004ca8:	c701                	beqz	a4,80004cb0 <printi+0x1e>
    80004caa:	47a9                	li	a5,10
    80004cac:	0afe0d63          	beq	t3,a5,80004d66 <printi+0xd4>
    80004cb0:	fc040fa3          	sb	zero,-33(s0)
    80004cb4:	ee21                	bnez	a2,80004d0c <printi+0x7a>
    80004cb6:	03000793          	li	a5,48
    80004cba:	fcf40f23          	sb	a5,-34(s0)
    80004cbe:	4901                	li	s2,0
    80004cc0:	fde40493          	addi	s1,s0,-34
    80004cc4:	020f0863          	beqz	t5,80004cf4 <printi+0x62>
    80004cc8:	4741                	li	a4,16
    80004cca:	fff48793          	addi	a5,s1,-1
    80004cce:	06ee0b63          	beq	t3,a4,80004d44 <printi+0xb2>
    80004cd2:	03000713          	li	a4,48
    80004cd6:	fee48fa3          	sb	a4,-1(s1)
    80004cda:	84be                	mv	s1,a5
    80004cdc:	00090c63          	beqz	s2,80004cf4 <printi+0x62>
    80004ce0:	c681                	beqz	a3,80004ce8 <printi+0x56>
    80004ce2:	00287793          	andi	a5,a6,2
    80004ce6:	ebc1                	bnez	a5,80004d76 <printi+0xe4>
    80004ce8:	02d00793          	li	a5,45
    80004cec:	fef48fa3          	sb	a5,-1(s1)
    80004cf0:	4901                	li	s2,0
    80004cf2:	14fd                	addi	s1,s1,-1
    80004cf4:	8626                	mv	a2,s1
    80004cf6:	8742                	mv	a4,a6
    80004cf8:	e39ff0ef          	jal	ra,80004b30 <prints>
    80004cfc:	70e6                	ld	ra,120(sp)
    80004cfe:	7446                	ld	s0,112(sp)
    80004d00:	74a6                	ld	s1,104(sp)
    80004d02:	0125053b          	addw	a0,a0,s2
    80004d06:	7906                	ld	s2,96(sp)
    80004d08:	6109                	addi	sp,sp,128
    80004d0a:	8082                	ret
    80004d0c:	4901                	li	s2,0
    80004d0e:	fdf40493          	addi	s1,s0,-33
    80004d12:	47a5                	li	a5,9
    80004d14:	fc68871b          	addiw	a4,a7,-58
    80004d18:	03c37633          	remu	a2,t1,t3
    80004d1c:	8e9a                	mv	t4,t1
    80004d1e:	14fd                	addi	s1,s1,-1
    80004d20:	03c35333          	divu	t1,t1,t3
    80004d24:	00c7f363          	bgeu	a5,a2,80004d2a <printi+0x98>
    80004d28:	963a                	add	a2,a2,a4
    80004d2a:	0306061b          	addiw	a2,a2,48
    80004d2e:	00c48023          	sb	a2,0(s1)
    80004d32:	ffcef3e3          	bgeu	t4,t3,80004d18 <printi+0x86>
    80004d36:	fa0f03e3          	beqz	t5,80004cdc <printi+0x4a>
    80004d3a:	4741                	li	a4,16
    80004d3c:	fff48793          	addi	a5,s1,-1
    80004d40:	f8ee19e3          	bne	t3,a4,80004cd2 <printi+0x40>
    80004d44:	04100713          	li	a4,65
    80004d48:	04e88d63          	beq	a7,a4,80004da2 <printi+0x110>
    80004d4c:	06100713          	li	a4,97
    80004d50:	f8e891e3          	bne	a7,a4,80004cd2 <printi+0x40>
    80004d54:	ffe48713          	addi	a4,s1,-2
    80004d58:	07800613          	li	a2,120
    80004d5c:	fec48fa3          	sb	a2,-1(s1)
    80004d60:	84be                	mv	s1,a5
    80004d62:	87ba                	mv	a5,a4
    80004d64:	b7bd                	j	80004cd2 <printi+0x40>
    80004d66:	f40655e3          	bgez	a2,80004cb0 <printi+0x1e>
    80004d6a:	893a                	mv	s2,a4
    80004d6c:	40c00333          	neg	t1,a2
    80004d70:	fc040fa3          	sb	zero,-33(s0)
    80004d74:	bf69                	j	80004d0e <printi+0x7c>
    80004d76:	02d00613          	li	a2,45
    80004d7a:	f9043023          	sd	a6,-128(s0)
    80004d7e:	f8d43423          	sd	a3,-120(s0)
    80004d82:	f8b43823          	sd	a1,-112(s0)
    80004d86:	f8a43c23          	sd	a0,-104(s0)
    80004d8a:	d65ff0ef          	jal	ra,80004aee <printc>
    80004d8e:	f8843683          	ld	a3,-120(s0)
    80004d92:	f9843503          	ld	a0,-104(s0)
    80004d96:	f9043583          	ld	a1,-112(s0)
    80004d9a:	f8043803          	ld	a6,-128(s0)
    80004d9e:	36fd                	addiw	a3,a3,-1
    80004da0:	bf91                	j	80004cf4 <printi+0x62>
    80004da2:	ffe48713          	addi	a4,s1,-2
    80004da6:	05800613          	li	a2,88
    80004daa:	fec48fa3          	sb	a2,-1(s1)
    80004dae:	84be                	mv	s1,a5
    80004db0:	87ba                	mv	a5,a4
    80004db2:	b705                	j	80004cd2 <printi+0x40>

0000000080004db4 <print>:
    80004db4:	7135                	addi	sp,sp,-160
    80004db6:	e922                	sd	s0,144(sp)
    80004db8:	f8d2                	sd	s4,112(sp)
    80004dba:	ed06                	sd	ra,152(sp)
    80004dbc:	e526                	sd	s1,136(sp)
    80004dbe:	e14a                	sd	s2,128(sp)
    80004dc0:	fcce                	sd	s3,120(sp)
    80004dc2:	f4d6                	sd	s5,104(sp)
    80004dc4:	f0da                	sd	s6,96(sp)
    80004dc6:	ecde                	sd	s7,88(sp)
    80004dc8:	e8e2                	sd	s8,80(sp)
    80004dca:	e4e6                	sd	s9,72(sp)
    80004dcc:	e0ea                	sd	s10,64(sp)
    80004dce:	fc6e                	sd	s11,56(sp)
    80004dd0:	1100                	addi	s0,sp,160
    80004dd2:	00064783          	lbu	a5,0(a2)
    80004dd6:	8a2a                	mv	s4,a0
    80004dd8:	2c078363          	beqz	a5,8000509e <print+0x2ea>
    80004ddc:	8b32                	mv	s6,a2
    80004dde:	8cae                	mv	s9,a1
    80004de0:	89b6                	mv	s3,a3
    80004de2:	4c01                	li	s8,0
    80004de4:	4a81                	li	s5,0
    80004de6:	02500913          	li	s2,37
    80004dea:	02d00b93          	li	s7,45
    80004dee:	03000d93          	li	s11,48
    80004df2:	4d25                	li	s10,9
    80004df4:	001b0493          	addi	s1,s6,1
    80004df8:	11279f63          	bne	a5,s2,80004f16 <print+0x162>
    80004dfc:	001b4603          	lbu	a2,1(s6)
    80004e00:	ce79                	beqz	a2,80004ede <print+0x12a>
    80004e02:	13260963          	beq	a2,s2,80004f34 <print+0x180>
    80004e06:	4801                	li	a6,0
    80004e08:	01761763          	bne	a2,s7,80004e16 <print+0x62>
    80004e0c:	002b4603          	lbu	a2,2(s6)
    80004e10:	002b0493          	addi	s1,s6,2
    80004e14:	4805                	li	a6,1
    80004e16:	02300793          	li	a5,35
    80004e1a:	0ef60863          	beq	a2,a5,80004f0a <print+0x156>
    80004e1e:	01b61963          	bne	a2,s11,80004e30 <print+0x7c>
    80004e22:	0014c603          	lbu	a2,1(s1)
    80004e26:	00286813          	ori	a6,a6,2
    80004e2a:	0485                	addi	s1,s1,1
    80004e2c:	ffb60be3          	beq	a2,s11,80004e22 <print+0x6e>
    80004e30:	fd06069b          	addiw	a3,a2,-48
    80004e34:	0ff6f793          	andi	a5,a3,255
    80004e38:	14fd6163          	bltu	s10,a5,80004f7a <print+0x1c6>
    80004e3c:	4781                	li	a5,0
    80004e3e:	0014c603          	lbu	a2,1(s1)
    80004e42:	0027971b          	slliw	a4,a5,0x2
    80004e46:	9fb9                	addw	a5,a5,a4
    80004e48:	0017979b          	slliw	a5,a5,0x1
    80004e4c:	9fb5                	addw	a5,a5,a3
    80004e4e:	fd06069b          	addiw	a3,a2,-48
    80004e52:	0ff6f713          	andi	a4,a3,255
    80004e56:	0485                	addi	s1,s1,1
    80004e58:	feed73e3          	bgeu	s10,a4,80004e3e <print+0x8a>
    80004e5c:	07300713          	li	a4,115
    80004e60:	0ee60d63          	beq	a2,a4,80004f5a <print+0x1a6>
    80004e64:	06400713          	li	a4,100
    80004e68:	0ce60863          	beq	a2,a4,80004f38 <print+0x184>
    80004e6c:	06900713          	li	a4,105
    80004e70:	0ce60463          	beq	a2,a4,80004f38 <print+0x184>
    80004e74:	07800713          	li	a4,120
    80004e78:	16e60463          	beq	a2,a4,80004fe0 <print+0x22c>
    80004e7c:	05800713          	li	a4,88
    80004e80:	1ce60263          	beq	a2,a4,80005044 <print+0x290>
    80004e84:	07500713          	li	a4,117
    80004e88:	1ce60363          	beq	a2,a4,8000504e <print+0x29a>
    80004e8c:	07000713          	li	a4,112
    80004e90:	1ce60663          	beq	a2,a4,8000505c <print+0x2a8>
    80004e94:	05000713          	li	a4,80
    80004e98:	1ee60363          	beq	a2,a4,8000507e <print+0x2ca>
    80004e9c:	06c00713          	li	a4,108
    80004ea0:	00148b13          	addi	s6,s1,1
    80004ea4:	0ce60d63          	beq	a2,a4,80004f7e <print+0x1ca>
    80004ea8:	0004c683          	lbu	a3,0(s1)
    80004eac:	06300713          	li	a4,99
    80004eb0:	06e69d63          	bne	a3,a4,80004f2a <print+0x176>
    80004eb4:	0009a883          	lw	a7,0(s3)
    80004eb8:	86be                	mv	a3,a5
    80004eba:	8742                	mv	a4,a6
    80004ebc:	f8840613          	addi	a2,s0,-120
    80004ec0:	85e6                	mv	a1,s9
    80004ec2:	8552                	mv	a0,s4
    80004ec4:	f9140423          	sb	a7,-120(s0)
    80004ec8:	f80404a3          	sb	zero,-119(s0)
    80004ecc:	c65ff0ef          	jal	ra,80004b30 <prints>
    80004ed0:	0014c783          	lbu	a5,1(s1)
    80004ed4:	09a1                	addi	s3,s3,8
    80004ed6:	00ac0c3b          	addw	s8,s8,a0
    80004eda:	2a91                	addiw	s5,s5,4
    80004edc:	ff81                	bnez	a5,80004df4 <print+0x40>
    80004ede:	000a0663          	beqz	s4,80004eea <print+0x136>
    80004ee2:	000a3783          	ld	a5,0(s4)
    80004ee6:	00078023          	sb	zero,0(a5)
    80004eea:	60ea                	ld	ra,152(sp)
    80004eec:	644a                	ld	s0,144(sp)
    80004eee:	64aa                	ld	s1,136(sp)
    80004ef0:	690a                	ld	s2,128(sp)
    80004ef2:	79e6                	ld	s3,120(sp)
    80004ef4:	7a46                	ld	s4,112(sp)
    80004ef6:	7aa6                	ld	s5,104(sp)
    80004ef8:	7b06                	ld	s6,96(sp)
    80004efa:	6be6                	ld	s7,88(sp)
    80004efc:	6ca6                	ld	s9,72(sp)
    80004efe:	6d06                	ld	s10,64(sp)
    80004f00:	7de2                	ld	s11,56(sp)
    80004f02:	8562                	mv	a0,s8
    80004f04:	6c46                	ld	s8,80(sp)
    80004f06:	610d                	addi	sp,sp,160
    80004f08:	8082                	ret
    80004f0a:	0014c603          	lbu	a2,1(s1)
    80004f0e:	00486813          	ori	a6,a6,4
    80004f12:	0485                	addi	s1,s1,1
    80004f14:	b729                	j	80004e1e <print+0x6a>
    80004f16:	87a6                	mv	a5,s1
    80004f18:	000b4603          	lbu	a2,0(s6)
    80004f1c:	84da                	mv	s1,s6
    80004f1e:	8b3e                	mv	s6,a5
    80004f20:	85e6                	mv	a1,s9
    80004f22:	8552                	mv	a0,s4
    80004f24:	bcbff0ef          	jal	ra,80004aee <printc>
    80004f28:	2c05                	addiw	s8,s8,1
    80004f2a:	0014c783          	lbu	a5,1(s1)
    80004f2e:	ec0793e3          	bnez	a5,80004df4 <print+0x40>
    80004f32:	b775                	j	80004ede <print+0x12a>
    80004f34:	0b09                	addi	s6,s6,2
    80004f36:	b7ed                	j	80004f20 <print+0x16c>
    80004f38:	0009a603          	lw	a2,0(s3)
    80004f3c:	03000893          	li	a7,48
    80004f40:	4705                	li	a4,1
    80004f42:	46a9                	li	a3,10
    80004f44:	85e6                	mv	a1,s9
    80004f46:	8552                	mv	a0,s4
    80004f48:	d4bff0ef          	jal	ra,80004c92 <printi>
    80004f4c:	09a1                	addi	s3,s3,8
    80004f4e:	01850c3b          	addw	s8,a0,s8
    80004f52:	2a91                	addiw	s5,s5,4
    80004f54:	00148b13          	addi	s6,s1,1
    80004f58:	bfc9                	j	80004f2a <print+0x176>
    80004f5a:	0009b603          	ld	a2,0(s3)
    80004f5e:	2aa1                	addiw	s5,s5,8
    80004f60:	09a1                	addi	s3,s3,8
    80004f62:	c651                	beqz	a2,80004fee <print+0x23a>
    80004f64:	8742                	mv	a4,a6
    80004f66:	86be                	mv	a3,a5
    80004f68:	85e6                	mv	a1,s9
    80004f6a:	8552                	mv	a0,s4
    80004f6c:	bc5ff0ef          	jal	ra,80004b30 <prints>
    80004f70:	01850c3b          	addw	s8,a0,s8
    80004f74:	00148b13          	addi	s6,s1,1
    80004f78:	bf4d                	j	80004f2a <print+0x176>
    80004f7a:	4781                	li	a5,0
    80004f7c:	b5c5                	j	80004e5c <print+0xa8>
    80004f7e:	0014c703          	lbu	a4,1(s1)
    80004f82:	00898e93          	addi	t4,s3,8
    80004f86:	10c70e63          	beq	a4,a2,800050a2 <print+0x2ee>
    80004f8a:	07500693          	li	a3,117
    80004f8e:	0009b603          	ld	a2,0(s3)
    80004f92:	00148b13          	addi	s6,s1,1
    80004f96:	0ed70963          	beq	a4,a3,80005088 <print+0x2d4>
    80004f9a:	07800693          	li	a3,120
    80004f9e:	2aa1                	addiw	s5,s5,8
    80004fa0:	06d70663          	beq	a4,a3,8000500c <print+0x258>
    80004fa4:	05800693          	li	a3,88
    80004fa8:	f7d43423          	sd	t4,-152(s0)
    80004fac:	04100893          	li	a7,65
    80004fb0:	06d70263          	beq	a4,a3,80005014 <print+0x260>
    80004fb4:	03000893          	li	a7,48
    80004fb8:	4705                	li	a4,1
    80004fba:	46a9                	li	a3,10
    80004fbc:	85e6                	mv	a1,s9
    80004fbe:	8552                	mv	a0,s4
    80004fc0:	f7043823          	sd	a6,-144(s0)
    80004fc4:	f6f43c23          	sd	a5,-136(s0)
    80004fc8:	ccbff0ef          	jal	ra,80004c92 <printi>
    80004fcc:	f6843e83          	ld	t4,-152(s0)
    80004fd0:	f7043803          	ld	a6,-144(s0)
    80004fd4:	f7843783          	ld	a5,-136(s0)
    80004fd8:	01850c3b          	addw	s8,a0,s8
    80004fdc:	89f6                	mv	s3,t4
    80004fde:	b5e9                	j	80004ea8 <print+0xf4>
    80004fe0:	0009e603          	lwu	a2,0(s3)
    80004fe4:	06100893          	li	a7,97
    80004fe8:	4701                	li	a4,0
    80004fea:	46c1                	li	a3,16
    80004fec:	bfa1                	j	80004f44 <print+0x190>
    80004fee:	00008617          	auipc	a2,0x8
    80004ff2:	8a260613          	addi	a2,a2,-1886 # 8000c890 <platform_ops+0x1d8>
    80004ff6:	8742                	mv	a4,a6
    80004ff8:	86be                	mv	a3,a5
    80004ffa:	85e6                	mv	a1,s9
    80004ffc:	8552                	mv	a0,s4
    80004ffe:	b33ff0ef          	jal	ra,80004b30 <prints>
    80005002:	01850c3b          	addw	s8,a0,s8
    80005006:	00148b13          	addi	s6,s1,1
    8000500a:	b705                	j	80004f2a <print+0x176>
    8000500c:	f7d43423          	sd	t4,-152(s0)
    80005010:	06100893          	li	a7,97
    80005014:	f7043823          	sd	a6,-144(s0)
    80005018:	f6f43c23          	sd	a5,-136(s0)
    8000501c:	4701                	li	a4,0
    8000501e:	46c1                	li	a3,16
    80005020:	85e6                	mv	a1,s9
    80005022:	8552                	mv	a0,s4
    80005024:	c6fff0ef          	jal	ra,80004c92 <printi>
    80005028:	f6843e83          	ld	t4,-152(s0)
    8000502c:	00248713          	addi	a4,s1,2
    80005030:	f7843783          	ld	a5,-136(s0)
    80005034:	84da                	mv	s1,s6
    80005036:	f7043803          	ld	a6,-144(s0)
    8000503a:	01850c3b          	addw	s8,a0,s8
    8000503e:	89f6                	mv	s3,t4
    80005040:	8b3a                	mv	s6,a4
    80005042:	b59d                	j	80004ea8 <print+0xf4>
    80005044:	0009e603          	lwu	a2,0(s3)
    80005048:	04100893          	li	a7,65
    8000504c:	bf71                	j	80004fe8 <print+0x234>
    8000504e:	0009e603          	lwu	a2,0(s3)
    80005052:	06100893          	li	a7,97
    80005056:	4701                	li	a4,0
    80005058:	46a9                	li	a3,10
    8000505a:	b5ed                	j	80004f44 <print+0x190>
    8000505c:	0009b603          	ld	a2,0(s3)
    80005060:	06100893          	li	a7,97
    80005064:	4701                	li	a4,0
    80005066:	46c1                	li	a3,16
    80005068:	85e6                	mv	a1,s9
    8000506a:	8552                	mv	a0,s4
    8000506c:	c27ff0ef          	jal	ra,80004c92 <printi>
    80005070:	09a1                	addi	s3,s3,8
    80005072:	01850c3b          	addw	s8,a0,s8
    80005076:	2aa1                	addiw	s5,s5,8
    80005078:	00148b13          	addi	s6,s1,1
    8000507c:	b57d                	j	80004f2a <print+0x176>
    8000507e:	0009b603          	ld	a2,0(s3)
    80005082:	04100893          	li	a7,65
    80005086:	bff9                	j	80005064 <print+0x2b0>
    80005088:	f7d43423          	sd	t4,-152(s0)
    8000508c:	06100893          	li	a7,97
    80005090:	f7043823          	sd	a6,-144(s0)
    80005094:	f6f43c23          	sd	a5,-136(s0)
    80005098:	4701                	li	a4,0
    8000509a:	46a9                	li	a3,10
    8000509c:	b751                	j	80005020 <print+0x26c>
    8000509e:	4c01                	li	s8,0
    800050a0:	bd3d                	j	80004ede <print+0x12a>
    800050a2:	007af713          	andi	a4,s5,7
    800050a6:	cf41                	beqz	a4,8000513e <print+0x38a>
    800050a8:	004a871b          	addiw	a4,s5,4
    800050ac:	86ce                	mv	a3,s3
    800050ae:	00777613          	andi	a2,a4,7
    800050b2:	89b6                	mv	s3,a3
    800050b4:	00070a9b          	sext.w	s5,a4
    800050b8:	06a1                	addi	a3,a3,8
    800050ba:	2711                	addiw	a4,a4,4
    800050bc:	fa6d                	bnez	a2,800050ae <print+0x2fa>
    800050be:	09c1                	addi	s3,s3,16
    800050c0:	0024c703          	lbu	a4,2(s1)
    800050c4:	07500593          	li	a1,117
    800050c8:	6290                	ld	a2,0(a3)
    800050ca:	2aa1                	addiw	s5,s5,8
    800050cc:	06b70463          	beq	a4,a1,80005134 <print+0x380>
    800050d0:	07800693          	li	a3,120
    800050d4:	06100893          	li	a7,97
    800050d8:	02d70c63          	beq	a4,a3,80005110 <print+0x35c>
    800050dc:	05800693          	li	a3,88
    800050e0:	02d70663          	beq	a4,a3,8000510c <print+0x358>
    800050e4:	00148e93          	addi	t4,s1,1
    800050e8:	03000893          	li	a7,48
    800050ec:	4705                	li	a4,1
    800050ee:	46a9                	li	a3,10
    800050f0:	85e6                	mv	a1,s9
    800050f2:	8552                	mv	a0,s4
    800050f4:	f7d43c23          	sd	t4,-136(s0)
    800050f8:	b9bff0ef          	jal	ra,80004c92 <printi>
    800050fc:	f7843e83          	ld	t4,-136(s0)
    80005100:	00248b13          	addi	s6,s1,2
    80005104:	01850c3b          	addw	s8,a0,s8
    80005108:	84f6                	mv	s1,t4
    8000510a:	b505                	j	80004f2a <print+0x176>
    8000510c:	04100893          	li	a7,65
    80005110:	4701                	li	a4,0
    80005112:	46c1                	li	a3,16
    80005114:	00248e93          	addi	t4,s1,2
    80005118:	85e6                	mv	a1,s9
    8000511a:	8552                	mv	a0,s4
    8000511c:	f7d43c23          	sd	t4,-136(s0)
    80005120:	b73ff0ef          	jal	ra,80004c92 <printi>
    80005124:	f7843e83          	ld	t4,-136(s0)
    80005128:	00348b13          	addi	s6,s1,3
    8000512c:	01850c3b          	addw	s8,a0,s8
    80005130:	84f6                	mv	s1,t4
    80005132:	bbe5                	j	80004f2a <print+0x176>
    80005134:	06100893          	li	a7,97
    80005138:	4701                	li	a4,0
    8000513a:	46a9                	li	a3,10
    8000513c:	bfe1                	j	80005114 <print+0x360>
    8000513e:	86ce                	mv	a3,s3
    80005140:	2a81                	sext.w	s5,s5
    80005142:	89f6                	mv	s3,t4
    80005144:	bfb5                	j	800050c0 <print+0x30c>

0000000080005146 <sbi_puts>:
    80005146:	7179                	addi	sp,sp,-48
    80005148:	f022                	sd	s0,32(sp)
    8000514a:	ec26                	sd	s1,24(sp)
    8000514c:	e84a                	sd	s2,16(sp)
    8000514e:	e44e                	sd	s3,8(sp)
    80005150:	e052                	sd	s4,0(sp)
    80005152:	f406                	sd	ra,40(sp)
    80005154:	1800                	addi	s0,sp,48
    80005156:	89aa                	mv	s3,a0
    80005158:	0000a517          	auipc	a0,0xa
    8000515c:	ef050513          	addi	a0,a0,-272 # 8000f048 <console_out_lock>
    80005160:	f32ff0ef          	jal	ra,80004892 <spin_lock>
    80005164:	0009c483          	lbu	s1,0(s3)
    80005168:	0000aa17          	auipc	s4,0xa
    8000516c:	ee8a0a13          	addi	s4,s4,-280 # 8000f050 <console_plat>
    80005170:	4929                	li	s2,10
    80005172:	e8d9                	bnez	s1,80005208 <sbi_puts+0xc2>
    80005174:	aa05                	j	800052a4 <sbi_puts+0x15e>
    80005176:	8526                	mv	a0,s1
    80005178:	c7c9                	beqz	a5,80005202 <sbi_puts+0xbc>
    8000517a:	0617c883          	lbu	a7,97(a5)
    8000517e:	0607c703          	lbu	a4,96(a5)
    80005182:	0627c803          	lbu	a6,98(a5)
    80005186:	0637c583          	lbu	a1,99(a5)
    8000518a:	0647c603          	lbu	a2,100(a5)
    8000518e:	08a2                	slli	a7,a7,0x8
    80005190:	00e8e8b3          	or	a7,a7,a4
    80005194:	0657c683          	lbu	a3,101(a5)
    80005198:	0842                	slli	a6,a6,0x10
    8000519a:	01186833          	or	a6,a6,a7
    8000519e:	0667c703          	lbu	a4,102(a5)
    800051a2:	05e2                	slli	a1,a1,0x18
    800051a4:	0105e5b3          	or	a1,a1,a6
    800051a8:	0677c783          	lbu	a5,103(a5)
    800051ac:	1602                	slli	a2,a2,0x20
    800051ae:	8e4d                	or	a2,a2,a1
    800051b0:	16a2                	slli	a3,a3,0x28
    800051b2:	8ed1                	or	a3,a3,a2
    800051b4:	1742                	slli	a4,a4,0x30
    800051b6:	8f55                	or	a4,a4,a3
    800051b8:	17e2                	slli	a5,a5,0x38
    800051ba:	8fd9                	or	a5,a5,a4
    800051bc:	0417c883          	lbu	a7,65(a5)
    800051c0:	0407c703          	lbu	a4,64(a5)
    800051c4:	0427c803          	lbu	a6,66(a5)
    800051c8:	0437c583          	lbu	a1,67(a5)
    800051cc:	0447c603          	lbu	a2,68(a5)
    800051d0:	08a2                	slli	a7,a7,0x8
    800051d2:	0457c683          	lbu	a3,69(a5)
    800051d6:	00e8e8b3          	or	a7,a7,a4
    800051da:	0842                	slli	a6,a6,0x10
    800051dc:	0467c703          	lbu	a4,70(a5)
    800051e0:	01186833          	or	a6,a6,a7
    800051e4:	05e2                	slli	a1,a1,0x18
    800051e6:	0477c783          	lbu	a5,71(a5)
    800051ea:	0105e5b3          	or	a1,a1,a6
    800051ee:	1602                	slli	a2,a2,0x20
    800051f0:	8e4d                	or	a2,a2,a1
    800051f2:	16a2                	slli	a3,a3,0x28
    800051f4:	8ed1                	or	a3,a3,a2
    800051f6:	1742                	slli	a4,a4,0x30
    800051f8:	8f55                	or	a4,a4,a3
    800051fa:	17e2                	slli	a5,a5,0x38
    800051fc:	8fd9                	or	a5,a5,a4
    800051fe:	c391                	beqz	a5,80005202 <sbi_puts+0xbc>
    80005200:	9782                	jalr	a5
    80005202:	0009c483          	lbu	s1,0(s3)
    80005206:	ccd9                	beqz	s1,800052a4 <sbi_puts+0x15e>
    80005208:	000a3783          	ld	a5,0(s4)
    8000520c:	0985                	addi	s3,s3,1
    8000520e:	f72494e3          	bne	s1,s2,80005176 <sbi_puts+0x30>
    80005212:	4535                	li	a0,13
    80005214:	d7fd                	beqz	a5,80005202 <sbi_puts+0xbc>
    80005216:	0617c883          	lbu	a7,97(a5)
    8000521a:	0607c703          	lbu	a4,96(a5)
    8000521e:	0627c803          	lbu	a6,98(a5)
    80005222:	0637c583          	lbu	a1,99(a5)
    80005226:	0647c603          	lbu	a2,100(a5)
    8000522a:	08a2                	slli	a7,a7,0x8
    8000522c:	00e8e8b3          	or	a7,a7,a4
    80005230:	0657c683          	lbu	a3,101(a5)
    80005234:	0842                	slli	a6,a6,0x10
    80005236:	01186833          	or	a6,a6,a7
    8000523a:	0667c703          	lbu	a4,102(a5)
    8000523e:	05e2                	slli	a1,a1,0x18
    80005240:	0105e5b3          	or	a1,a1,a6
    80005244:	0677c783          	lbu	a5,103(a5)
    80005248:	1602                	slli	a2,a2,0x20
    8000524a:	8e4d                	or	a2,a2,a1
    8000524c:	16a2                	slli	a3,a3,0x28
    8000524e:	8ed1                	or	a3,a3,a2
    80005250:	1742                	slli	a4,a4,0x30
    80005252:	8f55                	or	a4,a4,a3
    80005254:	17e2                	slli	a5,a5,0x38
    80005256:	8fd9                	or	a5,a5,a4
    80005258:	0417c883          	lbu	a7,65(a5)
    8000525c:	0407c703          	lbu	a4,64(a5)
    80005260:	0427c803          	lbu	a6,66(a5)
    80005264:	0437c583          	lbu	a1,67(a5)
    80005268:	0447c603          	lbu	a2,68(a5)
    8000526c:	08a2                	slli	a7,a7,0x8
    8000526e:	0457c683          	lbu	a3,69(a5)
    80005272:	00e8e8b3          	or	a7,a7,a4
    80005276:	0842                	slli	a6,a6,0x10
    80005278:	0467c703          	lbu	a4,70(a5)
    8000527c:	01186833          	or	a6,a6,a7
    80005280:	05e2                	slli	a1,a1,0x18
    80005282:	0477c783          	lbu	a5,71(a5)
    80005286:	0105e5b3          	or	a1,a1,a6
    8000528a:	1602                	slli	a2,a2,0x20
    8000528c:	8e4d                	or	a2,a2,a1
    8000528e:	16a2                	slli	a3,a3,0x28
    80005290:	8ed1                	or	a3,a3,a2
    80005292:	1742                	slli	a4,a4,0x30
    80005294:	8f55                	or	a4,a4,a3
    80005296:	17e2                	slli	a5,a5,0x38
    80005298:	8fd9                	or	a5,a5,a4
    8000529a:	d7a5                	beqz	a5,80005202 <sbi_puts+0xbc>
    8000529c:	9782                	jalr	a5
    8000529e:	000a3783          	ld	a5,0(s4)
    800052a2:	bdd1                	j	80005176 <sbi_puts+0x30>
    800052a4:	0000a517          	auipc	a0,0xa
    800052a8:	da450513          	addi	a0,a0,-604 # 8000f048 <console_out_lock>
    800052ac:	e04ff0ef          	jal	ra,800048b0 <spin_unlock>
    800052b0:	70a2                	ld	ra,40(sp)
    800052b2:	7402                	ld	s0,32(sp)
    800052b4:	64e2                	ld	s1,24(sp)
    800052b6:	6942                	ld	s2,16(sp)
    800052b8:	69a2                	ld	s3,8(sp)
    800052ba:	6a02                	ld	s4,0(sp)
    800052bc:	6145                	addi	sp,sp,48
    800052be:	8082                	ret

00000000800052c0 <sbi_gets>:
    800052c0:	7139                	addi	sp,sp,-64
    800052c2:	f822                	sd	s0,48(sp)
    800052c4:	ec4e                	sd	s3,24(sp)
    800052c6:	e456                	sd	s5,8(sp)
    800052c8:	fc06                	sd	ra,56(sp)
    800052ca:	f426                	sd	s1,40(sp)
    800052cc:	f04a                	sd	s2,32(sp)
    800052ce:	e852                	sd	s4,16(sp)
    800052d0:	0080                	addi	s0,sp,64
    800052d2:	0000a997          	auipc	s3,0xa
    800052d6:	d7e98993          	addi	s3,s3,-642 # 8000f050 <console_plat>
    800052da:	0009b703          	ld	a4,0(s3)
    800052de:	8aaa                	mv	s5,a0
    800052e0:	cb55                	beqz	a4,80005394 <sbi_gets+0xd4>
    800052e2:	0006091b          	sext.w	s2,a2
    800052e6:	00a584bb          	addw	s1,a1,a0
    800052ea:	4a05                	li	s4,1
    800052ec:	a819                	j	80005302 <sbi_gets+0x42>
    800052ee:	0a054363          	bltz	a0,80005394 <sbi_gets+0xd4>
    800052f2:	0afa5163          	bge	s4,a5,80005394 <sbi_gets+0xd4>
    800052f6:	0009b703          	ld	a4,0(s3)
    800052fa:	00aa8023          	sb	a0,0(s5)
    800052fe:	0a85                	addi	s5,s5,1
    80005300:	cb51                	beqz	a4,80005394 <sbi_gets+0xd4>
    80005302:	06174783          	lbu	a5,97(a4)
    80005306:	06074683          	lbu	a3,96(a4)
    8000530a:	06274803          	lbu	a6,98(a4)
    8000530e:	06374503          	lbu	a0,99(a4)
    80005312:	06474583          	lbu	a1,100(a4)
    80005316:	07a2                	slli	a5,a5,0x8
    80005318:	06574603          	lbu	a2,101(a4)
    8000531c:	8fd5                	or	a5,a5,a3
    8000531e:	0842                	slli	a6,a6,0x10
    80005320:	06674683          	lbu	a3,102(a4)
    80005324:	00f86833          	or	a6,a6,a5
    80005328:	0562                	slli	a0,a0,0x18
    8000532a:	06774783          	lbu	a5,103(a4)
    8000532e:	1582                	slli	a1,a1,0x20
    80005330:	01056733          	or	a4,a0,a6
    80005334:	8dd9                	or	a1,a1,a4
    80005336:	02861713          	slli	a4,a2,0x28
    8000533a:	00b76633          	or	a2,a4,a1
    8000533e:	03069713          	slli	a4,a3,0x30
    80005342:	8f51                	or	a4,a4,a2
    80005344:	17e2                	slli	a5,a5,0x38
    80005346:	8fd9                	or	a5,a5,a4
    80005348:	0497c503          	lbu	a0,73(a5)
    8000534c:	0487c703          	lbu	a4,72(a5)
    80005350:	04a7c803          	lbu	a6,74(a5)
    80005354:	04b7c583          	lbu	a1,75(a5)
    80005358:	04c7c603          	lbu	a2,76(a5)
    8000535c:	0522                	slli	a0,a0,0x8
    8000535e:	04d7c683          	lbu	a3,77(a5)
    80005362:	8d59                	or	a0,a0,a4
    80005364:	0842                	slli	a6,a6,0x10
    80005366:	04e7c703          	lbu	a4,78(a5)
    8000536a:	00a86833          	or	a6,a6,a0
    8000536e:	05e2                	slli	a1,a1,0x18
    80005370:	04f7c783          	lbu	a5,79(a5)
    80005374:	0105e5b3          	or	a1,a1,a6
    80005378:	1602                	slli	a2,a2,0x20
    8000537a:	8e4d                	or	a2,a2,a1
    8000537c:	16a2                	slli	a3,a3,0x28
    8000537e:	8ed1                	or	a3,a3,a2
    80005380:	1742                	slli	a4,a4,0x30
    80005382:	8f55                	or	a4,a4,a3
    80005384:	17e2                	slli	a5,a5,0x38
    80005386:	8fd9                	or	a5,a5,a4
    80005388:	c791                	beqz	a5,80005394 <sbi_gets+0xd4>
    8000538a:	9782                	jalr	a5
    8000538c:	415487bb          	subw	a5,s1,s5
    80005390:	f4a91fe3          	bne	s2,a0,800052ee <sbi_gets+0x2e>
    80005394:	000a8023          	sb	zero,0(s5)
    80005398:	70e2                	ld	ra,56(sp)
    8000539a:	7442                	ld	s0,48(sp)
    8000539c:	74a2                	ld	s1,40(sp)
    8000539e:	7902                	ld	s2,32(sp)
    800053a0:	69e2                	ld	s3,24(sp)
    800053a2:	6a42                	ld	s4,16(sp)
    800053a4:	6aa2                	ld	s5,8(sp)
    800053a6:	6121                	addi	sp,sp,64
    800053a8:	8082                	ret

00000000800053aa <sbi_sprintf>:
    800053aa:	711d                	addi	sp,sp,-96
    800053ac:	f022                	sd	s0,32(sp)
    800053ae:	f406                	sd	ra,40(sp)
    800053b0:	1800                	addi	s0,sp,48
    800053b2:	fca43c23          	sd	a0,-40(s0)
    800053b6:	e010                	sd	a2,0(s0)
    800053b8:	e414                	sd	a3,8(s0)
    800053ba:	862e                	mv	a2,a1
    800053bc:	86a2                	mv	a3,s0
    800053be:	fd840513          	addi	a0,s0,-40
    800053c2:	4581                	li	a1,0
    800053c4:	e818                	sd	a4,16(s0)
    800053c6:	ec1c                	sd	a5,24(s0)
    800053c8:	03043023          	sd	a6,32(s0)
    800053cc:	03143423          	sd	a7,40(s0)
    800053d0:	fe843423          	sd	s0,-24(s0)
    800053d4:	9e1ff0ef          	jal	ra,80004db4 <print>
    800053d8:	70a2                	ld	ra,40(sp)
    800053da:	7402                	ld	s0,32(sp)
    800053dc:	6125                	addi	sp,sp,96
    800053de:	8082                	ret

00000000800053e0 <sbi_snprintf>:
    800053e0:	711d                	addi	sp,sp,-96
    800053e2:	f022                	sd	s0,32(sp)
    800053e4:	f406                	sd	ra,40(sp)
    800053e6:	1800                	addi	s0,sp,48
    800053e8:	00840313          	addi	t1,s0,8
    800053ec:	8e2e                	mv	t3,a1
    800053ee:	fca43c23          	sd	a0,-40(s0)
    800053f2:	e414                	sd	a3,8(s0)
    800053f4:	fd440593          	addi	a1,s0,-44
    800053f8:	fd840513          	addi	a0,s0,-40
    800053fc:	869a                	mv	a3,t1
    800053fe:	e818                	sd	a4,16(s0)
    80005400:	ec1c                	sd	a5,24(s0)
    80005402:	03043023          	sd	a6,32(s0)
    80005406:	03143423          	sd	a7,40(s0)
    8000540a:	fdc42a23          	sw	t3,-44(s0)
    8000540e:	fe643423          	sd	t1,-24(s0)
    80005412:	9a3ff0ef          	jal	ra,80004db4 <print>
    80005416:	70a2                	ld	ra,40(sp)
    80005418:	7402                	ld	s0,32(sp)
    8000541a:	6125                	addi	sp,sp,96
    8000541c:	8082                	ret

000000008000541e <sbi_printf>:
    8000541e:	7159                	addi	sp,sp,-112
    80005420:	f406                	sd	ra,40(sp)
    80005422:	f022                	sd	s0,32(sp)
    80005424:	ec26                	sd	s1,24(sp)
    80005426:	1800                	addi	s0,sp,48
    80005428:	84aa                	mv	s1,a0
    8000542a:	0000a517          	auipc	a0,0xa
    8000542e:	c1e50513          	addi	a0,a0,-994 # 8000f048 <console_out_lock>
    80005432:	f018                	sd	a4,32(s0)
    80005434:	f41c                	sd	a5,40(s0)
    80005436:	03043823          	sd	a6,48(s0)
    8000543a:	03143c23          	sd	a7,56(s0)
    8000543e:	e40c                	sd	a1,8(s0)
    80005440:	e810                	sd	a2,16(s0)
    80005442:	ec14                	sd	a3,24(s0)
    80005444:	c4eff0ef          	jal	ra,80004892 <spin_lock>
    80005448:	00840693          	addi	a3,s0,8
    8000544c:	8626                	mv	a2,s1
    8000544e:	4581                	li	a1,0
    80005450:	4501                	li	a0,0
    80005452:	fcd43c23          	sd	a3,-40(s0)
    80005456:	95fff0ef          	jal	ra,80004db4 <print>
    8000545a:	84aa                	mv	s1,a0
    8000545c:	0000a517          	auipc	a0,0xa
    80005460:	bec50513          	addi	a0,a0,-1044 # 8000f048 <console_out_lock>
    80005464:	c4cff0ef          	jal	ra,800048b0 <spin_unlock>
    80005468:	70a2                	ld	ra,40(sp)
    8000546a:	7402                	ld	s0,32(sp)
    8000546c:	8526                	mv	a0,s1
    8000546e:	64e2                	ld	s1,24(sp)
    80005470:	6165                	addi	sp,sp,112
    80005472:	8082                	ret

0000000080005474 <sbi_dprintf>:
    80005474:	715d                	addi	sp,sp,-80
    80005476:	e822                	sd	s0,16(sp)
    80005478:	ec06                	sd	ra,24(sp)
    8000547a:	1000                	addi	s0,sp,32
    8000547c:	e010                	sd	a2,0(s0)
    8000547e:	e414                	sd	a3,8(s0)
    80005480:	e818                	sd	a4,16(s0)
    80005482:	ec1c                	sd	a5,24(s0)
    80005484:	03043023          	sd	a6,32(s0)
    80005488:	03143423          	sd	a7,40(s0)
    8000548c:	fe843423          	sd	s0,-24(s0)
    80005490:	04854783          	lbu	a5,72(a0)
    80005494:	4501                	li	a0,0
    80005496:	8b89                	andi	a5,a5,2
    80005498:	e789                	bnez	a5,800054a2 <sbi_dprintf+0x2e>
    8000549a:	60e2                	ld	ra,24(sp)
    8000549c:	6442                	ld	s0,16(sp)
    8000549e:	6161                	addi	sp,sp,80
    800054a0:	8082                	ret
    800054a2:	86a2                	mv	a3,s0
    800054a4:	862e                	mv	a2,a1
    800054a6:	4501                	li	a0,0
    800054a8:	4581                	li	a1,0
    800054aa:	90bff0ef          	jal	ra,80004db4 <print>
    800054ae:	60e2                	ld	ra,24(sp)
    800054b0:	6442                	ld	s0,16(sp)
    800054b2:	6161                	addi	sp,sp,80
    800054b4:	8082                	ret

00000000800054b6 <sbi_console_init>:
    800054b6:	03154783          	lbu	a5,49(a0)
    800054ba:	03054703          	lbu	a4,48(a0)
    800054be:	03254803          	lbu	a6,50(a0)
    800054c2:	03354583          	lbu	a1,51(a0)
    800054c6:	03454603          	lbu	a2,52(a0)
    800054ca:	07a2                	slli	a5,a5,0x8
    800054cc:	8fd9                	or	a5,a5,a4
    800054ce:	03554683          	lbu	a3,53(a0)
    800054d2:	0842                	slli	a6,a6,0x10
    800054d4:	03654703          	lbu	a4,54(a0)
    800054d8:	00f86833          	or	a6,a6,a5
    800054dc:	05e2                	slli	a1,a1,0x18
    800054de:	03754783          	lbu	a5,55(a0)
    800054e2:	0105e5b3          	or	a1,a1,a6
    800054e6:	1602                	slli	a2,a2,0x20
    800054e8:	8e4d                	or	a2,a2,a1
    800054ea:	16a2                	slli	a3,a3,0x28
    800054ec:	8ed1                	or	a3,a3,a2
    800054ee:	1742                	slli	a4,a4,0x30
    800054f0:	8f55                	or	a4,a4,a3
    800054f2:	17e2                	slli	a5,a5,0x38
    800054f4:	8fd9                	or	a5,a5,a4
    800054f6:	0000a717          	auipc	a4,0xa
    800054fa:	b4f73d23          	sd	a5,-1190(a4) # 8000f050 <console_plat>
    800054fe:	cfc9                	beqz	a5,80005598 <sbi_console_init+0xe2>
    80005500:	0617c803          	lbu	a6,97(a5)
    80005504:	0607c703          	lbu	a4,96(a5)
    80005508:	0627c503          	lbu	a0,98(a5)
    8000550c:	0637c583          	lbu	a1,99(a5)
    80005510:	0647c603          	lbu	a2,100(a5)
    80005514:	0822                	slli	a6,a6,0x8
    80005516:	00e86833          	or	a6,a6,a4
    8000551a:	0657c683          	lbu	a3,101(a5)
    8000551e:	0542                	slli	a0,a0,0x10
    80005520:	01056533          	or	a0,a0,a6
    80005524:	0667c703          	lbu	a4,102(a5)
    80005528:	05e2                	slli	a1,a1,0x18
    8000552a:	8dc9                	or	a1,a1,a0
    8000552c:	0677c783          	lbu	a5,103(a5)
    80005530:	1602                	slli	a2,a2,0x20
    80005532:	8e4d                	or	a2,a2,a1
    80005534:	16a2                	slli	a3,a3,0x28
    80005536:	8ed1                	or	a3,a3,a2
    80005538:	1742                	slli	a4,a4,0x30
    8000553a:	8f55                	or	a4,a4,a3
    8000553c:	17e2                	slli	a5,a5,0x38
    8000553e:	8fd9                	or	a5,a5,a4
    80005540:	0517c803          	lbu	a6,81(a5)
    80005544:	0507c703          	lbu	a4,80(a5)
    80005548:	0527c503          	lbu	a0,82(a5)
    8000554c:	0537c583          	lbu	a1,83(a5)
    80005550:	0547c603          	lbu	a2,84(a5)
    80005554:	0822                	slli	a6,a6,0x8
    80005556:	0557c683          	lbu	a3,85(a5)
    8000555a:	00e86833          	or	a6,a6,a4
    8000555e:	0542                	slli	a0,a0,0x10
    80005560:	0567c703          	lbu	a4,86(a5)
    80005564:	01056533          	or	a0,a0,a6
    80005568:	05e2                	slli	a1,a1,0x18
    8000556a:	8dc9                	or	a1,a1,a0
    8000556c:	0577c783          	lbu	a5,87(a5)
    80005570:	1602                	slli	a2,a2,0x20
    80005572:	8e4d                	or	a2,a2,a1
    80005574:	16a2                	slli	a3,a3,0x28
    80005576:	8ed1                	or	a3,a3,a2
    80005578:	1742                	slli	a4,a4,0x30
    8000557a:	8f55                	or	a4,a4,a3
    8000557c:	17e2                	slli	a5,a5,0x38
    8000557e:	8fd9                	or	a5,a5,a4
    80005580:	4501                	li	a0,0
    80005582:	cb91                	beqz	a5,80005596 <sbi_console_init+0xe0>
    80005584:	1141                	addi	sp,sp,-16
    80005586:	e022                	sd	s0,0(sp)
    80005588:	e406                	sd	ra,8(sp)
    8000558a:	0800                	addi	s0,sp,16
    8000558c:	9782                	jalr	a5
    8000558e:	60a2                	ld	ra,8(sp)
    80005590:	6402                	ld	s0,0(sp)
    80005592:	0141                	addi	sp,sp,16
    80005594:	8082                	ret
    80005596:	8082                	ret
    80005598:	4501                	li	a0,0
    8000559a:	8082                	ret

000000008000559c <sbi_ecall_version_major>:
    8000559c:	1141                	addi	sp,sp,-16
    8000559e:	e422                	sd	s0,8(sp)
    800055a0:	0800                	addi	s0,sp,16
    800055a2:	6422                	ld	s0,8(sp)
    800055a4:	4501                	li	a0,0
    800055a6:	0141                	addi	sp,sp,16
    800055a8:	8082                	ret

00000000800055aa <sbi_ecall_version_minor>:
    800055aa:	1141                	addi	sp,sp,-16
    800055ac:	e422                	sd	s0,8(sp)
    800055ae:	0800                	addi	s0,sp,16
    800055b0:	6422                	ld	s0,8(sp)
    800055b2:	4509                	li	a0,2
    800055b4:	0141                	addi	sp,sp,16
    800055b6:	8082                	ret

00000000800055b8 <sbi_ecall_find_extension>:
    800055b8:	1141                	addi	sp,sp,-16
    800055ba:	e422                	sd	s0,8(sp)
    800055bc:	0800                	addi	s0,sp,16
    800055be:	00009697          	auipc	a3,0x9
    800055c2:	b1268693          	addi	a3,a3,-1262 # 8000e0d0 <ecall_exts_list>
    800055c6:	629c                	ld	a5,0(a3)
    800055c8:	00d78b63          	beq	a5,a3,800055de <sbi_ecall_find_extension+0x26>
    800055cc:	6b98                	ld	a4,16(a5)
    800055ce:	00e56563          	bltu	a0,a4,800055d8 <sbi_ecall_find_extension+0x20>
    800055d2:	6f98                	ld	a4,24(a5)
    800055d4:	00a77663          	bgeu	a4,a0,800055e0 <sbi_ecall_find_extension+0x28>
    800055d8:	639c                	ld	a5,0(a5)
    800055da:	fed799e3          	bne	a5,a3,800055cc <sbi_ecall_find_extension+0x14>
    800055de:	4781                	li	a5,0
    800055e0:	6422                	ld	s0,8(sp)
    800055e2:	853e                	mv	a0,a5
    800055e4:	0141                	addi	sp,sp,16
    800055e6:	8082                	ret

00000000800055e8 <sbi_ecall_register_extension>:
    800055e8:	1141                	addi	sp,sp,-16
    800055ea:	e422                	sd	s0,8(sp)
    800055ec:	0800                	addi	s0,sp,16
    800055ee:	c525                	beqz	a0,80005656 <sbi_ecall_register_extension+0x6e>
    800055f0:	01853803          	ld	a6,24(a0)
    800055f4:	690c                	ld	a1,16(a0)
    800055f6:	88aa                	mv	a7,a0
    800055f8:	04b86f63          	bltu	a6,a1,80005656 <sbi_ecall_register_extension+0x6e>
    800055fc:	751c                	ld	a5,40(a0)
    800055fe:	cfa1                	beqz	a5,80005656 <sbi_ecall_register_extension+0x6e>
    80005600:	00009697          	auipc	a3,0x9
    80005604:	ad068693          	addi	a3,a3,-1328 # 8000e0d0 <ecall_exts_list>
    80005608:	629c                	ld	a5,0(a3)
    8000560a:	02d78563          	beq	a5,a3,80005634 <sbi_ecall_register_extension+0x4c>
    8000560e:	873e                	mv	a4,a5
    80005610:	6b10                	ld	a2,16(a4)
    80005612:	00c5e563          	bltu	a1,a2,8000561c <sbi_ecall_register_extension+0x34>
    80005616:	6f10                	ld	a2,24(a4)
    80005618:	02b67f63          	bgeu	a2,a1,80005656 <sbi_ecall_register_extension+0x6e>
    8000561c:	6318                	ld	a4,0(a4)
    8000561e:	fed719e3          	bne	a4,a3,80005610 <sbi_ecall_register_extension+0x28>
    80005622:	6b98                	ld	a4,16(a5)
    80005624:	00e86563          	bltu	a6,a4,8000562e <sbi_ecall_register_extension+0x46>
    80005628:	6f98                	ld	a4,24(a5)
    8000562a:	03077663          	bgeu	a4,a6,80005656 <sbi_ecall_register_extension+0x6e>
    8000562e:	639c                	ld	a5,0(a5)
    80005630:	fed799e3          	bne	a5,a3,80005622 <sbi_ecall_register_extension+0x3a>
    80005634:	0118b023          	sd	a7,0(a7)
    80005638:	0118b423          	sd	a7,8(a7)
    8000563c:	669c                	ld	a5,8(a3)
    8000563e:	00d8b023          	sd	a3,0(a7)
    80005642:	4501                	li	a0,0
    80005644:	00f8b423          	sd	a5,8(a7)
    80005648:	0117b023          	sd	a7,0(a5)
    8000564c:	0116b423          	sd	a7,8(a3)
    80005650:	6422                	ld	s0,8(sp)
    80005652:	0141                	addi	sp,sp,16
    80005654:	8082                	ret
    80005656:	6422                	ld	s0,8(sp)
    80005658:	5575                	li	a0,-3
    8000565a:	0141                	addi	sp,sp,16
    8000565c:	8082                	ret

000000008000565e <sbi_ecall_unregister_extension>:
    8000565e:	1141                	addi	sp,sp,-16
    80005660:	e422                	sd	s0,8(sp)
    80005662:	0800                	addi	s0,sp,16
    80005664:	cd09                	beqz	a0,8000567e <sbi_ecall_unregister_extension+0x20>
    80005666:	00009717          	auipc	a4,0x9
    8000566a:	a6a70713          	addi	a4,a4,-1430 # 8000e0d0 <ecall_exts_list>
    8000566e:	631c                	ld	a5,0(a4)
    80005670:	00e78763          	beq	a5,a4,8000567e <sbi_ecall_unregister_extension+0x20>
    80005674:	00f50863          	beq	a0,a5,80005684 <sbi_ecall_unregister_extension+0x26>
    80005678:	639c                	ld	a5,0(a5)
    8000567a:	fee79de3          	bne	a5,a4,80005674 <sbi_ecall_unregister_extension+0x16>
    8000567e:	6422                	ld	s0,8(sp)
    80005680:	0141                	addi	sp,sp,16
    80005682:	8082                	ret
    80005684:	6518                	ld	a4,8(a0)
    80005686:	611c                	ld	a5,0(a0)
    80005688:	e31c                	sd	a5,0(a4)
    8000568a:	e798                	sd	a4,8(a5)
    8000568c:	6422                	ld	s0,8(sp)
    8000568e:	e108                	sd	a0,0(a0)
    80005690:	e508                	sd	a0,8(a0)
    80005692:	0141                	addi	sp,sp,16
    80005694:	8082                	ret

0000000080005696 <sbi_ecall_handler>:
    80005696:	7171                	addi	sp,sp,-176
    80005698:	f122                	sd	s0,160(sp)
    8000569a:	ed26                	sd	s1,152(sp)
    8000569c:	fcd6                	sd	s5,120(sp)
    8000569e:	f8da                	sd	s6,112(sp)
    800056a0:	f506                	sd	ra,168(sp)
    800056a2:	e94a                	sd	s2,144(sp)
    800056a4:	e54e                	sd	s3,136(sp)
    800056a6:	e152                	sd	s4,128(sp)
    800056a8:	f4de                	sd	s7,104(sp)
    800056aa:	f0e2                	sd	s8,96(sp)
    800056ac:	1900                	addi	s0,sp,176
    800056ae:	08964e83          	lbu	t4,137(a2)
    800056b2:	08164e03          	lbu	t3,129(a2)
    800056b6:	08864703          	lbu	a4,136(a2)
    800056ba:	08064783          	lbu	a5,128(a2)
    800056be:	08a64f83          	lbu	t6,138(a2)
    800056c2:	08264f03          	lbu	t5,130(a2)
    800056c6:	08b64303          	lbu	t1,139(a2)
    800056ca:	08364883          	lbu	a7,131(a2)
    800056ce:	08c64803          	lbu	a6,140(a2)
    800056d2:	08464503          	lbu	a0,132(a2)
    800056d6:	0ea2                	slli	t4,t4,0x8
    800056d8:	0e22                	slli	t3,t3,0x8
    800056da:	08d64903          	lbu	s2,141(a2)
    800056de:	08564a03          	lbu	s4,133(a2)
    800056e2:	00eeeeb3          	or	t4,t4,a4
    800056e6:	00fe6e33          	or	t3,t3,a5
    800056ea:	0fc2                	slli	t6,t6,0x10
    800056ec:	0f42                	slli	t5,t5,0x10
    800056ee:	08e64703          	lbu	a4,142(a2)
    800056f2:	08664783          	lbu	a5,134(a2)
    800056f6:	01dfefb3          	or	t6,t6,t4
    800056fa:	01cf6f33          	or	t5,t5,t3
    800056fe:	0362                	slli	t1,t1,0x18
    80005700:	08e2                	slli	a7,a7,0x18
    80005702:	08f64e83          	lbu	t4,143(a2)
    80005706:	08764e03          	lbu	t3,135(a2)
    8000570a:	01f36333          	or	t1,t1,t6
    8000570e:	01e8e8b3          	or	a7,a7,t5
    80005712:	1802                	slli	a6,a6,0x20
    80005714:	1502                	slli	a0,a0,0x20
    80005716:	00686833          	or	a6,a6,t1
    8000571a:	01156533          	or	a0,a0,a7
    8000571e:	1922                	slli	s2,s2,0x28
    80005720:	1a22                	slli	s4,s4,0x28
    80005722:	01096933          	or	s2,s2,a6
    80005726:	00aa6a33          	or	s4,s4,a0
    8000572a:	1742                	slli	a4,a4,0x30
    8000572c:	17c2                	slli	a5,a5,0x30
    8000572e:	01276733          	or	a4,a4,s2
    80005732:	0147e7b3          	or	a5,a5,s4
    80005736:	038e9913          	slli	s2,t4,0x38
    8000573a:	038e1a13          	slli	s4,t3,0x38
    8000573e:	f4043c23          	sd	zero,-168(s0)
    80005742:	f6043023          	sd	zero,-160(s0)
    80005746:	f6043423          	sd	zero,-152(s0)
    8000574a:	f6043823          	sd	zero,-144(s0)
    8000574e:	f6043c23          	sd	zero,-136(s0)
    80005752:	84b2                	mv	s1,a2
    80005754:	8b2e                	mv	s6,a1
    80005756:	8ab6                	mv	s5,a3
    80005758:	00e96933          	or	s2,s2,a4
    8000575c:	00fa6a33          	or	s4,s4,a5
    80005760:	f4043823          	sd	zero,-176(s0)
    80005764:	34302bf3          	csrr	s7,mtval
    80005768:	08964583          	lbu	a1,137(a2)
    8000576c:	08864783          	lbu	a5,136(a2)
    80005770:	08a64503          	lbu	a0,138(a2)
    80005774:	08b64683          	lbu	a3,139(a2)
    80005778:	08c64703          	lbu	a4,140(a2)
    8000577c:	05a2                	slli	a1,a1,0x8
    8000577e:	8ddd                	or	a1,a1,a5
    80005780:	08d64983          	lbu	s3,141(a2)
    80005784:	0542                	slli	a0,a0,0x10
    80005786:	8d4d                	or	a0,a0,a1
    80005788:	08e64783          	lbu	a5,142(a2)
    8000578c:	06e2                	slli	a3,a3,0x18
    8000578e:	08f64803          	lbu	a6,143(a2)
    80005792:	8ec9                	or	a3,a3,a0
    80005794:	1702                	slli	a4,a4,0x20
    80005796:	8f55                	or	a4,a4,a3
    80005798:	19a2                	slli	s3,s3,0x28
    8000579a:	00e9e9b3          	or	s3,s3,a4
    8000579e:	10964583          	lbu	a1,265(a2)
    800057a2:	17c2                	slli	a5,a5,0x30
    800057a4:	0137e7b3          	or	a5,a5,s3
    800057a8:	03881993          	slli	s3,a6,0x38
    800057ac:	00f9e9b3          	or	s3,s3,a5
    800057b0:	192617b7          	lui	a5,0x19261
    800057b4:	0035d713          	srli	a4,a1,0x3
    800057b8:	81778793          	addi	a5,a5,-2025 # 19260817 <_fw_start-0x66d9f7e9>
    800057bc:	00377c13          	andi	s8,a4,3
    800057c0:	36f98a63          	beq	s3,a5,80005b34 <sbi_ecall_handler+0x49e>
    800057c4:	400c0a63          	beqz	s8,80005bd8 <sbi_ecall_handler+0x542>
    800057c8:	0514c683          	lbu	a3,81(s1)
    800057cc:	0594c703          	lbu	a4,89(s1)
    800057d0:	0614c783          	lbu	a5,97(s1)
    800057d4:	0504c503          	lbu	a0,80(s1)
    800057d8:	0584c583          	lbu	a1,88(s1)
    800057dc:	0604c603          	lbu	a2,96(s1)
    800057e0:	0524cb83          	lbu	s7,82(s1)
    800057e4:	05a4cb03          	lbu	s6,90(s1)
    800057e8:	0624c983          	lbu	s3,98(s1)
    800057ec:	0534c383          	lbu	t2,83(s1)
    800057f0:	05b4c283          	lbu	t0,91(s1)
    800057f4:	0634cf83          	lbu	t6,99(s1)
    800057f8:	0544cf03          	lbu	t5,84(s1)
    800057fc:	05c4ce83          	lbu	t4,92(s1)
    80005800:	0644ce03          	lbu	t3,100(s1)
    80005804:	06a2                	slli	a3,a3,0x8
    80005806:	0722                	slli	a4,a4,0x8
    80005808:	07a2                	slli	a5,a5,0x8
    8000580a:	0554c303          	lbu	t1,85(s1)
    8000580e:	05d4c883          	lbu	a7,93(s1)
    80005812:	0654c803          	lbu	a6,101(s1)
    80005816:	8ec9                	or	a3,a3,a0
    80005818:	8f4d                	or	a4,a4,a1
    8000581a:	8fd1                	or	a5,a5,a2
    8000581c:	0bc2                	slli	s7,s7,0x10
    8000581e:	0b42                	slli	s6,s6,0x10
    80005820:	09c2                	slli	s3,s3,0x10
    80005822:	0564c503          	lbu	a0,86(s1)
    80005826:	05e4c583          	lbu	a1,94(s1)
    8000582a:	0664c603          	lbu	a2,102(s1)
    8000582e:	00dbebb3          	or	s7,s7,a3
    80005832:	00eb6b33          	or	s6,s6,a4
    80005836:	00f9e9b3          	or	s3,s3,a5
    8000583a:	03e2                	slli	t2,t2,0x18
    8000583c:	02e2                	slli	t0,t0,0x18
    8000583e:	0fe2                	slli	t6,t6,0x18
    80005840:	0574c683          	lbu	a3,87(s1)
    80005844:	05f4c703          	lbu	a4,95(s1)
    80005848:	0674c783          	lbu	a5,103(s1)
    8000584c:	0173e3b3          	or	t2,t2,s7
    80005850:	0162e2b3          	or	t0,t0,s6
    80005854:	013fefb3          	or	t6,t6,s3
    80005858:	1f02                	slli	t5,t5,0x20
    8000585a:	1e82                	slli	t4,t4,0x20
    8000585c:	1e02                	slli	t3,t3,0x20
    8000585e:	007f6f33          	or	t5,t5,t2
    80005862:	005eeeb3          	or	t4,t4,t0
    80005866:	01fe6e33          	or	t3,t3,t6
    8000586a:	1322                	slli	t1,t1,0x28
    8000586c:	18a2                	slli	a7,a7,0x28
    8000586e:	1822                	slli	a6,a6,0x28
    80005870:	01e36333          	or	t1,t1,t5
    80005874:	01d8e8b3          	or	a7,a7,t4
    80005878:	01c86833          	or	a6,a6,t3
    8000587c:	1542                	slli	a0,a0,0x30
    8000587e:	15c2                	slli	a1,a1,0x30
    80005880:	1642                	slli	a2,a2,0x30
    80005882:	00656533          	or	a0,a0,t1
    80005886:	0115e5b3          	or	a1,a1,a7
    8000588a:	01066633          	or	a2,a2,a6
    8000588e:	16e2                	slli	a3,a3,0x38
    80005890:	1762                	slli	a4,a4,0x38
    80005892:	17e2                	slli	a5,a5,0x38
    80005894:	8ec9                	or	a3,a3,a0
    80005896:	8f4d                	or	a4,a4,a1
    80005898:	8fd1                	or	a5,a5,a2
    8000589a:	0694c883          	lbu	a7,105(s1)
    8000589e:	0684c603          	lbu	a2,104(s1)
    800058a2:	06a4c383          	lbu	t2,106(s1)
    800058a6:	06b4cb03          	lbu	s6,107(s1)
    800058aa:	06c4cf03          	lbu	t5,108(s1)
    800058ae:	f8d43023          	sd	a3,-128(s0)
    800058b2:	f8e43423          	sd	a4,-120(s0)
    800058b6:	f8f43823          	sd	a5,-112(s0)
    800058ba:	06d4ce03          	lbu	t3,109(s1)
    800058be:	0714c803          	lbu	a6,113(s1)
    800058c2:	0794c703          	lbu	a4,121(s1)
    800058c6:	0704c303          	lbu	t1,112(s1)
    800058ca:	0784c683          	lbu	a3,120(s1)
    800058ce:	0724cb83          	lbu	s7,114(s1)
    800058d2:	07a4c983          	lbu	s3,122(s1)
    800058d6:	0734c283          	lbu	t0,115(s1)
    800058da:	07b4cf83          	lbu	t6,123(s1)
    800058de:	0744ce83          	lbu	t4,116(s1)
    800058e2:	07c4c583          	lbu	a1,124(s1)
    800058e6:	08a2                	slli	a7,a7,0x8
    800058e8:	0822                	slli	a6,a6,0x8
    800058ea:	0722                	slli	a4,a4,0x8
    800058ec:	0754c503          	lbu	a0,117(s1)
    800058f0:	07d4c783          	lbu	a5,125(s1)
    800058f4:	00c8e8b3          	or	a7,a7,a2
    800058f8:	00686833          	or	a6,a6,t1
    800058fc:	8f55                	or	a4,a4,a3
    800058fe:	03c2                	slli	t2,t2,0x10
    80005900:	0bc2                	slli	s7,s7,0x10
    80005902:	09c2                	slli	s3,s3,0x10
    80005904:	06e4c603          	lbu	a2,110(s1)
    80005908:	0764c683          	lbu	a3,118(s1)
    8000590c:	07e4c303          	lbu	t1,126(s1)
    80005910:	0113e3b3          	or	t2,t2,a7
    80005914:	010bebb3          	or	s7,s7,a6
    80005918:	00e9e9b3          	or	s3,s3,a4
    8000591c:	0b62                	slli	s6,s6,0x18
    8000591e:	02e2                	slli	t0,t0,0x18
    80005920:	0fe2                	slli	t6,t6,0x18
    80005922:	06f4c883          	lbu	a7,111(s1)
    80005926:	0774c803          	lbu	a6,119(s1)
    8000592a:	07f4c703          	lbu	a4,127(s1)
    8000592e:	007b63b3          	or	t2,s6,t2
    80005932:	1f02                	slli	t5,t5,0x20
    80005934:	0172e2b3          	or	t0,t0,s7
    80005938:	1e82                	slli	t4,t4,0x20
    8000593a:	013fefb3          	or	t6,t6,s3
    8000593e:	1582                	slli	a1,a1,0x20
    80005940:	01f5e5b3          	or	a1,a1,t6
    80005944:	007f6f33          	or	t5,t5,t2
    80005948:	1e22                	slli	t3,t3,0x28
    8000594a:	005eeeb3          	or	t4,t4,t0
    8000594e:	1522                	slli	a0,a0,0x28
    80005950:	17a2                	slli	a5,a5,0x28
    80005952:	8fcd                	or	a5,a5,a1
    80005954:	01ee6e33          	or	t3,t3,t5
    80005958:	1642                	slli	a2,a2,0x30
    8000595a:	01d56533          	or	a0,a0,t4
    8000595e:	16c2                	slli	a3,a3,0x30
    80005960:	1342                	slli	t1,t1,0x30
    80005962:	00008597          	auipc	a1,0x8
    80005966:	76e58593          	addi	a1,a1,1902 # 8000e0d0 <ecall_exts_list>
    8000596a:	00f36333          	or	t1,t1,a5
    8000596e:	01c66633          	or	a2,a2,t3
    80005972:	18e2                	slli	a7,a7,0x38
    80005974:	8ec9                	or	a3,a3,a0
    80005976:	1862                	slli	a6,a6,0x38
    80005978:	1762                	slli	a4,a4,0x38
    8000597a:	619c                	ld	a5,0(a1)
    8000597c:	00c8e8b3          	or	a7,a7,a2
    80005980:	00d86833          	or	a6,a6,a3
    80005984:	00676733          	or	a4,a4,t1
    80005988:	f9143c23          	sd	a7,-104(s0)
    8000598c:	fb043023          	sd	a6,-96(s0)
    80005990:	fae43423          	sd	a4,-88(s0)
    80005994:	00b78b63          	beq	a5,a1,800059aa <sbi_ecall_handler+0x314>
    80005998:	6b98                	ld	a4,16(a5)
    8000599a:	00e96563          	bltu	s2,a4,800059a4 <sbi_ecall_handler+0x30e>
    8000599e:	6f98                	ld	a4,24(a5)
    800059a0:	11277763          	bgeu	a4,s2,80005aae <sbi_ecall_handler+0x418>
    800059a4:	639c                	ld	a5,0(a5)
    800059a6:	feb799e3          	bne	a5,a1,80005998 <sbi_ecall_handler+0x302>
    800059aa:	192617b7          	lui	a5,0x19261
    800059ae:	81778793          	addi	a5,a5,-2025 # 19260817 <_fw_start-0x66d9f7e9>
    800059b2:	34f90263          	beq	s2,a5,80005cf6 <sbi_ecall_handler+0x660>
    800059b6:	1014c783          	lbu	a5,257(s1)
    800059ba:	1004c703          	lbu	a4,256(s1)
    800059be:	1024c503          	lbu	a0,258(s1)
    800059c2:	1034c583          	lbu	a1,259(s1)
    800059c6:	1044c603          	lbu	a2,260(s1)
    800059ca:	07a2                	slli	a5,a5,0x8
    800059cc:	8fd9                	or	a5,a5,a4
    800059ce:	1054c683          	lbu	a3,261(s1)
    800059d2:	0542                	slli	a0,a0,0x10
    800059d4:	8d5d                	or	a0,a0,a5
    800059d6:	1064c703          	lbu	a4,262(s1)
    800059da:	05e2                	slli	a1,a1,0x18
    800059dc:	8dc9                	or	a1,a1,a0
    800059de:	1074c783          	lbu	a5,263(s1)
    800059e2:	1602                	slli	a2,a2,0x20
    800059e4:	8e4d                	or	a2,a2,a1
    800059e6:	16a2                	slli	a3,a3,0x28
    800059e8:	8ed1                	or	a3,a3,a2
    800059ea:	1742                	slli	a4,a4,0x30
    800059ec:	8f55                	or	a4,a4,a3
    800059ee:	17e2                	slli	a5,a5,0x38
    800059f0:	8fd9                	or	a5,a5,a4
    800059f2:	0791                	addi	a5,a5,4
    800059f4:	577d                	li	a4,-1
    800059f6:	0087d313          	srli	t1,a5,0x8
    800059fa:	0107d893          	srli	a7,a5,0x10
    800059fe:	0187d81b          	srliw	a6,a5,0x18
    80005a02:	0207d513          	srli	a0,a5,0x20
    80005a06:	0287d593          	srli	a1,a5,0x28
    80005a0a:	0307d613          	srli	a2,a5,0x30
    80005a0e:	0387d693          	srli	a3,a5,0x38
    80005a12:	10f48023          	sb	a5,256(s1)
    80005a16:	57f9                	li	a5,-2
    80005a18:	106480a3          	sb	t1,257(s1)
    80005a1c:	11148123          	sb	a7,258(s1)
    80005a20:	110481a3          	sb	a6,259(s1)
    80005a24:	10a48223          	sb	a0,260(s1)
    80005a28:	10b482a3          	sb	a1,261(s1)
    80005a2c:	10c48323          	sb	a2,262(s1)
    80005a30:	10d483a3          	sb	a3,263(s1)
    80005a34:	04f48823          	sb	a5,80(s1)
    80005a38:	04e488a3          	sb	a4,81(s1)
    80005a3c:	04e48923          	sb	a4,82(s1)
    80005a40:	04e489a3          	sb	a4,83(s1)
    80005a44:	04e48a23          	sb	a4,84(s1)
    80005a48:	04e48aa3          	sb	a4,85(s1)
    80005a4c:	04e48b23          	sb	a4,86(s1)
    80005a50:	04e48ba3          	sb	a4,87(s1)
    80005a54:	f5043783          	ld	a5,-176(s0)
    80005a58:	0087d893          	srli	a7,a5,0x8
    80005a5c:	0107d813          	srli	a6,a5,0x10
    80005a60:	0187d51b          	srliw	a0,a5,0x18
    80005a64:	0207d593          	srli	a1,a5,0x20
    80005a68:	0287d613          	srli	a2,a5,0x28
    80005a6c:	0307d693          	srli	a3,a5,0x30
    80005a70:	0387d713          	srli	a4,a5,0x38
    80005a74:	04f48c23          	sb	a5,88(s1)
    80005a78:	05148ca3          	sb	a7,89(s1)
    80005a7c:	05048d23          	sb	a6,90(s1)
    80005a80:	04a48da3          	sb	a0,91(s1)
    80005a84:	04b48e23          	sb	a1,92(s1)
    80005a88:	04c48ea3          	sb	a2,93(s1)
    80005a8c:	04d48f23          	sb	a3,94(s1)
    80005a90:	04e48fa3          	sb	a4,95(s1)
    80005a94:	70aa                	ld	ra,168(sp)
    80005a96:	740a                	ld	s0,160(sp)
    80005a98:	64ea                	ld	s1,152(sp)
    80005a9a:	694a                	ld	s2,144(sp)
    80005a9c:	69aa                	ld	s3,136(sp)
    80005a9e:	6a0a                	ld	s4,128(sp)
    80005aa0:	7ae6                	ld	s5,120(sp)
    80005aa2:	7b46                	ld	s6,112(sp)
    80005aa4:	7ba6                	ld	s7,104(sp)
    80005aa6:	7c06                	ld	s8,96(sp)
    80005aa8:	4501                	li	a0,0
    80005aaa:	614d                	addi	sp,sp,176
    80005aac:	8082                	ret
    80005aae:	0287b803          	ld	a6,40(a5)
    80005ab2:	ee080ce3          	beqz	a6,800059aa <sbi_ecall_handler+0x314>
    80005ab6:	f5840793          	addi	a5,s0,-168
    80005aba:	f5040713          	addi	a4,s0,-176
    80005abe:	f8040693          	addi	a3,s0,-128
    80005ac2:	8652                	mv	a2,s4
    80005ac4:	85ca                	mv	a1,s2
    80005ac6:	8556                	mv	a0,s5
    80005ac8:	9802                	jalr	a6
    80005aca:	47a1                	li	a5,8
    80005acc:	89aa                	mv	s3,a0
    80005ace:	1727f463          	bgeu	a5,s2,80005c36 <sbi_ecall_handler+0x5a0>
    80005ad2:	192617b7          	lui	a5,0x19261
    80005ad6:	81778793          	addi	a5,a5,-2025 # 19260817 <_fw_start-0x66d9f7e9>
    80005ada:	22f90663          	beq	s2,a5,80005d06 <sbi_ecall_handler+0x670>
    80005ade:	1014c783          	lbu	a5,257(s1)
    80005ae2:	1004c703          	lbu	a4,256(s1)
    80005ae6:	1024c503          	lbu	a0,258(s1)
    80005aea:	1034c583          	lbu	a1,259(s1)
    80005aee:	1044c603          	lbu	a2,260(s1)
    80005af2:	07a2                	slli	a5,a5,0x8
    80005af4:	8fd9                	or	a5,a5,a4
    80005af6:	1054c683          	lbu	a3,261(s1)
    80005afa:	0542                	slli	a0,a0,0x10
    80005afc:	8d5d                	or	a0,a0,a5
    80005afe:	1064c703          	lbu	a4,262(s1)
    80005b02:	05e2                	slli	a1,a1,0x18
    80005b04:	1074c783          	lbu	a5,263(s1)
    80005b08:	8dc9                	or	a1,a1,a0
    80005b0a:	1602                	slli	a2,a2,0x20
    80005b0c:	8e4d                	or	a2,a2,a1
    80005b0e:	16a2                	slli	a3,a3,0x28
    80005b10:	8ed1                	or	a3,a3,a2
    80005b12:	1742                	slli	a4,a4,0x30
    80005b14:	8f55                	or	a4,a4,a3
    80005b16:	17e2                	slli	a5,a5,0x38
    80005b18:	8fd9                	or	a5,a5,a4
    80005b1a:	56cd                	li	a3,-13
    80005b1c:	873e                	mv	a4,a5
    80005b1e:	1ed99c63          	bne	s3,a3,80005d16 <sbi_ecall_handler+0x680>
    80005b22:	8656                	mv	a2,s5
    80005b24:	f5840593          	addi	a1,s0,-168
    80005b28:	8526                	mv	a0,s1
    80005b2a:	f4e43c23          	sd	a4,-168(s0)
    80005b2e:	f45fc0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80005b32:	b78d                	j	80005a94 <sbi_ecall_handler+0x3fe>
    80005b34:	00009e17          	auipc	t3,0x9
    80005b38:	524e0e13          	addi	t3,t3,1316 # 8000f058 <count_ebi.0>
    80005b3c:	000e2783          	lw	a5,0(t3)
    80005b40:	06c48c23          	sb	a2,120(s1)
    80005b44:	02065513          	srli	a0,a2,0x20
    80005b48:	2785                	addiw	a5,a5,1
    80005b4a:	02865593          	srli	a1,a2,0x28
    80005b4e:	03065693          	srli	a3,a2,0x30
    80005b52:	00865313          	srli	t1,a2,0x8
    80005b56:	01065893          	srli	a7,a2,0x10
    80005b5a:	0186581b          	srliw	a6,a2,0x18
    80005b5e:	03865713          	srli	a4,a2,0x38
    80005b62:	06a60e23          	sb	a0,124(a2)
    80005b66:	06b60ea3          	sb	a1,125(a2)
    80005b6a:	06d60f23          	sb	a3,126(a2)
    80005b6e:	06660ca3          	sb	t1,121(a2)
    80005b72:	07160d23          	sb	a7,122(a2)
    80005b76:	07060da3          	sb	a6,123(a2)
    80005b7a:	06e60fa3          	sb	a4,127(a2)
    80005b7e:	86d2                	mv	a3,s4
    80005b80:	0007859b          	sext.w	a1,a5
    80005b84:	00007517          	auipc	a0,0x7
    80005b88:	d1450513          	addi	a0,a0,-748 # 8000c898 <platform_ops+0x1e0>
    80005b8c:	00fe2023          	sw	a5,0(t3)
    80005b90:	88fff0ef          	jal	ra,8000541e <sbi_printf>
    80005b94:	c20c1ae3          	bnez	s8,800057c8 <sbi_ecall_handler+0x132>
    80005b98:	0894c783          	lbu	a5,137(s1)
    80005b9c:	0884c703          	lbu	a4,136(s1)
    80005ba0:	08a4c503          	lbu	a0,138(s1)
    80005ba4:	08b4c583          	lbu	a1,139(s1)
    80005ba8:	08c4c603          	lbu	a2,140(s1)
    80005bac:	07a2                	slli	a5,a5,0x8
    80005bae:	8fd9                	or	a5,a5,a4
    80005bb0:	08d4c683          	lbu	a3,141(s1)
    80005bb4:	0542                	slli	a0,a0,0x10
    80005bb6:	8d5d                	or	a0,a0,a5
    80005bb8:	08e4c703          	lbu	a4,142(s1)
    80005bbc:	05e2                	slli	a1,a1,0x18
    80005bbe:	08f4c783          	lbu	a5,143(s1)
    80005bc2:	8dc9                	or	a1,a1,a0
    80005bc4:	1602                	slli	a2,a2,0x20
    80005bc6:	8e4d                	or	a2,a2,a1
    80005bc8:	16a2                	slli	a3,a3,0x28
    80005bca:	8ed1                	or	a3,a3,a2
    80005bcc:	1742                	slli	a4,a4,0x30
    80005bce:	8f55                	or	a4,a4,a3
    80005bd0:	17e2                	slli	a5,a5,0x38
    80005bd2:	8fd9                	or	a5,a5,a4
    80005bd4:	bf378ae3          	beq	a5,s3,800057c8 <sbi_ecall_handler+0x132>
    80005bd8:	1014c783          	lbu	a5,257(s1)
    80005bdc:	1004c703          	lbu	a4,256(s1)
    80005be0:	1024c503          	lbu	a0,258(s1)
    80005be4:	1034c583          	lbu	a1,259(s1)
    80005be8:	1044c603          	lbu	a2,260(s1)
    80005bec:	07a2                	slli	a5,a5,0x8
    80005bee:	1054c683          	lbu	a3,261(s1)
    80005bf2:	8fd9                	or	a5,a5,a4
    80005bf4:	0542                	slli	a0,a0,0x10
    80005bf6:	1064c703          	lbu	a4,262(s1)
    80005bfa:	8d5d                	or	a0,a0,a5
    80005bfc:	05e2                	slli	a1,a1,0x18
    80005bfe:	1074c783          	lbu	a5,263(s1)
    80005c02:	8dc9                	or	a1,a1,a0
    80005c04:	1602                	slli	a2,a2,0x20
    80005c06:	8e4d                	or	a2,a2,a1
    80005c08:	16a2                	slli	a3,a3,0x28
    80005c0a:	8ed1                	or	a3,a3,a2
    80005c0c:	1742                	slli	a4,a4,0x30
    80005c0e:	8f55                	or	a4,a4,a3
    80005c10:	17e2                	slli	a5,a5,0x38
    80005c12:	8fd9                	or	a5,a5,a4
    80005c14:	8656                	mv	a2,s5
    80005c16:	f5840593          	addi	a1,s0,-168
    80005c1a:	8526                	mv	a0,s1
    80005c1c:	f4f43c23          	sd	a5,-168(s0)
    80005c20:	f7643023          	sd	s6,-160(s0)
    80005c24:	f7743423          	sd	s7,-152(s0)
    80005c28:	f6043823          	sd	zero,-144(s0)
    80005c2c:	f6043c23          	sd	zero,-136(s0)
    80005c30:	e43fc0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80005c34:	b585                	j	80005a94 <sbi_ecall_handler+0x3fe>
    80005c36:	1014c783          	lbu	a5,257(s1)
    80005c3a:	1004c703          	lbu	a4,256(s1)
    80005c3e:	1024c503          	lbu	a0,258(s1)
    80005c42:	1034c583          	lbu	a1,259(s1)
    80005c46:	1044c603          	lbu	a2,260(s1)
    80005c4a:	07a2                	slli	a5,a5,0x8
    80005c4c:	8fd9                	or	a5,a5,a4
    80005c4e:	1054c683          	lbu	a3,261(s1)
    80005c52:	0542                	slli	a0,a0,0x10
    80005c54:	8d5d                	or	a0,a0,a5
    80005c56:	1064c703          	lbu	a4,262(s1)
    80005c5a:	05e2                	slli	a1,a1,0x18
    80005c5c:	1074c783          	lbu	a5,263(s1)
    80005c60:	8dc9                	or	a1,a1,a0
    80005c62:	1602                	slli	a2,a2,0x20
    80005c64:	8e4d                	or	a2,a2,a1
    80005c66:	16a2                	slli	a3,a3,0x28
    80005c68:	8ed1                	or	a3,a3,a2
    80005c6a:	1742                	slli	a4,a4,0x30
    80005c6c:	8f55                	or	a4,a4,a3
    80005c6e:	17e2                	slli	a5,a5,0x38
    80005c70:	8fd9                	or	a5,a5,a4
    80005c72:	56cd                	li	a3,-13
    80005c74:	873e                	mv	a4,a5
    80005c76:	ead986e3          	beq	s3,a3,80005b22 <sbi_ecall_handler+0x48c>
    80005c7a:	0791                	addi	a5,a5,4
    80005c7c:	0087d393          	srli	t2,a5,0x8
    80005c80:	0107d293          	srli	t0,a5,0x10
    80005c84:	0187df9b          	srliw	t6,a5,0x18
    80005c88:	0207df13          	srli	t5,a5,0x20
    80005c8c:	0287de93          	srli	t4,a5,0x28
    80005c90:	0307de13          	srli	t3,a5,0x30
    80005c94:	0387d313          	srli	t1,a5,0x38
    80005c98:	0089d893          	srli	a7,s3,0x8
    80005c9c:	0109d813          	srli	a6,s3,0x10
    80005ca0:	0189d51b          	srliw	a0,s3,0x18
    80005ca4:	0209d593          	srli	a1,s3,0x20
    80005ca8:	0289d613          	srli	a2,s3,0x28
    80005cac:	0309d693          	srli	a3,s3,0x30
    80005cb0:	0389d713          	srli	a4,s3,0x38
    80005cb4:	10f48023          	sb	a5,256(s1)
    80005cb8:	107480a3          	sb	t2,257(s1)
    80005cbc:	10548123          	sb	t0,258(s1)
    80005cc0:	11f481a3          	sb	t6,259(s1)
    80005cc4:	11e48223          	sb	t5,260(s1)
    80005cc8:	11d482a3          	sb	t4,261(s1)
    80005ccc:	11c48323          	sb	t3,262(s1)
    80005cd0:	106483a3          	sb	t1,263(s1)
    80005cd4:	05348823          	sb	s3,80(s1)
    80005cd8:	051488a3          	sb	a7,81(s1)
    80005cdc:	05048923          	sb	a6,82(s1)
    80005ce0:	04a489a3          	sb	a0,83(s1)
    80005ce4:	04b48a23          	sb	a1,84(s1)
    80005ce8:	04c48aa3          	sb	a2,85(s1)
    80005cec:	04d48b23          	sb	a3,86(s1)
    80005cf0:	04e48ba3          	sb	a4,87(s1)
    80005cf4:	b345                	j	80005a94 <sbi_ecall_handler+0x3fe>
    80005cf6:	55f9                	li	a1,-2
    80005cf8:	00007517          	auipc	a0,0x7
    80005cfc:	bf850513          	addi	a0,a0,-1032 # 8000c8f0 <platform_ops+0x238>
    80005d00:	f1eff0ef          	jal	ra,8000541e <sbi_printf>
    80005d04:	b94d                	j	800059b6 <sbi_ecall_handler+0x320>
    80005d06:	85aa                	mv	a1,a0
    80005d08:	00007517          	auipc	a0,0x7
    80005d0c:	be850513          	addi	a0,a0,-1048 # 8000c8f0 <platform_ops+0x238>
    80005d10:	f0eff0ef          	jal	ra,8000541e <sbi_printf>
    80005d14:	b3e9                	j	80005ade <sbi_ecall_handler+0x448>
    80005d16:	0791                	addi	a5,a5,4
    80005d18:	0087d393          	srli	t2,a5,0x8
    80005d1c:	0107d293          	srli	t0,a5,0x10
    80005d20:	0187df9b          	srliw	t6,a5,0x18
    80005d24:	0207df13          	srli	t5,a5,0x20
    80005d28:	0287de93          	srli	t4,a5,0x28
    80005d2c:	0307de13          	srli	t3,a5,0x30
    80005d30:	0387d313          	srli	t1,a5,0x38
    80005d34:	0089d893          	srli	a7,s3,0x8
    80005d38:	0109d813          	srli	a6,s3,0x10
    80005d3c:	0189d51b          	srliw	a0,s3,0x18
    80005d40:	0209d593          	srli	a1,s3,0x20
    80005d44:	0289d613          	srli	a2,s3,0x28
    80005d48:	0309d693          	srli	a3,s3,0x30
    80005d4c:	0389d713          	srli	a4,s3,0x38
    80005d50:	10f48023          	sb	a5,256(s1)
    80005d54:	107480a3          	sb	t2,257(s1)
    80005d58:	10548123          	sb	t0,258(s1)
    80005d5c:	11f481a3          	sb	t6,259(s1)
    80005d60:	11e48223          	sb	t5,260(s1)
    80005d64:	11d482a3          	sb	t4,261(s1)
    80005d68:	11c48323          	sb	t3,262(s1)
    80005d6c:	106483a3          	sb	t1,263(s1)
    80005d70:	05348823          	sb	s3,80(s1)
    80005d74:	051488a3          	sb	a7,81(s1)
    80005d78:	05048923          	sb	a6,82(s1)
    80005d7c:	04a489a3          	sb	a0,83(s1)
    80005d80:	04b48a23          	sb	a1,84(s1)
    80005d84:	04c48aa3          	sb	a2,85(s1)
    80005d88:	04d48b23          	sb	a3,86(s1)
    80005d8c:	04e48ba3          	sb	a4,87(s1)
    80005d90:	b1d1                	j	80005a54 <sbi_ecall_handler+0x3be>

0000000080005d92 <sbi_ecall_init>:
    80005d92:	1101                	addi	sp,sp,-32
    80005d94:	e822                	sd	s0,16(sp)
    80005d96:	e426                	sd	s1,8(sp)
    80005d98:	ec06                	sd	ra,24(sp)
    80005d9a:	1000                	addi	s0,sp,32
    80005d9c:	00008517          	auipc	a0,0x8
    80005da0:	43450513          	addi	a0,a0,1076 # 8000e1d0 <ecall_time>
    80005da4:	845ff0ef          	jal	ra,800055e8 <sbi_ecall_register_extension>
    80005da8:	84aa                	mv	s1,a0
    80005daa:	c519                	beqz	a0,80005db8 <sbi_ecall_init+0x26>
    80005dac:	60e2                	ld	ra,24(sp)
    80005dae:	6442                	ld	s0,16(sp)
    80005db0:	8526                	mv	a0,s1
    80005db2:	64a2                	ld	s1,8(sp)
    80005db4:	6105                	addi	sp,sp,32
    80005db6:	8082                	ret
    80005db8:	00008517          	auipc	a0,0x8
    80005dbc:	3e850513          	addi	a0,a0,1000 # 8000e1a0 <ecall_rfence>
    80005dc0:	829ff0ef          	jal	ra,800055e8 <sbi_ecall_register_extension>
    80005dc4:	84aa                	mv	s1,a0
    80005dc6:	f17d                	bnez	a0,80005dac <sbi_ecall_init+0x1a>
    80005dc8:	00008517          	auipc	a0,0x8
    80005dcc:	3a850513          	addi	a0,a0,936 # 8000e170 <ecall_ipi>
    80005dd0:	819ff0ef          	jal	ra,800055e8 <sbi_ecall_register_extension>
    80005dd4:	84aa                	mv	s1,a0
    80005dd6:	f979                	bnez	a0,80005dac <sbi_ecall_init+0x1a>
    80005dd8:	00008517          	auipc	a0,0x8
    80005ddc:	36850513          	addi	a0,a0,872 # 8000e140 <ecall_srst>
    80005de0:	809ff0ef          	jal	ra,800055e8 <sbi_ecall_register_extension>
    80005de4:	84aa                	mv	s1,a0
    80005de6:	f179                	bnez	a0,80005dac <sbi_ecall_init+0x1a>
    80005de8:	00008517          	auipc	a0,0x8
    80005dec:	2f850513          	addi	a0,a0,760 # 8000e0e0 <ecall_base>
    80005df0:	ff8ff0ef          	jal	ra,800055e8 <sbi_ecall_register_extension>
    80005df4:	84aa                	mv	s1,a0
    80005df6:	f95d                	bnez	a0,80005dac <sbi_ecall_init+0x1a>
    80005df8:	00008517          	auipc	a0,0x8
    80005dfc:	31850513          	addi	a0,a0,792 # 8000e110 <ecall_legacy>
    80005e00:	fe8ff0ef          	jal	ra,800055e8 <sbi_ecall_register_extension>
    80005e04:	84aa                	mv	s1,a0
    80005e06:	f15d                	bnez	a0,80005dac <sbi_ecall_init+0x1a>
    80005e08:	00008517          	auipc	a0,0x8
    80005e0c:	3f850513          	addi	a0,a0,1016 # 8000e200 <ecall_vendor>
    80005e10:	fd8ff0ef          	jal	ra,800055e8 <sbi_ecall_register_extension>
    80005e14:	84aa                	mv	s1,a0
    80005e16:	f959                	bnez	a0,80005dac <sbi_ecall_init+0x1a>
    80005e18:	00008517          	auipc	a0,0x8
    80005e1c:	41850513          	addi	a0,a0,1048 # 8000e230 <ecall_ebi>
    80005e20:	fc8ff0ef          	jal	ra,800055e8 <sbi_ecall_register_extension>
    80005e24:	84aa                	mv	s1,a0
    80005e26:	5e3000ef          	jal	ra,80006c08 <init_enclaves>
    80005e2a:	00007517          	auipc	a0,0x7
    80005e2e:	aee50513          	addi	a0,a0,-1298 # 8000c918 <platform_ops+0x260>
    80005e32:	decff0ef          	jal	ra,8000541e <sbi_printf>
    80005e36:	00008597          	auipc	a1,0x8
    80005e3a:	4225b583          	ld	a1,1058(a1) # 8000e258 <ecall_ebi+0x28>
    80005e3e:	00007517          	auipc	a0,0x7
    80005e42:	b0a50513          	addi	a0,a0,-1270 # 8000c948 <platform_ops+0x290>
    80005e46:	dd8ff0ef          	jal	ra,8000541e <sbi_printf>
    80005e4a:	b78d                	j	80005dac <sbi_ecall_init+0x1a>

0000000080005e4c <sbi_ecall_base_handler>:
    80005e4c:	4799                	li	a5,6
    80005e4e:	08c7eb63          	bltu	a5,a2,80005ee4 <sbi_ecall_base_handler+0x98>
    80005e52:	00007597          	auipc	a1,0x7
    80005e56:	b0658593          	addi	a1,a1,-1274 # 8000c958 <platform_ops+0x2a0>
    80005e5a:	00261793          	slli	a5,a2,0x2
    80005e5e:	97ae                	add	a5,a5,a1
    80005e60:	439c                	lw	a5,0(a5)
    80005e62:	97ae                	add	a5,a5,a1
    80005e64:	8782                	jr	a5
    80005e66:	f12027f3          	csrr	a5,marchid
    80005e6a:	4501                	li	a0,0
    80005e6c:	e31c                	sd	a5,0(a4)
    80005e6e:	8082                	ret
    80005e70:	f13027f3          	csrr	a5,mimpid
    80005e74:	4501                	li	a0,0
    80005e76:	e31c                	sd	a5,0(a4)
    80005e78:	8082                	ret
    80005e7a:	4789                	li	a5,2
    80005e7c:	e31c                	sd	a5,0(a4)
    80005e7e:	4501                	li	a0,0
    80005e80:	8082                	ret
    80005e82:	4785                	li	a5,1
    80005e84:	e31c                	sd	a5,0(a4)
    80005e86:	4501                	li	a0,0
    80005e88:	8082                	ret
    80005e8a:	4799                	li	a5,6
    80005e8c:	e31c                	sd	a5,0(a4)
    80005e8e:	4501                	li	a0,0
    80005e90:	8082                	ret
    80005e92:	7179                	addi	sp,sp,-48
    80005e94:	f022                	sd	s0,32(sp)
    80005e96:	ec26                	sd	s1,24(sp)
    80005e98:	1800                	addi	s0,sp,48
    80005e9a:	e84a                	sd	s2,16(sp)
    80005e9c:	f406                	sd	ra,40(sp)
    80005e9e:	0006b903          	ld	s2,0(a3)
    80005ea2:	84aa                	mv	s1,a0
    80005ea4:	fce43c23          	sd	a4,-40(s0)
    80005ea8:	854a                	mv	a0,s2
    80005eaa:	f0eff0ef          	jal	ra,800055b8 <sbi_ecall_find_extension>
    80005eae:	fd843703          	ld	a4,-40(s0)
    80005eb2:	c515                	beqz	a0,80005ede <sbi_ecall_base_handler+0x92>
    80005eb4:	711c                	ld	a5,32(a0)
    80005eb6:	c385                	beqz	a5,80005ed6 <sbi_ecall_base_handler+0x8a>
    80005eb8:	863a                	mv	a2,a4
    80005eba:	85ca                	mv	a1,s2
    80005ebc:	8526                	mv	a0,s1
    80005ebe:	9782                	jalr	a5
    80005ec0:	70a2                	ld	ra,40(sp)
    80005ec2:	7402                	ld	s0,32(sp)
    80005ec4:	64e2                	ld	s1,24(sp)
    80005ec6:	6942                	ld	s2,16(sp)
    80005ec8:	6145                	addi	sp,sp,48
    80005eca:	8082                	ret
    80005ecc:	f11027f3          	csrr	a5,mvendorid
    80005ed0:	4501                	li	a0,0
    80005ed2:	e31c                	sd	a5,0(a4)
    80005ed4:	8082                	ret
    80005ed6:	4785                	li	a5,1
    80005ed8:	e31c                	sd	a5,0(a4)
    80005eda:	4501                	li	a0,0
    80005edc:	b7d5                	j	80005ec0 <sbi_ecall_base_handler+0x74>
    80005ede:	00073023          	sd	zero,0(a4)
    80005ee2:	bff9                	j	80005ec0 <sbi_ecall_base_handler+0x74>
    80005ee4:	5579                	li	a0,-2
    80005ee6:	8082                	ret

0000000080005ee8 <sbi_ecall_legacy_handler>:
    80005ee8:	711d                	addi	sp,sp,-96
    80005eea:	e8a2                	sd	s0,80(sp)
    80005eec:	e4a6                	sd	s1,72(sp)
    80005eee:	e0ca                	sd	s2,64(sp)
    80005ef0:	fc4e                	sd	s3,56(sp)
    80005ef2:	f852                	sd	s4,48(sp)
    80005ef4:	ec86                	sd	ra,88(sp)
    80005ef6:	1080                	addi	s0,sp,96
    80005ef8:	89aa                	mv	s3,a0
    80005efa:	84ae                	mv	s1,a1
    80005efc:	8936                	mv	s2,a3
    80005efe:	8a3e                	mv	s4,a5
    80005f00:	67e010ef          	jal	ra,8000757e <sbi_current_hartid>
    80005f04:	4721                	li	a4,8
    80005f06:	14976963          	bltu	a4,s1,80006058 <sbi_ecall_legacy_handler+0x170>
    80005f0a:	00007697          	auipc	a3,0x7
    80005f0e:	a6a68693          	addi	a3,a3,-1430 # 8000c974 <platform_ops+0x2bc>
    80005f12:	048a                	slli	s1,s1,0x2
    80005f14:	94b6                	add	s1,s1,a3
    80005f16:	4098                	lw	a4,0(s1)
    80005f18:	0005079b          	sext.w	a5,a0
    80005f1c:	9736                	add	a4,a4,a3
    80005f1e:	8702                	jr	a4
    80005f20:	00893583          	ld	a1,8(s2)
    80005f24:	01093603          	ld	a2,16(s2)
    80005f28:	01893683          	ld	a3,24(s2)
    80005f2c:	4705                	li	a4,1
    80005f2e:	00093503          	ld	a0,0(s2)
    80005f32:	00f717b3          	sll	a5,a4,a5
    80005f36:	fab43423          	sd	a1,-88(s0)
    80005f3a:	fac43823          	sd	a2,-80(s0)
    80005f3e:	fad43c23          	sd	a3,-72(s0)
    80005f42:	fce43023          	sd	a4,-64(s0)
    80005f46:	fcf43423          	sd	a5,-56(s0)
    80005f4a:	c14d                	beqz	a0,80005fec <sbi_ecall_legacy_handler+0x104>
    80005f4c:	8652                	mv	a2,s4
    80005f4e:	85ce                	mv	a1,s3
    80005f50:	7f7020ef          	jal	ra,80008f46 <sbi_load_ulong>
    80005f54:	008a3783          	ld	a5,8(s4)
    80005f58:	0e079e63          	bnez	a5,80006054 <sbi_ecall_legacy_handler+0x16c>
    80005f5c:	85aa                	mv	a1,a0
    80005f5e:	fa840693          	addi	a3,s0,-88
    80005f62:	4601                	li	a2,0
    80005f64:	854e                	mv	a0,s3
    80005f66:	8d9fc0ef          	jal	ra,8000283e <sbi_tlb_request>
    80005f6a:	60e6                	ld	ra,88(sp)
    80005f6c:	6446                	ld	s0,80(sp)
    80005f6e:	64a6                	ld	s1,72(sp)
    80005f70:	6906                	ld	s2,64(sp)
    80005f72:	79e2                	ld	s3,56(sp)
    80005f74:	7a42                	ld	s4,48(sp)
    80005f76:	6125                	addi	sp,sp,96
    80005f78:	8082                	ret
    80005f7a:	00093583          	ld	a1,0(s2)
    80005f7e:	854e                	mv	a0,s3
    80005f80:	8d0fc0ef          	jal	ra,80002050 <sbi_timer_event_start>
    80005f84:	60e6                	ld	ra,88(sp)
    80005f86:	6446                	ld	s0,80(sp)
    80005f88:	64a6                	ld	s1,72(sp)
    80005f8a:	6906                	ld	s2,64(sp)
    80005f8c:	79e2                	ld	s3,56(sp)
    80005f8e:	7a42                	ld	s4,48(sp)
    80005f90:	4501                	li	a0,0
    80005f92:	6125                	addi	sp,sp,96
    80005f94:	8082                	ret
    80005f96:	854e                	mv	a0,s3
    80005f98:	bf2fb0ef          	jal	ra,8000138a <sbi_ipi_clear_smode>
    80005f9c:	60e6                	ld	ra,88(sp)
    80005f9e:	6446                	ld	s0,80(sp)
    80005fa0:	64a6                	ld	s1,72(sp)
    80005fa2:	6906                	ld	s2,64(sp)
    80005fa4:	79e2                	ld	s3,56(sp)
    80005fa6:	7a42                	ld	s4,48(sp)
    80005fa8:	4501                	li	a0,0
    80005faa:	6125                	addi	sp,sp,96
    80005fac:	8082                	ret
    80005fae:	00093503          	ld	a0,0(s2)
    80005fb2:	cd51                	beqz	a0,8000604e <sbi_ecall_legacy_handler+0x166>
    80005fb4:	8652                	mv	a2,s4
    80005fb6:	85ce                	mv	a1,s3
    80005fb8:	78f020ef          	jal	ra,80008f46 <sbi_load_ulong>
    80005fbc:	008a3783          	ld	a5,8(s4)
    80005fc0:	ebd1                	bnez	a5,80006054 <sbi_ecall_legacy_handler+0x16c>
    80005fc2:	85aa                	mv	a1,a0
    80005fc4:	4601                	li	a2,0
    80005fc6:	854e                	mv	a0,s3
    80005fc8:	ba4fb0ef          	jal	ra,8000136c <sbi_ipi_send_smode>
    80005fcc:	bf79                	j	80005f6a <sbi_ecall_legacy_handler+0x82>
    80005fce:	4705                	li	a4,1
    80005fd0:	00093503          	ld	a0,0(s2)
    80005fd4:	00f717b3          	sll	a5,a4,a5
    80005fd8:	4719                	li	a4,6
    80005fda:	fa043423          	sd	zero,-88(s0)
    80005fde:	fa043823          	sd	zero,-80(s0)
    80005fe2:	fce43023          	sd	a4,-64(s0)
    80005fe6:	fcf43423          	sd	a5,-56(s0)
    80005fea:	f12d                	bnez	a0,80005f4c <sbi_ecall_legacy_handler+0x64>
    80005fec:	555010ef          	jal	ra,80007d40 <sbi_hart_available_mask>
    80005ff0:	b7b5                	j	80005f5c <sbi_ecall_legacy_handler+0x74>
    80005ff2:	00893603          	ld	a2,8(s2)
    80005ff6:	01093683          	ld	a3,16(s2)
    80005ffa:	4705                	li	a4,1
    80005ffc:	00093503          	ld	a0,0(s2)
    80006000:	00f717b3          	sll	a5,a4,a5
    80006004:	fac43423          	sd	a2,-88(s0)
    80006008:	fad43823          	sd	a3,-80(s0)
    8000600c:	fc043023          	sd	zero,-64(s0)
    80006010:	fcf43423          	sd	a5,-56(s0)
    80006014:	fd05                	bnez	a0,80005f4c <sbi_ecall_legacy_handler+0x64>
    80006016:	bfd9                	j	80005fec <sbi_ecall_legacy_handler+0x104>
    80006018:	00094503          	lbu	a0,0(s2)
    8000601c:	991fe0ef          	jal	ra,800049ac <sbi_putc>
    80006020:	60e6                	ld	ra,88(sp)
    80006022:	6446                	ld	s0,80(sp)
    80006024:	64a6                	ld	s1,72(sp)
    80006026:	6906                	ld	s2,64(sp)
    80006028:	79e2                	ld	s3,56(sp)
    8000602a:	7a42                	ld	s4,48(sp)
    8000602c:	4501                	li	a0,0
    8000602e:	6125                	addi	sp,sp,96
    80006030:	8082                	ret
    80006032:	8d3fe0ef          	jal	ra,80004904 <sbi_getc>
    80006036:	60e6                	ld	ra,88(sp)
    80006038:	6446                	ld	s0,80(sp)
    8000603a:	64a6                	ld	s1,72(sp)
    8000603c:	6906                	ld	s2,64(sp)
    8000603e:	79e2                	ld	s3,56(sp)
    80006040:	7a42                	ld	s4,48(sp)
    80006042:	6125                	addi	sp,sp,96
    80006044:	8082                	ret
    80006046:	4581                	li	a1,0
    80006048:	854e                	mv	a0,s3
    8000604a:	cb9fb0ef          	jal	ra,80001d02 <sbi_system_shutdown>
    8000604e:	4f3010ef          	jal	ra,80007d40 <sbi_hart_available_mask>
    80006052:	bf85                	j	80005fc2 <sbi_ecall_legacy_handler+0xda>
    80006054:	554d                	li	a0,-13
    80006056:	bf11                	j	80005f6a <sbi_ecall_legacy_handler+0x82>
    80006058:	5579                	li	a0,-2
    8000605a:	bf01                	j	80005f6a <sbi_ecall_legacy_handler+0x82>

000000008000605c <sbi_ecall_time_handler>:
    8000605c:	ee09                	bnez	a2,80006076 <sbi_ecall_time_handler+0x1a>
    8000605e:	1141                	addi	sp,sp,-16
    80006060:	e022                	sd	s0,0(sp)
    80006062:	e406                	sd	ra,8(sp)
    80006064:	0800                	addi	s0,sp,16
    80006066:	628c                	ld	a1,0(a3)
    80006068:	fe9fb0ef          	jal	ra,80002050 <sbi_timer_event_start>
    8000606c:	60a2                	ld	ra,8(sp)
    8000606e:	6402                	ld	s0,0(sp)
    80006070:	4501                	li	a0,0
    80006072:	0141                	addi	sp,sp,16
    80006074:	8082                	ret
    80006076:	5579                	li	a0,-2
    80006078:	8082                	ret

000000008000607a <sbi_ecall_rfence_handler>:
    8000607a:	711d                	addi	sp,sp,-96
    8000607c:	e8a2                	sd	s0,80(sp)
    8000607e:	e4a6                	sd	s1,72(sp)
    80006080:	e0ca                	sd	s2,64(sp)
    80006082:	fc4e                	sd	s3,56(sp)
    80006084:	f852                	sd	s4,48(sp)
    80006086:	ec86                	sd	ra,88(sp)
    80006088:	1080                	addi	s0,sp,96
    8000608a:	84b2                	mv	s1,a2
    8000608c:	8936                	mv	s2,a3
    8000608e:	89aa                	mv	s3,a0
    80006090:	4ee010ef          	jal	ra,8000757e <sbi_current_hartid>
    80006094:	ffd48693          	addi	a3,s1,-3
    80006098:	470d                	li	a4,3
    8000609a:	00050a1b          	sext.w	s4,a0
    8000609e:	00d77e63          	bgeu	a4,a3,800060ba <sbi_ecall_rfence_handler+0x40>
    800060a2:	4799                	li	a5,6
    800060a4:	0297e063          	bltu	a5,s1,800060c4 <sbi_ecall_rfence_handler+0x4a>
    800060a8:	00007717          	auipc	a4,0x7
    800060ac:	8f070713          	addi	a4,a4,-1808 # 8000c998 <platform_ops+0x2e0>
    800060b0:	048a                	slli	s1,s1,0x2
    800060b2:	94ba                	add	s1,s1,a4
    800060b4:	409c                	lw	a5,0(s1)
    800060b6:	97ba                	add	a5,a5,a4
    800060b8:	8782                	jr	a5
    800060ba:	04800513          	li	a0,72
    800060be:	8d6fe0ef          	jal	ra,80004194 <misa_extension_imp>
    800060c2:	f165                	bnez	a0,800060a2 <sbi_ecall_rfence_handler+0x28>
    800060c4:	5579                	li	a0,-2
    800060c6:	a815                	j	800060fa <sbi_ecall_rfence_handler+0x80>
    800060c8:	01893703          	ld	a4,24(s2)
    800060cc:	01093803          	ld	a6,16(s2)
    800060d0:	00893603          	ld	a2,8(s2)
    800060d4:	00093583          	ld	a1,0(s2)
    800060d8:	4785                	li	a5,1
    800060da:	014797b3          	sll	a5,a5,s4
    800060de:	fae43823          	sd	a4,-80(s0)
    800060e2:	fa840693          	addi	a3,s0,-88
    800060e6:	4711                	li	a4,4
    800060e8:	854e                	mv	a0,s3
    800060ea:	fb043423          	sd	a6,-88(s0)
    800060ee:	fce43023          	sd	a4,-64(s0)
    800060f2:	fcf43423          	sd	a5,-56(s0)
    800060f6:	f48fc0ef          	jal	ra,8000283e <sbi_tlb_request>
    800060fa:	60e6                	ld	ra,88(sp)
    800060fc:	6446                	ld	s0,80(sp)
    800060fe:	64a6                	ld	s1,72(sp)
    80006100:	6906                	ld	s2,64(sp)
    80006102:	79e2                	ld	s3,56(sp)
    80006104:	7a42                	ld	s4,48(sp)
    80006106:	6125                	addi	sp,sp,96
    80006108:	8082                	ret
    8000610a:	02093703          	ld	a4,32(s2)
    8000610e:	01093883          	ld	a7,16(s2)
    80006112:	01893803          	ld	a6,24(s2)
    80006116:	00893603          	ld	a2,8(s2)
    8000611a:	00093583          	ld	a1,0(s2)
    8000611e:	4785                	li	a5,1
    80006120:	014797b3          	sll	a5,a5,s4
    80006124:	fae43c23          	sd	a4,-72(s0)
    80006128:	fa840693          	addi	a3,s0,-88
    8000612c:	854e                	mv	a0,s3
    8000612e:	4715                	li	a4,5
    80006130:	fb143423          	sd	a7,-88(s0)
    80006134:	fb043823          	sd	a6,-80(s0)
    80006138:	fce43023          	sd	a4,-64(s0)
    8000613c:	fcf43423          	sd	a5,-56(s0)
    80006140:	efefc0ef          	jal	ra,8000283e <sbi_tlb_request>
    80006144:	60e6                	ld	ra,88(sp)
    80006146:	6446                	ld	s0,80(sp)
    80006148:	64a6                	ld	s1,72(sp)
    8000614a:	6906                	ld	s2,64(sp)
    8000614c:	79e2                	ld	s3,56(sp)
    8000614e:	7a42                	ld	s4,48(sp)
    80006150:	6125                	addi	sp,sp,96
    80006152:	8082                	ret
    80006154:	00893603          	ld	a2,8(s2)
    80006158:	00093583          	ld	a1,0(s2)
    8000615c:	4785                	li	a5,1
    8000615e:	014797b3          	sll	a5,a5,s4
    80006162:	fa840693          	addi	a3,s0,-88
    80006166:	854e                	mv	a0,s3
    80006168:	4719                	li	a4,6
    8000616a:	fa043423          	sd	zero,-88(s0)
    8000616e:	fa043823          	sd	zero,-80(s0)
    80006172:	fce43023          	sd	a4,-64(s0)
    80006176:	fcf43423          	sd	a5,-56(s0)
    8000617a:	ec4fc0ef          	jal	ra,8000283e <sbi_tlb_request>
    8000617e:	60e6                	ld	ra,88(sp)
    80006180:	6446                	ld	s0,80(sp)
    80006182:	64a6                	ld	s1,72(sp)
    80006184:	6906                	ld	s2,64(sp)
    80006186:	79e2                	ld	s3,56(sp)
    80006188:	7a42                	ld	s4,48(sp)
    8000618a:	6125                	addi	sp,sp,96
    8000618c:	8082                	ret
    8000618e:	01093803          	ld	a6,16(s2)
    80006192:	01893703          	ld	a4,24(s2)
    80006196:	00893603          	ld	a2,8(s2)
    8000619a:	00093583          	ld	a1,0(s2)
    8000619e:	4785                	li	a5,1
    800061a0:	014797b3          	sll	a5,a5,s4
    800061a4:	fa840693          	addi	a3,s0,-88
    800061a8:	854e                	mv	a0,s3
    800061aa:	fb043423          	sd	a6,-88(s0)
    800061ae:	fae43823          	sd	a4,-80(s0)
    800061b2:	fc043023          	sd	zero,-64(s0)
    800061b6:	fcf43423          	sd	a5,-56(s0)
    800061ba:	e84fc0ef          	jal	ra,8000283e <sbi_tlb_request>
    800061be:	60e6                	ld	ra,88(sp)
    800061c0:	6446                	ld	s0,80(sp)
    800061c2:	64a6                	ld	s1,72(sp)
    800061c4:	6906                	ld	s2,64(sp)
    800061c6:	79e2                	ld	s3,56(sp)
    800061c8:	7a42                	ld	s4,48(sp)
    800061ca:	6125                	addi	sp,sp,96
    800061cc:	8082                	ret
    800061ce:	01093303          	ld	t1,16(s2)
    800061d2:	01893883          	ld	a7,24(s2)
    800061d6:	02093803          	ld	a6,32(s2)
    800061da:	00893603          	ld	a2,8(s2)
    800061de:	00093583          	ld	a1,0(s2)
    800061e2:	4705                	li	a4,1
    800061e4:	014717b3          	sll	a5,a4,s4
    800061e8:	fa840693          	addi	a3,s0,-88
    800061ec:	854e                	mv	a0,s3
    800061ee:	fa643423          	sd	t1,-88(s0)
    800061f2:	fb143823          	sd	a7,-80(s0)
    800061f6:	fb043c23          	sd	a6,-72(s0)
    800061fa:	fce43023          	sd	a4,-64(s0)
    800061fe:	fcf43423          	sd	a5,-56(s0)
    80006202:	e3cfc0ef          	jal	ra,8000283e <sbi_tlb_request>
    80006206:	60e6                	ld	ra,88(sp)
    80006208:	6446                	ld	s0,80(sp)
    8000620a:	64a6                	ld	s1,72(sp)
    8000620c:	6906                	ld	s2,64(sp)
    8000620e:	79e2                	ld	s3,56(sp)
    80006210:	7a42                	ld	s4,48(sp)
    80006212:	6125                	addi	sp,sp,96
    80006214:	8082                	ret
    80006216:	01893703          	ld	a4,24(s2)
    8000621a:	01093803          	ld	a6,16(s2)
    8000621e:	00893603          	ld	a2,8(s2)
    80006222:	00093583          	ld	a1,0(s2)
    80006226:	4785                	li	a5,1
    80006228:	014797b3          	sll	a5,a5,s4
    8000622c:	fae43823          	sd	a4,-80(s0)
    80006230:	fa840693          	addi	a3,s0,-88
    80006234:	854e                	mv	a0,s3
    80006236:	4709                	li	a4,2
    80006238:	fb043423          	sd	a6,-88(s0)
    8000623c:	fce43023          	sd	a4,-64(s0)
    80006240:	fcf43423          	sd	a5,-56(s0)
    80006244:	dfafc0ef          	jal	ra,8000283e <sbi_tlb_request>
    80006248:	60e6                	ld	ra,88(sp)
    8000624a:	6446                	ld	s0,80(sp)
    8000624c:	64a6                	ld	s1,72(sp)
    8000624e:	6906                	ld	s2,64(sp)
    80006250:	79e2                	ld	s3,56(sp)
    80006252:	7a42                	ld	s4,48(sp)
    80006254:	6125                	addi	sp,sp,96
    80006256:	8082                	ret
    80006258:	02093703          	ld	a4,32(s2)
    8000625c:	01093883          	ld	a7,16(s2)
    80006260:	01893803          	ld	a6,24(s2)
    80006264:	00893603          	ld	a2,8(s2)
    80006268:	00093583          	ld	a1,0(s2)
    8000626c:	4785                	li	a5,1
    8000626e:	014797b3          	sll	a5,a5,s4
    80006272:	fae43c23          	sd	a4,-72(s0)
    80006276:	fa840693          	addi	a3,s0,-88
    8000627a:	854e                	mv	a0,s3
    8000627c:	470d                	li	a4,3
    8000627e:	fb143423          	sd	a7,-88(s0)
    80006282:	fb043823          	sd	a6,-80(s0)
    80006286:	fce43023          	sd	a4,-64(s0)
    8000628a:	fcf43423          	sd	a5,-56(s0)
    8000628e:	db0fc0ef          	jal	ra,8000283e <sbi_tlb_request>
    80006292:	60e6                	ld	ra,88(sp)
    80006294:	6446                	ld	s0,80(sp)
    80006296:	64a6                	ld	s1,72(sp)
    80006298:	6906                	ld	s2,64(sp)
    8000629a:	79e2                	ld	s3,56(sp)
    8000629c:	7a42                	ld	s4,48(sp)
    8000629e:	6125                	addi	sp,sp,96
    800062a0:	8082                	ret

00000000800062a2 <sbi_ecall_ipi_handler>:
    800062a2:	ee09                	bnez	a2,800062bc <sbi_ecall_ipi_handler+0x1a>
    800062a4:	1141                	addi	sp,sp,-16
    800062a6:	e022                	sd	s0,0(sp)
    800062a8:	e406                	sd	ra,8(sp)
    800062aa:	0800                	addi	s0,sp,16
    800062ac:	6690                	ld	a2,8(a3)
    800062ae:	628c                	ld	a1,0(a3)
    800062b0:	8bcfb0ef          	jal	ra,8000136c <sbi_ipi_send_smode>
    800062b4:	60a2                	ld	ra,8(sp)
    800062b6:	6402                	ld	s0,0(sp)
    800062b8:	0141                	addi	sp,sp,16
    800062ba:	8082                	ret
    800062bc:	5579                	li	a0,-2
    800062be:	8082                	ret

00000000800062c0 <sbi_ecall_srst_handler>:
    800062c0:	1141                	addi	sp,sp,-16
    800062c2:	e022                	sd	s0,0(sp)
    800062c4:	e406                	sd	ra,8(sp)
    800062c6:	0800                	addi	s0,sp,16
    800062c8:	629c                	ld	a5,0(a3)
    800062ca:	872a                	mv	a4,a0
    800062cc:	ef99                	bnez	a5,800062ea <sbi_ecall_srst_handler+0x2a>
    800062ce:	669c                	ld	a5,8(a3)
    800062d0:	c395                	beqz	a5,800062f4 <sbi_ecall_srst_handler+0x34>
    800062d2:	17fd                	addi	a5,a5,-1
    800062d4:	4605                	li	a2,1
    800062d6:	00f66563          	bltu	a2,a5,800062e0 <sbi_ecall_srst_handler+0x20>
    800062da:	6a8c                	ld	a1,16(a3)
    800062dc:	00b67863          	bgeu	a2,a1,800062ec <sbi_ecall_srst_handler+0x2c>
    800062e0:	60a2                	ld	ra,8(sp)
    800062e2:	6402                	ld	s0,0(sp)
    800062e4:	5579                	li	a0,-2
    800062e6:	0141                	addi	sp,sp,16
    800062e8:	8082                	ret
    800062ea:	6a8c                	ld	a1,16(a3)
    800062ec:	2581                	sext.w	a1,a1
    800062ee:	853a                	mv	a0,a4
    800062f0:	911fb0ef          	jal	ra,80001c00 <sbi_system_reboot>
    800062f4:	4581                	li	a1,0
    800062f6:	a0dfb0ef          	jal	ra,80001d02 <sbi_system_shutdown>

00000000800062fa <sbi_ecall_vendor_probe>:
    800062fa:	1101                	addi	sp,sp,-32
    800062fc:	e822                	sd	s0,16(sp)
    800062fe:	e426                	sd	s1,8(sp)
    80006300:	ec06                	sd	ra,24(sp)
    80006302:	1000                	addi	s0,sp,32
    80006304:	03154783          	lbu	a5,49(a0)
    80006308:	03054703          	lbu	a4,48(a0)
    8000630c:	03254303          	lbu	t1,50(a0)
    80006310:	03354883          	lbu	a7,51(a0)
    80006314:	03454803          	lbu	a6,52(a0)
    80006318:	07a2                	slli	a5,a5,0x8
    8000631a:	8fd9                	or	a5,a5,a4
    8000631c:	03554683          	lbu	a3,53(a0)
    80006320:	0342                	slli	t1,t1,0x10
    80006322:	03654703          	lbu	a4,54(a0)
    80006326:	00f36333          	or	t1,t1,a5
    8000632a:	08e2                	slli	a7,a7,0x18
    8000632c:	03754783          	lbu	a5,55(a0)
    80006330:	0068e8b3          	or	a7,a7,t1
    80006334:	02081513          	slli	a0,a6,0x20
    80006338:	01156833          	or	a6,a0,a7
    8000633c:	02869513          	slli	a0,a3,0x28
    80006340:	01056533          	or	a0,a0,a6
    80006344:	1742                	slli	a4,a4,0x30
    80006346:	8f49                	or	a4,a4,a0
    80006348:	17e2                	slli	a5,a5,0x38
    8000634a:	8fd9                	or	a5,a5,a4
    8000634c:	84b2                	mv	s1,a2
    8000634e:	cfc1                	beqz	a5,800063e6 <sbi_ecall_vendor_probe+0xec>
    80006350:	0617c883          	lbu	a7,97(a5)
    80006354:	0607c703          	lbu	a4,96(a5)
    80006358:	0627c803          	lbu	a6,98(a5)
    8000635c:	852e                	mv	a0,a1
    8000635e:	0637c583          	lbu	a1,99(a5)
    80006362:	0647c603          	lbu	a2,100(a5)
    80006366:	08a2                	slli	a7,a7,0x8
    80006368:	00e8e8b3          	or	a7,a7,a4
    8000636c:	0657c683          	lbu	a3,101(a5)
    80006370:	0842                	slli	a6,a6,0x10
    80006372:	01186833          	or	a6,a6,a7
    80006376:	0667c703          	lbu	a4,102(a5)
    8000637a:	05e2                	slli	a1,a1,0x18
    8000637c:	0105e5b3          	or	a1,a1,a6
    80006380:	0677c783          	lbu	a5,103(a5)
    80006384:	1602                	slli	a2,a2,0x20
    80006386:	8e4d                	or	a2,a2,a1
    80006388:	16a2                	slli	a3,a3,0x28
    8000638a:	8ed1                	or	a3,a3,a2
    8000638c:	1742                	slli	a4,a4,0x30
    8000638e:	8f55                	or	a4,a4,a3
    80006390:	17e2                	slli	a5,a5,0x38
    80006392:	8fd9                	or	a5,a5,a4
    80006394:	0c97c703          	lbu	a4,201(a5)
    80006398:	0c87c683          	lbu	a3,200(a5)
    8000639c:	0ca7ce03          	lbu	t3,202(a5)
    800063a0:	0cb7c303          	lbu	t1,203(a5)
    800063a4:	0cc7c883          	lbu	a7,204(a5)
    800063a8:	0722                	slli	a4,a4,0x8
    800063aa:	0cd7c803          	lbu	a6,205(a5)
    800063ae:	8f55                	or	a4,a4,a3
    800063b0:	0e42                	slli	t3,t3,0x10
    800063b2:	0ce7c683          	lbu	a3,206(a5)
    800063b6:	00ee6e33          	or	t3,t3,a4
    800063ba:	0362                	slli	t1,t1,0x18
    800063bc:	0cf7c703          	lbu	a4,207(a5)
    800063c0:	1882                	slli	a7,a7,0x20
    800063c2:	01c367b3          	or	a5,t1,t3
    800063c6:	00f8e8b3          	or	a7,a7,a5
    800063ca:	02881793          	slli	a5,a6,0x28
    800063ce:	0117e833          	or	a6,a5,a7
    800063d2:	03069793          	slli	a5,a3,0x30
    800063d6:	0107e7b3          	or	a5,a5,a6
    800063da:	1762                	slli	a4,a4,0x38
    800063dc:	8f5d                	or	a4,a4,a5
    800063de:	4781                	li	a5,0
    800063e0:	c319                	beqz	a4,800063e6 <sbi_ecall_vendor_probe+0xec>
    800063e2:	9702                	jalr	a4
    800063e4:	87aa                	mv	a5,a0
    800063e6:	e09c                	sd	a5,0(s1)
    800063e8:	60e2                	ld	ra,24(sp)
    800063ea:	6442                	ld	s0,16(sp)
    800063ec:	64a2                	ld	s1,8(sp)
    800063ee:	4501                	li	a0,0
    800063f0:	6105                	addi	sp,sp,32
    800063f2:	8082                	ret

00000000800063f4 <sbi_ecall_vendor_handler>:
    800063f4:	03154803          	lbu	a6,49(a0)
    800063f8:	03054883          	lbu	a7,48(a0)
    800063fc:	03254f03          	lbu	t5,50(a0)
    80006400:	03354e83          	lbu	t4,51(a0)
    80006404:	03454e03          	lbu	t3,52(a0)
    80006408:	0822                	slli	a6,a6,0x8
    8000640a:	01186833          	or	a6,a6,a7
    8000640e:	03554303          	lbu	t1,53(a0)
    80006412:	0f42                	slli	t5,t5,0x10
    80006414:	03654883          	lbu	a7,54(a0)
    80006418:	010f6f33          	or	t5,t5,a6
    8000641c:	0ee2                	slli	t4,t4,0x18
    8000641e:	03754803          	lbu	a6,55(a0)
    80006422:	01eeeeb3          	or	t4,t4,t5
    80006426:	020e1513          	slli	a0,t3,0x20
    8000642a:	01d56e33          	or	t3,a0,t4
    8000642e:	02831513          	slli	a0,t1,0x28
    80006432:	01c56533          	or	a0,a0,t3
    80006436:	18c2                	slli	a7,a7,0x30
    80006438:	00a8e8b3          	or	a7,a7,a0
    8000643c:	1862                	slli	a6,a6,0x38
    8000643e:	01186833          	or	a6,a6,a7
    80006442:	0a080c63          	beqz	a6,800064fa <sbi_ecall_vendor_handler+0x106>
    80006446:	06184f03          	lbu	t5,97(a6)
    8000644a:	06284e83          	lbu	t4,98(a6)
    8000644e:	852e                	mv	a0,a1
    80006450:	85b2                	mv	a1,a2
    80006452:	8636                	mv	a2,a3
    80006454:	86ba                	mv	a3,a4
    80006456:	873e                	mv	a4,a5
    80006458:	06084783          	lbu	a5,96(a6)
    8000645c:	06384e03          	lbu	t3,99(a6)
    80006460:	06484303          	lbu	t1,100(a6)
    80006464:	0f22                	slli	t5,t5,0x8
    80006466:	00ff6f33          	or	t5,t5,a5
    8000646a:	06584883          	lbu	a7,101(a6)
    8000646e:	0ec2                	slli	t4,t4,0x10
    80006470:	01eeeeb3          	or	t4,t4,t5
    80006474:	06684783          	lbu	a5,102(a6)
    80006478:	0e62                	slli	t3,t3,0x18
    8000647a:	01de6e33          	or	t3,t3,t4
    8000647e:	06784803          	lbu	a6,103(a6)
    80006482:	1302                	slli	t1,t1,0x20
    80006484:	01c36333          	or	t1,t1,t3
    80006488:	18a2                	slli	a7,a7,0x28
    8000648a:	0068e8b3          	or	a7,a7,t1
    8000648e:	17c2                	slli	a5,a5,0x30
    80006490:	0117e7b3          	or	a5,a5,a7
    80006494:	1862                	slli	a6,a6,0x38
    80006496:	00f86833          	or	a6,a6,a5
    8000649a:	0d184783          	lbu	a5,209(a6)
    8000649e:	0d084883          	lbu	a7,208(a6)
    800064a2:	0d284f03          	lbu	t5,210(a6)
    800064a6:	0d384e83          	lbu	t4,211(a6)
    800064aa:	0d484e03          	lbu	t3,212(a6)
    800064ae:	07a2                	slli	a5,a5,0x8
    800064b0:	0d584303          	lbu	t1,213(a6)
    800064b4:	0117e7b3          	or	a5,a5,a7
    800064b8:	0f42                	slli	t5,t5,0x10
    800064ba:	0d684883          	lbu	a7,214(a6)
    800064be:	00ff6f33          	or	t5,t5,a5
    800064c2:	0ee2                	slli	t4,t4,0x18
    800064c4:	0d784803          	lbu	a6,215(a6)
    800064c8:	01eeeeb3          	or	t4,t4,t5
    800064cc:	1e02                	slli	t3,t3,0x20
    800064ce:	01de6e33          	or	t3,t3,t4
    800064d2:	1322                	slli	t1,t1,0x28
    800064d4:	01c36333          	or	t1,t1,t3
    800064d8:	18c2                	slli	a7,a7,0x30
    800064da:	0068e8b3          	or	a7,a7,t1
    800064de:	1862                	slli	a6,a6,0x38
    800064e0:	01186833          	or	a6,a6,a7
    800064e4:	00080b63          	beqz	a6,800064fa <sbi_ecall_vendor_handler+0x106>
    800064e8:	1141                	addi	sp,sp,-16
    800064ea:	e022                	sd	s0,0(sp)
    800064ec:	e406                	sd	ra,8(sp)
    800064ee:	0800                	addi	s0,sp,16
    800064f0:	9802                	jalr	a6
    800064f2:	60a2                	ld	ra,8(sp)
    800064f4:	6402                	ld	s0,0(sp)
    800064f6:	0141                	addi	sp,sp,16
    800064f8:	8082                	ret
    800064fa:	5579                	li	a0,-2
    800064fc:	8082                	ret

00000000800064fe <sbi_ecall_ebi_handler>:
    800064fe:	7139                	addi	sp,sp,-64
    80006500:	f822                	sd	s0,48(sp)
    80006502:	f426                	sd	s1,40(sp)
    80006504:	fc06                	sd	ra,56(sp)
    80006506:	f04a                	sd	s2,32(sp)
    80006508:	ec4e                	sd	s3,24(sp)
    8000650a:	0080                	addi	s0,sp,64
    8000650c:	84b6                	mv	s1,a3
    8000650e:	f14029f3          	csrr	s3,mhartid
    80006512:	34102973          	csrr	s2,mepc
    80006516:	18f00713          	li	a4,399
    8000651a:	04e60563          	beq	a2,a4,80006564 <sbi_ecall_ebi_handler+0x66>
    8000651e:	19000793          	li	a5,400
    80006522:	02f61963          	bne	a2,a5,80006554 <sbi_ecall_ebi_handler+0x56>
    80006526:	00006517          	auipc	a0,0x6
    8000652a:	5da50513          	addi	a0,a0,1498 # 8000cb00 <platform_ops+0x448>
    8000652e:	ef1fe0ef          	jal	ra,8000541e <sbi_printf>
    80006532:	85ca                	mv	a1,s2
    80006534:	8526                	mv	a0,s1
    80006536:	718000ef          	jal	ra,80006c4e <enter_enclave>
    8000653a:	00006517          	auipc	a0,0x6
    8000653e:	5e650513          	addi	a0,a0,1510 # 8000cb20 <platform_ops+0x468>
    80006542:	eddfe0ef          	jal	ra,8000541e <sbi_printf>
    80006546:	648c                	ld	a1,8(s1)
    80006548:	00006517          	auipc	a0,0x6
    8000654c:	61050513          	addi	a0,a0,1552 # 8000cb58 <platform_ops+0x4a0>
    80006550:	ecffe0ef          	jal	ra,8000541e <sbi_printf>
    80006554:	70e2                	ld	ra,56(sp)
    80006556:	7442                	ld	s0,48(sp)
    80006558:	74a2                	ld	s1,40(sp)
    8000655a:	7902                	ld	s2,32(sp)
    8000655c:	69e2                	ld	s3,24(sp)
    8000655e:	4501                	li	a0,0
    80006560:	6121                	addi	sp,sp,64
    80006562:	8082                	ret
    80006564:	00006517          	auipc	a0,0x6
    80006568:	45450513          	addi	a0,a0,1108 # 8000c9b8 <platform_ops+0x300>
    8000656c:	fcb43423          	sd	a1,-56(s0)
    80006570:	eaffe0ef          	jal	ra,8000541e <sbi_printf>
    80006574:	6498                	ld	a4,8(s1)
    80006576:	6094                	ld	a3,0(s1)
    80006578:	fc843583          	ld	a1,-56(s0)
    8000657c:	87ce                	mv	a5,s3
    8000657e:	18f00613          	li	a2,399
    80006582:	00006517          	auipc	a0,0x6
    80006586:	46650513          	addi	a0,a0,1126 # 8000c9e8 <platform_ops+0x330>
    8000658a:	e95fe0ef          	jal	ra,8000541e <sbi_printf>
    8000658e:	0007e617          	auipc	a2,0x7e
    80006592:	eca60613          	addi	a2,a2,-310 # 80084458 <_base_end>
    80006596:	0007a597          	auipc	a1,0x7a
    8000659a:	a6a58593          	addi	a1,a1,-1430 # 80080000 <_base_start>
    8000659e:	00006517          	auipc	a0,0x6
    800065a2:	4b250513          	addi	a0,a0,1202 # 8000ca50 <platform_ops+0x398>
    800065a6:	e79fe0ef          	jal	ra,8000541e <sbi_printf>
    800065aa:	016fa617          	auipc	a2,0x16fa
    800065ae:	a5660613          	addi	a2,a2,-1450 # 81700000 <_enclave_end>
    800065b2:	0007f597          	auipc	a1,0x7f
    800065b6:	a4e58593          	addi	a1,a1,-1458 # 80085000 <_enclave_start>
    800065ba:	00006517          	auipc	a0,0x6
    800065be:	4d650513          	addi	a0,a0,1238 # 8000ca90 <platform_ops+0x3d8>
    800065c2:	e5dfe0ef          	jal	ra,8000541e <sbi_printf>
    800065c6:	85ca                	mv	a1,s2
    800065c8:	8526                	mv	a0,s1
    800065ca:	213000ef          	jal	ra,80006fdc <create_enclave>
    800065ce:	00006517          	auipc	a0,0x6
    800065d2:	50250513          	addi	a0,a0,1282 # 8000cad0 <platform_ops+0x418>
    800065d6:	e49fe0ef          	jal	ra,8000541e <sbi_printf>
    800065da:	70e2                	ld	ra,56(sp)
    800065dc:	7442                	ld	s0,48(sp)
    800065de:	74a2                	ld	s1,40(sp)
    800065e0:	7902                	ld	s2,32(sp)
    800065e2:	69e2                	ld	s3,24(sp)
    800065e4:	4501                	li	a0,0
    800065e6:	6121                	addi	sp,sp,64
    800065e8:	8082                	ret

00000000800065ea <poweroff>:
    800065ea:	1141                	addi	sp,sp,-16
    800065ec:	e022                	sd	s0,0(sp)
    800065ee:	e406                	sd	ra,8(sp)
    800065f0:	0800                	addi	s0,sp,16
    800065f2:	00006517          	auipc	a0,0x6
    800065f6:	59650513          	addi	a0,a0,1430 # 8000cb88 <platform_ops+0x4d0>
    800065fa:	e25fe0ef          	jal	ra,8000541e <sbi_printf>
    800065fe:	60a2                	ld	ra,8(sp)
    80006600:	6402                	ld	s0,0(sp)
    80006602:	0141                	addi	sp,sp,16
    80006604:	8082                	ret

0000000080006606 <memset>:
    80006606:	1141                	addi	sp,sp,-16
    80006608:	e422                	sd	s0,8(sp)
    8000660a:	0800                	addi	s0,sp,16
    8000660c:	6422                	ld	s0,8(sp)
    8000660e:	557d                	li	a0,-1
    80006610:	0141                	addi	sp,sp,16
    80006612:	8082                	ret

0000000080006614 <atol>:
    80006614:	1141                	addi	sp,sp,-16
    80006616:	e422                	sd	s0,8(sp)
    80006618:	0800                	addi	s0,sp,16
    8000661a:	00054703          	lbu	a4,0(a0)
    8000661e:	02000693          	li	a3,32
    80006622:	87aa                	mv	a5,a0
    80006624:	00d71763          	bne	a4,a3,80006632 <atol+0x1e>
    80006628:	0017c703          	lbu	a4,1(a5)
    8000662c:	0785                	addi	a5,a5,1
    8000662e:	fed70de3          	beq	a4,a3,80006628 <atol+0x14>
    80006632:	02d00693          	li	a3,45
    80006636:	04d70563          	beq	a4,a3,80006680 <atol+0x6c>
    8000663a:	02b00693          	li	a3,43
    8000663e:	02d70863          	beq	a4,a3,8000666e <atol+0x5a>
    80006642:	0007c683          	lbu	a3,0(a5)
    80006646:	4581                	li	a1,0
    80006648:	ca85                	beqz	a3,80006678 <atol+0x64>
    8000664a:	4501                	li	a0,0
    8000664c:	0785                	addi	a5,a5,1
    8000664e:	fd06861b          	addiw	a2,a3,-48
    80006652:	00251713          	slli	a4,a0,0x2
    80006656:	0007c683          	lbu	a3,0(a5)
    8000665a:	953a                	add	a0,a0,a4
    8000665c:	0506                	slli	a0,a0,0x1
    8000665e:	9532                	add	a0,a0,a2
    80006660:	f6f5                	bnez	a3,8000664c <atol+0x38>
    80006662:	c199                	beqz	a1,80006668 <atol+0x54>
    80006664:	40a00533          	neg	a0,a0
    80006668:	6422                	ld	s0,8(sp)
    8000666a:	0141                	addi	sp,sp,16
    8000666c:	8082                	ret
    8000666e:	0017c683          	lbu	a3,1(a5)
    80006672:	4581                	li	a1,0
    80006674:	0785                	addi	a5,a5,1
    80006676:	faf1                	bnez	a3,8000664a <atol+0x36>
    80006678:	4501                	li	a0,0
    8000667a:	6422                	ld	s0,8(sp)
    8000667c:	0141                	addi	sp,sp,16
    8000667e:	8082                	ret
    80006680:	0017c683          	lbu	a3,1(a5)
    80006684:	4585                	li	a1,1
    80006686:	0785                	addi	a5,a5,1
    80006688:	f2e9                	bnez	a3,8000664a <atol+0x36>
    8000668a:	4501                	li	a0,0
    8000668c:	b7fd                	j	8000667a <atol+0x66>

000000008000668e <enclave_mem_init>:
    8000668e:	1101                	addi	sp,sp,-32
    80006690:	e426                	sd	s1,8(sp)
    80006692:	016fa617          	auipc	a2,0x16fa
    80006696:	96e60613          	addi	a2,a2,-1682 # 81700000 <_enclave_end>
    8000669a:	0007f497          	auipc	s1,0x7f
    8000669e:	96648493          	addi	s1,s1,-1690 # 80085000 <_enclave_start>
    800066a2:	e822                	sd	s0,16(sp)
    800066a4:	e04a                	sd	s2,0(sp)
    800066a6:	ec06                	sd	ra,24(sp)
    800066a8:	1000                	addi	s0,sp,32
    800066aa:	40960933          	sub	s2,a2,s1
    800066ae:	03491793          	slli	a5,s2,0x34
    800066b2:	efa1                	bnez	a5,8000670a <enclave_mem_init+0x7c>
    800066b4:	00c95613          	srli	a2,s2,0xc
    800066b8:	00009917          	auipc	s2,0x9
    800066bc:	9a890913          	addi	s2,s2,-1624 # 8000f060 <max_pages>
    800066c0:	00c93023          	sd	a2,0(s2)
    800066c4:	6789                	lui	a5,0x2
    800066c6:	08c7e363          	bltu	a5,a2,8000674c <enclave_mem_init+0xbe>
    800066ca:	0612                	slli	a2,a2,0x4
    800066cc:	4581                	li	a1,0
    800066ce:	00009517          	auipc	a0,0x9
    800066d2:	68a50513          	addi	a0,a0,1674 # 8000fd58 <pages>
    800066d6:	857fd0ef          	jal	ra,80003f2c <sbi_memset>
    800066da:	00093603          	ld	a2,0(s2)
    800066de:	00009797          	auipc	a5,0x9
    800066e2:	67a78793          	addi	a5,a5,1658 # 8000fd58 <pages>
    800066e6:	6685                	lui	a3,0x1
    800066e8:	00461713          	slli	a4,a2,0x4
    800066ec:	973e                	add	a4,a4,a5
    800066ee:	ca01                	beqz	a2,800066fe <enclave_mem_init+0x70>
    800066f0:	e384                	sd	s1,0(a5)
    800066f2:	00078423          	sb	zero,8(a5)
    800066f6:	07c1                	addi	a5,a5,16
    800066f8:	94b6                	add	s1,s1,a3
    800066fa:	fee79be3          	bne	a5,a4,800066f0 <enclave_mem_init+0x62>
    800066fe:	60e2                	ld	ra,24(sp)
    80006700:	6442                	ld	s0,16(sp)
    80006702:	64a2                	ld	s1,8(sp)
    80006704:	6902                	ld	s2,0(sp)
    80006706:	6105                	addi	sp,sp,32
    80006708:	8082                	ret
    8000670a:	07300613          	li	a2,115
    8000670e:	00006697          	auipc	a3,0x6
    80006712:	48a68693          	addi	a3,a3,1162 # 8000cb98 <platform_ops+0x4e0>
    80006716:	00006597          	auipc	a1,0x6
    8000671a:	4aa58593          	addi	a1,a1,1194 # 8000cbc0 <platform_ops+0x508>
    8000671e:	00006517          	auipc	a0,0x6
    80006722:	50a50513          	addi	a0,a0,1290 # 8000cc28 <platform_ops+0x570>
    80006726:	cf9fe0ef          	jal	ra,8000541e <sbi_printf>
    8000672a:	00006517          	auipc	a0,0x6
    8000672e:	45e50513          	addi	a0,a0,1118 # 8000cb88 <platform_ops+0x4d0>
    80006732:	cedfe0ef          	jal	ra,8000541e <sbi_printf>
    80006736:	00c95613          	srli	a2,s2,0xc
    8000673a:	00009917          	auipc	s2,0x9
    8000673e:	92690913          	addi	s2,s2,-1754 # 8000f060 <max_pages>
    80006742:	00c93023          	sd	a2,0(s2)
    80006746:	6789                	lui	a5,0x2
    80006748:	f8c7f1e3          	bgeu	a5,a2,800066ca <enclave_mem_init+0x3c>
    8000674c:	07600613          	li	a2,118
    80006750:	00006697          	auipc	a3,0x6
    80006754:	4f868693          	addi	a3,a3,1272 # 8000cc48 <platform_ops+0x590>
    80006758:	00006597          	auipc	a1,0x6
    8000675c:	46858593          	addi	a1,a1,1128 # 8000cbc0 <platform_ops+0x508>
    80006760:	00006517          	auipc	a0,0x6
    80006764:	4c850513          	addi	a0,a0,1224 # 8000cc28 <platform_ops+0x570>
    80006768:	cb7fe0ef          	jal	ra,8000541e <sbi_printf>
    8000676c:	00006517          	auipc	a0,0x6
    80006770:	41c50513          	addi	a0,a0,1052 # 8000cb88 <platform_ops+0x4d0>
    80006774:	cabfe0ef          	jal	ra,8000541e <sbi_printf>
    80006778:	00093603          	ld	a2,0(s2)
    8000677c:	b7b9                	j	800066ca <enclave_mem_init+0x3c>

000000008000677e <enclave_mem_alloc>:
    8000677e:	715d                	addi	sp,sp,-80
    80006780:	e0a2                	sd	s0,64(sp)
    80006782:	ec56                	sd	s5,24(sp)
    80006784:	e85a                	sd	s6,16(sp)
    80006786:	e486                	sd	ra,72(sp)
    80006788:	fc26                	sd	s1,56(sp)
    8000678a:	f84a                	sd	s2,48(sp)
    8000678c:	f44e                	sd	s3,40(sp)
    8000678e:	f052                	sd	s4,32(sp)
    80006790:	e45e                	sd	s7,8(sp)
    80006792:	e062                	sd	s8,0(sp)
    80006794:	0880                	addi	s0,sp,80
    80006796:	03459793          	slli	a5,a1,0x34
    8000679a:	8aae                	mv	s5,a1
    8000679c:	8b2a                	mv	s6,a0
    8000679e:	e7e9                	bnez	a5,80006868 <enclave_mem_alloc+0xea>
    800067a0:	00009597          	auipc	a1,0x9
    800067a4:	8c05b583          	ld	a1,-1856(a1) # 8000f060 <max_pages>
    800067a8:	00cad993          	srli	s3,s5,0xc
    800067ac:	c19d                	beqz	a1,800067d2 <enclave_mem_alloc+0x54>
    800067ae:	4681                	li	a3,0
    800067b0:	00009a17          	auipc	s4,0x9
    800067b4:	5a8a0a13          	addi	s4,s4,1448 # 8000fd58 <pages>
    800067b8:	4805                	li	a6,1
    800067ba:	00469913          	slli	s2,a3,0x4
    800067be:	012a07b3          	add	a5,s4,s2
    800067c2:	0087c703          	lbu	a4,8(a5) # 2008 <_fw_start-0x7fffdff8>
    800067c6:	00168793          	addi	a5,a3,1
    800067ca:	cf01                	beqz	a4,800067e2 <enclave_mem_alloc+0x64>
    800067cc:	86be                	mv	a3,a5
    800067ce:	feb6e6e3          	bltu	a3,a1,800067ba <enclave_mem_alloc+0x3c>
    800067d2:	00006517          	auipc	a0,0x6
    800067d6:	4de50513          	addi	a0,a0,1246 # 8000ccb0 <platform_ops+0x5f8>
    800067da:	c45fe0ef          	jal	ra,8000541e <sbi_printf>
    800067de:	557d                	li	a0,-1
    800067e0:	a885                	j	80006850 <enclave_mem_alloc+0xd2>
    800067e2:	03387863          	bgeu	a6,s3,80006812 <enclave_mem_alloc+0x94>
    800067e6:	02b7f863          	bgeu	a5,a1,80006816 <enclave_mem_alloc+0x98>
    800067ea:	01890713          	addi	a4,s2,24
    800067ee:	9752                	add	a4,a4,s4
    800067f0:	96ce                	add	a3,a3,s3
    800067f2:	a031                	j	800067fe <enclave_mem_alloc+0x80>
    800067f4:	02d78163          	beq	a5,a3,80006816 <enclave_mem_alloc+0x98>
    800067f8:	0741                	addi	a4,a4,16
    800067fa:	00b7fe63          	bgeu	a5,a1,80006816 <enclave_mem_alloc+0x98>
    800067fe:	00074603          	lbu	a2,0(a4)
    80006802:	853e                	mv	a0,a5
    80006804:	0785                	addi	a5,a5,1
    80006806:	d67d                	beqz	a2,800067f4 <enclave_mem_alloc+0x76>
    80006808:	00250693          	addi	a3,a0,2
    8000680c:	fab6e7e3          	bltu	a3,a1,800067ba <enclave_mem_alloc+0x3c>
    80006810:	b7c9                	j	800067d2 <enclave_mem_alloc+0x54>
    80006812:	02098163          	beqz	s3,80006834 <enclave_mem_alloc+0xb6>
    80006816:	012a04b3          	add	s1,s4,s2
    8000681a:	4b81                	li	s7,0
    8000681c:	4c05                	li	s8,1
    8000681e:	6088                	ld	a0,0(s1)
    80006820:	01848423          	sb	s8,8(s1)
    80006824:	6605                	lui	a2,0x1
    80006826:	4581                	li	a1,0
    80006828:	0b85                	addi	s7,s7,1
    8000682a:	f02fd0ef          	jal	ra,80003f2c <sbi_memset>
    8000682e:	04c1                	addi	s1,s1,16
    80006830:	ff3be7e3          	bltu	s7,s3,8000681e <enclave_mem_alloc+0xa0>
    80006834:	9952                	add	s2,s2,s4
    80006836:	00093583          	ld	a1,0(s2)
    8000683a:	00006517          	auipc	a0,0x6
    8000683e:	44e50513          	addi	a0,a0,1102 # 8000cc88 <platform_ops+0x5d0>
    80006842:	04bb3423          	sd	a1,72(s6)
    80006846:	bd9fe0ef          	jal	ra,8000541e <sbi_printf>
    8000684a:	4501                	li	a0,0
    8000684c:	055b3823          	sd	s5,80(s6)
    80006850:	60a6                	ld	ra,72(sp)
    80006852:	6406                	ld	s0,64(sp)
    80006854:	74e2                	ld	s1,56(sp)
    80006856:	7942                	ld	s2,48(sp)
    80006858:	79a2                	ld	s3,40(sp)
    8000685a:	7a02                	ld	s4,32(sp)
    8000685c:	6ae2                	ld	s5,24(sp)
    8000685e:	6b42                	ld	s6,16(sp)
    80006860:	6ba2                	ld	s7,8(sp)
    80006862:	6c02                	ld	s8,0(sp)
    80006864:	6161                	addi	sp,sp,80
    80006866:	8082                	ret
    80006868:	00006697          	auipc	a3,0x6
    8000686c:	3f868693          	addi	a3,a3,1016 # 8000cc60 <platform_ops+0x5a8>
    80006870:	08200613          	li	a2,130
    80006874:	00006597          	auipc	a1,0x6
    80006878:	34c58593          	addi	a1,a1,844 # 8000cbc0 <platform_ops+0x508>
    8000687c:	00006517          	auipc	a0,0x6
    80006880:	3ac50513          	addi	a0,a0,940 # 8000cc28 <platform_ops+0x570>
    80006884:	b9bfe0ef          	jal	ra,8000541e <sbi_printf>
    80006888:	00006517          	auipc	a0,0x6
    8000688c:	30050513          	addi	a0,a0,768 # 8000cb88 <platform_ops+0x4d0>
    80006890:	b8ffe0ef          	jal	ra,8000541e <sbi_printf>
    80006894:	b731                	j	800067a0 <enclave_mem_alloc+0x22>

0000000080006896 <enclave_mem_free>:
    80006896:	1101                	addi	sp,sp,-32
    80006898:	e822                	sd	s0,16(sp)
    8000689a:	e426                	sd	s1,8(sp)
    8000689c:	ec06                	sd	ra,24(sp)
    8000689e:	1000                	addi	s0,sp,32
    800068a0:	6934                	ld	a3,80(a0)
    800068a2:	84aa                	mv	s1,a0
    800068a4:	03469793          	slli	a5,a3,0x34
    800068a8:	ef85                	bnez	a5,800068e0 <enclave_mem_free+0x4a>
    800068aa:	00009617          	auipc	a2,0x9
    800068ae:	4ae60613          	addi	a2,a2,1198 # 8000fd58 <pages>
    800068b2:	64bc                	ld	a5,72(s1)
    800068b4:	6218                	ld	a4,0(a2)
    800068b6:	82b1                	srli	a3,a3,0xc
    800068b8:	8f99                	sub	a5,a5,a4
    800068ba:	83b1                	srli	a5,a5,0xc
    800068bc:	ce81                	beqz	a3,800068d4 <enclave_mem_free+0x3e>
    800068be:	96be                	add	a3,a3,a5
    800068c0:	00469713          	slli	a4,a3,0x4
    800068c4:	0792                	slli	a5,a5,0x4
    800068c6:	97b2                	add	a5,a5,a2
    800068c8:	9732                	add	a4,a4,a2
    800068ca:	00078423          	sb	zero,8(a5)
    800068ce:	07c1                	addi	a5,a5,16
    800068d0:	fef71de3          	bne	a4,a5,800068ca <enclave_mem_free+0x34>
    800068d4:	60e2                	ld	ra,24(sp)
    800068d6:	6442                	ld	s0,16(sp)
    800068d8:	64a2                	ld	s1,8(sp)
    800068da:	4501                	li	a0,0
    800068dc:	6105                	addi	sp,sp,32
    800068de:	8082                	ret
    800068e0:	00006697          	auipc	a3,0x6
    800068e4:	3f068693          	addi	a3,a3,1008 # 8000ccd0 <platform_ops+0x618>
    800068e8:	0ad00613          	li	a2,173
    800068ec:	00006597          	auipc	a1,0x6
    800068f0:	2d458593          	addi	a1,a1,724 # 8000cbc0 <platform_ops+0x508>
    800068f4:	00006517          	auipc	a0,0x6
    800068f8:	33450513          	addi	a0,a0,820 # 8000cc28 <platform_ops+0x570>
    800068fc:	b23fe0ef          	jal	ra,8000541e <sbi_printf>
    80006900:	00006517          	auipc	a0,0x6
    80006904:	28850513          	addi	a0,a0,648 # 8000cb88 <platform_ops+0x4d0>
    80006908:	b17fe0ef          	jal	ra,8000541e <sbi_printf>
    8000690c:	68b4                	ld	a3,80(s1)
    8000690e:	bf71                	j	800068aa <enclave_mem_free+0x14>

0000000080006910 <pmp_switch>:
    80006910:	1141                	addi	sp,sp,-16
    80006912:	e422                	sd	s0,8(sp)
    80006914:	0800                	addi	s0,sp,16
    80006916:	c139                	beqz	a0,8000695c <pmp_switch+0x4c>
    80006918:	653c                	ld	a5,72(a0)
    8000691a:	6938                	ld	a4,80(a0)
    8000691c:	00007617          	auipc	a2,0x7
    80006920:	8c463603          	ld	a2,-1852(a2) # 8000d1e0 <__func__.0+0xa0>
    80006924:	0027d593          	srli	a1,a5,0x2
    80006928:	97ba                	add	a5,a5,a4
    8000692a:	577d                	li	a4,-1
    8000692c:	8389                	srli	a5,a5,0x2
    8000692e:	8309                	srli	a4,a4,0x2
    80006930:	22000837          	lui	a6,0x22000
    80006934:	200006b7          	lui	a3,0x20000
    80006938:	4501                	li	a0,0
    8000693a:	3b059073          	csrw	pmpaddr0,a1
    8000693e:	3b179073          	csrw	pmpaddr1,a5
    80006942:	3b251073          	csrw	pmpaddr2,a0
    80006946:	3b369073          	csrw	pmpaddr3,a3
    8000694a:	3b481073          	csrw	pmpaddr4,a6
    8000694e:	3b571073          	csrw	pmpaddr5,a4
    80006952:	3a061073          	csrw	pmpcfg0,a2
    80006956:	6422                	ld	s0,8(sp)
    80006958:	0141                	addi	sp,sp,16
    8000695a:	8082                	ret
    8000695c:	016f9797          	auipc	a5,0x16f9
    80006960:	6a478793          	addi	a5,a5,1700 # 81700000 <_enclave_end>
    80006964:	0f001637          	lui	a2,0xf001
    80006968:	56fd                	li	a3,-1
    8000696a:	8389                	srli	a5,a5,0x2
    8000696c:	80060613          	addi	a2,a2,-2048 # f000800 <_fw_start-0x70fff800>
    80006970:	4701                	li	a4,0
    80006972:	4801                	li	a6,0
    80006974:	8289                	srli	a3,a3,0x2
    80006976:	200005b7          	lui	a1,0x20000
    8000697a:	bf7d                	j	80006938 <pmp_switch+0x28>

000000008000697c <save_umode_context>:
    8000697c:	1101                	addi	sp,sp,-32
    8000697e:	ec06                	sd	ra,24(sp)
    80006980:	e822                	sd	s0,16(sp)
    80006982:	e426                	sd	s1,8(sp)
    80006984:	e04a                	sd	s2,0(sp)
    80006986:	1000                	addi	s0,sp,32
    80006988:	84aa                	mv	s1,a0
    8000698a:	00006517          	auipc	a0,0x6
    8000698e:	36e50513          	addi	a0,a0,878 # 8000ccf8 <platform_ops+0x640>
    80006992:	892e                	mv	s2,a1
    80006994:	a8bfe0ef          	jal	ra,8000541e <sbi_printf>
    80006998:	85ca                	mv	a1,s2
    8000699a:	07048513          	addi	a0,s1,112
    8000699e:	10000613          	li	a2,256
    800069a2:	dacfd0ef          	jal	ra,80003f4e <sbi_memcpy>
    800069a6:	60e2                	ld	ra,24(sp)
    800069a8:	6442                	ld	s0,16(sp)
    800069aa:	64a2                	ld	s1,8(sp)
    800069ac:	6902                	ld	s2,0(sp)
    800069ae:	6105                	addi	sp,sp,32
    800069b0:	8082                	ret

00000000800069b2 <restore_umode_context>:
    800069b2:	1141                	addi	sp,sp,-16
    800069b4:	e022                	sd	s0,0(sp)
    800069b6:	e406                	sd	ra,8(sp)
    800069b8:	0800                	addi	s0,sp,16
    800069ba:	87ae                	mv	a5,a1
    800069bc:	07050593          	addi	a1,a0,112
    800069c0:	10000613          	li	a2,256
    800069c4:	853e                	mv	a0,a5
    800069c6:	d88fd0ef          	jal	ra,80003f4e <sbi_memcpy>
    800069ca:	60a2                	ld	ra,8(sp)
    800069cc:	6402                	ld	s0,0(sp)
    800069ce:	0141                	addi	sp,sp,16
    800069d0:	8082                	ret

00000000800069d2 <save_csr_context>:
    800069d2:	1141                	addi	sp,sp,-16
    800069d4:	e422                	sd	s0,8(sp)
    800069d6:	0800                	addi	s0,sp,16
    800069d8:	180027f3          	csrr	a5,satp
    800069dc:	0591                	addi	a1,a1,4
    800069de:	e51c                	sd	a5,8(a0)
    800069e0:	e90c                	sd	a1,16(a0)
    800069e2:	10964783          	lbu	a5,265(a2)
    800069e6:	10864703          	lbu	a4,264(a2)
    800069ea:	10a64883          	lbu	a7,266(a2)
    800069ee:	10b64803          	lbu	a6,267(a2)
    800069f2:	10c64583          	lbu	a1,268(a2)
    800069f6:	07a2                	slli	a5,a5,0x8
    800069f8:	10d64683          	lbu	a3,269(a2)
    800069fc:	8fd9                	or	a5,a5,a4
    800069fe:	08c2                	slli	a7,a7,0x10
    80006a00:	10e64703          	lbu	a4,270(a2)
    80006a04:	00f8e8b3          	or	a7,a7,a5
    80006a08:	0862                	slli	a6,a6,0x18
    80006a0a:	10f64783          	lbu	a5,271(a2)
    80006a0e:	01186833          	or	a6,a6,a7
    80006a12:	02059613          	slli	a2,a1,0x20
    80006a16:	01066633          	or	a2,a2,a6
    80006a1a:	16a2                	slli	a3,a3,0x28
    80006a1c:	8ed1                	or	a3,a3,a2
    80006a1e:	1742                	slli	a4,a4,0x30
    80006a20:	8f55                	or	a4,a4,a3
    80006a22:	17e2                	slli	a5,a5,0x38
    80006a24:	8fd9                	or	a5,a5,a4
    80006a26:	ed1c                	sd	a5,24(a0)
    80006a28:	302027f3          	csrr	a5,medeleg
    80006a2c:	f11c                	sd	a5,32(a0)
    80006a2e:	104027f3          	csrr	a5,sie
    80006a32:	e13c                	sd	a5,64(a0)
    80006a34:	105027f3          	csrr	a5,stvec
    80006a38:	f91c                	sd	a5,48(a0)
    80006a3a:	100027f3          	csrr	a5,sstatus
    80006a3e:	f51c                	sd	a5,40(a0)
    80006a40:	140027f3          	csrr	a5,sscratch
    80006a44:	6422                	ld	s0,8(sp)
    80006a46:	fd1c                	sd	a5,56(a0)
    80006a48:	0141                	addi	sp,sp,16
    80006a4a:	8082                	ret

0000000080006a4c <restore_csr_context>:
    80006a4c:	1141                	addi	sp,sp,-16
    80006a4e:	e422                	sd	s0,8(sp)
    80006a50:	0800                	addi	s0,sp,16
    80006a52:	651c                	ld	a5,8(a0)
    80006a54:	18079073          	csrw	satp,a5
    80006a58:	12000073          	sfence.vma
    80006a5c:	711c                	ld	a5,32(a0)
    80006a5e:	30279073          	csrw	medeleg,a5
    80006a62:	613c                	ld	a5,64(a0)
    80006a64:	10479073          	csrw	sie,a5
    80006a68:	791c                	ld	a5,48(a0)
    80006a6a:	10579073          	csrw	stvec,a5
    80006a6e:	751c                	ld	a5,40(a0)
    80006a70:	10079073          	csrw	sstatus,a5
    80006a74:	7d1c                	ld	a5,56(a0)
    80006a76:	14079073          	csrw	sscratch,a5
    80006a7a:	691c                	ld	a5,16(a0)
    80006a7c:	6422                	ld	s0,8(sp)
    80006a7e:	17f1                	addi	a5,a5,-4
    80006a80:	0107d313          	srli	t1,a5,0x10
    80006a84:	0187d89b          	srliw	a7,a5,0x18
    80006a88:	0207d813          	srli	a6,a5,0x20
    80006a8c:	0287d613          	srli	a2,a5,0x28
    80006a90:	0307d693          	srli	a3,a5,0x30
    80006a94:	0387d713          	srli	a4,a5,0x38
    80006a98:	0087de13          	srli	t3,a5,0x8
    80006a9c:	10658123          	sb	t1,258(a1) # 20000102 <_fw_start-0x5ffffefe>
    80006aa0:	111581a3          	sb	a7,259(a1)
    80006aa4:	11058223          	sb	a6,260(a1)
    80006aa8:	10c582a3          	sb	a2,261(a1)
    80006aac:	10d58323          	sb	a3,262(a1)
    80006ab0:	10e583a3          	sb	a4,263(a1)
    80006ab4:	10f58023          	sb	a5,256(a1)
    80006ab8:	11c580a3          	sb	t3,257(a1)
    80006abc:	6d1c                	ld	a5,24(a0)
    80006abe:	0087d313          	srli	t1,a5,0x8
    80006ac2:	0107d893          	srli	a7,a5,0x10
    80006ac6:	0187d81b          	srliw	a6,a5,0x18
    80006aca:	0207d513          	srli	a0,a5,0x20
    80006ace:	0287d613          	srli	a2,a5,0x28
    80006ad2:	0307d693          	srli	a3,a5,0x30
    80006ad6:	0387d713          	srli	a4,a5,0x38
    80006ada:	10f58423          	sb	a5,264(a1)
    80006ade:	106584a3          	sb	t1,265(a1)
    80006ae2:	11158523          	sb	a7,266(a1)
    80006ae6:	110585a3          	sb	a6,267(a1)
    80006aea:	10a58623          	sb	a0,268(a1)
    80006aee:	10c586a3          	sb	a2,269(a1)
    80006af2:	10d58723          	sb	a3,270(a1)
    80006af6:	10e587a3          	sb	a4,271(a1)
    80006afa:	0141                	addi	sp,sp,16
    80006afc:	8082                	ret

0000000080006afe <init_csr_context>:
    80006afe:	1141                	addi	sp,sp,-16
    80006b00:	e422                	sd	s0,8(sp)
    80006b02:	0800                	addi	s0,sp,16
    80006b04:	300027f3          	csrr	a5,mstatus
    80006b08:	7779                	lui	a4,0xffffe
    80006b0a:	7dd70713          	addi	a4,a4,2013 # ffffffffffffe7dd <_enclave_end+0xffffffff7e8fe7dd>
    80006b0e:	8ff9                	and	a5,a5,a4
    80006b10:	6705                	lui	a4,0x1
    80006b12:	80270713          	addi	a4,a4,-2046 # 802 <_fw_start-0x7ffff7fe>
    80006b16:	8fd9                	or	a5,a5,a4
    80006b18:	ed1c                	sd	a5,24(a0)
    80006b1a:	10002773          	csrr	a4,sstatus
    80006b1e:	653c                	ld	a5,72(a0)
    80006b20:	6422                	ld	s0,8(sp)
    80006b22:	006006b7          	lui	a3,0x600
    80006b26:	9b75                	andi	a4,a4,-3
    80006b28:	97b6                	add	a5,a5,a3
    80006b2a:	f518                	sd	a4,40(a0)
    80006b2c:	e91c                	sd	a5,16(a0)
    80006b2e:	02053c23          	sd	zero,56(a0)
    80006b32:	00053423          	sd	zero,8(a0)
    80006b36:	04053023          	sd	zero,64(a0)
    80006b3a:	02053823          	sd	zero,48(a0)
    80006b3e:	0141                	addi	sp,sp,16
    80006b40:	8082                	ret

0000000080006b42 <memcpy_from_user>:
    80006b42:	ce49                	beqz	a2,80006bdc <memcpy_from_user+0x9a>
    80006b44:	715d                	addi	sp,sp,-80
    80006b46:	e0a2                	sd	s0,64(sp)
    80006b48:	fc26                	sd	s1,56(sp)
    80006b4a:	f84a                	sd	s2,48(sp)
    80006b4c:	f44e                	sd	s3,40(sp)
    80006b4e:	f052                	sd	s4,32(sp)
    80006b50:	ec56                	sd	s5,24(sp)
    80006b52:	e85a                	sd	s6,16(sp)
    80006b54:	e45e                	sd	s7,8(sp)
    80006b56:	e486                	sd	ra,72(sp)
    80006b58:	0880                	addi	s0,sp,80
    80006b5a:	8932                	mv	s2,a2
    80006b5c:	84aa                	mv	s1,a0
    80006b5e:	8a2e                	mv	s4,a1
    80006b60:	8ab6                	mv	s5,a3
    80006b62:	4b9d                	li	s7,7
    80006b64:	000209b7          	lui	s3,0x20
    80006b68:	00006b17          	auipc	s6,0x6
    80006b6c:	1b8b0b13          	addi	s6,s6,440 # 8000cd20 <platform_ops+0x668>
    80006b70:	8656                	mv	a2,s5
    80006b72:	052bf263          	bgeu	s7,s2,80006bb6 <memcpy_from_user+0x74>
    80006b76:	3009a6f3          	csrrs	a3,mstatus,s3
    80006b7a:	4098                	lw	a4,0(s1)
    80006b7c:	30069073          	csrw	mstatus,a3
    80006b80:	1702                	slli	a4,a4,0x20
    80006b82:	3009a6f3          	csrrs	a3,mstatus,s3
    80006b86:	40dc                	lw	a5,4(s1)
    80006b88:	30069073          	csrw	mstatus,a3
    80006b8c:	9301                	srli	a4,a4,0x20
    80006b8e:	1782                	slli	a5,a5,0x20
    80006b90:	97ba                	add	a5,a5,a4
    80006b92:	00fa3023          	sd	a5,0(s4)
    80006b96:	1961                	addi	s2,s2,-8
    80006b98:	04a1                	addi	s1,s1,8
    80006b9a:	0a21                	addi	s4,s4,8
    80006b9c:	fc091ae3          	bnez	s2,80006b70 <memcpy_from_user+0x2e>
    80006ba0:	60a6                	ld	ra,72(sp)
    80006ba2:	6406                	ld	s0,64(sp)
    80006ba4:	74e2                	ld	s1,56(sp)
    80006ba6:	7942                	ld	s2,48(sp)
    80006ba8:	79a2                	ld	s3,40(sp)
    80006baa:	7a02                	ld	s4,32(sp)
    80006bac:	6ae2                	ld	s5,24(sp)
    80006bae:	6b42                	ld	s6,16(sp)
    80006bb0:	6ba2                	ld	s7,8(sp)
    80006bb2:	6161                	addi	sp,sp,80
    80006bb4:	8082                	ret
    80006bb6:	3009a6f3          	csrrs	a3,mstatus,s3
    80006bba:	0004c783          	lbu	a5,0(s1)
    80006bbe:	30069073          	csrw	mstatus,a3
    80006bc2:	0ff7f593          	andi	a1,a5,255
    80006bc6:	00ba0023          	sb	a1,0(s4)
    80006bca:	855a                	mv	a0,s6
    80006bcc:	197d                	addi	s2,s2,-1
    80006bce:	851fe0ef          	jal	ra,8000541e <sbi_printf>
    80006bd2:	0a05                	addi	s4,s4,1
    80006bd4:	0485                	addi	s1,s1,1
    80006bd6:	f8091de3          	bnez	s2,80006b70 <memcpy_from_user+0x2e>
    80006bda:	b7d9                	j	80006ba0 <memcpy_from_user+0x5e>
    80006bdc:	8082                	ret

0000000080006bde <find_avail_enclave>:
    80006bde:	1141                	addi	sp,sp,-16
    80006be0:	e422                	sd	s0,8(sp)
    80006be2:	0800                	addi	s0,sp,16
    80006be4:	00008797          	auipc	a5,0x8
    80006be8:	70c78793          	addi	a5,a5,1804 # 8000f2f0 <enclaves>
    80006bec:	1707c703          	lbu	a4,368(a5)
    80006bf0:	cb01                	beqz	a4,80006c00 <find_avail_enclave+0x22>
    80006bf2:	2e87c783          	lbu	a5,744(a5)
    80006bf6:	c799                	beqz	a5,80006c04 <find_avail_enclave+0x26>
    80006bf8:	557d                	li	a0,-1
    80006bfa:	6422                	ld	s0,8(sp)
    80006bfc:	0141                	addi	sp,sp,16
    80006bfe:	8082                	ret
    80006c00:	4501                	li	a0,0
    80006c02:	bfe5                	j	80006bfa <find_avail_enclave+0x1c>
    80006c04:	4505                	li	a0,1
    80006c06:	bfd5                	j	80006bfa <find_avail_enclave+0x1c>

0000000080006c08 <init_enclaves>:
    80006c08:	1101                	addi	sp,sp,-32
    80006c0a:	ec06                	sd	ra,24(sp)
    80006c0c:	e822                	sd	s0,16(sp)
    80006c0e:	e426                	sd	s1,8(sp)
    80006c10:	1000                	addi	s0,sp,32
    80006c12:	a7dff0ef          	jal	ra,8000668e <enclave_mem_init>
    80006c16:	00008497          	auipc	s1,0x8
    80006c1a:	6da48493          	addi	s1,s1,1754 # 8000f2f0 <enclaves>
    80006c1e:	2f000613          	li	a2,752
    80006c22:	4581                	li	a1,0
    80006c24:	8526                	mv	a0,s1
    80006c26:	b06fd0ef          	jal	ra,80003f2c <sbi_memset>
    80006c2a:	478d                	li	a5,3
    80006c2c:	00006517          	auipc	a0,0x6
    80006c30:	0fc50513          	addi	a0,a0,252 # 8000cd28 <platform_ops+0x670>
    80006c34:	46f48023          	sb	a5,1120(s1)
    80006c38:	16048823          	sb	zero,368(s1)
    80006c3c:	2e048423          	sb	zero,744(s1)
    80006c40:	fdefe0ef          	jal	ra,8000541e <sbi_printf>
    80006c44:	60e2                	ld	ra,24(sp)
    80006c46:	6442                	ld	s0,16(sp)
    80006c48:	64a2                	ld	s1,8(sp)
    80006c4a:	6105                	addi	sp,sp,32
    80006c4c:	8082                	ret

0000000080006c4e <enter_enclave>:
    80006c4e:	715d                	addi	sp,sp,-80
    80006c50:	e0a2                	sd	s0,64(sp)
    80006c52:	fc26                	sd	s1,56(sp)
    80006c54:	f44e                	sd	s3,40(sp)
    80006c56:	f052                	sd	s4,32(sp)
    80006c58:	ec56                	sd	s5,24(sp)
    80006c5a:	e85a                	sd	s6,16(sp)
    80006c5c:	e486                	sd	ra,72(sp)
    80006c5e:	f84a                	sd	s2,48(sp)
    80006c60:	e45e                	sd	s7,8(sp)
    80006c62:	e062                	sd	s8,0(sp)
    80006c64:	0880                	addi	s0,sp,80
    80006c66:	00053b83          	ld	s7,0(a0)
    80006c6a:	17800493          	li	s1,376
    80006c6e:	89aa                	mv	s3,a0
    80006c70:	029b84b3          	mul	s1,s7,s1
    80006c74:	00006517          	auipc	a0,0x6
    80006c78:	0dc50513          	addi	a0,a0,220 # 8000cd50 <platform_ops+0x698>
    80006c7c:	00008a17          	auipc	s4,0x8
    80006c80:	674a0a13          	addi	s4,s4,1652 # 8000f2f0 <enclaves>
    80006c84:	8aae                	mv	s5,a1
    80006c86:	f98fe0ef          	jal	ra,8000541e <sbi_printf>
    80006c8a:	4785                	li	a5,1
    80006c8c:	5b7d                	li	s6,-1
    80006c8e:	94d2                	add	s1,s1,s4
    80006c90:	1704c703          	lbu	a4,368(s1)
    80006c94:	00f71863          	bne	a4,a5,80006ca4 <enter_enclave+0x56>
    80006c98:	460a4c03          	lbu	s8,1120(s4)
    80006c9c:	478d                	li	a5,3
    80006c9e:	5b7d                	li	s6,-1
    80006ca0:	00fc0f63          	beq	s8,a5,80006cbe <enter_enclave+0x70>
    80006ca4:	60a6                	ld	ra,72(sp)
    80006ca6:	6406                	ld	s0,64(sp)
    80006ca8:	74e2                	ld	s1,56(sp)
    80006caa:	7942                	ld	s2,48(sp)
    80006cac:	79a2                	ld	s3,40(sp)
    80006cae:	7a02                	ld	s4,32(sp)
    80006cb0:	6ae2                	ld	s5,24(sp)
    80006cb2:	6ba2                	ld	s7,8(sp)
    80006cb4:	6c02                	ld	s8,0(sp)
    80006cb6:	855a                	mv	a0,s6
    80006cb8:	6b42                	ld	s6,16(sp)
    80006cba:	6161                	addi	sp,sp,80
    80006cbc:	8082                	ret
    80006cbe:	00006517          	auipc	a0,0x6
    80006cc2:	0aa50513          	addi	a0,a0,170 # 8000cd68 <platform_ops+0x6b0>
    80006cc6:	f58fe0ef          	jal	ra,8000541e <sbi_printf>
    80006cca:	0089b603          	ld	a2,8(s3) # 20008 <_fw_start-0x7ffdfff8>
    80006cce:	74ac                	ld	a1,104(s1)
    80006cd0:	0109b503          	ld	a0,16(s3)
    80006cd4:	86d6                	mv	a3,s5
    80006cd6:	002b5b13          	srli	s6,s6,0x2
    80006cda:	e69ff0ef          	jal	ra,80006b42 <memcpy_from_user>
    80006cde:	00006517          	auipc	a0,0x6
    80006ce2:	0a250513          	addi	a0,a0,162 # 8000cd80 <platform_ops+0x6c8>
    80006ce6:	0289b903          	ld	s2,40(s3)
    80006cea:	f34fe0ef          	jal	ra,8000541e <sbi_printf>
    80006cee:	64bc                	ld	a5,72(s1)
    80006cf0:	68b4                	ld	a3,80(s1)
    80006cf2:	20000637          	lui	a2,0x20000
    80006cf6:	0027d713          	srli	a4,a5,0x2
    80006cfa:	97b6                	add	a5,a5,a3
    80006cfc:	8389                	srli	a5,a5,0x2
    80006cfe:	4681                	li	a3,0
    80006d00:	220005b7          	lui	a1,0x22000
    80006d04:	00006517          	auipc	a0,0x6
    80006d08:	4dc53503          	ld	a0,1244(a0) # 8000d1e0 <__func__.0+0xa0>
    80006d0c:	3b071073          	csrw	pmpaddr0,a4
    80006d10:	3b179073          	csrw	pmpaddr1,a5
    80006d14:	3b269073          	csrw	pmpaddr2,a3
    80006d18:	3b361073          	csrw	pmpaddr3,a2
    80006d1c:	3b459073          	csrw	pmpaddr4,a1
    80006d20:	3b5b1073          	csrw	pmpaddr5,s6
    80006d24:	3a051073          	csrw	pmpcfg0,a0
    80006d28:	00006517          	auipc	a0,0x6
    80006d2c:	fd050513          	addi	a0,a0,-48 # 8000ccf8 <platform_ops+0x640>
    80006d30:	85ca                	mv	a1,s2
    80006d32:	eecfe0ef          	jal	ra,8000541e <sbi_printf>
    80006d36:	10000613          	li	a2,256
    80006d3a:	85ca                	mv	a1,s2
    80006d3c:	00009517          	auipc	a0,0x9
    80006d40:	91450513          	addi	a0,a0,-1772 # 8000f650 <enclaves+0x360>
    80006d44:	a0afd0ef          	jal	ra,80003f4e <sbi_memcpy>
    80006d48:	180027f3          	csrr	a5,satp
    80006d4c:	0a91                	addi	s5,s5,4
    80006d4e:	2efa3c23          	sd	a5,760(s4)
    80006d52:	315a3023          	sd	s5,768(s4)
    80006d56:	10994783          	lbu	a5,265(s2)
    80006d5a:	10894703          	lbu	a4,264(s2)
    80006d5e:	10a94503          	lbu	a0,266(s2)
    80006d62:	10b94583          	lbu	a1,267(s2)
    80006d66:	10c94603          	lbu	a2,268(s2)
    80006d6a:	07a2                	slli	a5,a5,0x8
    80006d6c:	10d94683          	lbu	a3,269(s2)
    80006d70:	8fd9                	or	a5,a5,a4
    80006d72:	0542                	slli	a0,a0,0x10
    80006d74:	10e94703          	lbu	a4,270(s2)
    80006d78:	8d5d                	or	a0,a0,a5
    80006d7a:	05e2                	slli	a1,a1,0x18
    80006d7c:	10f94783          	lbu	a5,271(s2)
    80006d80:	8dc9                	or	a1,a1,a0
    80006d82:	1602                	slli	a2,a2,0x20
    80006d84:	8e4d                	or	a2,a2,a1
    80006d86:	16a2                	slli	a3,a3,0x28
    80006d88:	8ed1                	or	a3,a3,a2
    80006d8a:	1742                	slli	a4,a4,0x30
    80006d8c:	8f55                	or	a4,a4,a3
    80006d8e:	17e2                	slli	a5,a5,0x38
    80006d90:	8fd9                	or	a5,a5,a4
    80006d92:	30fa3423          	sd	a5,776(s4)
    80006d96:	302027f3          	csrr	a5,medeleg
    80006d9a:	30fa3823          	sd	a5,784(s4)
    80006d9e:	104027f3          	csrr	a5,sie
    80006da2:	32fa3823          	sd	a5,816(s4)
    80006da6:	105027f3          	csrr	a5,stvec
    80006daa:	32fa3023          	sd	a5,800(s4)
    80006dae:	100027f3          	csrr	a5,sstatus
    80006db2:	30fa3c23          	sd	a5,792(s4)
    80006db6:	140027f3          	csrr	a5,sscratch
    80006dba:	32fa3423          	sd	a5,808(s4)
    80006dbe:	649c                	ld	a5,8(s1)
    80006dc0:	18079073          	csrw	satp,a5
    80006dc4:	12000073          	sfence.vma
    80006dc8:	709c                	ld	a5,32(s1)
    80006dca:	30279073          	csrw	medeleg,a5
    80006dce:	60bc                	ld	a5,64(s1)
    80006dd0:	10479073          	csrw	sie,a5
    80006dd4:	789c                	ld	a5,48(s1)
    80006dd6:	10579073          	csrw	stvec,a5
    80006dda:	749c                	ld	a5,40(s1)
    80006ddc:	10079073          	csrw	sstatus,a5
    80006de0:	7c9c                	ld	a5,56(s1)
    80006de2:	14079073          	csrw	sscratch,a5
    80006de6:	689c                	ld	a5,16(s1)
    80006de8:	17f1                	addi	a5,a5,-4
    80006dea:	0087d893          	srli	a7,a5,0x8
    80006dee:	0107d813          	srli	a6,a5,0x10
    80006df2:	0187d51b          	srliw	a0,a5,0x18
    80006df6:	0207d593          	srli	a1,a5,0x20
    80006dfa:	0287d613          	srli	a2,a5,0x28
    80006dfe:	0307d693          	srli	a3,a5,0x30
    80006e02:	0387d713          	srli	a4,a5,0x38
    80006e06:	111900a3          	sb	a7,257(s2)
    80006e0a:	11090123          	sb	a6,258(s2)
    80006e0e:	10a901a3          	sb	a0,259(s2)
    80006e12:	10b90223          	sb	a1,260(s2)
    80006e16:	10c902a3          	sb	a2,261(s2)
    80006e1a:	10d90323          	sb	a3,262(s2)
    80006e1e:	10e903a3          	sb	a4,263(s2)
    80006e22:	10f90023          	sb	a5,256(s2)
    80006e26:	6c9c                	ld	a5,24(s1)
    80006e28:	0087d893          	srli	a7,a5,0x8
    80006e2c:	0107d813          	srli	a6,a5,0x10
    80006e30:	0187d51b          	srliw	a0,a5,0x18
    80006e34:	0207d593          	srli	a1,a5,0x20
    80006e38:	0287d613          	srli	a2,a5,0x28
    80006e3c:	0307d693          	srli	a3,a5,0x30
    80006e40:	0387d713          	srli	a4,a5,0x38
    80006e44:	10f90423          	sb	a5,264(s2)
    80006e48:	111904a3          	sb	a7,265(s2)
    80006e4c:	11090523          	sb	a6,266(s2)
    80006e50:	10a905a3          	sb	a0,267(s2)
    80006e54:	10b90623          	sb	a1,268(s2)
    80006e58:	10c906a3          	sb	a2,269(s2)
    80006e5c:	10d90723          	sb	a3,270(s2)
    80006e60:	10e907a3          	sb	a4,271(s2)
    80006e64:	12000073          	sfence.vma
    80006e68:	0089b783          	ld	a5,8(s3)
    80006e6c:	4b01                	li	s6,0
    80006e6e:	02f9b023          	sd	a5,32(s3)
    80006e72:	74bc                	ld	a5,104(s1)
    80006e74:	0179b023          	sd	s7,0(s3)
    80006e78:	02f9b423          	sd	a5,40(s3)
    80006e7c:	64bc                	ld	a5,72(s1)
    80006e7e:	00f9b423          	sd	a5,8(s3)
    80006e82:	6cbc                	ld	a5,88(s1)
    80006e84:	00f9b823          	sd	a5,16(s3)
    80006e88:	70bc                	ld	a5,96(s1)
    80006e8a:	00f9bc23          	sd	a5,24(s3)
    80006e8e:	17848823          	sb	s8,368(s1)
    80006e92:	4789                	li	a5,2
    80006e94:	46fa0023          	sb	a5,1120(s4)
    80006e98:	b531                	j	80006ca4 <enter_enclave+0x56>

0000000080006e9a <exit_enclave>:
    80006e9a:	1141                	addi	sp,sp,-16
    80006e9c:	e422                	sd	s0,8(sp)
    80006e9e:	0800                	addi	s0,sp,16
    80006ea0:	6422                	ld	s0,8(sp)
    80006ea2:	4501                	li	a0,0
    80006ea4:	0141                	addi	sp,sp,16
    80006ea6:	8082                	ret

0000000080006ea8 <pause_enclave>:
    80006ea8:	1141                	addi	sp,sp,-16
    80006eaa:	e422                	sd	s0,8(sp)
    80006eac:	0800                	addi	s0,sp,16
    80006eae:	6422                	ld	s0,8(sp)
    80006eb0:	4501                	li	a0,0
    80006eb2:	0141                	addi	sp,sp,16
    80006eb4:	8082                	ret

0000000080006eb6 <resume_enclave>:
    80006eb6:	1141                	addi	sp,sp,-16
    80006eb8:	e422                	sd	s0,8(sp)
    80006eba:	0800                	addi	s0,sp,16
    80006ebc:	6422                	ld	s0,8(sp)
    80006ebe:	4501                	li	a0,0
    80006ec0:	0141                	addi	sp,sp,16
    80006ec2:	8082                	ret

0000000080006ec4 <drvcpy>:
    80006ec4:	9a010113          	addi	sp,sp,-1632
    80006ec8:	64813823          	sd	s0,1616(sp)
    80006ecc:	64913423          	sd	s1,1608(sp)
    80006ed0:	65213023          	sd	s2,1600(sp)
    80006ed4:	63413823          	sd	s4,1584(sp)
    80006ed8:	63513423          	sd	s5,1576(sp)
    80006edc:	63613023          	sd	s6,1568(sp)
    80006ee0:	61713c23          	sd	s7,1560(sp)
    80006ee4:	61913423          	sd	s9,1544(sp)
    80006ee8:	61a13023          	sd	s10,1536(sp)
    80006eec:	66010413          	addi	s0,sp,1632
    80006ef0:	64113c23          	sd	ra,1624(sp)
    80006ef4:	63313c23          	sd	s3,1592(sp)
    80006ef8:	61813823          	sd	s8,1552(sp)
    80006efc:	8d2a                	mv	s10,a0
    80006efe:	8aae                	mv	s5,a1
    80006f00:	60000613          	li	a2,1536
    80006f04:	4581                	li	a1,0
    80006f06:	9a040513          	addi	a0,s0,-1632
    80006f0a:	efcff0ef          	jal	ra,80006606 <memset>
    80006f0e:	000d3703          	ld	a4,0(s10)
    80006f12:	00009917          	auipc	s2,0x9
    80006f16:	84690913          	addi	s2,s2,-1978 # 8000f758 <bbl_addr_list>
    80006f1a:	4481                	li	s1,0
    80006f1c:	4c81                	li	s9,0
    80006f1e:	4b85                	li	s7,1
    80006f20:	00006a17          	auipc	s4,0x6
    80006f24:	e78a0a13          	addi	s4,s4,-392 # 8000cd98 <platform_ops+0x6e0>
    80006f28:	04000b13          	li	s6,64
    80006f2c:	a029                	j	80006f36 <drvcpy+0x72>
    80006f2e:	2485                	addiw	s1,s1,1
    80006f30:	0961                	addi	s2,s2,24
    80006f32:	07648163          	beq	s1,s6,80006f94 <drvcpy+0xd0>
    80006f36:	00093983          	ld	s3,0(s2)
    80006f3a:	009b97bb          	sllw	a5,s7,s1
    80006f3e:	0157f7b3          	and	a5,a5,s5
    80006f42:	fe0986e3          	beqz	s3,80006f2e <drvcpy+0x6a>
    80006f46:	d7e5                	beqz	a5,80006f2e <drvcpy+0x6a>
    80006f48:	00893c03          	ld	s8,8(s2)
    80006f4c:	001c9793          	slli	a5,s9,0x1
    80006f50:	97e6                	add	a5,a5,s9
    80006f52:	413c0c33          	sub	s8,s8,s3
    80006f56:	fa040613          	addi	a2,s0,-96
    80006f5a:	078e                	slli	a5,a5,0x3
    80006f5c:	97b2                	add	a5,a5,a2
    80006f5e:	00ec06b3          	add	a3,s8,a4
    80006f62:	863a                	mv	a2,a4
    80006f64:	85a6                	mv	a1,s1
    80006f66:	a0e7b023          	sd	a4,-1536(a5)
    80006f6a:	a0d7b423          	sd	a3,-1528(a5)
    80006f6e:	8552                	mv	a0,s4
    80006f70:	caefe0ef          	jal	ra,8000541e <sbi_printf>
    80006f74:	000d3503          	ld	a0,0(s10)
    80006f78:	8662                	mv	a2,s8
    80006f7a:	85ce                	mv	a1,s3
    80006f7c:	fd3fc0ef          	jal	ra,80003f4e <sbi_memcpy>
    80006f80:	000d3703          	ld	a4,0(s10)
    80006f84:	2485                	addiw	s1,s1,1
    80006f86:	2c85                	addiw	s9,s9,1
    80006f88:	9762                	add	a4,a4,s8
    80006f8a:	00ed3023          	sd	a4,0(s10)
    80006f8e:	0961                	addi	s2,s2,24
    80006f90:	fb6493e3          	bne	s1,s6,80006f36 <drvcpy+0x72>
    80006f94:	9a040593          	addi	a1,s0,-1632
    80006f98:	60000613          	li	a2,1536
    80006f9c:	853a                	mv	a0,a4
    80006f9e:	fb1fc0ef          	jal	ra,80003f4e <sbi_memcpy>
    80006fa2:	65813083          	ld	ra,1624(sp)
    80006fa6:	65013403          	ld	s0,1616(sp)
    80006faa:	64813483          	ld	s1,1608(sp)
    80006fae:	64013903          	ld	s2,1600(sp)
    80006fb2:	63813983          	ld	s3,1592(sp)
    80006fb6:	63013a03          	ld	s4,1584(sp)
    80006fba:	62813a83          	ld	s5,1576(sp)
    80006fbe:	62013b03          	ld	s6,1568(sp)
    80006fc2:	61813b83          	ld	s7,1560(sp)
    80006fc6:	61013c03          	ld	s8,1552(sp)
    80006fca:	60813c83          	ld	s9,1544(sp)
    80006fce:	60013d03          	ld	s10,1536(sp)
    80006fd2:	60000513          	li	a0,1536
    80006fd6:	66010113          	addi	sp,sp,1632
    80006fda:	8082                	ret

0000000080006fdc <create_enclave>:
    80006fdc:	7159                	addi	sp,sp,-112
    80006fde:	f0a2                	sd	s0,96(sp)
    80006fe0:	e8ca                	sd	s2,80(sp)
    80006fe2:	e4ce                	sd	s3,72(sp)
    80006fe4:	f486                	sd	ra,104(sp)
    80006fe6:	eca6                	sd	s1,88(sp)
    80006fe8:	e0d2                	sd	s4,64(sp)
    80006fea:	fc56                	sd	s5,56(sp)
    80006fec:	f85a                	sd	s6,48(sp)
    80006fee:	f45e                	sd	s7,40(sp)
    80006ff0:	f062                	sd	s8,32(sp)
    80006ff2:	ec66                	sd	s9,24(sp)
    80006ff4:	1880                	addi	s0,sp,112
    80006ff6:	00053b03          	ld	s6,0(a0)
    80006ffa:	00853a83          	ld	s5,8(a0)
    80006ffe:	892a                	mv	s2,a0
    80007000:	89ae                	mv	s3,a1
    80007002:	00006517          	auipc	a0,0x6
    80007006:	db650513          	addi	a0,a0,-586 # 8000cdb8 <platform_ops+0x700>
    8000700a:	85da                	mv	a1,s6
    8000700c:	01093a03          	ld	s4,16(s2)
    80007010:	c0efe0ef          	jal	ra,8000541e <sbi_printf>
    80007014:	6785                	lui	a5,0x1
    80007016:	17fd                	addi	a5,a5,-1
    80007018:	777d                	lui	a4,0xfffff
    8000701a:	97d6                	add	a5,a5,s5
    8000701c:	8ff9                	and	a5,a5,a4
    8000701e:	00800737          	lui	a4,0x800
    80007022:	02f76763          	bltu	a4,a5,80007050 <create_enclave+0x74>
    80007026:	00006517          	auipc	a0,0x6
    8000702a:	dc250513          	addi	a0,a0,-574 # 8000cde8 <platform_ops+0x730>
    8000702e:	00008497          	auipc	s1,0x8
    80007032:	2c248493          	addi	s1,s1,706 # 8000f2f0 <enclaves>
    80007036:	be8fe0ef          	jal	ra,8000541e <sbi_printf>
    8000703a:	1704c783          	lbu	a5,368(s1)
    8000703e:	cb85                	beqz	a5,8000706e <create_enclave+0x92>
    80007040:	2e84c783          	lbu	a5,744(s1)
    80007044:	00008c97          	auipc	s9,0x8
    80007048:	424c8c93          	addi	s9,s9,1060 # 8000f468 <enclaves+0x178>
    8000704c:	4b85                	li	s7,1
    8000704e:	c395                	beqz	a5,80007072 <create_enclave+0x96>
    80007050:	5bfd                	li	s7,-1
    80007052:	70a6                	ld	ra,104(sp)
    80007054:	7406                	ld	s0,96(sp)
    80007056:	64e6                	ld	s1,88(sp)
    80007058:	6946                	ld	s2,80(sp)
    8000705a:	69a6                	ld	s3,72(sp)
    8000705c:	6a06                	ld	s4,64(sp)
    8000705e:	7ae2                	ld	s5,56(sp)
    80007060:	7b42                	ld	s6,48(sp)
    80007062:	7c02                	ld	s8,32(sp)
    80007064:	6ce2                	ld	s9,24(sp)
    80007066:	855e                	mv	a0,s7
    80007068:	7ba2                	ld	s7,40(sp)
    8000706a:	6165                	addi	sp,sp,112
    8000706c:	8082                	ret
    8000706e:	8ca6                	mv	s9,s1
    80007070:	4b81                	li	s7,0
    80007072:	17800c13          	li	s8,376
    80007076:	038b8c33          	mul	s8,s7,s8
    8000707a:	4785                	li	a5,1
    8000707c:	00006517          	auipc	a0,0x6
    80007080:	d8450513          	addi	a0,a0,-636 # 8000ce00 <platform_ops+0x748>
    80007084:	9c26                	add	s8,s8,s1
    80007086:	16fc0823          	sb	a5,368(s8)
    8000708a:	b94fe0ef          	jal	ra,8000541e <sbi_printf>
    8000708e:	008005b7          	lui	a1,0x800
    80007092:	8566                	mv	a0,s9
    80007094:	eeaff0ef          	jal	ra,8000677e <enclave_mem_alloc>
    80007098:	fd45                	bnez	a0,80007050 <create_enclave+0x74>
    8000709a:	00006517          	auipc	a0,0x6
    8000709e:	d7e50513          	addi	a0,a0,-642 # 8000ce18 <platform_ops+0x760>
    800070a2:	b7cfe0ef          	jal	ra,8000541e <sbi_printf>
    800070a6:	048c3703          	ld	a4,72(s8)
    800070aa:	006007b7          	lui	a5,0x600
    800070ae:	00079c97          	auipc	s9,0x79
    800070b2:	f52c8c93          	addi	s9,s9,-174 # 80080000 <_base_start>
    800070b6:	97ba                	add	a5,a5,a4
    800070b8:	f8f43c23          	sd	a5,-104(s0)
    800070bc:	638c                	ld	a1,0(a5)
    800070be:	0007ec17          	auipc	s8,0x7e
    800070c2:	399c0c13          	addi	s8,s8,921 # 80085457 <_enclave_start+0x457>
    800070c6:	767d                	lui	a2,0xfffff
    800070c8:	419c0c33          	sub	s8,s8,s9
    800070cc:	00006517          	auipc	a0,0x6
    800070d0:	d6450513          	addi	a0,a0,-668 # 8000ce30 <platform_ops+0x778>
    800070d4:	00cc7c33          	and	s8,s8,a2
    800070d8:	b46fe0ef          	jal	ra,8000541e <sbi_printf>
    800070dc:	f9843503          	ld	a0,-104(s0)
    800070e0:	8662                	mv	a2,s8
    800070e2:	85e6                	mv	a1,s9
    800070e4:	e6bfc0ef          	jal	ra,80003f4e <sbi_memcpy>
    800070e8:	f9843783          	ld	a5,-104(s0)
    800070ec:	00006517          	auipc	a0,0x6
    800070f0:	d7c50513          	addi	a0,a0,-644 # 8000ce68 <platform_ops+0x7b0>
    800070f4:	638c                	ld	a1,0(a5)
    800070f6:	b28fe0ef          	jal	ra,8000541e <sbi_printf>
    800070fa:	f9843583          	ld	a1,-104(s0)
    800070fe:	00006517          	auipc	a0,0x6
    80007102:	da250513          	addi	a0,a0,-606 # 8000cea0 <platform_ops+0x7e8>
    80007106:	95e2                	add	a1,a1,s8
    80007108:	f8b43c23          	sd	a1,-104(s0)
    8000710c:	b12fe0ef          	jal	ra,8000541e <sbi_printf>
    80007110:	85d2                	mv	a1,s4
    80007112:	00006517          	auipc	a0,0x6
    80007116:	d9650513          	addi	a0,a0,-618 # 8000cea8 <platform_ops+0x7f0>
    8000711a:	b04fe0ef          	jal	ra,8000541e <sbi_printf>
    8000711e:	080a1e63          	bnez	s4,800071ba <create_enclave+0x1de>
    80007122:	f8043c23          	sd	zero,-104(s0)
    80007126:	4581                	li	a1,0
    80007128:	00006517          	auipc	a0,0x6
    8000712c:	da850513          	addi	a0,a0,-600 # 8000ced0 <platform_ops+0x818>
    80007130:	aeefe0ef          	jal	ra,8000541e <sbi_printf>
    80007134:	00079597          	auipc	a1,0x79
    80007138:	ecc58593          	addi	a1,a1,-308 # 80080000 <_base_start>
    8000713c:	00006517          	auipc	a0,0x6
    80007140:	dbc50513          	addi	a0,a0,-580 # 8000cef8 <platform_ops+0x840>
    80007144:	adafe0ef          	jal	ra,8000541e <sbi_printf>
    80007148:	17800793          	li	a5,376
    8000714c:	02fb87b3          	mul	a5,s7,a5
    80007150:	00006517          	auipc	a0,0x6
    80007154:	dd050513          	addi	a0,a0,-560 # 8000cf20 <platform_ops+0x868>
    80007158:	94be                	add	s1,s1,a5
    8000715a:	64ac                	ld	a1,72(s1)
    8000715c:	ac2fe0ef          	jal	ra,8000541e <sbi_printf>
    80007160:	64ac                	ld	a1,72(s1)
    80007162:	86ce                	mv	a3,s3
    80007164:	8656                	mv	a2,s5
    80007166:	855a                	mv	a0,s6
    80007168:	9dbff0ef          	jal	ra,80006b42 <memcpy_from_user>
    8000716c:	300027f3          	csrr	a5,mstatus
    80007170:	7779                	lui	a4,0xffffe
    80007172:	7dd70713          	addi	a4,a4,2013 # ffffffffffffe7dd <_enclave_end+0xffffffff7e8fe7dd>
    80007176:	8ff9                	and	a5,a5,a4
    80007178:	6705                	lui	a4,0x1
    8000717a:	80270713          	addi	a4,a4,-2046 # 802 <_fw_start-0x7ffff7fe>
    8000717e:	8fd9                	or	a5,a5,a4
    80007180:	ec9c                	sd	a5,24(s1)
    80007182:	10002773          	csrr	a4,sstatus
    80007186:	64bc                	ld	a5,72(s1)
    80007188:	f9843683          	ld	a3,-104(s0)
    8000718c:	00600637          	lui	a2,0x600
    80007190:	9b75                	andi	a4,a4,-3
    80007192:	97b2                	add	a5,a5,a2
    80007194:	9a36                	add	s4,s4,a3
    80007196:	f498                	sd	a4,40(s1)
    80007198:	e89c                	sd	a5,16(s1)
    8000719a:	0204bc23          	sd	zero,56(s1)
    8000719e:	0004b423          	sd	zero,8(s1)
    800071a2:	0404b023          	sd	zero,64(s1)
    800071a6:	0204b823          	sd	zero,48(s1)
    800071aa:	0554bc23          	sd	s5,88(s1)
    800071ae:	f0b4                	sd	a3,96(s1)
    800071b0:	0744b423          	sd	s4,104(s1)
    800071b4:	01793023          	sd	s7,0(s2)
    800071b8:	bd69                	j	80007052 <create_enclave+0x76>
    800071ba:	85d2                	mv	a1,s4
    800071bc:	f9840513          	addi	a0,s0,-104
    800071c0:	d05ff0ef          	jal	ra,80006ec4 <drvcpy>
    800071c4:	f9843583          	ld	a1,-104(s0)
    800071c8:	8a2a                	mv	s4,a0
    800071ca:	bfb9                	j	80007128 <create_enclave+0x14c>

00000000800071cc <drvfetch>:
    800071cc:	03f00793          	li	a5,63
    800071d0:	04b7cf63          	blt	a5,a1,8000722e <drvfetch+0x62>
    800071d4:	1101                	addi	sp,sp,-32
    800071d6:	e426                	sd	s1,8(sp)
    800071d8:	00159493          	slli	s1,a1,0x1
    800071dc:	94ae                	add	s1,s1,a1
    800071de:	00008797          	auipc	a5,0x8
    800071e2:	58a78793          	addi	a5,a5,1418 # 8000f768 <bbl_addr_list+0x10>
    800071e6:	048e                	slli	s1,s1,0x3
    800071e8:	e822                	sd	s0,16(sp)
    800071ea:	e04a                	sd	s2,0(sp)
    800071ec:	94be                	add	s1,s1,a5
    800071ee:	ec06                	sd	ra,24(sp)
    800071f0:	1000                	addi	s0,sp,32
    800071f2:	892a                	mv	s2,a0
    800071f4:	8526                	mv	a0,s1
    800071f6:	caefd0ef          	jal	ra,800046a4 <atomic_read>
    800071fa:	87aa                	mv	a5,a0
    800071fc:	0ff97513          	andi	a0,s2,255
    80007200:	03278163          	beq	a5,s2,80007222 <drvfetch+0x56>
    80007204:	0009069b          	sext.w	a3,s2
    80007208:	577d                	li	a4,-1
    8000720a:	0f50000f          	fence	iorw,ow
    8000720e:	1404a7af          	lr.w.aq	a5,(s1)
    80007212:	00e79563          	bne	a5,a4,8000721c <drvfetch+0x50>
    80007216:	1cd4a62f          	sc.w.aq	a2,a3,(s1)
    8000721a:	fa75                	bnez	a2,8000720e <drvfetch+0x42>
    8000721c:	2781                	sext.w	a5,a5
    8000721e:	ff2796e3          	bne	a5,s2,8000720a <drvfetch+0x3e>
    80007222:	60e2                	ld	ra,24(sp)
    80007224:	6442                	ld	s0,16(sp)
    80007226:	64a2                	ld	s1,8(sp)
    80007228:	6902                	ld	s2,0(sp)
    8000722a:	6105                	addi	sp,sp,32
    8000722c:	8082                	ret
    8000722e:	0ff00513          	li	a0,255
    80007232:	8082                	ret

0000000080007234 <drvrelease>:
    80007234:	1141                	addi	sp,sp,-16
    80007236:	e422                	sd	s0,8(sp)
    80007238:	0800                	addi	s0,sp,16
    8000723a:	03f00793          	li	a5,63
    8000723e:	02b7c763          	blt	a5,a1,8000726c <drvrelease+0x38>
    80007242:	00159793          	slli	a5,a1,0x1
    80007246:	95be                	add	a1,a1,a5
    80007248:	058e                	slli	a1,a1,0x3
    8000724a:	00008797          	auipc	a5,0x8
    8000724e:	0a678793          	addi	a5,a5,166 # 8000f2f0 <enclaves>
    80007252:	95be                	add	a1,a1,a5
    80007254:	47858693          	addi	a3,a1,1144
    80007258:	57fd                	li	a5,-1
    8000725a:	0f50000f          	fence	iorw,ow
    8000725e:	1406a72f          	lr.w.aq	a4,(a3)
    80007262:	00a71563          	bne	a4,a0,8000726c <drvrelease+0x38>
    80007266:	1cf6a62f          	sc.w.aq	a2,a5,(a3)
    8000726a:	fa75                	bnez	a2,8000725e <drvrelease+0x2a>
    8000726c:	6422                	ld	s0,8(sp)
    8000726e:	0141                	addi	sp,sp,16
    80007270:	8082                	ret

0000000080007272 <sbi_fifo_init>:
    80007272:	8732                	mv	a4,a2
    80007274:	02d60633          	mul	a2,a2,a3
    80007278:	1141                	addi	sp,sp,-16
    8000727a:	e022                	sd	s0,0(sp)
    8000727c:	e406                	sd	ra,8(sp)
    8000727e:	0800                	addi	s0,sp,16
    80007280:	87aa                	mv	a5,a0
    80007282:	e38c                	sd	a1,0(a5)
    80007284:	852e                	mv	a0,a1
    80007286:	00e79923          	sh	a4,18(a5)
    8000728a:	00d79823          	sh	a3,16(a5)
    8000728e:	0007b423          	sd	zero,8(a5)
    80007292:	0007aa23          	sw	zero,20(a5)
    80007296:	4581                	li	a1,0
    80007298:	c95fc0ef          	jal	ra,80003f2c <sbi_memset>
    8000729c:	60a2                	ld	ra,8(sp)
    8000729e:	6402                	ld	s0,0(sp)
    800072a0:	0141                	addi	sp,sp,16
    800072a2:	8082                	ret

00000000800072a4 <sbi_fifo_avail>:
    800072a4:	1101                	addi	sp,sp,-32
    800072a6:	e822                	sd	s0,16(sp)
    800072a8:	e426                	sd	s1,8(sp)
    800072aa:	ec06                	sd	ra,24(sp)
    800072ac:	e04a                	sd	s2,0(sp)
    800072ae:	1000                	addi	s0,sp,32
    800072b0:	4481                	li	s1,0
    800072b2:	cd01                	beqz	a0,800072ca <sbi_fifo_avail+0x26>
    800072b4:	00850913          	addi	s2,a0,8
    800072b8:	84aa                	mv	s1,a0
    800072ba:	854a                	mv	a0,s2
    800072bc:	dd6fd0ef          	jal	ra,80004892 <spin_lock>
    800072c0:	854a                	mv	a0,s2
    800072c2:	0144d483          	lhu	s1,20(s1)
    800072c6:	deafd0ef          	jal	ra,800048b0 <spin_unlock>
    800072ca:	60e2                	ld	ra,24(sp)
    800072cc:	6442                	ld	s0,16(sp)
    800072ce:	6902                	ld	s2,0(sp)
    800072d0:	8526                	mv	a0,s1
    800072d2:	64a2                	ld	s1,8(sp)
    800072d4:	6105                	addi	sp,sp,32
    800072d6:	8082                	ret

00000000800072d8 <sbi_fifo_is_full>:
    800072d8:	7179                	addi	sp,sp,-48
    800072da:	f406                	sd	ra,40(sp)
    800072dc:	f022                	sd	s0,32(sp)
    800072de:	ec26                	sd	s1,24(sp)
    800072e0:	e84a                	sd	s2,16(sp)
    800072e2:	e44e                	sd	s3,8(sp)
    800072e4:	1800                	addi	s0,sp,48
    800072e6:	00850993          	addi	s3,a0,8
    800072ea:	892a                	mv	s2,a0
    800072ec:	854e                	mv	a0,s3
    800072ee:	da4fd0ef          	jal	ra,80004892 <spin_lock>
    800072f2:	01295783          	lhu	a5,18(s2)
    800072f6:	01495483          	lhu	s1,20(s2)
    800072fa:	854e                	mv	a0,s3
    800072fc:	8c9d                	sub	s1,s1,a5
    800072fe:	db2fd0ef          	jal	ra,800048b0 <spin_unlock>
    80007302:	70a2                	ld	ra,40(sp)
    80007304:	7402                	ld	s0,32(sp)
    80007306:	0014b493          	seqz	s1,s1
    8000730a:	6942                	ld	s2,16(sp)
    8000730c:	69a2                	ld	s3,8(sp)
    8000730e:	8526                	mv	a0,s1
    80007310:	64e2                	ld	s1,24(sp)
    80007312:	6145                	addi	sp,sp,48
    80007314:	8082                	ret

0000000080007316 <sbi_fifo_is_empty>:
    80007316:	1101                	addi	sp,sp,-32
    80007318:	ec06                	sd	ra,24(sp)
    8000731a:	e822                	sd	s0,16(sp)
    8000731c:	e426                	sd	s1,8(sp)
    8000731e:	e04a                	sd	s2,0(sp)
    80007320:	1000                	addi	s0,sp,32
    80007322:	00850913          	addi	s2,a0,8
    80007326:	84aa                	mv	s1,a0
    80007328:	854a                	mv	a0,s2
    8000732a:	d68fd0ef          	jal	ra,80004892 <spin_lock>
    8000732e:	854a                	mv	a0,s2
    80007330:	0144d483          	lhu	s1,20(s1)
    80007334:	d7cfd0ef          	jal	ra,800048b0 <spin_unlock>
    80007338:	60e2                	ld	ra,24(sp)
    8000733a:	6442                	ld	s0,16(sp)
    8000733c:	0014b493          	seqz	s1,s1
    80007340:	6902                	ld	s2,0(sp)
    80007342:	8526                	mv	a0,s1
    80007344:	64a2                	ld	s1,8(sp)
    80007346:	6105                	addi	sp,sp,32
    80007348:	8082                	ret

000000008000734a <sbi_fifo_reset>:
    8000734a:	c139                	beqz	a0,80007390 <sbi_fifo_reset+0x46>
    8000734c:	1101                	addi	sp,sp,-32
    8000734e:	ec06                	sd	ra,24(sp)
    80007350:	e822                	sd	s0,16(sp)
    80007352:	e426                	sd	s1,8(sp)
    80007354:	1000                	addi	s0,sp,32
    80007356:	e04a                	sd	s2,0(sp)
    80007358:	00850913          	addi	s2,a0,8
    8000735c:	84aa                	mv	s1,a0
    8000735e:	854a                	mv	a0,s2
    80007360:	d32fd0ef          	jal	ra,80004892 <spin_lock>
    80007364:	0104d783          	lhu	a5,16(s1)
    80007368:	0124d603          	lhu	a2,18(s1)
    8000736c:	6088                	ld	a0,0(s1)
    8000736e:	4581                	li	a1,0
    80007370:	02f60633          	mul	a2,a2,a5
    80007374:	0004aa23          	sw	zero,20(s1)
    80007378:	bb5fc0ef          	jal	ra,80003f2c <sbi_memset>
    8000737c:	854a                	mv	a0,s2
    8000737e:	d32fd0ef          	jal	ra,800048b0 <spin_unlock>
    80007382:	60e2                	ld	ra,24(sp)
    80007384:	6442                	ld	s0,16(sp)
    80007386:	64a2                	ld	s1,8(sp)
    80007388:	6902                	ld	s2,0(sp)
    8000738a:	4505                	li	a0,1
    8000738c:	6105                	addi	sp,sp,32
    8000738e:	8082                	ret
    80007390:	4501                	li	a0,0
    80007392:	8082                	ret

0000000080007394 <sbi_fifo_inplace_update>:
    80007394:	715d                	addi	sp,sp,-80
    80007396:	e0a2                	sd	s0,64(sp)
    80007398:	e486                	sd	ra,72(sp)
    8000739a:	fc26                	sd	s1,56(sp)
    8000739c:	f84a                	sd	s2,48(sp)
    8000739e:	f44e                	sd	s3,40(sp)
    800073a0:	f052                	sd	s4,32(sp)
    800073a2:	ec56                	sd	s5,24(sp)
    800073a4:	e85a                	sd	s6,16(sp)
    800073a6:	e45e                	sd	s7,8(sp)
    800073a8:	0880                	addi	s0,sp,80
    800073aa:	cd25                	beqz	a0,80007422 <sbi_fifo_inplace_update+0x8e>
    800073ac:	89ae                	mv	s3,a1
    800073ae:	c9b5                	beqz	a1,80007422 <sbi_fifo_inplace_update+0x8e>
    800073b0:	00850b13          	addi	s6,a0,8
    800073b4:	84aa                	mv	s1,a0
    800073b6:	855a                	mv	a0,s6
    800073b8:	8a32                	mv	s4,a2
    800073ba:	cd8fd0ef          	jal	ra,80004892 <spin_lock>
    800073be:	0144d783          	lhu	a5,20(s1)
    800073c2:	4b81                	li	s7,0
    800073c4:	4a85                	li	s5,1
    800073c6:	e791                	bnez	a5,800073d2 <sbi_fifo_inplace_update+0x3e>
    800073c8:	a8b9                	j	80007426 <sbi_fifo_inplace_update+0x92>
    800073ca:	0144d783          	lhu	a5,20(s1)
    800073ce:	02fbdb63          	bge	s7,a5,80007404 <sbi_fifo_inplace_update+0x70>
    800073d2:	0164d703          	lhu	a4,22(s1)
    800073d6:	0124d603          	lhu	a2,18(s1)
    800073da:	854e                	mv	a0,s3
    800073dc:	017706bb          	addw	a3,a4,s7
    800073e0:	2b85                	addiw	s7,s7,1
    800073e2:	00c6c363          	blt	a3,a2,800073e8 <sbi_fifo_inplace_update+0x54>
    800073e6:	9e91                	subw	a3,a3,a2
    800073e8:	0104d783          	lhu	a5,16(s1)
    800073ec:	608c                	ld	a1,0(s1)
    800073ee:	02d787bb          	mulw	a5,a5,a3
    800073f2:	1782                	slli	a5,a5,0x20
    800073f4:	9381                	srli	a5,a5,0x20
    800073f6:	95be                	add	a1,a1,a5
    800073f8:	9a02                	jalr	s4
    800073fa:	0005079b          	sext.w	a5,a0
    800073fe:	892a                	mv	s2,a0
    80007400:	fcfae5e3          	bltu	s5,a5,800073ca <sbi_fifo_inplace_update+0x36>
    80007404:	855a                	mv	a0,s6
    80007406:	caafd0ef          	jal	ra,800048b0 <spin_unlock>
    8000740a:	60a6                	ld	ra,72(sp)
    8000740c:	6406                	ld	s0,64(sp)
    8000740e:	74e2                	ld	s1,56(sp)
    80007410:	79a2                	ld	s3,40(sp)
    80007412:	7a02                	ld	s4,32(sp)
    80007414:	6ae2                	ld	s5,24(sp)
    80007416:	6b42                	ld	s6,16(sp)
    80007418:	6ba2                	ld	s7,8(sp)
    8000741a:	854a                	mv	a0,s2
    8000741c:	7942                	ld	s2,48(sp)
    8000741e:	6161                	addi	sp,sp,80
    80007420:	8082                	ret
    80007422:	4909                	li	s2,2
    80007424:	b7dd                	j	8000740a <sbi_fifo_inplace_update+0x76>
    80007426:	855a                	mv	a0,s6
    80007428:	c88fd0ef          	jal	ra,800048b0 <spin_unlock>
    8000742c:	4909                	li	s2,2
    8000742e:	bff1                	j	8000740a <sbi_fifo_inplace_update+0x76>

0000000080007430 <sbi_fifo_enqueue>:
    80007430:	cd3d                	beqz	a0,800074ae <sbi_fifo_enqueue+0x7e>
    80007432:	7179                	addi	sp,sp,-48
    80007434:	f022                	sd	s0,32(sp)
    80007436:	e84a                	sd	s2,16(sp)
    80007438:	f406                	sd	ra,40(sp)
    8000743a:	ec26                	sd	s1,24(sp)
    8000743c:	e44e                	sd	s3,8(sp)
    8000743e:	1800                	addi	s0,sp,48
    80007440:	892e                	mv	s2,a1
    80007442:	cdb9                	beqz	a1,800074a0 <sbi_fifo_enqueue+0x70>
    80007444:	00850993          	addi	s3,a0,8
    80007448:	84aa                	mv	s1,a0
    8000744a:	854e                	mv	a0,s3
    8000744c:	c46fd0ef          	jal	ra,80004892 <spin_lock>
    80007450:	0144d783          	lhu	a5,20(s1)
    80007454:	0124d683          	lhu	a3,18(s1)
    80007458:	04d78663          	beq	a5,a3,800074a4 <sbi_fifo_enqueue+0x74>
    8000745c:	0164d703          	lhu	a4,22(s1)
    80007460:	9fb9                	addw	a5,a5,a4
    80007462:	02d7fd63          	bgeu	a5,a3,8000749c <sbi_fifo_enqueue+0x6c>
    80007466:	0104d603          	lhu	a2,16(s1)
    8000746a:	6088                	ld	a0,0(s1)
    8000746c:	85ca                	mv	a1,s2
    8000746e:	02f607bb          	mulw	a5,a2,a5
    80007472:	1782                	slli	a5,a5,0x20
    80007474:	9381                	srli	a5,a5,0x20
    80007476:	953e                	add	a0,a0,a5
    80007478:	ad7fc0ef          	jal	ra,80003f4e <sbi_memcpy>
    8000747c:	0144d783          	lhu	a5,20(s1)
    80007480:	854e                	mv	a0,s3
    80007482:	2785                	addiw	a5,a5,1
    80007484:	00f49a23          	sh	a5,20(s1)
    80007488:	c28fd0ef          	jal	ra,800048b0 <spin_unlock>
    8000748c:	4501                	li	a0,0
    8000748e:	70a2                	ld	ra,40(sp)
    80007490:	7402                	ld	s0,32(sp)
    80007492:	64e2                	ld	s1,24(sp)
    80007494:	6942                	ld	s2,16(sp)
    80007496:	69a2                	ld	s3,8(sp)
    80007498:	6145                	addi	sp,sp,48
    8000749a:	8082                	ret
    8000749c:	9f95                	subw	a5,a5,a3
    8000749e:	b7e1                	j	80007466 <sbi_fifo_enqueue+0x36>
    800074a0:	5575                	li	a0,-3
    800074a2:	b7f5                	j	8000748e <sbi_fifo_enqueue+0x5e>
    800074a4:	854e                	mv	a0,s3
    800074a6:	c0afd0ef          	jal	ra,800048b0 <spin_unlock>
    800074aa:	5555                	li	a0,-11
    800074ac:	b7cd                	j	8000748e <sbi_fifo_enqueue+0x5e>
    800074ae:	5575                	li	a0,-3
    800074b0:	8082                	ret

00000000800074b2 <sbi_fifo_dequeue>:
    800074b2:	c549                	beqz	a0,8000753c <sbi_fifo_dequeue+0x8a>
    800074b4:	7179                	addi	sp,sp,-48
    800074b6:	f022                	sd	s0,32(sp)
    800074b8:	e84a                	sd	s2,16(sp)
    800074ba:	f406                	sd	ra,40(sp)
    800074bc:	ec26                	sd	s1,24(sp)
    800074be:	e44e                	sd	s3,8(sp)
    800074c0:	1800                	addi	s0,sp,48
    800074c2:	892e                	mv	s2,a1
    800074c4:	c9b5                	beqz	a1,80007538 <sbi_fifo_dequeue+0x86>
    800074c6:	00850993          	addi	s3,a0,8
    800074ca:	84aa                	mv	s1,a0
    800074cc:	854e                	mv	a0,s3
    800074ce:	bc4fd0ef          	jal	ra,80004892 <spin_lock>
    800074d2:	0144d783          	lhu	a5,20(s1)
    800074d6:	cfa1                	beqz	a5,8000752e <sbi_fifo_dequeue+0x7c>
    800074d8:	0104d603          	lhu	a2,16(s1)
    800074dc:	0164d783          	lhu	a5,22(s1)
    800074e0:	608c                	ld	a1,0(s1)
    800074e2:	854a                	mv	a0,s2
    800074e4:	02c787bb          	mulw	a5,a5,a2
    800074e8:	1782                	slli	a5,a5,0x20
    800074ea:	9381                	srli	a5,a5,0x20
    800074ec:	95be                	add	a1,a1,a5
    800074ee:	a61fc0ef          	jal	ra,80003f4e <sbi_memcpy>
    800074f2:	0164d783          	lhu	a5,22(s1)
    800074f6:	0144d703          	lhu	a4,20(s1)
    800074fa:	0124d683          	lhu	a3,18(s1)
    800074fe:	2785                	addiw	a5,a5,1
    80007500:	17c2                	slli	a5,a5,0x30
    80007502:	377d                	addiw	a4,a4,-1
    80007504:	93c1                	srli	a5,a5,0x30
    80007506:	00e49a23          	sh	a4,20(s1)
    8000750a:	00f49b23          	sh	a5,22(s1)
    8000750e:	00d7fd63          	bgeu	a5,a3,80007528 <sbi_fifo_dequeue+0x76>
    80007512:	854e                	mv	a0,s3
    80007514:	b9cfd0ef          	jal	ra,800048b0 <spin_unlock>
    80007518:	4501                	li	a0,0
    8000751a:	70a2                	ld	ra,40(sp)
    8000751c:	7402                	ld	s0,32(sp)
    8000751e:	64e2                	ld	s1,24(sp)
    80007520:	6942                	ld	s2,16(sp)
    80007522:	69a2                	ld	s3,8(sp)
    80007524:	6145                	addi	sp,sp,48
    80007526:	8082                	ret
    80007528:	00049b23          	sh	zero,22(s1)
    8000752c:	b7dd                	j	80007512 <sbi_fifo_dequeue+0x60>
    8000752e:	854e                	mv	a0,s3
    80007530:	b80fd0ef          	jal	ra,800048b0 <spin_unlock>
    80007534:	5545                	li	a0,-15
    80007536:	b7d5                	j	8000751a <sbi_fifo_dequeue+0x68>
    80007538:	5575                	li	a0,-3
    8000753a:	b7c5                	j	8000751a <sbi_fifo_dequeue+0x68>
    8000753c:	5575                	li	a0,-3
    8000753e:	8082                	ret

0000000080007540 <__sbi_hfence_gvma_vmid_gpa>:
    80007540:	62a60073          	0x62a60073
    80007544:	8082                	ret
    80007546:	0001                	nop

0000000080007548 <__sbi_hfence_gvma_vmid>:
    80007548:	62a00073          	0x62a00073
    8000754c:	8082                	ret
    8000754e:	0001                	nop

0000000080007550 <__sbi_hfence_gvma_gpa>:
    80007550:	62050073          	0x62050073
    80007554:	8082                	ret
    80007556:	0001                	nop

0000000080007558 <__sbi_hfence_gvma_all>:
    80007558:	62000073          	0x62000073
    8000755c:	8082                	ret
    8000755e:	0001                	nop

0000000080007560 <__sbi_hfence_vvma_asid_va>:
    80007560:	22a60073          	0x22a60073
    80007564:	8082                	ret
    80007566:	0001                	nop

0000000080007568 <__sbi_hfence_vvma_asid>:
    80007568:	22a00073          	0x22a00073
    8000756c:	8082                	ret
    8000756e:	0001                	nop

0000000080007570 <__sbi_hfence_vvma_va>:
    80007570:	22050073          	0x22050073
    80007574:	8082                	ret
    80007576:	0001                	nop

0000000080007578 <__sbi_hfence_vvma_all>:
    80007578:	22000073          	0x22000073
    8000757c:	8082                	ret

000000008000757e <sbi_current_hartid>:
    8000757e:	1141                	addi	sp,sp,-16
    80007580:	e422                	sd	s0,8(sp)
    80007582:	0800                	addi	s0,sp,16
    80007584:	f1402573          	csrr	a0,mhartid
    80007588:	6422                	ld	s0,8(sp)
    8000758a:	2501                	sext.w	a0,a0
    8000758c:	0141                	addi	sp,sp,16
    8000758e:	8082                	ret

0000000080007590 <sbi_hart_delegation_dump>:
    80007590:	1141                	addi	sp,sp,-16
    80007592:	e022                	sd	s0,0(sp)
    80007594:	e406                	sd	ra,8(sp)
    80007596:	0800                	addi	s0,sp,16
    80007598:	303025f3          	csrr	a1,mideleg
    8000759c:	00006517          	auipc	a0,0x6
    800075a0:	9ac50513          	addi	a0,a0,-1620 # 8000cf48 <platform_ops+0x890>
    800075a4:	e7bfd0ef          	jal	ra,8000541e <sbi_printf>
    800075a8:	302025f3          	csrr	a1,medeleg
    800075ac:	00006517          	auipc	a0,0x6
    800075b0:	9b450513          	addi	a0,a0,-1612 # 8000cf60 <platform_ops+0x8a8>
    800075b4:	e6bfd0ef          	jal	ra,8000541e <sbi_printf>
    800075b8:	60a2                	ld	ra,8(sp)
    800075ba:	6402                	ld	s0,0(sp)
    800075bc:	0141                	addi	sp,sp,16
    800075be:	8082                	ret

00000000800075c0 <log2roundup>:
    800075c0:	1141                	addi	sp,sp,-16
    800075c2:	e422                	sd	s0,8(sp)
    800075c4:	0800                	addi	s0,sp,16
    800075c6:	872a                	mv	a4,a0
    800075c8:	4501                	li	a0,0
    800075ca:	4685                	li	a3,1
    800075cc:	04000613          	li	a2,64
    800075d0:	a021                	j	800075d8 <log2roundup+0x18>
    800075d2:	0505                	addi	a0,a0,1
    800075d4:	00c50663          	beq	a0,a2,800075e0 <log2roundup+0x20>
    800075d8:	00a697b3          	sll	a5,a3,a0
    800075dc:	fee7ebe3          	bltu	a5,a4,800075d2 <log2roundup+0x12>
    800075e0:	6422                	ld	s0,8(sp)
    800075e2:	0141                	addi	sp,sp,16
    800075e4:	8082                	ret

00000000800075e6 <sbi_hart_pmp_dump>:
    800075e6:	03154783          	lbu	a5,49(a0)
    800075ea:	03054703          	lbu	a4,48(a0)
    800075ee:	03254803          	lbu	a6,50(a0)
    800075f2:	03354583          	lbu	a1,51(a0)
    800075f6:	03454603          	lbu	a2,52(a0)
    800075fa:	07a2                	slli	a5,a5,0x8
    800075fc:	8fd9                	or	a5,a5,a4
    800075fe:	03554683          	lbu	a3,53(a0)
    80007602:	0842                	slli	a6,a6,0x10
    80007604:	00f86833          	or	a6,a6,a5
    80007608:	03654703          	lbu	a4,54(a0)
    8000760c:	05e2                	slli	a1,a1,0x18
    8000760e:	03754783          	lbu	a5,55(a0)
    80007612:	0105e5b3          	or	a1,a1,a6
    80007616:	1602                	slli	a2,a2,0x20
    80007618:	8e4d                	or	a2,a2,a1
    8000761a:	16a2                	slli	a3,a3,0x28
    8000761c:	8ed1                	or	a3,a3,a2
    8000761e:	1742                	slli	a4,a4,0x30
    80007620:	8f55                	or	a4,a4,a3
    80007622:	17e2                	slli	a5,a5,0x38
    80007624:	8fd9                	or	a5,a5,a4
    80007626:	0487c783          	lbu	a5,72(a5)
    8000762a:	8b91                	andi	a5,a5,4
    8000762c:	10078163          	beqz	a5,8000772e <sbi_hart_pmp_dump+0x148>
    80007630:	7159                	addi	sp,sp,-112
    80007632:	f0a2                	sd	s0,96(sp)
    80007634:	eca6                	sd	s1,88(sp)
    80007636:	e8ca                	sd	s2,80(sp)
    80007638:	e4ce                	sd	s3,72(sp)
    8000763a:	e0d2                	sd	s4,64(sp)
    8000763c:	fc56                	sd	s5,56(sp)
    8000763e:	f85a                	sd	s6,48(sp)
    80007640:	f45e                	sd	s7,40(sp)
    80007642:	f062                	sd	s8,32(sp)
    80007644:	f486                	sd	ra,104(sp)
    80007646:	1880                	addi	s0,sp,112
    80007648:	4481                	li	s1,0
    8000764a:	03f00a13          	li	s4,63
    8000764e:	00006997          	auipc	s3,0x6
    80007652:	92a98993          	addi	s3,s3,-1750 # 8000cf78 <platform_ops+0x8c0>
    80007656:	00005917          	auipc	s2,0x5
    8000765a:	dba90913          	addi	s2,s2,-582 # 8000c410 <fdt_move+0x85c>
    8000765e:	00006c17          	auipc	s8,0x6
    80007662:	952c0c13          	addi	s8,s8,-1710 # 8000cfb0 <platform_ops+0x8f8>
    80007666:	00006b97          	auipc	s7,0x6
    8000766a:	942b8b93          	addi	s7,s7,-1726 # 8000cfa8 <platform_ops+0x8f0>
    8000766e:	00006b17          	auipc	s6,0x6
    80007672:	932b0b13          	addi	s6,s6,-1742 # 8000cfa0 <platform_ops+0x8e8>
    80007676:	00006a97          	auipc	s5,0x6
    8000767a:	922a8a93          	addi	s5,s5,-1758 # 8000cf98 <platform_ops+0x8e0>
    8000767e:	a829                	j	80007698 <sbi_hart_pmp_dump+0xb2>
    80007680:	0027f713          	andi	a4,a5,2
    80007684:	eb25                	bnez	a4,800076f4 <sbi_hart_pmp_dump+0x10e>
    80007686:	8b91                	andi	a5,a5,4
    80007688:	efad                	bnez	a5,80007702 <sbi_hart_pmp_dump+0x11c>
    8000768a:	854a                	mv	a0,s2
    8000768c:	d93fd0ef          	jal	ra,8000541e <sbi_printf>
    80007690:	2485                	addiw	s1,s1,1
    80007692:	47c1                	li	a5,16
    80007694:	08f48163          	beq	s1,a5,80007716 <sbi_hart_pmp_dump+0x130>
    80007698:	fa840693          	addi	a3,s0,-88
    8000769c:	fa040613          	addi	a2,s0,-96
    800076a0:	f9840593          	addi	a1,s0,-104
    800076a4:	8526                	mv	a0,s1
    800076a6:	f31fc0ef          	jal	ra,800045d6 <pmp_get>
    800076aa:	f9843783          	ld	a5,-104(s0)
    800076ae:	8be1                	andi	a5,a5,24
    800076b0:	d3e5                	beqz	a5,80007690 <sbi_hart_pmp_dump+0xaa>
    800076b2:	fa843703          	ld	a4,-88(s0)
    800076b6:	4781                	li	a5,0
    800076b8:	00ea6563          	bltu	s4,a4,800076c2 <sbi_hart_pmp_dump+0xdc>
    800076bc:	4785                	li	a5,1
    800076be:	00e797b3          	sll	a5,a5,a4
    800076c2:	fa043603          	ld	a2,-96(s0)
    800076c6:	85a6                	mv	a1,s1
    800076c8:	854e                	mv	a0,s3
    800076ca:	fff60693          	addi	a3,a2,-1 # 5fffff <_fw_start-0x7fa00001>
    800076ce:	96be                	add	a3,a3,a5
    800076d0:	d4ffd0ef          	jal	ra,8000541e <sbi_printf>
    800076d4:	f9843783          	ld	a5,-104(s0)
    800076d8:	0807f713          	andi	a4,a5,128
    800076dc:	e71d                	bnez	a4,8000770a <sbi_hart_pmp_dump+0x124>
    800076de:	0017f713          	andi	a4,a5,1
    800076e2:	df59                	beqz	a4,80007680 <sbi_hart_pmp_dump+0x9a>
    800076e4:	855a                	mv	a0,s6
    800076e6:	d39fd0ef          	jal	ra,8000541e <sbi_printf>
    800076ea:	f9843783          	ld	a5,-104(s0)
    800076ee:	0027f713          	andi	a4,a5,2
    800076f2:	db51                	beqz	a4,80007686 <sbi_hart_pmp_dump+0xa0>
    800076f4:	855e                	mv	a0,s7
    800076f6:	d29fd0ef          	jal	ra,8000541e <sbi_printf>
    800076fa:	f9843783          	ld	a5,-104(s0)
    800076fe:	8b91                	andi	a5,a5,4
    80007700:	d7c9                	beqz	a5,8000768a <sbi_hart_pmp_dump+0xa4>
    80007702:	8562                	mv	a0,s8
    80007704:	d1bfd0ef          	jal	ra,8000541e <sbi_printf>
    80007708:	b749                	j	8000768a <sbi_hart_pmp_dump+0xa4>
    8000770a:	8556                	mv	a0,s5
    8000770c:	d13fd0ef          	jal	ra,8000541e <sbi_printf>
    80007710:	f9843783          	ld	a5,-104(s0)
    80007714:	b7e9                	j	800076de <sbi_hart_pmp_dump+0xf8>
    80007716:	70a6                	ld	ra,104(sp)
    80007718:	7406                	ld	s0,96(sp)
    8000771a:	64e6                	ld	s1,88(sp)
    8000771c:	6946                	ld	s2,80(sp)
    8000771e:	69a6                	ld	s3,72(sp)
    80007720:	6a06                	ld	s4,64(sp)
    80007722:	7ae2                	ld	s5,56(sp)
    80007724:	7b42                	ld	s6,48(sp)
    80007726:	7ba2                	ld	s7,40(sp)
    80007728:	7c02                	ld	s8,32(sp)
    8000772a:	6165                	addi	sp,sp,112
    8000772c:	8082                	ret
    8000772e:	8082                	ret

0000000080007730 <sbi_hart_init>:
    80007730:	715d                	addi	sp,sp,-80
    80007732:	e0a2                	sd	s0,64(sp)
    80007734:	fc26                	sd	s1,56(sp)
    80007736:	f44e                	sd	s3,40(sp)
    80007738:	e486                	sd	ra,72(sp)
    8000773a:	f84a                	sd	s2,48(sp)
    8000773c:	f052                	sd	s4,32(sp)
    8000773e:	0880                	addi	s0,sp,80
    80007740:	84aa                	mv	s1,a0
    80007742:	89ae                	mv	s3,a1
    80007744:	ce11                	beqz	a2,80007760 <sbi_hart_init+0x30>
    80007746:	00006597          	auipc	a1,0x6
    8000774a:	87258593          	addi	a1,a1,-1934 # 8000cfb8 <platform_ops+0x900>
    8000774e:	4521                	li	a0,8
    80007750:	834fa0ef          	jal	ra,80001784 <sbi_scratch_alloc_offset>
    80007754:	00008797          	auipc	a5,0x8
    80007758:	92a7be23          	sd	a0,-1732(a5) # 8000f090 <trap_info_offset>
    8000775c:	42050a63          	beqz	a0,80007b90 <sbi_hart_init+0x460>
    80007760:	0314c583          	lbu	a1,49(s1)
    80007764:	0304c783          	lbu	a5,48(s1)
    80007768:	0324c603          	lbu	a2,50(s1)
    8000776c:	0334c683          	lbu	a3,51(s1)
    80007770:	0344c703          	lbu	a4,52(s1)
    80007774:	05a2                	slli	a1,a1,0x8
    80007776:	8ddd                	or	a1,a1,a5
    80007778:	0354c903          	lbu	s2,53(s1)
    8000777c:	0642                	slli	a2,a2,0x10
    8000777e:	8e4d                	or	a2,a2,a1
    80007780:	0364c783          	lbu	a5,54(s1)
    80007784:	06e2                	slli	a3,a3,0x18
    80007786:	0374c583          	lbu	a1,55(s1)
    8000778a:	8ed1                	or	a3,a3,a2
    8000778c:	1702                	slli	a4,a4,0x20
    8000778e:	8f55                	or	a4,a4,a3
    80007790:	1922                	slli	s2,s2,0x28
    80007792:	00e96933          	or	s2,s2,a4
    80007796:	17c2                	slli	a5,a5,0x30
    80007798:	0127e7b3          	or	a5,a5,s2
    8000779c:	04400513          	li	a0,68
    800077a0:	03859913          	slli	s2,a1,0x38
    800077a4:	00f96933          	or	s2,s2,a5
    800077a8:	9edfc0ef          	jal	ra,80004194 <misa_extension_imp>
    800077ac:	3a050f63          	beqz	a0,80007b6a <sbi_hart_init+0x43a>
    800077b0:	6799                	lui	a5,0x6
    800077b2:	30079073          	csrw	mstatus,a5
    800077b6:	05300513          	li	a0,83
    800077ba:	9dbfc0ef          	jal	ra,80004194 <misa_extension_imp>
    800077be:	c529                	beqz	a0,80007808 <sbi_hart_init+0xd8>
    800077c0:	04994503          	lbu	a0,73(s2)
    800077c4:	04894703          	lbu	a4,72(s2)
    800077c8:	04a94783          	lbu	a5,74(s2)
    800077cc:	04b94583          	lbu	a1,75(s2)
    800077d0:	04c94603          	lbu	a2,76(s2)
    800077d4:	0522                	slli	a0,a0,0x8
    800077d6:	8d59                	or	a0,a0,a4
    800077d8:	04d94683          	lbu	a3,77(s2)
    800077dc:	07c2                	slli	a5,a5,0x10
    800077de:	8fc9                	or	a5,a5,a0
    800077e0:	04e94703          	lbu	a4,78(s2)
    800077e4:	05e2                	slli	a1,a1,0x18
    800077e6:	8ddd                	or	a1,a1,a5
    800077e8:	1602                	slli	a2,a2,0x20
    800077ea:	04f94783          	lbu	a5,79(s2)
    800077ee:	8e4d                	or	a2,a2,a1
    800077f0:	16a2                	slli	a3,a3,0x28
    800077f2:	8ed1                	or	a3,a3,a2
    800077f4:	1742                	slli	a4,a4,0x30
    800077f6:	8f55                	or	a4,a4,a3
    800077f8:	17e2                	slli	a5,a5,0x38
    800077fa:	00877693          	andi	a3,a4,8
    800077fe:	8fd9                	or	a5,a5,a4
    80007800:	c2b1                	beqz	a3,80007844 <sbi_hart_init+0x114>
    80007802:	57fd                	li	a5,-1
    80007804:	10679073          	csrw	scounteren,a5
    80007808:	04994783          	lbu	a5,73(s2)
    8000780c:	04894703          	lbu	a4,72(s2)
    80007810:	04a94503          	lbu	a0,74(s2)
    80007814:	04b94583          	lbu	a1,75(s2)
    80007818:	04c94603          	lbu	a2,76(s2)
    8000781c:	07a2                	slli	a5,a5,0x8
    8000781e:	8fd9                	or	a5,a5,a4
    80007820:	04d94683          	lbu	a3,77(s2)
    80007824:	0542                	slli	a0,a0,0x10
    80007826:	8d5d                	or	a0,a0,a5
    80007828:	04e94703          	lbu	a4,78(s2)
    8000782c:	05e2                	slli	a1,a1,0x18
    8000782e:	04f94783          	lbu	a5,79(s2)
    80007832:	8dc9                	or	a1,a1,a0
    80007834:	1602                	slli	a2,a2,0x20
    80007836:	8e4d                	or	a2,a2,a1
    80007838:	16a2                	slli	a3,a3,0x28
    8000783a:	8ed1                	or	a3,a3,a2
    8000783c:	1742                	slli	a4,a4,0x30
    8000783e:	8f55                	or	a4,a4,a3
    80007840:	17e2                	slli	a5,a5,0x38
    80007842:	8fd9                	or	a5,a5,a4
    80007844:	8bc1                	andi	a5,a5,16
    80007846:	c781                	beqz	a5,8000784e <sbi_hart_init+0x11e>
    80007848:	57fd                	li	a5,-1
    8000784a:	30679073          	csrw	mcounteren,a5
    8000784e:	30405073          	csrwi	mie,0
    80007852:	05300513          	li	a0,83
    80007856:	93ffc0ef          	jal	ra,80004194 <misa_extension_imp>
    8000785a:	2e051963          	bnez	a0,80007b4c <sbi_hart_init+0x41c>
    8000785e:	04400513          	li	a0,68
    80007862:	933fc0ef          	jal	ra,80004194 <misa_extension_imp>
    80007866:	2e050b63          	beqz	a0,80007b5c <sbi_hart_init+0x42c>
    8000786a:	300027f3          	csrr	a5,mstatus
    8000786e:	6719                	lui	a4,0x6
    80007870:	8ff9                	and	a5,a5,a4
    80007872:	32078363          	beqz	a5,80007b98 <sbi_hart_init+0x468>
    80007876:	4781                	li	a5,0
    80007878:	10000713          	li	a4,256
    8000787c:	4501                	li	a0,0
    8000787e:	00002697          	auipc	a3,0x2
    80007882:	96be                	add	a3,a3,a5
    80007884:	030682e7          	jalr	t0,48(a3) # 800098ae <put_f32_reg>
    80007888:	07a1                	addi	a5,a5,8
    8000788a:	fee799e3          	bne	a5,a4,8000787c <sbi_hart_init+0x14c>
    8000788e:	00305073          	csrwi	fcsr,0
    80007892:	0314c503          	lbu	a0,49(s1)
    80007896:	0304c783          	lbu	a5,48(s1)
    8000789a:	0324c583          	lbu	a1,50(s1)
    8000789e:	0334c603          	lbu	a2,51(s1)
    800078a2:	0344c683          	lbu	a3,52(s1)
    800078a6:	0522                	slli	a0,a0,0x8
    800078a8:	8d5d                	or	a0,a0,a5
    800078aa:	0354c703          	lbu	a4,53(s1)
    800078ae:	05c2                	slli	a1,a1,0x10
    800078b0:	8dc9                	or	a1,a1,a0
    800078b2:	0364c783          	lbu	a5,54(s1)
    800078b6:	0662                	slli	a2,a2,0x18
    800078b8:	0374c503          	lbu	a0,55(s1)
    800078bc:	8e4d                	or	a2,a2,a1
    800078be:	1682                	slli	a3,a3,0x20
    800078c0:	8ed1                	or	a3,a3,a2
    800078c2:	1722                	slli	a4,a4,0x28
    800078c4:	8f55                	or	a4,a4,a3
    800078c6:	17c2                	slli	a5,a5,0x30
    800078c8:	8fd9                	or	a5,a5,a4
    800078ca:	03851713          	slli	a4,a0,0x38
    800078ce:	05300513          	li	a0,83
    800078d2:	00f76933          	or	s2,a4,a5
    800078d6:	8bffc0ef          	jal	ra,80004194 <misa_extension_imp>
    800078da:	c915                	beqz	a0,8000790e <sbi_hart_init+0x1de>
    800078dc:	04894783          	lbu	a5,72(s2)
    800078e0:	4925                	li	s2,9
    800078e2:	0207f793          	andi	a5,a5,32
    800078e6:	c399                	beqz	a5,800078ec <sbi_hart_init+0x1bc>
    800078e8:	692d                	lui	s2,0xb
    800078ea:	0925                	addi	s2,s2,9
    800078ec:	04800513          	li	a0,72
    800078f0:	8a5fc0ef          	jal	ra,80004194 <misa_extension_imp>
    800078f4:	c519                	beqz	a0,80007902 <sbi_hart_init+0x1d2>
    800078f6:	00b007b7          	lui	a5,0xb00
    800078fa:	40078793          	addi	a5,a5,1024 # b00400 <_fw_start-0x7f4ffc00>
    800078fe:	00f96933          	or	s2,s2,a5
    80007902:	22200793          	li	a5,546
    80007906:	30379073          	csrw	mideleg,a5
    8000790a:	30291073          	csrw	medeleg,s2
    8000790e:	0314c583          	lbu	a1,49(s1)
    80007912:	0304c783          	lbu	a5,48(s1)
    80007916:	0324c603          	lbu	a2,50(s1)
    8000791a:	0334c683          	lbu	a3,51(s1)
    8000791e:	0344c703          	lbu	a4,52(s1)
    80007922:	05a2                	slli	a1,a1,0x8
    80007924:	8ddd                	or	a1,a1,a5
    80007926:	0354c903          	lbu	s2,53(s1)
    8000792a:	0642                	slli	a2,a2,0x10
    8000792c:	8e4d                	or	a2,a2,a1
    8000792e:	0364c783          	lbu	a5,54(s1)
    80007932:	06e2                	slli	a3,a3,0x18
    80007934:	0374c583          	lbu	a1,55(s1)
    80007938:	8ed1                	or	a3,a3,a2
    8000793a:	1702                	slli	a4,a4,0x20
    8000793c:	8f55                	or	a4,a4,a3
    8000793e:	1922                	slli	s2,s2,0x28
    80007940:	00e96933          	or	s2,s2,a4
    80007944:	17c2                	slli	a5,a5,0x30
    80007946:	0127e7b3          	or	a5,a5,s2
    8000794a:	03859913          	slli	s2,a1,0x38
    8000794e:	00f96933          	or	s2,s2,a5
    80007952:	04894783          	lbu	a5,72(s2) # b048 <_fw_start-0x7fff4fb8>
    80007956:	8b91                	andi	a5,a5,4
    80007958:	1e078163          	beqz	a5,80007b3a <sbi_hart_init+0x40a>
    8000795c:	0094c703          	lbu	a4,9(s1)
    80007960:	0084c783          	lbu	a5,8(s1)
    80007964:	00a4c503          	lbu	a0,10(s1)
    80007968:	00b4c583          	lbu	a1,11(s1)
    8000796c:	00c4c603          	lbu	a2,12(s1)
    80007970:	0722                	slli	a4,a4,0x8
    80007972:	8f5d                	or	a4,a4,a5
    80007974:	00d4c683          	lbu	a3,13(s1)
    80007978:	0542                	slli	a0,a0,0x10
    8000797a:	8d59                	or	a0,a0,a4
    8000797c:	00e4c783          	lbu	a5,14(s1)
    80007980:	05e2                	slli	a1,a1,0x18
    80007982:	8dc9                	or	a1,a1,a0
    80007984:	00f4c703          	lbu	a4,15(s1)
    80007988:	1602                	slli	a2,a2,0x20
    8000798a:	8e4d                	or	a2,a2,a1
    8000798c:	16a2                	slli	a3,a3,0x28
    8000798e:	8ed1                	or	a3,a3,a2
    80007990:	17c2                	slli	a5,a5,0x30
    80007992:	8fd5                	or	a5,a5,a3
    80007994:	1762                	slli	a4,a4,0x38
    80007996:	4681                	li	a3,0
    80007998:	4605                	li	a2,1
    8000799a:	8f5d                	or	a4,a4,a5
    8000799c:	00d617b3          	sll	a5,a2,a3
    800079a0:	04000593          	li	a1,64
    800079a4:	00e7f963          	bgeu	a5,a4,800079b6 <sbi_hart_init+0x286>
    800079a8:	0685                	addi	a3,a3,1
    800079aa:	1eb68563          	beq	a3,a1,80007b94 <sbi_hart_init+0x464>
    800079ae:	00d617b3          	sll	a5,a2,a3
    800079b2:	fee7ebe3          	bltu	a5,a4,800079a8 <sbi_hart_init+0x278>
    800079b6:	40f007b3          	neg	a5,a5
    800079ba:	0014c603          	lbu	a2,1(s1)
    800079be:	0004c703          	lbu	a4,0(s1)
    800079c2:	0024c883          	lbu	a7,2(s1)
    800079c6:	0034c803          	lbu	a6,3(s1)
    800079ca:	0044c503          	lbu	a0,4(s1)
    800079ce:	0622                	slli	a2,a2,0x8
    800079d0:	8e59                	or	a2,a2,a4
    800079d2:	0054c583          	lbu	a1,5(s1)
    800079d6:	08c2                	slli	a7,a7,0x10
    800079d8:	00c8e8b3          	or	a7,a7,a2
    800079dc:	0064c703          	lbu	a4,6(s1)
    800079e0:	0862                	slli	a6,a6,0x18
    800079e2:	0074c603          	lbu	a2,7(s1)
    800079e6:	01186833          	or	a6,a6,a7
    800079ea:	1502                	slli	a0,a0,0x20
    800079ec:	01056533          	or	a0,a0,a6
    800079f0:	15a2                	slli	a1,a1,0x28
    800079f2:	8dc9                	or	a1,a1,a0
    800079f4:	1742                	slli	a4,a4,0x30
    800079f6:	8f4d                	or	a4,a4,a1
    800079f8:	1662                	slli	a2,a2,0x38
    800079fa:	8e59                	or	a2,a2,a4
    800079fc:	8e7d                	and	a2,a2,a5
    800079fe:	4581                	li	a1,0
    80007a00:	4501                	li	a0,0
    80007a02:	af7fc0ef          	jal	ra,800044f8 <pmp_set>
    80007a06:	12090a63          	beqz	s2,80007b3a <sbi_hart_init+0x40a>
    80007a0a:	06194783          	lbu	a5,97(s2)
    80007a0e:	06094703          	lbu	a4,96(s2)
    80007a12:	06294503          	lbu	a0,98(s2)
    80007a16:	06394583          	lbu	a1,99(s2)
    80007a1a:	06494603          	lbu	a2,100(s2)
    80007a1e:	07a2                	slli	a5,a5,0x8
    80007a20:	8fd9                	or	a5,a5,a4
    80007a22:	06594683          	lbu	a3,101(s2)
    80007a26:	0542                	slli	a0,a0,0x10
    80007a28:	8d5d                	or	a0,a0,a5
    80007a2a:	06694703          	lbu	a4,102(s2)
    80007a2e:	05e2                	slli	a1,a1,0x18
    80007a30:	8dc9                	or	a1,a1,a0
    80007a32:	06794783          	lbu	a5,103(s2)
    80007a36:	1602                	slli	a2,a2,0x20
    80007a38:	8e4d                	or	a2,a2,a1
    80007a3a:	16a2                	slli	a3,a3,0x28
    80007a3c:	8ed1                	or	a3,a3,a2
    80007a3e:	1742                	slli	a4,a4,0x30
    80007a40:	8f55                	or	a4,a4,a3
    80007a42:	17e2                	slli	a5,a5,0x38
    80007a44:	8fd9                	or	a5,a5,a4
    80007a46:	0317c803          	lbu	a6,49(a5)
    80007a4a:	0307c703          	lbu	a4,48(a5)
    80007a4e:	0327c503          	lbu	a0,50(a5)
    80007a52:	0337c583          	lbu	a1,51(a5)
    80007a56:	0347c603          	lbu	a2,52(a5)
    80007a5a:	0822                	slli	a6,a6,0x8
    80007a5c:	0357c683          	lbu	a3,53(a5)
    80007a60:	00e86833          	or	a6,a6,a4
    80007a64:	0542                	slli	a0,a0,0x10
    80007a66:	0367c703          	lbu	a4,54(a5)
    80007a6a:	01056533          	or	a0,a0,a6
    80007a6e:	05e2                	slli	a1,a1,0x18
    80007a70:	0377c783          	lbu	a5,55(a5)
    80007a74:	8dc9                	or	a1,a1,a0
    80007a76:	1602                	slli	a2,a2,0x20
    80007a78:	8e4d                	or	a2,a2,a1
    80007a7a:	16a2                	slli	a3,a3,0x28
    80007a7c:	8ed1                	or	a3,a3,a2
    80007a7e:	1742                	slli	a4,a4,0x30
    80007a80:	8f55                	or	a4,a4,a3
    80007a82:	17e2                	slli	a5,a5,0x38
    80007a84:	8fd9                	or	a5,a5,a4
    80007a86:	cbd5                	beqz	a5,80007b3a <sbi_hart_init+0x40a>
    80007a88:	854e                	mv	a0,s3
    80007a8a:	9782                	jalr	a5
    80007a8c:	0005079b          	sext.w	a5,a0
    80007a90:	473d                	li	a4,15
    80007a92:	0007849b          	sext.w	s1,a5
    80007a96:	00f77363          	bgeu	a4,a5,80007a9c <sbi_hart_init+0x36c>
    80007a9a:	44bd                	li	s1,15
    80007a9c:	cfd9                	beqz	a5,80007b3a <sbi_hart_init+0x40a>
    80007a9e:	4a01                	li	s4,0
    80007aa0:	06194783          	lbu	a5,97(s2)
    80007aa4:	06094703          	lbu	a4,96(s2)
    80007aa8:	06294503          	lbu	a0,98(s2)
    80007aac:	06394583          	lbu	a1,99(s2)
    80007ab0:	06494603          	lbu	a2,100(s2)
    80007ab4:	07a2                	slli	a5,a5,0x8
    80007ab6:	8fd9                	or	a5,a5,a4
    80007ab8:	06594683          	lbu	a3,101(s2)
    80007abc:	0542                	slli	a0,a0,0x10
    80007abe:	8d5d                	or	a0,a0,a5
    80007ac0:	06694703          	lbu	a4,102(s2)
    80007ac4:	05e2                	slli	a1,a1,0x18
    80007ac6:	8dc9                	or	a1,a1,a0
    80007ac8:	06794783          	lbu	a5,103(s2)
    80007acc:	1602                	slli	a2,a2,0x20
    80007ace:	8e4d                	or	a2,a2,a1
    80007ad0:	16a2                	slli	a3,a3,0x28
    80007ad2:	8ed1                	or	a3,a3,a2
    80007ad4:	1742                	slli	a4,a4,0x30
    80007ad6:	8f55                	or	a4,a4,a3
    80007ad8:	17e2                	slli	a5,a5,0x38
    80007ada:	8fd9                	or	a5,a5,a4
    80007adc:	0397c803          	lbu	a6,57(a5)
    80007ae0:	0387c583          	lbu	a1,56(a5)
    80007ae4:	03a7c503          	lbu	a0,58(a5)
    80007ae8:	03b7c603          	lbu	a2,59(a5)
    80007aec:	03c7c683          	lbu	a3,60(a5)
    80007af0:	0822                	slli	a6,a6,0x8
    80007af2:	03d7c703          	lbu	a4,61(a5)
    80007af6:	00b86833          	or	a6,a6,a1
    80007afa:	0542                	slli	a0,a0,0x10
    80007afc:	03e7c583          	lbu	a1,62(a5)
    80007b00:	01056533          	or	a0,a0,a6
    80007b04:	0662                	slli	a2,a2,0x18
    80007b06:	8e49                	or	a2,a2,a0
    80007b08:	03f7c783          	lbu	a5,63(a5)
    80007b0c:	1682                	slli	a3,a3,0x20
    80007b0e:	8ed1                	or	a3,a3,a2
    80007b10:	1722                	slli	a4,a4,0x28
    80007b12:	8f55                	or	a4,a4,a3
    80007b14:	15c2                	slli	a1,a1,0x30
    80007b16:	8dd9                	or	a1,a1,a4
    80007b18:	17e2                	slli	a5,a5,0x38
    80007b1a:	8fcd                	or	a5,a5,a1
    80007b1c:	fc840713          	addi	a4,s0,-56
    80007b20:	000a059b          	sext.w	a1,s4
    80007b24:	fc040693          	addi	a3,s0,-64
    80007b28:	fb840613          	addi	a2,s0,-72
    80007b2c:	854e                	mv	a0,s3
    80007b2e:	2a05                	addiw	s4,s4,1
    80007b30:	c7a1                	beqz	a5,80007b78 <sbi_hart_init+0x448>
    80007b32:	9782                	jalr	a5
    80007b34:	c131                	beqz	a0,80007b78 <sbi_hart_init+0x448>
    80007b36:	f69a65e3          	bltu	s4,s1,80007aa0 <sbi_hart_init+0x370>
    80007b3a:	4501                	li	a0,0
    80007b3c:	60a6                	ld	ra,72(sp)
    80007b3e:	6406                	ld	s0,64(sp)
    80007b40:	74e2                	ld	s1,56(sp)
    80007b42:	7942                	ld	s2,48(sp)
    80007b44:	79a2                	ld	s3,40(sp)
    80007b46:	7a02                	ld	s4,32(sp)
    80007b48:	6161                	addi	sp,sp,80
    80007b4a:	8082                	ret
    80007b4c:	18005073          	csrwi	satp,0
    80007b50:	04400513          	li	a0,68
    80007b54:	e40fc0ef          	jal	ra,80004194 <misa_extension_imp>
    80007b58:	d00519e3          	bnez	a0,8000786a <sbi_hart_init+0x13a>
    80007b5c:	04600513          	li	a0,70
    80007b60:	e34fc0ef          	jal	ra,80004194 <misa_extension_imp>
    80007b64:	d00513e3          	bnez	a0,8000786a <sbi_hart_init+0x13a>
    80007b68:	b32d                	j	80007892 <sbi_hart_init+0x162>
    80007b6a:	04600513          	li	a0,70
    80007b6e:	e26fc0ef          	jal	ra,80004194 <misa_extension_imp>
    80007b72:	c2051fe3          	bnez	a0,800077b0 <sbi_hart_init+0x80>
    80007b76:	b181                	j	800077b6 <sbi_hart_init+0x86>
    80007b78:	fc843683          	ld	a3,-56(s0)
    80007b7c:	fc043603          	ld	a2,-64(s0)
    80007b80:	fb843583          	ld	a1,-72(s0)
    80007b84:	8552                	mv	a0,s4
    80007b86:	973fc0ef          	jal	ra,800044f8 <pmp_set>
    80007b8a:	f09a6be3          	bltu	s4,s1,80007aa0 <sbi_hart_init+0x370>
    80007b8e:	b775                	j	80007b3a <sbi_hart_init+0x40a>
    80007b90:	5551                	li	a0,-12
    80007b92:	b76d                	j	80007b3c <sbi_hart_init+0x40c>
    80007b94:	4781                	li	a5,0
    80007b96:	b515                	j	800079ba <sbi_hart_init+0x28a>
    80007b98:	5575                	li	a0,-3
    80007b9a:	b74d                	j	80007b3c <sbi_hart_init+0x40c>

0000000080007b9c <sbi_hart_get_trap_info>:
    80007b9c:	1141                	addi	sp,sp,-16
    80007b9e:	e422                	sd	s0,8(sp)
    80007ba0:	0800                	addi	s0,sp,16
    80007ba2:	00007797          	auipc	a5,0x7
    80007ba6:	4ee7b783          	ld	a5,1262(a5) # 8000f090 <trap_info_offset>
    80007baa:	c791                	beqz	a5,80007bb6 <sbi_hart_get_trap_info+0x1a>
    80007bac:	6422                	ld	s0,8(sp)
    80007bae:	953e                	add	a0,a0,a5
    80007bb0:	6108                	ld	a0,0(a0)
    80007bb2:	0141                	addi	sp,sp,16
    80007bb4:	8082                	ret
    80007bb6:	6422                	ld	s0,8(sp)
    80007bb8:	4501                	li	a0,0
    80007bba:	0141                	addi	sp,sp,16
    80007bbc:	8082                	ret

0000000080007bbe <sbi_hart_set_trap_info>:
    80007bbe:	1141                	addi	sp,sp,-16
    80007bc0:	e422                	sd	s0,8(sp)
    80007bc2:	0800                	addi	s0,sp,16
    80007bc4:	00007797          	auipc	a5,0x7
    80007bc8:	4cc7b783          	ld	a5,1228(a5) # 8000f090 <trap_info_offset>
    80007bcc:	c399                	beqz	a5,80007bd2 <sbi_hart_set_trap_info+0x14>
    80007bce:	953e                	add	a0,a0,a5
    80007bd0:	e10c                	sd	a1,0(a0)
    80007bd2:	6422                	ld	s0,8(sp)
    80007bd4:	0141                	addi	sp,sp,16
    80007bd6:	8082                	ret

0000000080007bd8 <sbi_hart_hang>:
    80007bd8:	1141                	addi	sp,sp,-16
    80007bda:	e422                	sd	s0,8(sp)
    80007bdc:	0800                	addi	s0,sp,16
    80007bde:	10500073          	wfi
    80007be2:	10500073          	wfi
    80007be6:	bfe5                	j	80007bde <sbi_hart_hang+0x6>

0000000080007be8 <sbi_hart_switch_mode>:
    80007be8:	7139                	addi	sp,sp,-64
    80007bea:	f822                	sd	s0,48(sp)
    80007bec:	f426                	sd	s1,40(sp)
    80007bee:	f04a                	sd	s2,32(sp)
    80007bf0:	ec4e                	sd	s3,24(sp)
    80007bf2:	e852                	sd	s4,16(sp)
    80007bf4:	e456                	sd	s5,8(sp)
    80007bf6:	fc06                	sd	ra,56(sp)
    80007bf8:	e05a                	sd	s6,0(sp)
    80007bfa:	0080                	addi	s0,sp,64
    80007bfc:	4785                	li	a5,1
    80007bfe:	84b6                	mv	s1,a3
    80007c00:	8a2a                	mv	s4,a0
    80007c02:	89ae                	mv	s3,a1
    80007c04:	8932                	mv	s2,a2
    80007c06:	8aba                	mv	s5,a4
    80007c08:	02f68563          	beq	a3,a5,80007c32 <sbi_hart_switch_mode+0x4a>
    80007c0c:	478d                	li	a5,3
    80007c0e:	02f68c63          	beq	a3,a5,80007c46 <sbi_hart_switch_mode+0x5e>
    80007c12:	c691                	beqz	a3,80007c1e <sbi_hart_switch_mode+0x36>
    80007c14:	10500073          	wfi
    80007c18:	10500073          	wfi
    80007c1c:	bfe5                	j	80007c14 <sbi_hart_switch_mode+0x2c>
    80007c1e:	05500513          	li	a0,85
    80007c22:	d72fc0ef          	jal	ra,80004194 <misa_extension_imp>
    80007c26:	e105                	bnez	a0,80007c46 <sbi_hart_switch_mode+0x5e>
    80007c28:	10500073          	wfi
    80007c2c:	10500073          	wfi
    80007c30:	bfe5                	j	80007c28 <sbi_hart_switch_mode+0x40>
    80007c32:	05300513          	li	a0,83
    80007c36:	d5efc0ef          	jal	ra,80004194 <misa_extension_imp>
    80007c3a:	e511                	bnez	a0,80007c46 <sbi_hart_switch_mode+0x5e>
    80007c3c:	10500073          	wfi
    80007c40:	10500073          	wfi
    80007c44:	bfe5                	j	80007c3c <sbi_hart_switch_mode+0x54>
    80007c46:	30002b73          	csrr	s6,mstatus
    80007c4a:	77f9                	lui	a5,0xffffe
    80007c4c:	7ff78793          	addi	a5,a5,2047 # ffffffffffffe7ff <_enclave_end+0xffffffff7e8fe7ff>
    80007c50:	00fb7b33          	and	s6,s6,a5
    80007c54:	04800513          	li	a0,72
    80007c58:	00b49793          	slli	a5,s1,0xb
    80007c5c:	00fb6b33          	or	s6,s6,a5
    80007c60:	d34fc0ef          	jal	ra,80004194 <misa_extension_imp>
    80007c64:	f7fb7793          	andi	a5,s6,-129
    80007c68:	c511                	beqz	a0,80007c74 <sbi_hart_switch_mode+0x8c>
    80007c6a:	040a8063          	beqz	s5,80007caa <sbi_hart_switch_mode+0xc2>
    80007c6e:	4705                	li	a4,1
    80007c70:	171e                	slli	a4,a4,0x27
    80007c72:	8fd9                	or	a5,a5,a4
    80007c74:	30079073          	csrw	mstatus,a5
    80007c78:	34191073          	csrw	mepc,s2
    80007c7c:	4785                	li	a5,1
    80007c7e:	00f48d63          	beq	s1,a5,80007c98 <sbi_hart_switch_mode+0xb0>
    80007c82:	e499                	bnez	s1,80007c90 <sbi_hart_switch_mode+0xa8>
    80007c84:	00591073          	csrw	utvec,s2
    80007c88:	04005073          	csrwi	uscratch,0
    80007c8c:	00405073          	csrwi	uie,0
    80007c90:	8552                	mv	a0,s4
    80007c92:	85ce                	mv	a1,s3
    80007c94:	30200073          	mret
    80007c98:	10591073          	csrw	stvec,s2
    80007c9c:	14005073          	csrwi	sscratch,0
    80007ca0:	10405073          	csrwi	sie,0
    80007ca4:	18005073          	csrwi	satp,0
    80007ca8:	b7e5                	j	80007c90 <sbi_hart_switch_mode+0xa8>
    80007caa:	57fd                	li	a5,-1
    80007cac:	179e                	slli	a5,a5,0x27
    80007cae:	f7f78793          	addi	a5,a5,-129
    80007cb2:	00fb77b3          	and	a5,s6,a5
    80007cb6:	bf7d                	j	80007c74 <sbi_hart_switch_mode+0x8c>

0000000080007cb8 <sbi_hart_mark_available>:
    80007cb8:	1101                	addi	sp,sp,-32
    80007cba:	ec06                	sd	ra,24(sp)
    80007cbc:	e822                	sd	s0,16(sp)
    80007cbe:	e426                	sd	s1,8(sp)
    80007cc0:	1000                	addi	s0,sp,32
    80007cc2:	84aa                	mv	s1,a0
    80007cc4:	00007517          	auipc	a0,0x7
    80007cc8:	3c450513          	addi	a0,a0,964 # 8000f088 <avail_hart_mask_lock>
    80007ccc:	bc7fc0ef          	jal	ra,80004892 <spin_lock>
    80007cd0:	00007717          	auipc	a4,0x7
    80007cd4:	3b070713          	addi	a4,a4,944 # 8000f080 <avail_hart_mask>
    80007cd8:	6314                	ld	a3,0(a4)
    80007cda:	4785                	li	a5,1
    80007cdc:	009797b3          	sll	a5,a5,s1
    80007ce0:	8fd5                	or	a5,a5,a3
    80007ce2:	00007517          	auipc	a0,0x7
    80007ce6:	3a650513          	addi	a0,a0,934 # 8000f088 <avail_hart_mask_lock>
    80007cea:	e31c                	sd	a5,0(a4)
    80007cec:	bc5fc0ef          	jal	ra,800048b0 <spin_unlock>
    80007cf0:	60e2                	ld	ra,24(sp)
    80007cf2:	6442                	ld	s0,16(sp)
    80007cf4:	64a2                	ld	s1,8(sp)
    80007cf6:	6105                	addi	sp,sp,32
    80007cf8:	8082                	ret

0000000080007cfa <sbi_hart_unmark_available>:
    80007cfa:	1101                	addi	sp,sp,-32
    80007cfc:	ec06                	sd	ra,24(sp)
    80007cfe:	e822                	sd	s0,16(sp)
    80007d00:	e426                	sd	s1,8(sp)
    80007d02:	1000                	addi	s0,sp,32
    80007d04:	84aa                	mv	s1,a0
    80007d06:	00007517          	auipc	a0,0x7
    80007d0a:	38250513          	addi	a0,a0,898 # 8000f088 <avail_hart_mask_lock>
    80007d0e:	b85fc0ef          	jal	ra,80004892 <spin_lock>
    80007d12:	00007717          	auipc	a4,0x7
    80007d16:	36e70713          	addi	a4,a4,878 # 8000f080 <avail_hart_mask>
    80007d1a:	6314                	ld	a3,0(a4)
    80007d1c:	4785                	li	a5,1
    80007d1e:	009797b3          	sll	a5,a5,s1
    80007d22:	fff7c793          	not	a5,a5
    80007d26:	8ff5                	and	a5,a5,a3
    80007d28:	00007517          	auipc	a0,0x7
    80007d2c:	36050513          	addi	a0,a0,864 # 8000f088 <avail_hart_mask_lock>
    80007d30:	e31c                	sd	a5,0(a4)
    80007d32:	b7ffc0ef          	jal	ra,800048b0 <spin_unlock>
    80007d36:	60e2                	ld	ra,24(sp)
    80007d38:	6442                	ld	s0,16(sp)
    80007d3a:	64a2                	ld	s1,8(sp)
    80007d3c:	6105                	addi	sp,sp,32
    80007d3e:	8082                	ret

0000000080007d40 <sbi_hart_available_mask>:
    80007d40:	1101                	addi	sp,sp,-32
    80007d42:	ec06                	sd	ra,24(sp)
    80007d44:	e822                	sd	s0,16(sp)
    80007d46:	e426                	sd	s1,8(sp)
    80007d48:	1000                	addi	s0,sp,32
    80007d4a:	00007517          	auipc	a0,0x7
    80007d4e:	33e50513          	addi	a0,a0,830 # 8000f088 <avail_hart_mask_lock>
    80007d52:	b41fc0ef          	jal	ra,80004892 <spin_lock>
    80007d56:	00007517          	auipc	a0,0x7
    80007d5a:	33250513          	addi	a0,a0,818 # 8000f088 <avail_hart_mask_lock>
    80007d5e:	00007497          	auipc	s1,0x7
    80007d62:	3224b483          	ld	s1,802(s1) # 8000f080 <avail_hart_mask>
    80007d66:	b4bfc0ef          	jal	ra,800048b0 <spin_unlock>
    80007d6a:	60e2                	ld	ra,24(sp)
    80007d6c:	6442                	ld	s0,16(sp)
    80007d6e:	8526                	mv	a0,s1
    80007d70:	64a2                	ld	s1,8(sp)
    80007d72:	6105                	addi	sp,sp,32
    80007d74:	8082                	ret

0000000080007d76 <sbi_hart_id_to_scratch>:
    80007d76:	1141                	addi	sp,sp,-16
    80007d78:	e022                	sd	s0,0(sp)
    80007d7a:	e406                	sd	ra,8(sp)
    80007d7c:	0800                	addi	s0,sp,16
    80007d7e:	03954703          	lbu	a4,57(a0)
    80007d82:	03854783          	lbu	a5,56(a0)
    80007d86:	03a54883          	lbu	a7,58(a0)
    80007d8a:	03b54803          	lbu	a6,59(a0)
    80007d8e:	03c54603          	lbu	a2,60(a0)
    80007d92:	0722                	slli	a4,a4,0x8
    80007d94:	03d54683          	lbu	a3,61(a0)
    80007d98:	8f5d                	or	a4,a4,a5
    80007d9a:	08c2                	slli	a7,a7,0x10
    80007d9c:	03e54783          	lbu	a5,62(a0)
    80007da0:	00e8e8b3          	or	a7,a7,a4
    80007da4:	0862                	slli	a6,a6,0x18
    80007da6:	03f54703          	lbu	a4,63(a0)
    80007daa:	1602                	slli	a2,a2,0x20
    80007dac:	01186533          	or	a0,a6,a7
    80007db0:	8e49                	or	a2,a2,a0
    80007db2:	16a2                	slli	a3,a3,0x28
    80007db4:	8ed1                	or	a3,a3,a2
    80007db6:	17c2                	slli	a5,a5,0x30
    80007db8:	8edd                	or	a3,a3,a5
    80007dba:	02059513          	slli	a0,a1,0x20
    80007dbe:	03871793          	slli	a5,a4,0x38
    80007dc2:	8fd5                	or	a5,a5,a3
    80007dc4:	9101                	srli	a0,a0,0x20
    80007dc6:	9782                	jalr	a5
    80007dc8:	60a2                	ld	ra,8(sp)
    80007dca:	6402                	ld	s0,0(sp)
    80007dcc:	0141                	addi	sp,sp,16
    80007dce:	8082                	ret

0000000080007dd0 <sbi_hart_wait_for_coldboot>:
    80007dd0:	715d                	addi	sp,sp,-80
    80007dd2:	e0a2                	sd	s0,64(sp)
    80007dd4:	e486                	sd	ra,72(sp)
    80007dd6:	fc26                	sd	s1,56(sp)
    80007dd8:	f84a                	sd	s2,48(sp)
    80007dda:	f44e                	sd	s3,40(sp)
    80007ddc:	f052                	sd	s4,32(sp)
    80007dde:	ec56                	sd	s5,24(sp)
    80007de0:	e85a                	sd	s6,16(sp)
    80007de2:	e45e                	sd	s7,8(sp)
    80007de4:	0880                	addi	s0,sp,80
    80007de6:	03154803          	lbu	a6,49(a0)
    80007dea:	03054783          	lbu	a5,48(a0)
    80007dee:	03254603          	lbu	a2,50(a0)
    80007df2:	03354683          	lbu	a3,51(a0)
    80007df6:	03454703          	lbu	a4,52(a0)
    80007dfa:	0822                	slli	a6,a6,0x8
    80007dfc:	03554483          	lbu	s1,53(a0)
    80007e00:	00f86833          	or	a6,a6,a5
    80007e04:	0642                	slli	a2,a2,0x10
    80007e06:	03654783          	lbu	a5,54(a0)
    80007e0a:	01066633          	or	a2,a2,a6
    80007e0e:	06e2                	slli	a3,a3,0x18
    80007e10:	03754503          	lbu	a0,55(a0)
    80007e14:	8ed1                	or	a3,a3,a2
    80007e16:	1702                	slli	a4,a4,0x20
    80007e18:	8f55                	or	a4,a4,a3
    80007e1a:	14a2                	slli	s1,s1,0x28
    80007e1c:	8cd9                	or	s1,s1,a4
    80007e1e:	17c2                	slli	a5,a5,0x30
    80007e20:	8fc5                	or	a5,a5,s1
    80007e22:	03851493          	slli	s1,a0,0x38
    80007e26:	8cdd                	or	s1,s1,a5
    80007e28:	c49d                	beqz	s1,80007e56 <sbi_hart_wait_for_coldboot+0x86>
    80007e2a:	0514c683          	lbu	a3,81(s1)
    80007e2e:	0504c603          	lbu	a2,80(s1)
    80007e32:	0524c703          	lbu	a4,82(s1)
    80007e36:	0534c783          	lbu	a5,83(s1)
    80007e3a:	06a2                	slli	a3,a3,0x8
    80007e3c:	8ed1                	or	a3,a3,a2
    80007e3e:	0742                	slli	a4,a4,0x10
    80007e40:	8f55                	or	a4,a4,a3
    80007e42:	07e2                	slli	a5,a5,0x18
    80007e44:	8fd9                	or	a5,a5,a4
    80007e46:	2781                	sext.w	a5,a5
    80007e48:	892e                	mv	s2,a1
    80007e4a:	00f5f663          	bgeu	a1,a5,80007e56 <sbi_hart_wait_for_coldboot+0x86>
    80007e4e:	03f00793          	li	a5,63
    80007e52:	00b7f763          	bgeu	a5,a1,80007e60 <sbi_hart_wait_for_coldboot+0x90>
    80007e56:	10500073          	wfi
    80007e5a:	10500073          	wfi
    80007e5e:	bfe5                	j	80007e56 <sbi_hart_wait_for_coldboot+0x86>
    80007e60:	30402bf3          	csrr	s7,mie
    80007e64:	30446073          	csrsi	mie,8
    80007e68:	00007517          	auipc	a0,0x7
    80007e6c:	21050513          	addi	a0,a0,528 # 8000f078 <coldboot_lock>
    80007e70:	a23fc0ef          	jal	ra,80004892 <spin_lock>
    80007e74:	00007b17          	auipc	s6,0x7
    80007e78:	1f4b0b13          	addi	s6,s6,500 # 8000f068 <coldboot_wait_bitmap>
    80007e7c:	000b3783          	ld	a5,0(s6)
    80007e80:	00007a17          	auipc	s4,0x7
    80007e84:	1f0a0a13          	addi	s4,s4,496 # 8000f070 <coldboot_done>
    80007e88:	4a85                	li	s5,1
    80007e8a:	012a9ab3          	sll	s5,s5,s2
    80007e8e:	000a3683          	ld	a3,0(s4)
    80007e92:	00fae733          	or	a4,s5,a5
    80007e96:	00eb3023          	sd	a4,0(s6)
    80007e9a:	e295                	bnez	a3,80007ebe <sbi_hart_wait_for_coldboot+0xee>
    80007e9c:	00007997          	auipc	s3,0x7
    80007ea0:	1dc98993          	addi	s3,s3,476 # 8000f078 <coldboot_lock>
    80007ea4:	854e                	mv	a0,s3
    80007ea6:	a0bfc0ef          	jal	ra,800048b0 <spin_unlock>
    80007eaa:	10500073          	wfi
    80007eae:	854e                	mv	a0,s3
    80007eb0:	9e3fc0ef          	jal	ra,80004892 <spin_lock>
    80007eb4:	000a3783          	ld	a5,0(s4)
    80007eb8:	d7f5                	beqz	a5,80007ea4 <sbi_hart_wait_for_coldboot+0xd4>
    80007eba:	000b3703          	ld	a4,0(s6)
    80007ebe:	fffac793          	not	a5,s5
    80007ec2:	8ff9                	and	a5,a5,a4
    80007ec4:	00007517          	auipc	a0,0x7
    80007ec8:	1b450513          	addi	a0,a0,436 # 8000f078 <coldboot_lock>
    80007ecc:	00fb3023          	sd	a5,0(s6)
    80007ed0:	9e1fc0ef          	jal	ra,800048b0 <spin_unlock>
    80007ed4:	304b9073          	csrw	mie,s7
    80007ed8:	0614c783          	lbu	a5,97(s1)
    80007edc:	0604c703          	lbu	a4,96(s1)
    80007ee0:	0624c503          	lbu	a0,98(s1)
    80007ee4:	0634c583          	lbu	a1,99(s1)
    80007ee8:	0644c603          	lbu	a2,100(s1)
    80007eec:	07a2                	slli	a5,a5,0x8
    80007eee:	8fd9                	or	a5,a5,a4
    80007ef0:	0654c683          	lbu	a3,101(s1)
    80007ef4:	0542                	slli	a0,a0,0x10
    80007ef6:	8d5d                	or	a0,a0,a5
    80007ef8:	0664c703          	lbu	a4,102(s1)
    80007efc:	05e2                	slli	a1,a1,0x18
    80007efe:	8dc9                	or	a1,a1,a0
    80007f00:	0674c783          	lbu	a5,103(s1)
    80007f04:	1602                	slli	a2,a2,0x20
    80007f06:	8e4d                	or	a2,a2,a1
    80007f08:	16a2                	slli	a3,a3,0x28
    80007f0a:	8ed1                	or	a3,a3,a2
    80007f0c:	1742                	slli	a4,a4,0x30
    80007f0e:	8f55                	or	a4,a4,a3
    80007f10:	17e2                	slli	a5,a5,0x38
    80007f12:	8fd9                	or	a5,a5,a4
    80007f14:	0717c803          	lbu	a6,113(a5)
    80007f18:	0707c703          	lbu	a4,112(a5)
    80007f1c:	0727c503          	lbu	a0,114(a5)
    80007f20:	0737c583          	lbu	a1,115(a5)
    80007f24:	0747c603          	lbu	a2,116(a5)
    80007f28:	0822                	slli	a6,a6,0x8
    80007f2a:	0757c683          	lbu	a3,117(a5)
    80007f2e:	00e86833          	or	a6,a6,a4
    80007f32:	0542                	slli	a0,a0,0x10
    80007f34:	0767c703          	lbu	a4,118(a5)
    80007f38:	01056533          	or	a0,a0,a6
    80007f3c:	05e2                	slli	a1,a1,0x18
    80007f3e:	0777c783          	lbu	a5,119(a5)
    80007f42:	8dc9                	or	a1,a1,a0
    80007f44:	1602                	slli	a2,a2,0x20
    80007f46:	8e4d                	or	a2,a2,a1
    80007f48:	16a2                	slli	a3,a3,0x28
    80007f4a:	8ed1                	or	a3,a3,a2
    80007f4c:	1742                	slli	a4,a4,0x30
    80007f4e:	8f55                	or	a4,a4,a3
    80007f50:	17e2                	slli	a5,a5,0x38
    80007f52:	8fd9                	or	a5,a5,a4
    80007f54:	c399                	beqz	a5,80007f5a <sbi_hart_wait_for_coldboot+0x18a>
    80007f56:	854a                	mv	a0,s2
    80007f58:	9782                	jalr	a5
    80007f5a:	60a6                	ld	ra,72(sp)
    80007f5c:	6406                	ld	s0,64(sp)
    80007f5e:	74e2                	ld	s1,56(sp)
    80007f60:	7942                	ld	s2,48(sp)
    80007f62:	79a2                	ld	s3,40(sp)
    80007f64:	7a02                	ld	s4,32(sp)
    80007f66:	6ae2                	ld	s5,24(sp)
    80007f68:	6b42                	ld	s6,16(sp)
    80007f6a:	6ba2                	ld	s7,8(sp)
    80007f6c:	6161                	addi	sp,sp,80
    80007f6e:	8082                	ret

0000000080007f70 <sbi_hart_wake_coldboot_harts>:
    80007f70:	7139                	addi	sp,sp,-64
    80007f72:	f822                	sd	s0,48(sp)
    80007f74:	fc06                	sd	ra,56(sp)
    80007f76:	f426                	sd	s1,40(sp)
    80007f78:	f04a                	sd	s2,32(sp)
    80007f7a:	ec4e                	sd	s3,24(sp)
    80007f7c:	e852                	sd	s4,16(sp)
    80007f7e:	e456                	sd	s5,8(sp)
    80007f80:	0080                	addi	s0,sp,64
    80007f82:	03154803          	lbu	a6,49(a0)
    80007f86:	03054783          	lbu	a5,48(a0)
    80007f8a:	03254603          	lbu	a2,50(a0)
    80007f8e:	03354683          	lbu	a3,51(a0)
    80007f92:	03454703          	lbu	a4,52(a0)
    80007f96:	0822                	slli	a6,a6,0x8
    80007f98:	03554903          	lbu	s2,53(a0)
    80007f9c:	00f86833          	or	a6,a6,a5
    80007fa0:	0642                	slli	a2,a2,0x10
    80007fa2:	03654783          	lbu	a5,54(a0)
    80007fa6:	01066633          	or	a2,a2,a6
    80007faa:	06e2                	slli	a3,a3,0x18
    80007fac:	03754503          	lbu	a0,55(a0)
    80007fb0:	8ed1                	or	a3,a3,a2
    80007fb2:	1702                	slli	a4,a4,0x20
    80007fb4:	8f55                	or	a4,a4,a3
    80007fb6:	1922                	slli	s2,s2,0x28
    80007fb8:	00e96933          	or	s2,s2,a4
    80007fbc:	17c2                	slli	a5,a5,0x30
    80007fbe:	0127e7b3          	or	a5,a5,s2
    80007fc2:	03851913          	slli	s2,a0,0x38
    80007fc6:	00f96933          	or	s2,s2,a5
    80007fca:	10090863          	beqz	s2,800080da <sbi_hart_wake_coldboot_harts+0x16a>
    80007fce:	05194703          	lbu	a4,81(s2)
    80007fd2:	05094683          	lbu	a3,80(s2)
    80007fd6:	05294783          	lbu	a5,82(s2)
    80007fda:	05394983          	lbu	s3,83(s2)
    80007fde:	0722                	slli	a4,a4,0x8
    80007fe0:	8f55                	or	a4,a4,a3
    80007fe2:	07c2                	slli	a5,a5,0x10
    80007fe4:	8fd9                	or	a5,a5,a4
    80007fe6:	09e2                	slli	s3,s3,0x18
    80007fe8:	00007517          	auipc	a0,0x7
    80007fec:	09050513          	addi	a0,a0,144 # 8000f078 <coldboot_lock>
    80007ff0:	00f9e9b3          	or	s3,s3,a5
    80007ff4:	8a2e                	mv	s4,a1
    80007ff6:	89dfc0ef          	jal	ra,80004892 <spin_lock>
    80007ffa:	4785                	li	a5,1
    80007ffc:	2981                	sext.w	s3,s3
    80007ffe:	00007717          	auipc	a4,0x7
    80008002:	06f73923          	sd	a5,114(a4) # 8000f070 <coldboot_done>
    80008006:	4481                	li	s1,0
    80008008:	00007a97          	auipc	s5,0x7
    8000800c:	060a8a93          	addi	s5,s5,96 # 8000f068 <coldboot_wait_bitmap>
    80008010:	01304663          	bgtz	s3,8000801c <sbi_hart_wake_coldboot_harts+0xac>
    80008014:	a065                	j	800080bc <sbi_hart_wake_coldboot_harts+0x14c>
    80008016:	2485                	addiw	s1,s1,1
    80008018:	0a998263          	beq	s3,s1,800080bc <sbi_hart_wake_coldboot_harts+0x14c>
    8000801c:	0004851b          	sext.w	a0,s1
    80008020:	fe9a0be3          	beq	s4,s1,80008016 <sbi_hart_wake_coldboot_harts+0xa6>
    80008024:	000ab783          	ld	a5,0(s5)
    80008028:	0097d7b3          	srl	a5,a5,s1
    8000802c:	8b85                	andi	a5,a5,1
    8000802e:	d7e5                	beqz	a5,80008016 <sbi_hart_wake_coldboot_harts+0xa6>
    80008030:	06194783          	lbu	a5,97(s2)
    80008034:	06094703          	lbu	a4,96(s2)
    80008038:	06294803          	lbu	a6,98(s2)
    8000803c:	06394583          	lbu	a1,99(s2)
    80008040:	06494603          	lbu	a2,100(s2)
    80008044:	07a2                	slli	a5,a5,0x8
    80008046:	8fd9                	or	a5,a5,a4
    80008048:	06594683          	lbu	a3,101(s2)
    8000804c:	0842                	slli	a6,a6,0x10
    8000804e:	00f86833          	or	a6,a6,a5
    80008052:	06694703          	lbu	a4,102(s2)
    80008056:	05e2                	slli	a1,a1,0x18
    80008058:	0105e5b3          	or	a1,a1,a6
    8000805c:	06794783          	lbu	a5,103(s2)
    80008060:	1602                	slli	a2,a2,0x20
    80008062:	8e4d                	or	a2,a2,a1
    80008064:	16a2                	slli	a3,a3,0x28
    80008066:	8ed1                	or	a3,a3,a2
    80008068:	1742                	slli	a4,a4,0x30
    8000806a:	8f55                	or	a4,a4,a3
    8000806c:	17e2                	slli	a5,a5,0x38
    8000806e:	8fd9                	or	a5,a5,a4
    80008070:	0697c883          	lbu	a7,105(a5)
    80008074:	0687c703          	lbu	a4,104(a5)
    80008078:	06a7c803          	lbu	a6,106(a5)
    8000807c:	06b7c583          	lbu	a1,107(a5)
    80008080:	06c7c603          	lbu	a2,108(a5)
    80008084:	08a2                	slli	a7,a7,0x8
    80008086:	06d7c683          	lbu	a3,109(a5)
    8000808a:	00e8e8b3          	or	a7,a7,a4
    8000808e:	0842                	slli	a6,a6,0x10
    80008090:	06e7c703          	lbu	a4,110(a5)
    80008094:	01186833          	or	a6,a6,a7
    80008098:	05e2                	slli	a1,a1,0x18
    8000809a:	06f7c783          	lbu	a5,111(a5)
    8000809e:	0105e5b3          	or	a1,a1,a6
    800080a2:	1602                	slli	a2,a2,0x20
    800080a4:	8e4d                	or	a2,a2,a1
    800080a6:	16a2                	slli	a3,a3,0x28
    800080a8:	8ed1                	or	a3,a3,a2
    800080aa:	1742                	slli	a4,a4,0x30
    800080ac:	8f55                	or	a4,a4,a3
    800080ae:	17e2                	slli	a5,a5,0x38
    800080b0:	8fd9                	or	a5,a5,a4
    800080b2:	d3b5                	beqz	a5,80008016 <sbi_hart_wake_coldboot_harts+0xa6>
    800080b4:	2485                	addiw	s1,s1,1
    800080b6:	9782                	jalr	a5
    800080b8:	f69992e3          	bne	s3,s1,8000801c <sbi_hart_wake_coldboot_harts+0xac>
    800080bc:	00007517          	auipc	a0,0x7
    800080c0:	fbc50513          	addi	a0,a0,-68 # 8000f078 <coldboot_lock>
    800080c4:	fecfc0ef          	jal	ra,800048b0 <spin_unlock>
    800080c8:	70e2                	ld	ra,56(sp)
    800080ca:	7442                	ld	s0,48(sp)
    800080cc:	74a2                	ld	s1,40(sp)
    800080ce:	7902                	ld	s2,32(sp)
    800080d0:	69e2                	ld	s3,24(sp)
    800080d2:	6a42                	ld	s4,16(sp)
    800080d4:	6aa2                	ld	s5,8(sp)
    800080d6:	6121                	addi	sp,sp,64
    800080d8:	8082                	ret
    800080da:	00007517          	auipc	a0,0x7
    800080de:	f9e50513          	addi	a0,a0,-98 # 8000f078 <coldboot_lock>
    800080e2:	fb0fc0ef          	jal	ra,80004892 <spin_lock>
    800080e6:	4785                	li	a5,1
    800080e8:	00007717          	auipc	a4,0x7
    800080ec:	f8f73423          	sd	a5,-120(a4) # 8000f070 <coldboot_done>
    800080f0:	b7f1                	j	800080bc <sbi_hart_wake_coldboot_harts+0x14c>

00000000800080f2 <truly_illegal_insn>:
    800080f2:	7139                	addi	sp,sp,-64
    800080f4:	f822                	sd	s0,48(sp)
    800080f6:	fc06                	sd	ra,56(sp)
    800080f8:	0080                	addi	s0,sp,64
    800080fa:	1016c583          	lbu	a1,257(a3)
    800080fe:	1006c783          	lbu	a5,256(a3)
    80008102:	1026ce03          	lbu	t3,258(a3)
    80008106:	1036c303          	lbu	t1,259(a3)
    8000810a:	1046c883          	lbu	a7,260(a3)
    8000810e:	05a2                	slli	a1,a1,0x8
    80008110:	8ddd                	or	a1,a1,a5
    80008112:	1056c803          	lbu	a6,261(a3)
    80008116:	0e42                	slli	t3,t3,0x10
    80008118:	00be6e33          	or	t3,t3,a1
    8000811c:	1066c783          	lbu	a5,262(a3)
    80008120:	0362                	slli	t1,t1,0x18
    80008122:	1076c583          	lbu	a1,263(a3)
    80008126:	01c36333          	or	t1,t1,t3
    8000812a:	1882                	slli	a7,a7,0x20
    8000812c:	0068e8b3          	or	a7,a7,t1
    80008130:	1822                	slli	a6,a6,0x28
    80008132:	01186833          	or	a6,a6,a7
    80008136:	17c2                	slli	a5,a5,0x30
    80008138:	0107e833          	or	a6,a5,a6
    8000813c:	03859793          	slli	a5,a1,0x38
    80008140:	88aa                	mv	a7,a0
    80008142:	8332                	mv	t1,a2
    80008144:	0107e7b3          	or	a5,a5,a6
    80008148:	fc840593          	addi	a1,s0,-56
    8000814c:	863a                	mv	a2,a4
    8000814e:	8536                	mv	a0,a3
    80008150:	fcf43423          	sd	a5,-56(s0)
    80008154:	fc643823          	sd	t1,-48(s0)
    80008158:	fd143c23          	sd	a7,-40(s0)
    8000815c:	fe043023          	sd	zero,-32(s0)
    80008160:	fe043423          	sd	zero,-24(s0)
    80008164:	90ffa0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80008168:	70e2                	ld	ra,56(sp)
    8000816a:	7442                	ld	s0,48(sp)
    8000816c:	6121                	addi	sp,sp,64
    8000816e:	8082                	ret

0000000080008170 <system_opcode_insn>:
    80008170:	7175                	addi	sp,sp,-144
    80008172:	e122                	sd	s0,128(sp)
    80008174:	fca6                	sd	s1,120(sp)
    80008176:	f8ca                	sd	s2,112(sp)
    80008178:	f4ce                	sd	s3,104(sp)
    8000817a:	f0d2                	sd	s4,96(sp)
    8000817c:	e8da                	sd	s6,80(sp)
    8000817e:	e4de                	sd	s7,72(sp)
    80008180:	fc66                	sd	s9,56(sp)
    80008182:	e506                	sd	ra,136(sp)
    80008184:	ecd6                	sd	s5,88(sp)
    80008186:	e0e2                	sd	s8,64(sp)
    80008188:	0900                	addi	s0,sp,144
    8000818a:	84b6                	mv	s1,a3
    8000818c:	1096c783          	lbu	a5,265(a3)
    80008190:	10a4ce03          	lbu	t3,266(s1)
    80008194:	1086c683          	lbu	a3,264(a3)
    80008198:	10b4c303          	lbu	t1,267(s1)
    8000819c:	10c4c883          	lbu	a7,268(s1)
    800081a0:	07a2                	slli	a5,a5,0x8
    800081a2:	8fd5                	or	a5,a5,a3
    800081a4:	10d4c803          	lbu	a6,269(s1)
    800081a8:	0e42                	slli	t3,t3,0x10
    800081aa:	00fe6e33          	or	t3,t3,a5
    800081ae:	10e4c683          	lbu	a3,270(s1)
    800081b2:	0362                	slli	t1,t1,0x18
    800081b4:	10f4c783          	lbu	a5,271(s1)
    800081b8:	01c36333          	or	t1,t1,t3
    800081bc:	1882                	slli	a7,a7,0x20
    800081be:	0068e8b3          	or	a7,a7,t1
    800081c2:	1822                	slli	a6,a6,0x28
    800081c4:	01186833          	or	a6,a6,a7
    800081c8:	16c2                	slli	a3,a3,0x30
    800081ca:	0106e6b3          	or	a3,a3,a6
    800081ce:	892a                	mv	s2,a0
    800081d0:	00c55993          	srli	s3,a0,0xc
    800081d4:	17e2                	slli	a5,a5,0x38
    800081d6:	4505                	li	a0,1
    800081d8:	8fd5                	or	a5,a5,a3
    800081da:	0f89f813          	andi	a6,s3,248
    800081de:	02751693          	slli	a3,a0,0x27
    800081e2:	9826                	add	a6,a6,s1
    800081e4:	8ff5                	and	a5,a5,a3
    800081e6:	00083c03          	ld	s8,0(a6) # 22000000 <_fw_start-0x5e000000>
    800081ea:	8bae                	mv	s7,a1
    800081ec:	8a32                	mv	s4,a2
    800081ee:	8b3a                	mv	s6,a4
    800081f0:	01495c9b          	srliw	s9,s2,0x14
    800081f4:	cb91                	beqz	a5,80008208 <system_opcode_insn+0x98>
    800081f6:	1502                	slli	a0,a0,0x20
    800081f8:	f0050513          	addi	a0,a0,-256
    800081fc:	00a97533          	and	a0,s2,a0
    80008200:	105007b7          	lui	a5,0x10500
    80008204:	0ef50c63          	beq	a0,a5,800082fc <system_opcode_insn+0x18c>
    80008208:	f7040713          	addi	a4,s0,-144
    8000820c:	86da                	mv	a3,s6
    8000820e:	8626                	mv	a2,s1
    80008210:	85de                	mv	a1,s7
    80008212:	8566                	mv	a0,s9
    80008214:	19b010ef          	jal	ra,80009bae <sbi_emulate_csr_read>
    80008218:	8aaa                	mv	s5,a0
    8000821a:	e16d                	bnez	a0,800082fc <system_opcode_insn+0x18c>
    8000821c:	0079f993          	andi	s3,s3,7
    80008220:	00005717          	auipc	a4,0x5
    80008224:	da870713          	addi	a4,a4,-600 # 8000cfc8 <platform_ops+0x910>
    80008228:	098a                	slli	s3,s3,0x2
    8000822a:	99ba                	add	s3,s3,a4
    8000822c:	0009a683          	lw	a3,0(s3)
    80008230:	00f95793          	srli	a5,s2,0xf
    80008234:	8bfd                	andi	a5,a5,31
    80008236:	96ba                	add	a3,a3,a4
    80008238:	8682                	jr	a3
    8000823a:	f7043703          	ld	a4,-144(s0)
    8000823e:	00e7ec33          	or	s8,a5,a4
    80008242:	cb99                	beqz	a5,80008258 <system_opcode_insn+0xe8>
    80008244:	8762                	mv	a4,s8
    80008246:	86da                	mv	a3,s6
    80008248:	8626                	mv	a2,s1
    8000824a:	85de                	mv	a1,s7
    8000824c:	8566                	mv	a0,s9
    8000824e:	37b010ef          	jal	ra,80009dc8 <sbi_emulate_csr_write>
    80008252:	e54d                	bnez	a0,800082fc <system_opcode_insn+0x18c>
    80008254:	f7043703          	ld	a4,-144(s0)
    80008258:	00495913          	srli	s2,s2,0x4
    8000825c:	0f897913          	andi	s2,s2,248
    80008260:	9926                	add	s2,s2,s1
    80008262:	00e93023          	sd	a4,0(s2)
    80008266:	1014c783          	lbu	a5,257(s1)
    8000826a:	1004c703          	lbu	a4,256(s1)
    8000826e:	1024c503          	lbu	a0,258(s1)
    80008272:	1034c583          	lbu	a1,259(s1)
    80008276:	1044c603          	lbu	a2,260(s1)
    8000827a:	07a2                	slli	a5,a5,0x8
    8000827c:	8fd9                	or	a5,a5,a4
    8000827e:	1054c683          	lbu	a3,261(s1)
    80008282:	0542                	slli	a0,a0,0x10
    80008284:	8d5d                	or	a0,a0,a5
    80008286:	1064c703          	lbu	a4,262(s1)
    8000828a:	05e2                	slli	a1,a1,0x18
    8000828c:	8dc9                	or	a1,a1,a0
    8000828e:	1074c783          	lbu	a5,263(s1)
    80008292:	1602                	slli	a2,a2,0x20
    80008294:	8e4d                	or	a2,a2,a1
    80008296:	16a2                	slli	a3,a3,0x28
    80008298:	8ed1                	or	a3,a3,a2
    8000829a:	1742                	slli	a4,a4,0x30
    8000829c:	8f55                	or	a4,a4,a3
    8000829e:	17e2                	slli	a5,a5,0x38
    800082a0:	8fd9                	or	a5,a5,a4
    800082a2:	0791                	addi	a5,a5,4
    800082a4:	0087d893          	srli	a7,a5,0x8
    800082a8:	0107d813          	srli	a6,a5,0x10
    800082ac:	0187d51b          	srliw	a0,a5,0x18
    800082b0:	0207d593          	srli	a1,a5,0x20
    800082b4:	0287d613          	srli	a2,a5,0x28
    800082b8:	0307d693          	srli	a3,a5,0x30
    800082bc:	0387d713          	srli	a4,a5,0x38
    800082c0:	10f48023          	sb	a5,256(s1)
    800082c4:	111480a3          	sb	a7,257(s1)
    800082c8:	11048123          	sb	a6,258(s1)
    800082cc:	10a481a3          	sb	a0,259(s1)
    800082d0:	10b48223          	sb	a1,260(s1)
    800082d4:	10c482a3          	sb	a2,261(s1)
    800082d8:	10d48323          	sb	a3,262(s1)
    800082dc:	10e483a3          	sb	a4,263(s1)
    800082e0:	60aa                	ld	ra,136(sp)
    800082e2:	640a                	ld	s0,128(sp)
    800082e4:	74e6                	ld	s1,120(sp)
    800082e6:	7946                	ld	s2,112(sp)
    800082e8:	79a6                	ld	s3,104(sp)
    800082ea:	7a06                	ld	s4,96(sp)
    800082ec:	6b46                	ld	s6,80(sp)
    800082ee:	6ba6                	ld	s7,72(sp)
    800082f0:	6c06                	ld	s8,64(sp)
    800082f2:	7ce2                	ld	s9,56(sp)
    800082f4:	8556                	mv	a0,s5
    800082f6:	6ae6                	ld	s5,88(sp)
    800082f8:	6149                	addi	sp,sp,144
    800082fa:	8082                	ret
    800082fc:	1014c783          	lbu	a5,257(s1)
    80008300:	1004c703          	lbu	a4,256(s1)
    80008304:	1024c503          	lbu	a0,258(s1)
    80008308:	1034c583          	lbu	a1,259(s1)
    8000830c:	1044c603          	lbu	a2,260(s1)
    80008310:	07a2                	slli	a5,a5,0x8
    80008312:	1054c683          	lbu	a3,261(s1)
    80008316:	8fd9                	or	a5,a5,a4
    80008318:	0542                	slli	a0,a0,0x10
    8000831a:	1064c703          	lbu	a4,262(s1)
    8000831e:	8d5d                	or	a0,a0,a5
    80008320:	05e2                	slli	a1,a1,0x18
    80008322:	1074c783          	lbu	a5,263(s1)
    80008326:	8dc9                	or	a1,a1,a0
    80008328:	1602                	slli	a2,a2,0x20
    8000832a:	8e4d                	or	a2,a2,a1
    8000832c:	16a2                	slli	a3,a3,0x28
    8000832e:	8ed1                	or	a3,a3,a2
    80008330:	1742                	slli	a4,a4,0x30
    80008332:	8f55                	or	a4,a4,a3
    80008334:	17e2                	slli	a5,a5,0x38
    80008336:	8fd9                	or	a5,a5,a4
    80008338:	865a                	mv	a2,s6
    8000833a:	f7840593          	addi	a1,s0,-136
    8000833e:	8526                	mv	a0,s1
    80008340:	f6f43c23          	sd	a5,-136(s0)
    80008344:	f9443023          	sd	s4,-128(s0)
    80008348:	f9243423          	sd	s2,-120(s0)
    8000834c:	f8043823          	sd	zero,-112(s0)
    80008350:	f8043c23          	sd	zero,-104(s0)
    80008354:	f1efa0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80008358:	8aaa                	mv	s5,a0
    8000835a:	b759                	j	800082e0 <system_opcode_insn+0x170>
    8000835c:	f7043703          	ld	a4,-144(s0)
    80008360:	fff7cc13          	not	s8,a5
    80008364:	00ec7c33          	and	s8,s8,a4
    80008368:	ee0788e3          	beqz	a5,80008258 <system_opcode_insn+0xe8>
    8000836c:	bde1                	j	80008244 <system_opcode_insn+0xd4>
    8000836e:	f7043703          	ld	a4,-144(s0)
    80008372:	00ec6c33          	or	s8,s8,a4
    80008376:	ee0781e3          	beqz	a5,80008258 <system_opcode_insn+0xe8>
    8000837a:	b5e9                	j	80008244 <system_opcode_insn+0xd4>
    8000837c:	8c3e                	mv	s8,a5
    8000837e:	b5d9                	j	80008244 <system_opcode_insn+0xd4>
    80008380:	f7043703          	ld	a4,-144(s0)
    80008384:	fffc4c13          	not	s8,s8
    80008388:	00ec7c33          	and	s8,s8,a4
    8000838c:	ec0786e3          	beqz	a5,80008258 <system_opcode_insn+0xe8>
    80008390:	bd55                	j	80008244 <system_opcode_insn+0xd4>

0000000080008392 <sbi_illegal_insn_handler>:
    80008392:	7175                	addi	sp,sp,-144
    80008394:	e122                	sd	s0,128(sp)
    80008396:	fca6                	sd	s1,120(sp)
    80008398:	f8ca                	sd	s2,112(sp)
    8000839a:	f4ce                	sd	s3,104(sp)
    8000839c:	e506                	sd	ra,136(sp)
    8000839e:	0900                	addi	s0,sp,144
    800083a0:	00367813          	andi	a6,a2,3
    800083a4:	448d                	li	s1,3
    800083a6:	87b2                	mv	a5,a2
    800083a8:	89aa                	mv	s3,a0
    800083aa:	892e                	mv	s2,a1
    800083ac:	02981863          	bne	a6,s1,800083dc <sbi_illegal_insn_handler+0x4a>
    800083b0:	00179813          	slli	a6,a5,0x1
    800083b4:	0f887893          	andi	a7,a6,248
    800083b8:	00005817          	auipc	a6,0x5
    800083bc:	c3080813          	addi	a6,a6,-976 # 8000cfe8 <illegal_insn_table>
    800083c0:	9846                	add	a6,a6,a7
    800083c2:	00083803          	ld	a6,0(a6)
    800083c6:	864a                	mv	a2,s2
    800083c8:	85ce                	mv	a1,s3
    800083ca:	853e                	mv	a0,a5
    800083cc:	9802                	jalr	a6
    800083ce:	60aa                	ld	ra,136(sp)
    800083d0:	640a                	ld	s0,128(sp)
    800083d2:	74e6                	ld	s1,120(sp)
    800083d4:	7946                	ld	s2,112(sp)
    800083d6:	79a6                	ld	s3,104(sp)
    800083d8:	6149                	addi	sp,sp,144
    800083da:	8082                	ret
    800083dc:	1016c303          	lbu	t1,257(a3)
    800083e0:	1006c603          	lbu	a2,256(a3)
    800083e4:	1026c883          	lbu	a7,258(a3)
    800083e8:	1036c803          	lbu	a6,259(a3)
    800083ec:	1046c503          	lbu	a0,260(a3)
    800083f0:	0322                	slli	t1,t1,0x8
    800083f2:	00c36333          	or	t1,t1,a2
    800083f6:	1056c583          	lbu	a1,261(a3)
    800083fa:	08c2                	slli	a7,a7,0x10
    800083fc:	0068e8b3          	or	a7,a7,t1
    80008400:	1066c603          	lbu	a2,262(a3)
    80008404:	0862                	slli	a6,a6,0x18
    80008406:	01186833          	or	a6,a6,a7
    8000840a:	1076c303          	lbu	t1,263(a3)
    8000840e:	1502                	slli	a0,a0,0x20
    80008410:	01056533          	or	a0,a0,a6
    80008414:	15a2                	slli	a1,a1,0x28
    80008416:	8dc9                	or	a1,a1,a0
    80008418:	1642                	slli	a2,a2,0x30
    8000841a:	8e4d                	or	a2,a2,a1
    8000841c:	03831513          	slli	a0,t1,0x38
    80008420:	00c56833          	or	a6,a0,a2
    80008424:	c395                	beqz	a5,80008448 <sbi_illegal_insn_handler+0xb6>
    80008426:	863a                	mv	a2,a4
    80008428:	fa840593          	addi	a1,s0,-88
    8000842c:	8536                	mv	a0,a3
    8000842e:	fb043423          	sd	a6,-88(s0)
    80008432:	fb243823          	sd	s2,-80(s0)
    80008436:	faf43c23          	sd	a5,-72(s0)
    8000843a:	fc043023          	sd	zero,-64(s0)
    8000843e:	fc043423          	sd	zero,-56(s0)
    80008442:	e30fa0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80008446:	b761                	j	800083ce <sbi_illegal_insn_handler+0x3c>
    80008448:	85ba                	mv	a1,a4
    8000844a:	f8040613          	addi	a2,s0,-128
    8000844e:	8542                	mv	a0,a6
    80008450:	f6d43823          	sd	a3,-144(s0)
    80008454:	f6e43c23          	sd	a4,-136(s0)
    80008458:	343000ef          	jal	ra,80008f9a <sbi_get_insn>
    8000845c:	f8843583          	ld	a1,-120(s0)
    80008460:	f7843703          	ld	a4,-136(s0)
    80008464:	f7043683          	ld	a3,-144(s0)
    80008468:	87aa                	mv	a5,a0
    8000846a:	e9b1                	bnez	a1,800084be <sbi_illegal_insn_handler+0x12c>
    8000846c:	00357613          	andi	a2,a0,3
    80008470:	f49600e3          	beq	a2,s1,800083b0 <sbi_illegal_insn_handler+0x1e>
    80008474:	1016c603          	lbu	a2,257(a3)
    80008478:	1006c503          	lbu	a0,256(a3)
    8000847c:	1026c303          	lbu	t1,258(a3)
    80008480:	1036c883          	lbu	a7,259(a3)
    80008484:	1046c583          	lbu	a1,260(a3)
    80008488:	0622                	slli	a2,a2,0x8
    8000848a:	8e49                	or	a2,a2,a0
    8000848c:	1056c803          	lbu	a6,261(a3)
    80008490:	0342                	slli	t1,t1,0x10
    80008492:	00c36333          	or	t1,t1,a2
    80008496:	1066c503          	lbu	a0,262(a3)
    8000849a:	08e2                	slli	a7,a7,0x18
    8000849c:	1076c603          	lbu	a2,263(a3)
    800084a0:	0068e8b3          	or	a7,a7,t1
    800084a4:	1582                	slli	a1,a1,0x20
    800084a6:	0115e5b3          	or	a1,a1,a7
    800084aa:	1822                	slli	a6,a6,0x28
    800084ac:	00b86833          	or	a6,a6,a1
    800084b0:	1542                	slli	a0,a0,0x30
    800084b2:	01056533          	or	a0,a0,a6
    800084b6:	1662                	slli	a2,a2,0x38
    800084b8:	00a66833          	or	a6,a2,a0
    800084bc:	b7ad                	j	80008426 <sbi_illegal_insn_handler+0x94>
    800084be:	1016c783          	lbu	a5,257(a3)
    800084c2:	1006c603          	lbu	a2,256(a3)
    800084c6:	1026c883          	lbu	a7,258(a3)
    800084ca:	1036c803          	lbu	a6,259(a3)
    800084ce:	1046c503          	lbu	a0,260(a3)
    800084d2:	07a2                	slli	a5,a5,0x8
    800084d4:	1056c583          	lbu	a1,261(a3)
    800084d8:	8fd1                	or	a5,a5,a2
    800084da:	08c2                	slli	a7,a7,0x10
    800084dc:	1066c603          	lbu	a2,262(a3)
    800084e0:	00f8e8b3          	or	a7,a7,a5
    800084e4:	0862                	slli	a6,a6,0x18
    800084e6:	1076c783          	lbu	a5,263(a3)
    800084ea:	01186833          	or	a6,a6,a7
    800084ee:	1502                	slli	a0,a0,0x20
    800084f0:	01056533          	or	a0,a0,a6
    800084f4:	15a2                	slli	a1,a1,0x28
    800084f6:	8dc9                	or	a1,a1,a0
    800084f8:	1642                	slli	a2,a2,0x30
    800084fa:	8e4d                	or	a2,a2,a1
    800084fc:	17e2                	slli	a5,a5,0x38
    800084fe:	8fd1                	or	a5,a5,a2
    80008500:	f8040593          	addi	a1,s0,-128
    80008504:	863a                	mv	a2,a4
    80008506:	8536                	mv	a0,a3
    80008508:	f8f43023          	sd	a5,-128(s0)
    8000850c:	d66fa0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80008510:	bd7d                	j	800083ce <sbi_illegal_insn_handler+0x3c>

0000000080008512 <sbi_misaligned_load_handler>:
    80008512:	7175                	addi	sp,sp,-144
    80008514:	e122                	sd	s0,128(sp)
    80008516:	fca6                	sd	s1,120(sp)
    80008518:	f8ca                	sd	s2,112(sp)
    8000851a:	f4ce                	sd	s3,104(sp)
    8000851c:	f0d2                	sd	s4,96(sp)
    8000851e:	e4de                	sd	s7,72(sp)
    80008520:	f86a                	sd	s10,48(sp)
    80008522:	e506                	sd	ra,136(sp)
    80008524:	ecd6                	sd	s5,88(sp)
    80008526:	e8da                	sd	s6,80(sp)
    80008528:	e0e2                	sd	s8,64(sp)
    8000852a:	fc66                	sd	s9,56(sp)
    8000852c:	0900                	addi	s0,sp,144
    8000852e:	84ba                	mv	s1,a4
    80008530:	8b05                	andi	a4,a4,1
    80008532:	8bae                	mv	s7,a1
    80008534:	89b2                	mv	s3,a2
    80008536:	8a36                	mv	s4,a3
    80008538:	893e                	mv	s2,a5
    8000853a:	8d42                	mv	s10,a6
    8000853c:	1e070363          	beqz	a4,80008722 <sbi_misaligned_load_handler+0x210>
    80008540:	0034eb13          	ori	s6,s1,3
    80008544:	f7840a93          	addi	s5,s0,-136
    80008548:	679d                	lui	a5,0x7
    8000854a:	6709                	lui	a4,0x2
    8000854c:	07f78793          	addi	a5,a5,127 # 707f <_fw_start-0x7fff8f81>
    80008550:	00fb77b3          	and	a5,s6,a5
    80008554:	00370693          	addi	a3,a4,3 # 2003 <_fw_start-0x7fffdffd>
    80008558:	26d78a63          	beq	a5,a3,800087cc <sbi_misaligned_load_handler+0x2ba>
    8000855c:	660d                	lui	a2,0x3
    8000855e:	00360693          	addi	a3,a2,3 # 3003 <_fw_start-0x7fffcffd>
    80008562:	0ad78d63          	beq	a5,a3,8000861c <sbi_misaligned_load_handler+0x10a>
    80008566:	6699                	lui	a3,0x6
    80008568:	00368593          	addi	a1,a3,3 # 6003 <_fw_start-0x7fff9ffd>
    8000856c:	28b78863          	beq	a5,a1,800087fc <sbi_misaligned_load_handler+0x2ea>
    80008570:	061d                	addi	a2,a2,7
    80008572:	26c78b63          	beq	a5,a2,800087e8 <sbi_misaligned_load_handler+0x2d6>
    80008576:	071d                	addi	a4,a4,7
    80008578:	28e78663          	beq	a5,a4,80008804 <sbi_misaligned_load_handler+0x2f2>
    8000857c:	6705                	lui	a4,0x1
    8000857e:	070d                	addi	a4,a4,3
    80008580:	2ae78063          	beq	a5,a4,80008820 <sbi_misaligned_load_handler+0x30e>
    80008584:	6715                	lui	a4,0x5
    80008586:	070d                	addi	a4,a4,3
    80008588:	2ae78163          	beq	a5,a4,8000882a <sbi_misaligned_load_handler+0x318>
    8000858c:	67b9                	lui	a5,0xe
    8000858e:	078d                	addi	a5,a5,3
    80008590:	00fb77b3          	and	a5,s6,a5
    80008594:	26d78c63          	beq	a5,a3,8000880c <sbi_misaligned_load_handler+0x2fa>
    80008598:	0689                	addi	a3,a3,2
    8000859a:	06d78d63          	beq	a5,a3,80008614 <sbi_misaligned_load_handler+0x102>
    8000859e:	6711                	lui	a4,0x4
    800085a0:	28e78963          	beq	a5,a4,80008832 <sbi_misaligned_load_handler+0x320>
    800085a4:	6711                	lui	a4,0x4
    800085a6:	0709                	addi	a4,a4,2
    800085a8:	20e78d63          	beq	a5,a4,800087c2 <sbi_misaligned_load_handler+0x2b0>
    800085ac:	6709                	lui	a4,0x2
    800085ae:	28e78d63          	beq	a5,a4,80008848 <sbi_misaligned_load_handler+0x336>
    800085b2:	0709                	addi	a4,a4,2
    800085b4:	22e78a63          	beq	a5,a4,800087e8 <sbi_misaligned_load_handler+0x2d6>
    800085b8:	10194783          	lbu	a5,257(s2)
    800085bc:	10094703          	lbu	a4,256(s2)
    800085c0:	10294503          	lbu	a0,258(s2)
    800085c4:	10394583          	lbu	a1,259(s2)
    800085c8:	10494603          	lbu	a2,260(s2)
    800085cc:	07a2                	slli	a5,a5,0x8
    800085ce:	10594683          	lbu	a3,261(s2)
    800085d2:	8fd9                	or	a5,a5,a4
    800085d4:	0542                	slli	a0,a0,0x10
    800085d6:	10694703          	lbu	a4,262(s2)
    800085da:	8d5d                	or	a0,a0,a5
    800085dc:	05e2                	slli	a1,a1,0x18
    800085de:	10794783          	lbu	a5,263(s2)
    800085e2:	8dc9                	or	a1,a1,a0
    800085e4:	1602                	slli	a2,a2,0x20
    800085e6:	8e4d                	or	a2,a2,a1
    800085e8:	16a2                	slli	a3,a3,0x28
    800085ea:	8ed1                	or	a3,a3,a2
    800085ec:	1742                	slli	a4,a4,0x30
    800085ee:	8f55                	or	a4,a4,a3
    800085f0:	17e2                	slli	a5,a5,0x38
    800085f2:	8fd9                	or	a5,a5,a4
    800085f4:	866a                	mv	a2,s10
    800085f6:	85d6                	mv	a1,s5
    800085f8:	854a                	mv	a0,s2
    800085fa:	f6f43c23          	sd	a5,-136(s0)
    800085fe:	f9743023          	sd	s7,-128(s0)
    80008602:	f9343423          	sd	s3,-120(s0)
    80008606:	f9443823          	sd	s4,-112(s0)
    8000860a:	f8943c23          	sd	s1,-104(s0)
    8000860e:	c64fa0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80008612:	a8d5                	j	80008706 <sbi_misaligned_load_handler+0x1f4>
    80008614:	007b5793          	srli	a5,s6,0x7
    80008618:	8bfd                	andi	a5,a5,31
    8000861a:	dfd9                	beqz	a5,800085b8 <sbi_misaligned_load_handler+0xa6>
    8000861c:	4ba1                	li	s7,8
    8000861e:	4c81                	li	s9,0
    80008620:	4c01                	li	s8,0
    80008622:	fffb8a1b          	addiw	s4,s7,-1
    80008626:	020a1793          	slli	a5,s4,0x20
    8000862a:	9381                	srli	a5,a5,0x20
    8000862c:	00198a13          	addi	s4,s3,1
    80008630:	f6043823          	sd	zero,-144(s0)
    80008634:	9a3e                	add	s4,s4,a5
    80008636:	84ce                	mv	s1,s3
    80008638:	8526                	mv	a0,s1
    8000863a:	8656                	mv	a2,s5
    8000863c:	85ea                	mv	a1,s10
    8000863e:	54e000ef          	jal	ra,80008b8c <sbi_load_u8>
    80008642:	41348733          	sub	a4,s1,s3
    80008646:	f7040693          	addi	a3,s0,-144
    8000864a:	f8043783          	ld	a5,-128(s0)
    8000864e:	9736                	add	a4,a4,a3
    80008650:	00a70023          	sb	a0,0(a4) # 2000 <_fw_start-0x7fffe000>
    80008654:	0485                	addi	s1,s1,1
    80008656:	12079063          	bnez	a5,80008776 <sbi_misaligned_load_handler+0x264>
    8000865a:	fc9a1fe3          	bne	s4,s1,80008638 <sbi_misaligned_load_handler+0x126>
    8000865e:	004b5793          	srli	a5,s6,0x4
    80008662:	f7043503          	ld	a0,-144(s0)
    80008666:	0f87f793          	andi	a5,a5,248
    8000866a:	160c1663          	bnez	s8,800087d6 <sbi_misaligned_load_handler+0x2c4>
    8000866e:	01951533          	sll	a0,a0,s9
    80008672:	97ca                	add	a5,a5,s2
    80008674:	01955cb3          	srl	s9,a0,s9
    80008678:	0197b023          	sd	s9,0(a5) # e000 <_fw_start-0x7fff2000>
    8000867c:	10194783          	lbu	a5,257(s2)
    80008680:	10094703          	lbu	a4,256(s2)
    80008684:	10294503          	lbu	a0,258(s2)
    80008688:	10394583          	lbu	a1,259(s2)
    8000868c:	10494603          	lbu	a2,260(s2)
    80008690:	07a2                	slli	a5,a5,0x8
    80008692:	8fd9                	or	a5,a5,a4
    80008694:	10594683          	lbu	a3,261(s2)
    80008698:	0542                	slli	a0,a0,0x10
    8000869a:	8d5d                	or	a0,a0,a5
    8000869c:	10694703          	lbu	a4,262(s2)
    800086a0:	05e2                	slli	a1,a1,0x18
    800086a2:	10794783          	lbu	a5,263(s2)
    800086a6:	8dc9                	or	a1,a1,a0
    800086a8:	1602                	slli	a2,a2,0x20
    800086aa:	8e4d                	or	a2,a2,a1
    800086ac:	16a2                	slli	a3,a3,0x28
    800086ae:	8ed1                	or	a3,a3,a2
    800086b0:	1742                	slli	a4,a4,0x30
    800086b2:	8f55                	or	a4,a4,a3
    800086b4:	17e2                	slli	a5,a5,0x38
    800086b6:	003b7b13          	andi	s6,s6,3
    800086ba:	468d                	li	a3,3
    800086bc:	8fd9                	or	a5,a5,a4
    800086be:	4709                	li	a4,2
    800086c0:	00db1363          	bne	s6,a3,800086c6 <sbi_misaligned_load_handler+0x1b4>
    800086c4:	4711                	li	a4,4
    800086c6:	97ba                	add	a5,a5,a4
    800086c8:	0187d51b          	srliw	a0,a5,0x18
    800086cc:	0087d893          	srli	a7,a5,0x8
    800086d0:	0107d813          	srli	a6,a5,0x10
    800086d4:	0207d593          	srli	a1,a5,0x20
    800086d8:	0287d613          	srli	a2,a5,0x28
    800086dc:	0307d693          	srli	a3,a5,0x30
    800086e0:	0387d713          	srli	a4,a5,0x38
    800086e4:	10a901a3          	sb	a0,259(s2)
    800086e8:	10f90023          	sb	a5,256(s2)
    800086ec:	111900a3          	sb	a7,257(s2)
    800086f0:	11090123          	sb	a6,258(s2)
    800086f4:	10b90223          	sb	a1,260(s2)
    800086f8:	10c902a3          	sb	a2,261(s2)
    800086fc:	10d90323          	sb	a3,262(s2)
    80008700:	10e903a3          	sb	a4,263(s2)
    80008704:	4501                	li	a0,0
    80008706:	60aa                	ld	ra,136(sp)
    80008708:	640a                	ld	s0,128(sp)
    8000870a:	74e6                	ld	s1,120(sp)
    8000870c:	7946                	ld	s2,112(sp)
    8000870e:	79a6                	ld	s3,104(sp)
    80008710:	7a06                	ld	s4,96(sp)
    80008712:	6ae6                	ld	s5,88(sp)
    80008714:	6b46                	ld	s6,80(sp)
    80008716:	6ba6                	ld	s7,72(sp)
    80008718:	6c06                	ld	s8,64(sp)
    8000871a:	7ce2                	ld	s9,56(sp)
    8000871c:	7d42                	ld	s10,48(sp)
    8000871e:	6149                	addi	sp,sp,144
    80008720:	8082                	ret
    80008722:	1017c583          	lbu	a1,257(a5)
    80008726:	10294603          	lbu	a2,258(s2)
    8000872a:	1007c783          	lbu	a5,256(a5)
    8000872e:	10394683          	lbu	a3,259(s2)
    80008732:	10494703          	lbu	a4,260(s2)
    80008736:	05a2                	slli	a1,a1,0x8
    80008738:	8ddd                	or	a1,a1,a5
    8000873a:	10594503          	lbu	a0,261(s2)
    8000873e:	0642                	slli	a2,a2,0x10
    80008740:	8e4d                	or	a2,a2,a1
    80008742:	10694783          	lbu	a5,262(s2)
    80008746:	06e2                	slli	a3,a3,0x18
    80008748:	10794583          	lbu	a1,263(s2)
    8000874c:	8ed1                	or	a3,a3,a2
    8000874e:	1702                	slli	a4,a4,0x20
    80008750:	8f55                	or	a4,a4,a3
    80008752:	1522                	slli	a0,a0,0x28
    80008754:	8d59                	or	a0,a0,a4
    80008756:	17c2                	slli	a5,a5,0x30
    80008758:	8fc9                	or	a5,a5,a0
    8000875a:	f7840a93          	addi	s5,s0,-136
    8000875e:	03859513          	slli	a0,a1,0x38
    80008762:	8d5d                	or	a0,a0,a5
    80008764:	8656                	mv	a2,s5
    80008766:	85c2                	mv	a1,a6
    80008768:	033000ef          	jal	ra,80008f9a <sbi_get_insn>
    8000876c:	f8043783          	ld	a5,-128(s0)
    80008770:	8b2a                	mv	s6,a0
    80008772:	dc078be3          	beqz	a5,80008548 <sbi_misaligned_load_handler+0x36>
    80008776:	10194783          	lbu	a5,257(s2)
    8000877a:	10094703          	lbu	a4,256(s2)
    8000877e:	10294503          	lbu	a0,258(s2)
    80008782:	10394583          	lbu	a1,259(s2)
    80008786:	10494603          	lbu	a2,260(s2)
    8000878a:	07a2                	slli	a5,a5,0x8
    8000878c:	10594683          	lbu	a3,261(s2)
    80008790:	8fd9                	or	a5,a5,a4
    80008792:	0542                	slli	a0,a0,0x10
    80008794:	10694703          	lbu	a4,262(s2)
    80008798:	8d5d                	or	a0,a0,a5
    8000879a:	05e2                	slli	a1,a1,0x18
    8000879c:	10794783          	lbu	a5,263(s2)
    800087a0:	8dc9                	or	a1,a1,a0
    800087a2:	1602                	slli	a2,a2,0x20
    800087a4:	8e4d                	or	a2,a2,a1
    800087a6:	16a2                	slli	a3,a3,0x28
    800087a8:	8ed1                	or	a3,a3,a2
    800087aa:	1742                	slli	a4,a4,0x30
    800087ac:	8f55                	or	a4,a4,a3
    800087ae:	17e2                	slli	a5,a5,0x38
    800087b0:	8fd9                	or	a5,a5,a4
    800087b2:	866a                	mv	a2,s10
    800087b4:	85d6                	mv	a1,s5
    800087b6:	854a                	mv	a0,s2
    800087b8:	f6f43c23          	sd	a5,-136(s0)
    800087bc:	ab6fa0ef          	jal	ra,80002a72 <sbi_trap_redirect>
    800087c0:	b799                	j	80008706 <sbi_misaligned_load_handler+0x1f4>
    800087c2:	007b5793          	srli	a5,s6,0x7
    800087c6:	8bfd                	andi	a5,a5,31
    800087c8:	de0788e3          	beqz	a5,800085b8 <sbi_misaligned_load_handler+0xa6>
    800087cc:	4b91                	li	s7,4
    800087ce:	02000c93          	li	s9,32
    800087d2:	4c01                	li	s8,0
    800087d4:	b5b9                	j	80008622 <sbi_misaligned_load_handler+0x110>
    800087d6:	4721                	li	a4,8
    800087d8:	00eb8c63          	beq	s7,a4,800087f0 <sbi_misaligned_load_handler+0x2de>
    800087dc:	00001717          	auipc	a4,0x1
    800087e0:	973e                	add	a4,a4,a5
    800087e2:	0d2702e7          	jalr	t0,210(a4) # 800098ae <put_f32_reg>
    800087e6:	bd59                	j	8000867c <sbi_misaligned_load_handler+0x16a>
    800087e8:	4ba1                	li	s7,8
    800087ea:	4c81                	li	s9,0
    800087ec:	4c05                	li	s8,1
    800087ee:	bd15                	j	80008622 <sbi_misaligned_load_handler+0x110>
    800087f0:	00001717          	auipc	a4,0x1
    800087f4:	973e                	add	a4,a4,a5
    800087f6:	2be702e7          	jalr	t0,702(a4) # 80009aae <put_f64_reg>
    800087fa:	b549                	j	8000867c <sbi_misaligned_load_handler+0x16a>
    800087fc:	4b91                	li	s7,4
    800087fe:	4c81                	li	s9,0
    80008800:	4c01                	li	s8,0
    80008802:	b505                	j	80008622 <sbi_misaligned_load_handler+0x110>
    80008804:	4b91                	li	s7,4
    80008806:	4c81                	li	s9,0
    80008808:	4c05                	li	s8,1
    8000880a:	bd21                	j	80008622 <sbi_misaligned_load_handler+0x110>
    8000880c:	002b5b13          	srli	s6,s6,0x2
    80008810:	007b7b13          	andi	s6,s6,7
    80008814:	0b21                	addi	s6,s6,8
    80008816:	0b1e                	slli	s6,s6,0x7
    80008818:	4ba1                	li	s7,8
    8000881a:	4c81                	li	s9,0
    8000881c:	4c01                	li	s8,0
    8000881e:	b511                	j	80008622 <sbi_misaligned_load_handler+0x110>
    80008820:	4b89                	li	s7,2
    80008822:	03000c93          	li	s9,48
    80008826:	4c01                	li	s8,0
    80008828:	bbed                	j	80008622 <sbi_misaligned_load_handler+0x110>
    8000882a:	4b89                	li	s7,2
    8000882c:	4c81                	li	s9,0
    8000882e:	4c01                	li	s8,0
    80008830:	bbcd                	j	80008622 <sbi_misaligned_load_handler+0x110>
    80008832:	002b5b13          	srli	s6,s6,0x2
    80008836:	007b7b13          	andi	s6,s6,7
    8000883a:	0b21                	addi	s6,s6,8
    8000883c:	0b1e                	slli	s6,s6,0x7
    8000883e:	4b91                	li	s7,4
    80008840:	02000c93          	li	s9,32
    80008844:	4c01                	li	s8,0
    80008846:	bbf1                	j	80008622 <sbi_misaligned_load_handler+0x110>
    80008848:	002b5b13          	srli	s6,s6,0x2
    8000884c:	007b7b13          	andi	s6,s6,7
    80008850:	0b21                	addi	s6,s6,8
    80008852:	0b1e                	slli	s6,s6,0x7
    80008854:	4ba1                	li	s7,8
    80008856:	4c81                	li	s9,0
    80008858:	4c05                	li	s8,1
    8000885a:	b3e1                	j	80008622 <sbi_misaligned_load_handler+0x110>

000000008000885c <sbi_misaligned_store_handler>:
    8000885c:	7119                	addi	sp,sp,-128
    8000885e:	f8a2                	sd	s0,112(sp)
    80008860:	f4a6                	sd	s1,104(sp)
    80008862:	f0ca                	sd	s2,96(sp)
    80008864:	ecce                	sd	s3,88(sp)
    80008866:	e8d2                	sd	s4,80(sp)
    80008868:	e4d6                	sd	s5,72(sp)
    8000886a:	f862                	sd	s8,48(sp)
    8000886c:	fc86                	sd	ra,120(sp)
    8000886e:	e0da                	sd	s6,64(sp)
    80008870:	fc5e                	sd	s7,56(sp)
    80008872:	0100                	addi	s0,sp,128
    80008874:	84ba                	mv	s1,a4
    80008876:	8b05                	andi	a4,a4,1
    80008878:	8c2e                	mv	s8,a1
    8000887a:	89b2                	mv	s3,a2
    8000887c:	8ab6                	mv	s5,a3
    8000887e:	893e                	mv	s2,a5
    80008880:	8a42                	mv	s4,a6
    80008882:	18070763          	beqz	a4,80008a10 <sbi_misaligned_store_handler+0x1b4>
    80008886:	0034eb93          	ori	s7,s1,3
    8000888a:	f8840b13          	addi	s6,s0,-120
    8000888e:	011bd513          	srli	a0,s7,0x11
    80008892:	0f857513          	andi	a0,a0,248
    80008896:	00a907b3          	add	a5,s2,a0
    8000889a:	639c                	ld	a5,0(a5)
    8000889c:	6709                	lui	a4,0x2
    8000889e:	02370693          	addi	a3,a4,35 # 2023 <_fw_start-0x7fffdfdd>
    800088a2:	f8f43023          	sd	a5,-128(s0)
    800088a6:	679d                	lui	a5,0x7
    800088a8:	07f78793          	addi	a5,a5,127 # 707f <_fw_start-0x7fff8f81>
    800088ac:	00fbf7b3          	and	a5,s7,a5
    800088b0:	20d78063          	beq	a5,a3,80008ab0 <sbi_misaligned_store_handler+0x254>
    800088b4:	660d                	lui	a2,0x3
    800088b6:	02360693          	addi	a3,a2,35 # 3023 <_fw_start-0x7fffcfdd>
    800088ba:	06d78f63          	beq	a5,a3,80008938 <sbi_misaligned_store_handler+0xdc>
    800088be:	02760613          	addi	a2,a2,39
    800088c2:	06c78463          	beq	a5,a2,8000892a <sbi_misaligned_store_handler+0xce>
    800088c6:	02770713          	addi	a4,a4,39
    800088ca:	1ee78563          	beq	a5,a4,80008ab4 <sbi_misaligned_store_handler+0x258>
    800088ce:	6705                	lui	a4,0x1
    800088d0:	02370713          	addi	a4,a4,35 # 1023 <_fw_start-0x7fffefdd>
    800088d4:	1ee78a63          	beq	a5,a4,80008ac8 <sbi_misaligned_store_handler+0x26c>
    800088d8:	6739                	lui	a4,0xe
    800088da:	00370793          	addi	a5,a4,3 # e003 <_fw_start-0x7fff1ffd>
    800088de:	00fbf7b3          	and	a5,s7,a5
    800088e2:	20e78063          	beq	a5,a4,80008ae2 <sbi_misaligned_store_handler+0x286>
    800088e6:	0709                	addi	a4,a4,2
    800088e8:	20e78863          	beq	a5,a4,80008af8 <sbi_misaligned_store_handler+0x29c>
    800088ec:	6731                	lui	a4,0xc
    800088ee:	1ce78f63          	beq	a5,a4,80008acc <sbi_misaligned_store_handler+0x270>
    800088f2:	0709                	addi	a4,a4,2
    800088f4:	26e78463          	beq	a5,a4,80008b5c <sbi_misaligned_store_handler+0x300>
    800088f8:	6729                	lui	a4,0xa
    800088fa:	02e78363          	beq	a5,a4,80008920 <sbi_misaligned_store_handler+0xc4>
    800088fe:	6729                	lui	a4,0xa
    80008900:	0709                	addi	a4,a4,2
    80008902:	1ee79f63          	bne	a5,a4,80008b00 <sbi_misaligned_store_handler+0x2a4>
    80008906:	001b9513          	slli	a0,s7,0x1
    8000890a:	0f857513          	andi	a0,a0,248
    8000890e:	4aa1                	li	s5,8
    80008910:	00001797          	auipc	a5,0x1
    80008914:	97aa                	add	a5,a5,a0
    80008916:	09e782e7          	jalr	t0,158(a5) # 800099ae <get_f64_reg>
    8000891a:	f8a43023          	sd	a0,-128(s0)
    8000891e:	a831                	j	8000893a <sbi_misaligned_store_handler+0xde>
    80008920:	002bd513          	srli	a0,s7,0x2
    80008924:	891d                	andi	a0,a0,7
    80008926:	0521                	addi	a0,a0,8
    80008928:	050e                	slli	a0,a0,0x3
    8000892a:	00001797          	auipc	a5,0x1
    8000892e:	97aa                	add	a5,a5,a0
    80008930:	084782e7          	jalr	t0,132(a5) # 800099ae <get_f64_reg>
    80008934:	f8a43023          	sd	a0,-128(s0)
    80008938:	4aa1                	li	s5,8
    8000893a:	3afd                	addiw	s5,s5,-1
    8000893c:	1a82                	slli	s5,s5,0x20
    8000893e:	020ada93          	srli	s5,s5,0x20
    80008942:	f8040493          	addi	s1,s0,-128
    80008946:	f8140793          	addi	a5,s0,-127
    8000894a:	9abe                	add	s5,s5,a5
    8000894c:	409989b3          	sub	s3,s3,s1
    80008950:	0004c583          	lbu	a1,0(s1)
    80008954:	00998533          	add	a0,s3,s1
    80008958:	86da                	mv	a3,s6
    8000895a:	8652                	mv	a2,s4
    8000895c:	3e8000ef          	jal	ra,80008d44 <sbi_store_u8>
    80008960:	f9043783          	ld	a5,-112(s0)
    80008964:	0485                	addi	s1,s1,1
    80008966:	0e079f63          	bnez	a5,80008a64 <sbi_misaligned_store_handler+0x208>
    8000896a:	fe9a93e3          	bne	s5,s1,80008950 <sbi_misaligned_store_handler+0xf4>
    8000896e:	10194783          	lbu	a5,257(s2)
    80008972:	10094703          	lbu	a4,256(s2)
    80008976:	10294503          	lbu	a0,258(s2)
    8000897a:	10394583          	lbu	a1,259(s2)
    8000897e:	10494603          	lbu	a2,260(s2)
    80008982:	07a2                	slli	a5,a5,0x8
    80008984:	8fd9                	or	a5,a5,a4
    80008986:	10594683          	lbu	a3,261(s2)
    8000898a:	0542                	slli	a0,a0,0x10
    8000898c:	8d5d                	or	a0,a0,a5
    8000898e:	10694703          	lbu	a4,262(s2)
    80008992:	05e2                	slli	a1,a1,0x18
    80008994:	10794783          	lbu	a5,263(s2)
    80008998:	8dc9                	or	a1,a1,a0
    8000899a:	1602                	slli	a2,a2,0x20
    8000899c:	8e4d                	or	a2,a2,a1
    8000899e:	16a2                	slli	a3,a3,0x28
    800089a0:	8ed1                	or	a3,a3,a2
    800089a2:	1742                	slli	a4,a4,0x30
    800089a4:	8f55                	or	a4,a4,a3
    800089a6:	17e2                	slli	a5,a5,0x38
    800089a8:	003bfb93          	andi	s7,s7,3
    800089ac:	468d                	li	a3,3
    800089ae:	8fd9                	or	a5,a5,a4
    800089b0:	4709                	li	a4,2
    800089b2:	00db9363          	bne	s7,a3,800089b8 <sbi_misaligned_store_handler+0x15c>
    800089b6:	4711                	li	a4,4
    800089b8:	97ba                	add	a5,a5,a4
    800089ba:	0187d51b          	srliw	a0,a5,0x18
    800089be:	0087d893          	srli	a7,a5,0x8
    800089c2:	0107d813          	srli	a6,a5,0x10
    800089c6:	0207d593          	srli	a1,a5,0x20
    800089ca:	0287d613          	srli	a2,a5,0x28
    800089ce:	0307d693          	srli	a3,a5,0x30
    800089d2:	0387d713          	srli	a4,a5,0x38
    800089d6:	10a901a3          	sb	a0,259(s2)
    800089da:	10f90023          	sb	a5,256(s2)
    800089de:	111900a3          	sb	a7,257(s2)
    800089e2:	11090123          	sb	a6,258(s2)
    800089e6:	10b90223          	sb	a1,260(s2)
    800089ea:	10c902a3          	sb	a2,261(s2)
    800089ee:	10d90323          	sb	a3,262(s2)
    800089f2:	10e903a3          	sb	a4,263(s2)
    800089f6:	4501                	li	a0,0
    800089f8:	70e6                	ld	ra,120(sp)
    800089fa:	7446                	ld	s0,112(sp)
    800089fc:	74a6                	ld	s1,104(sp)
    800089fe:	7906                	ld	s2,96(sp)
    80008a00:	69e6                	ld	s3,88(sp)
    80008a02:	6a46                	ld	s4,80(sp)
    80008a04:	6aa6                	ld	s5,72(sp)
    80008a06:	6b06                	ld	s6,64(sp)
    80008a08:	7be2                	ld	s7,56(sp)
    80008a0a:	7c42                	ld	s8,48(sp)
    80008a0c:	6109                	addi	sp,sp,128
    80008a0e:	8082                	ret
    80008a10:	1017c583          	lbu	a1,257(a5)
    80008a14:	10294603          	lbu	a2,258(s2)
    80008a18:	1007c783          	lbu	a5,256(a5)
    80008a1c:	10394683          	lbu	a3,259(s2)
    80008a20:	10494703          	lbu	a4,260(s2)
    80008a24:	05a2                	slli	a1,a1,0x8
    80008a26:	8ddd                	or	a1,a1,a5
    80008a28:	10594503          	lbu	a0,261(s2)
    80008a2c:	0642                	slli	a2,a2,0x10
    80008a2e:	8e4d                	or	a2,a2,a1
    80008a30:	10694783          	lbu	a5,262(s2)
    80008a34:	06e2                	slli	a3,a3,0x18
    80008a36:	10794583          	lbu	a1,263(s2)
    80008a3a:	8ed1                	or	a3,a3,a2
    80008a3c:	1702                	slli	a4,a4,0x20
    80008a3e:	8f55                	or	a4,a4,a3
    80008a40:	1522                	slli	a0,a0,0x28
    80008a42:	8d59                	or	a0,a0,a4
    80008a44:	17c2                	slli	a5,a5,0x30
    80008a46:	8fc9                	or	a5,a5,a0
    80008a48:	f8840b13          	addi	s6,s0,-120
    80008a4c:	03859513          	slli	a0,a1,0x38
    80008a50:	8d5d                	or	a0,a0,a5
    80008a52:	865a                	mv	a2,s6
    80008a54:	85c2                	mv	a1,a6
    80008a56:	544000ef          	jal	ra,80008f9a <sbi_get_insn>
    80008a5a:	f9043783          	ld	a5,-112(s0)
    80008a5e:	8baa                	mv	s7,a0
    80008a60:	e20787e3          	beqz	a5,8000888e <sbi_misaligned_store_handler+0x32>
    80008a64:	10194783          	lbu	a5,257(s2)
    80008a68:	10094703          	lbu	a4,256(s2)
    80008a6c:	10294503          	lbu	a0,258(s2)
    80008a70:	10394583          	lbu	a1,259(s2)
    80008a74:	10494603          	lbu	a2,260(s2)
    80008a78:	07a2                	slli	a5,a5,0x8
    80008a7a:	10594683          	lbu	a3,261(s2)
    80008a7e:	8fd9                	or	a5,a5,a4
    80008a80:	0542                	slli	a0,a0,0x10
    80008a82:	10694703          	lbu	a4,262(s2)
    80008a86:	8d5d                	or	a0,a0,a5
    80008a88:	05e2                	slli	a1,a1,0x18
    80008a8a:	10794783          	lbu	a5,263(s2)
    80008a8e:	8dc9                	or	a1,a1,a0
    80008a90:	1602                	slli	a2,a2,0x20
    80008a92:	8e4d                	or	a2,a2,a1
    80008a94:	16a2                	slli	a3,a3,0x28
    80008a96:	8ed1                	or	a3,a3,a2
    80008a98:	1742                	slli	a4,a4,0x30
    80008a9a:	8f55                	or	a4,a4,a3
    80008a9c:	17e2                	slli	a5,a5,0x38
    80008a9e:	8fd9                	or	a5,a5,a4
    80008aa0:	8652                	mv	a2,s4
    80008aa2:	85da                	mv	a1,s6
    80008aa4:	854a                	mv	a0,s2
    80008aa6:	f8f43423          	sd	a5,-120(s0)
    80008aaa:	fc9f90ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80008aae:	b7a9                	j	800089f8 <sbi_misaligned_store_handler+0x19c>
    80008ab0:	4a91                	li	s5,4
    80008ab2:	b561                	j	8000893a <sbi_misaligned_store_handler+0xde>
    80008ab4:	00001797          	auipc	a5,0x1
    80008ab8:	97aa                	add	a5,a5,a0
    80008aba:	cfa782e7          	jalr	t0,-774(a5) # 800097ae <get_f32_reg>
    80008abe:	2501                	sext.w	a0,a0
    80008ac0:	f8a43023          	sd	a0,-128(s0)
    80008ac4:	4a91                	li	s5,4
    80008ac6:	bd95                	j	8000893a <sbi_misaligned_store_handler+0xde>
    80008ac8:	4a89                	li	s5,2
    80008aca:	bd85                	j	8000893a <sbi_misaligned_store_handler+0xde>
    80008acc:	002bd793          	srli	a5,s7,0x2
    80008ad0:	8b9d                	andi	a5,a5,7
    80008ad2:	07a1                	addi	a5,a5,8
    80008ad4:	078e                	slli	a5,a5,0x3
    80008ad6:	97ca                	add	a5,a5,s2
    80008ad8:	639c                	ld	a5,0(a5)
    80008ada:	4a91                	li	s5,4
    80008adc:	f8f43023          	sd	a5,-128(s0)
    80008ae0:	bda9                	j	8000893a <sbi_misaligned_store_handler+0xde>
    80008ae2:	002bd793          	srli	a5,s7,0x2
    80008ae6:	8b9d                	andi	a5,a5,7
    80008ae8:	07a1                	addi	a5,a5,8
    80008aea:	078e                	slli	a5,a5,0x3
    80008aec:	97ca                	add	a5,a5,s2
    80008aee:	639c                	ld	a5,0(a5)
    80008af0:	4aa1                	li	s5,8
    80008af2:	f8f43023          	sd	a5,-128(s0)
    80008af6:	b591                	j	8000893a <sbi_misaligned_store_handler+0xde>
    80008af8:	007bd793          	srli	a5,s7,0x7
    80008afc:	8bfd                	andi	a5,a5,31
    80008afe:	efad                	bnez	a5,80008b78 <sbi_misaligned_store_handler+0x31c>
    80008b00:	10194783          	lbu	a5,257(s2)
    80008b04:	10094703          	lbu	a4,256(s2)
    80008b08:	10294503          	lbu	a0,258(s2)
    80008b0c:	10394583          	lbu	a1,259(s2)
    80008b10:	10494603          	lbu	a2,260(s2)
    80008b14:	07a2                	slli	a5,a5,0x8
    80008b16:	10594683          	lbu	a3,261(s2)
    80008b1a:	8fd9                	or	a5,a5,a4
    80008b1c:	0542                	slli	a0,a0,0x10
    80008b1e:	10694703          	lbu	a4,262(s2)
    80008b22:	8d5d                	or	a0,a0,a5
    80008b24:	05e2                	slli	a1,a1,0x18
    80008b26:	10794783          	lbu	a5,263(s2)
    80008b2a:	8dc9                	or	a1,a1,a0
    80008b2c:	1602                	slli	a2,a2,0x20
    80008b2e:	8e4d                	or	a2,a2,a1
    80008b30:	16a2                	slli	a3,a3,0x28
    80008b32:	8ed1                	or	a3,a3,a2
    80008b34:	1742                	slli	a4,a4,0x30
    80008b36:	8f55                	or	a4,a4,a3
    80008b38:	17e2                	slli	a5,a5,0x38
    80008b3a:	8fd9                	or	a5,a5,a4
    80008b3c:	8652                	mv	a2,s4
    80008b3e:	85da                	mv	a1,s6
    80008b40:	854a                	mv	a0,s2
    80008b42:	f8f43423          	sd	a5,-120(s0)
    80008b46:	f9843823          	sd	s8,-112(s0)
    80008b4a:	f9343c23          	sd	s3,-104(s0)
    80008b4e:	fb543023          	sd	s5,-96(s0)
    80008b52:	fa943423          	sd	s1,-88(s0)
    80008b56:	f1df90ef          	jal	ra,80002a72 <sbi_trap_redirect>
    80008b5a:	bd79                	j	800089f8 <sbi_misaligned_store_handler+0x19c>
    80008b5c:	007bd793          	srli	a5,s7,0x7
    80008b60:	8bfd                	andi	a5,a5,31
    80008b62:	dfd9                	beqz	a5,80008b00 <sbi_misaligned_store_handler+0x2a4>
    80008b64:	001b9793          	slli	a5,s7,0x1
    80008b68:	0f87f793          	andi	a5,a5,248
    80008b6c:	97ca                	add	a5,a5,s2
    80008b6e:	639c                	ld	a5,0(a5)
    80008b70:	4a91                	li	s5,4
    80008b72:	f8f43023          	sd	a5,-128(s0)
    80008b76:	b3d1                	j	8000893a <sbi_misaligned_store_handler+0xde>
    80008b78:	001b9793          	slli	a5,s7,0x1
    80008b7c:	0f87f793          	andi	a5,a5,248
    80008b80:	97ca                	add	a5,a5,s2
    80008b82:	639c                	ld	a5,0(a5)
    80008b84:	4aa1                	li	s5,8
    80008b86:	f8f43023          	sd	a5,-128(s0)
    80008b8a:	bb45                	j	8000893a <sbi_misaligned_store_handler+0xde>

0000000080008b8c <sbi_load_u8>:
    80008b8c:	1101                	addi	sp,sp,-32
    80008b8e:	e822                	sd	s0,16(sp)
    80008b90:	e426                	sd	s1,8(sp)
    80008b92:	e04a                	sd	s2,0(sp)
    80008b94:	ec06                	sd	ra,24(sp)
    80008b96:	1000                	addi	s0,sp,32
    80008b98:	84ae                	mv	s1,a1
    80008b9a:	892a                	mv	s2,a0
    80008b9c:	00063023          	sd	zero,0(a2)
    80008ba0:	00063423          	sd	zero,8(a2)
    80008ba4:	00063823          	sd	zero,16(a2)
    80008ba8:	00063c23          	sd	zero,24(a2)
    80008bac:	02063023          	sd	zero,32(a2)
    80008bb0:	85b2                	mv	a1,a2
    80008bb2:	8526                	mv	a0,s1
    80008bb4:	80aff0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008bb8:	000207b7          	lui	a5,0x20
    80008bbc:	3007a673          	csrrs	a2,mstatus,a5
    80008bc0:	00094703          	lbu	a4,0(s2)
    80008bc4:	30061073          	csrw	mstatus,a2
    80008bc8:	4581                	li	a1,0
    80008bca:	8526                	mv	a0,s1
    80008bcc:	0ff77913          	andi	s2,a4,255
    80008bd0:	feffe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008bd4:	60e2                	ld	ra,24(sp)
    80008bd6:	6442                	ld	s0,16(sp)
    80008bd8:	64a2                	ld	s1,8(sp)
    80008bda:	854a                	mv	a0,s2
    80008bdc:	6902                	ld	s2,0(sp)
    80008bde:	6105                	addi	sp,sp,32
    80008be0:	8082                	ret

0000000080008be2 <sbi_load_u16>:
    80008be2:	1101                	addi	sp,sp,-32
    80008be4:	e822                	sd	s0,16(sp)
    80008be6:	e426                	sd	s1,8(sp)
    80008be8:	e04a                	sd	s2,0(sp)
    80008bea:	ec06                	sd	ra,24(sp)
    80008bec:	1000                	addi	s0,sp,32
    80008bee:	84ae                	mv	s1,a1
    80008bf0:	892a                	mv	s2,a0
    80008bf2:	00063023          	sd	zero,0(a2)
    80008bf6:	00063423          	sd	zero,8(a2)
    80008bfa:	00063823          	sd	zero,16(a2)
    80008bfe:	00063c23          	sd	zero,24(a2)
    80008c02:	02063023          	sd	zero,32(a2)
    80008c06:	85b2                	mv	a1,a2
    80008c08:	8526                	mv	a0,s1
    80008c0a:	fb5fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008c0e:	000207b7          	lui	a5,0x20
    80008c12:	3007a673          	csrrs	a2,mstatus,a5
    80008c16:	00095703          	lhu	a4,0(s2)
    80008c1a:	30061073          	csrw	mstatus,a2
    80008c1e:	4581                	li	a1,0
    80008c20:	8526                	mv	a0,s1
    80008c22:	893a                	mv	s2,a4
    80008c24:	f9bfe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008c28:	60e2                	ld	ra,24(sp)
    80008c2a:	6442                	ld	s0,16(sp)
    80008c2c:	1942                	slli	s2,s2,0x30
    80008c2e:	03095913          	srli	s2,s2,0x30
    80008c32:	64a2                	ld	s1,8(sp)
    80008c34:	854a                	mv	a0,s2
    80008c36:	6902                	ld	s2,0(sp)
    80008c38:	6105                	addi	sp,sp,32
    80008c3a:	8082                	ret

0000000080008c3c <sbi_load_s8>:
    80008c3c:	1101                	addi	sp,sp,-32
    80008c3e:	e822                	sd	s0,16(sp)
    80008c40:	e426                	sd	s1,8(sp)
    80008c42:	e04a                	sd	s2,0(sp)
    80008c44:	ec06                	sd	ra,24(sp)
    80008c46:	1000                	addi	s0,sp,32
    80008c48:	84ae                	mv	s1,a1
    80008c4a:	892a                	mv	s2,a0
    80008c4c:	00063023          	sd	zero,0(a2)
    80008c50:	00063423          	sd	zero,8(a2)
    80008c54:	00063823          	sd	zero,16(a2)
    80008c58:	00063c23          	sd	zero,24(a2)
    80008c5c:	02063023          	sd	zero,32(a2)
    80008c60:	85b2                	mv	a1,a2
    80008c62:	8526                	mv	a0,s1
    80008c64:	f5bfe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008c68:	000207b7          	lui	a5,0x20
    80008c6c:	3007a673          	csrrs	a2,mstatus,a5
    80008c70:	00090703          	lb	a4,0(s2)
    80008c74:	30061073          	csrw	mstatus,a2
    80008c78:	4581                	li	a1,0
    80008c7a:	8526                	mv	a0,s1
    80008c7c:	0ff77913          	andi	s2,a4,255
    80008c80:	f3ffe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008c84:	60e2                	ld	ra,24(sp)
    80008c86:	6442                	ld	s0,16(sp)
    80008c88:	64a2                	ld	s1,8(sp)
    80008c8a:	854a                	mv	a0,s2
    80008c8c:	6902                	ld	s2,0(sp)
    80008c8e:	6105                	addi	sp,sp,32
    80008c90:	8082                	ret

0000000080008c92 <sbi_load_s16>:
    80008c92:	1101                	addi	sp,sp,-32
    80008c94:	e822                	sd	s0,16(sp)
    80008c96:	e426                	sd	s1,8(sp)
    80008c98:	e04a                	sd	s2,0(sp)
    80008c9a:	ec06                	sd	ra,24(sp)
    80008c9c:	1000                	addi	s0,sp,32
    80008c9e:	84ae                	mv	s1,a1
    80008ca0:	892a                	mv	s2,a0
    80008ca2:	00063023          	sd	zero,0(a2)
    80008ca6:	00063423          	sd	zero,8(a2)
    80008caa:	00063823          	sd	zero,16(a2)
    80008cae:	00063c23          	sd	zero,24(a2)
    80008cb2:	02063023          	sd	zero,32(a2)
    80008cb6:	85b2                	mv	a1,a2
    80008cb8:	8526                	mv	a0,s1
    80008cba:	f05fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008cbe:	000207b7          	lui	a5,0x20
    80008cc2:	3007a673          	csrrs	a2,mstatus,a5
    80008cc6:	00091703          	lh	a4,0(s2)
    80008cca:	30061073          	csrw	mstatus,a2
    80008cce:	4581                	li	a1,0
    80008cd0:	8526                	mv	a0,s1
    80008cd2:	893a                	mv	s2,a4
    80008cd4:	eebfe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008cd8:	60e2                	ld	ra,24(sp)
    80008cda:	6442                	ld	s0,16(sp)
    80008cdc:	0109191b          	slliw	s2,s2,0x10
    80008ce0:	4109591b          	sraiw	s2,s2,0x10
    80008ce4:	64a2                	ld	s1,8(sp)
    80008ce6:	854a                	mv	a0,s2
    80008ce8:	6902                	ld	s2,0(sp)
    80008cea:	6105                	addi	sp,sp,32
    80008cec:	8082                	ret

0000000080008cee <sbi_load_s32>:
    80008cee:	1101                	addi	sp,sp,-32
    80008cf0:	e822                	sd	s0,16(sp)
    80008cf2:	e426                	sd	s1,8(sp)
    80008cf4:	e04a                	sd	s2,0(sp)
    80008cf6:	ec06                	sd	ra,24(sp)
    80008cf8:	1000                	addi	s0,sp,32
    80008cfa:	84ae                	mv	s1,a1
    80008cfc:	892a                	mv	s2,a0
    80008cfe:	00063023          	sd	zero,0(a2)
    80008d02:	00063423          	sd	zero,8(a2)
    80008d06:	00063823          	sd	zero,16(a2)
    80008d0a:	00063c23          	sd	zero,24(a2)
    80008d0e:	02063023          	sd	zero,32(a2)
    80008d12:	85b2                	mv	a1,a2
    80008d14:	8526                	mv	a0,s1
    80008d16:	ea9fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008d1a:	000207b7          	lui	a5,0x20
    80008d1e:	3007a673          	csrrs	a2,mstatus,a5
    80008d22:	00092703          	lw	a4,0(s2)
    80008d26:	30061073          	csrw	mstatus,a2
    80008d2a:	4581                	li	a1,0
    80008d2c:	8526                	mv	a0,s1
    80008d2e:	0007091b          	sext.w	s2,a4
    80008d32:	e8dfe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008d36:	60e2                	ld	ra,24(sp)
    80008d38:	6442                	ld	s0,16(sp)
    80008d3a:	64a2                	ld	s1,8(sp)
    80008d3c:	854a                	mv	a0,s2
    80008d3e:	6902                	ld	s2,0(sp)
    80008d40:	6105                	addi	sp,sp,32
    80008d42:	8082                	ret

0000000080008d44 <sbi_store_u8>:
    80008d44:	7179                	addi	sp,sp,-48
    80008d46:	f022                	sd	s0,32(sp)
    80008d48:	ec26                	sd	s1,24(sp)
    80008d4a:	e84a                	sd	s2,16(sp)
    80008d4c:	e44e                	sd	s3,8(sp)
    80008d4e:	f406                	sd	ra,40(sp)
    80008d50:	1800                	addi	s0,sp,48
    80008d52:	89aa                	mv	s3,a0
    80008d54:	892e                	mv	s2,a1
    80008d56:	0006b023          	sd	zero,0(a3)
    80008d5a:	0006b423          	sd	zero,8(a3)
    80008d5e:	0006b823          	sd	zero,16(a3)
    80008d62:	0006bc23          	sd	zero,24(a3)
    80008d66:	0206b023          	sd	zero,32(a3)
    80008d6a:	85b6                	mv	a1,a3
    80008d6c:	8532                	mv	a0,a2
    80008d6e:	84b2                	mv	s1,a2
    80008d70:	e4ffe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008d74:	000207b7          	lui	a5,0x20
    80008d78:	3007a6f3          	csrrs	a3,mstatus,a5
    80008d7c:	01298023          	sb	s2,0(s3)
    80008d80:	30069073          	csrw	mstatus,a3
    80008d84:	4581                	li	a1,0
    80008d86:	8526                	mv	a0,s1
    80008d88:	e37fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008d8c:	70a2                	ld	ra,40(sp)
    80008d8e:	7402                	ld	s0,32(sp)
    80008d90:	64e2                	ld	s1,24(sp)
    80008d92:	6942                	ld	s2,16(sp)
    80008d94:	69a2                	ld	s3,8(sp)
    80008d96:	6145                	addi	sp,sp,48
    80008d98:	8082                	ret

0000000080008d9a <sbi_store_u16>:
    80008d9a:	7179                	addi	sp,sp,-48
    80008d9c:	f022                	sd	s0,32(sp)
    80008d9e:	ec26                	sd	s1,24(sp)
    80008da0:	e84a                	sd	s2,16(sp)
    80008da2:	e44e                	sd	s3,8(sp)
    80008da4:	f406                	sd	ra,40(sp)
    80008da6:	1800                	addi	s0,sp,48
    80008da8:	89aa                	mv	s3,a0
    80008daa:	892e                	mv	s2,a1
    80008dac:	0006b023          	sd	zero,0(a3)
    80008db0:	0006b423          	sd	zero,8(a3)
    80008db4:	0006b823          	sd	zero,16(a3)
    80008db8:	0006bc23          	sd	zero,24(a3)
    80008dbc:	0206b023          	sd	zero,32(a3)
    80008dc0:	85b6                	mv	a1,a3
    80008dc2:	8532                	mv	a0,a2
    80008dc4:	84b2                	mv	s1,a2
    80008dc6:	df9fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008dca:	000207b7          	lui	a5,0x20
    80008dce:	3007a6f3          	csrrs	a3,mstatus,a5
    80008dd2:	01299023          	sh	s2,0(s3)
    80008dd6:	30069073          	csrw	mstatus,a3
    80008dda:	4581                	li	a1,0
    80008ddc:	8526                	mv	a0,s1
    80008dde:	de1fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008de2:	70a2                	ld	ra,40(sp)
    80008de4:	7402                	ld	s0,32(sp)
    80008de6:	64e2                	ld	s1,24(sp)
    80008de8:	6942                	ld	s2,16(sp)
    80008dea:	69a2                	ld	s3,8(sp)
    80008dec:	6145                	addi	sp,sp,48
    80008dee:	8082                	ret

0000000080008df0 <sbi_store_u32>:
    80008df0:	7179                	addi	sp,sp,-48
    80008df2:	f022                	sd	s0,32(sp)
    80008df4:	ec26                	sd	s1,24(sp)
    80008df6:	e84a                	sd	s2,16(sp)
    80008df8:	e44e                	sd	s3,8(sp)
    80008dfa:	f406                	sd	ra,40(sp)
    80008dfc:	1800                	addi	s0,sp,48
    80008dfe:	89aa                	mv	s3,a0
    80008e00:	892e                	mv	s2,a1
    80008e02:	0006b023          	sd	zero,0(a3)
    80008e06:	0006b423          	sd	zero,8(a3)
    80008e0a:	0006b823          	sd	zero,16(a3)
    80008e0e:	0006bc23          	sd	zero,24(a3)
    80008e12:	0206b023          	sd	zero,32(a3)
    80008e16:	85b6                	mv	a1,a3
    80008e18:	8532                	mv	a0,a2
    80008e1a:	84b2                	mv	s1,a2
    80008e1c:	da3fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008e20:	000207b7          	lui	a5,0x20
    80008e24:	3007a6f3          	csrrs	a3,mstatus,a5
    80008e28:	0129a023          	sw	s2,0(s3)
    80008e2c:	30069073          	csrw	mstatus,a3
    80008e30:	4581                	li	a1,0
    80008e32:	8526                	mv	a0,s1
    80008e34:	d8bfe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008e38:	70a2                	ld	ra,40(sp)
    80008e3a:	7402                	ld	s0,32(sp)
    80008e3c:	64e2                	ld	s1,24(sp)
    80008e3e:	6942                	ld	s2,16(sp)
    80008e40:	69a2                	ld	s3,8(sp)
    80008e42:	6145                	addi	sp,sp,48
    80008e44:	8082                	ret

0000000080008e46 <sbi_load_u32>:
    80008e46:	1101                	addi	sp,sp,-32
    80008e48:	e822                	sd	s0,16(sp)
    80008e4a:	e426                	sd	s1,8(sp)
    80008e4c:	e04a                	sd	s2,0(sp)
    80008e4e:	ec06                	sd	ra,24(sp)
    80008e50:	1000                	addi	s0,sp,32
    80008e52:	84ae                	mv	s1,a1
    80008e54:	892a                	mv	s2,a0
    80008e56:	00063023          	sd	zero,0(a2)
    80008e5a:	00063423          	sd	zero,8(a2)
    80008e5e:	00063823          	sd	zero,16(a2)
    80008e62:	00063c23          	sd	zero,24(a2)
    80008e66:	02063023          	sd	zero,32(a2)
    80008e6a:	85b2                	mv	a1,a2
    80008e6c:	8526                	mv	a0,s1
    80008e6e:	d51fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008e72:	000207b7          	lui	a5,0x20
    80008e76:	3007a673          	csrrs	a2,mstatus,a5
    80008e7a:	00096703          	lwu	a4,0(s2)
    80008e7e:	30061073          	csrw	mstatus,a2
    80008e82:	4581                	li	a1,0
    80008e84:	8526                	mv	a0,s1
    80008e86:	0007091b          	sext.w	s2,a4
    80008e8a:	d35fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008e8e:	60e2                	ld	ra,24(sp)
    80008e90:	6442                	ld	s0,16(sp)
    80008e92:	64a2                	ld	s1,8(sp)
    80008e94:	854a                	mv	a0,s2
    80008e96:	6902                	ld	s2,0(sp)
    80008e98:	6105                	addi	sp,sp,32
    80008e9a:	8082                	ret

0000000080008e9c <sbi_load_u64>:
    80008e9c:	1101                	addi	sp,sp,-32
    80008e9e:	e822                	sd	s0,16(sp)
    80008ea0:	e426                	sd	s1,8(sp)
    80008ea2:	e04a                	sd	s2,0(sp)
    80008ea4:	ec06                	sd	ra,24(sp)
    80008ea6:	1000                	addi	s0,sp,32
    80008ea8:	84ae                	mv	s1,a1
    80008eaa:	892a                	mv	s2,a0
    80008eac:	00063023          	sd	zero,0(a2)
    80008eb0:	00063423          	sd	zero,8(a2)
    80008eb4:	00063823          	sd	zero,16(a2)
    80008eb8:	00063c23          	sd	zero,24(a2)
    80008ebc:	02063023          	sd	zero,32(a2)
    80008ec0:	85b2                	mv	a1,a2
    80008ec2:	8526                	mv	a0,s1
    80008ec4:	cfbfe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008ec8:	000207b7          	lui	a5,0x20
    80008ecc:	3007a673          	csrrs	a2,mstatus,a5
    80008ed0:	00093703          	ld	a4,0(s2)
    80008ed4:	30061073          	csrw	mstatus,a2
    80008ed8:	4581                	li	a1,0
    80008eda:	8526                	mv	a0,s1
    80008edc:	893a                	mv	s2,a4
    80008ede:	ce1fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008ee2:	60e2                	ld	ra,24(sp)
    80008ee4:	6442                	ld	s0,16(sp)
    80008ee6:	64a2                	ld	s1,8(sp)
    80008ee8:	854a                	mv	a0,s2
    80008eea:	6902                	ld	s2,0(sp)
    80008eec:	6105                	addi	sp,sp,32
    80008eee:	8082                	ret

0000000080008ef0 <sbi_store_u64>:
    80008ef0:	7179                	addi	sp,sp,-48
    80008ef2:	f022                	sd	s0,32(sp)
    80008ef4:	ec26                	sd	s1,24(sp)
    80008ef6:	e84a                	sd	s2,16(sp)
    80008ef8:	e44e                	sd	s3,8(sp)
    80008efa:	f406                	sd	ra,40(sp)
    80008efc:	1800                	addi	s0,sp,48
    80008efe:	89aa                	mv	s3,a0
    80008f00:	892e                	mv	s2,a1
    80008f02:	0006b023          	sd	zero,0(a3)
    80008f06:	0006b423          	sd	zero,8(a3)
    80008f0a:	0006b823          	sd	zero,16(a3)
    80008f0e:	0006bc23          	sd	zero,24(a3)
    80008f12:	0206b023          	sd	zero,32(a3)
    80008f16:	85b6                	mv	a1,a3
    80008f18:	8532                	mv	a0,a2
    80008f1a:	84b2                	mv	s1,a2
    80008f1c:	ca3fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008f20:	000207b7          	lui	a5,0x20
    80008f24:	3007a6f3          	csrrs	a3,mstatus,a5
    80008f28:	0129b023          	sd	s2,0(s3)
    80008f2c:	30069073          	csrw	mstatus,a3
    80008f30:	4581                	li	a1,0
    80008f32:	8526                	mv	a0,s1
    80008f34:	c8bfe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008f38:	70a2                	ld	ra,40(sp)
    80008f3a:	7402                	ld	s0,32(sp)
    80008f3c:	64e2                	ld	s1,24(sp)
    80008f3e:	6942                	ld	s2,16(sp)
    80008f40:	69a2                	ld	s3,8(sp)
    80008f42:	6145                	addi	sp,sp,48
    80008f44:	8082                	ret

0000000080008f46 <sbi_load_ulong>:
    80008f46:	1101                	addi	sp,sp,-32
    80008f48:	e822                	sd	s0,16(sp)
    80008f4a:	e426                	sd	s1,8(sp)
    80008f4c:	e04a                	sd	s2,0(sp)
    80008f4e:	ec06                	sd	ra,24(sp)
    80008f50:	1000                	addi	s0,sp,32
    80008f52:	84ae                	mv	s1,a1
    80008f54:	892a                	mv	s2,a0
    80008f56:	00063023          	sd	zero,0(a2)
    80008f5a:	00063423          	sd	zero,8(a2)
    80008f5e:	00063823          	sd	zero,16(a2)
    80008f62:	00063c23          	sd	zero,24(a2)
    80008f66:	02063023          	sd	zero,32(a2)
    80008f6a:	85b2                	mv	a1,a2
    80008f6c:	8526                	mv	a0,s1
    80008f6e:	c51fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008f72:	000207b7          	lui	a5,0x20
    80008f76:	3007a673          	csrrs	a2,mstatus,a5
    80008f7a:	00093703          	ld	a4,0(s2)
    80008f7e:	30061073          	csrw	mstatus,a2
    80008f82:	4581                	li	a1,0
    80008f84:	8526                	mv	a0,s1
    80008f86:	893a                	mv	s2,a4
    80008f88:	c37fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008f8c:	60e2                	ld	ra,24(sp)
    80008f8e:	6442                	ld	s0,16(sp)
    80008f90:	64a2                	ld	s1,8(sp)
    80008f92:	854a                	mv	a0,s2
    80008f94:	6902                	ld	s2,0(sp)
    80008f96:	6105                	addi	sp,sp,32
    80008f98:	8082                	ret

0000000080008f9a <sbi_get_insn>:
    80008f9a:	7179                	addi	sp,sp,-48
    80008f9c:	f406                	sd	ra,40(sp)
    80008f9e:	f022                	sd	s0,32(sp)
    80008fa0:	ec26                	sd	s1,24(sp)
    80008fa2:	e84a                	sd	s2,16(sp)
    80008fa4:	e44e                	sd	s3,8(sp)
    80008fa6:	1800                	addi	s0,sp,48
    80008fa8:	89ae                	mv	s3,a1
    80008faa:	892a                	mv	s2,a0
    80008fac:	85b2                	mv	a1,a2
    80008fae:	854e                	mv	a0,s3
    80008fb0:	00063023          	sd	zero,0(a2)
    80008fb4:	00063423          	sd	zero,8(a2)
    80008fb8:	00063823          	sd	zero,16(a2)
    80008fbc:	00063c23          	sd	zero,24(a2)
    80008fc0:	02063023          	sd	zero,32(a2)
    80008fc4:	84b2                	mv	s1,a2
    80008fc6:	bf9fe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008fca:	000a0737          	lui	a4,0xa0
    80008fce:	854e                	mv	a0,s3
    80008fd0:	468d                	li	a3,3
    80008fd2:	4581                	li	a1,0
    80008fd4:	4781                	li	a5,0
    80008fd6:	300727f3          	csrrs	a5,mstatus,a4
    80008fda:	00095983          	lhu	s3,0(s2)
    80008fde:	00d9f633          	and	a2,s3,a3
    80008fe2:	00d61663          	bne	a2,a3,80008fee <sbi_get_insn+0x54>
    80008fe6:	00295603          	lhu	a2,2(s2)
    80008fea:	0642                	slli	a2,a2,0x10
    80008fec:	99b2                	add	s3,s3,a2
    80008fee:	30079073          	csrw	mstatus,a5
    80008ff2:	bcdfe0ef          	jal	ra,80007bbe <sbi_hart_set_trap_info>
    80008ff6:	649c                	ld	a5,8(s1)
    80008ff8:	4735                	li	a4,13
    80008ffa:	02e78063          	beq	a5,a4,8000901a <sbi_get_insn+0x80>
    80008ffe:	4755                	li	a4,21
    80009000:	04e78563          	beq	a5,a4,8000904a <sbi_get_insn+0xb0>
    80009004:	4715                	li	a4,5
    80009006:	02e78663          	beq	a5,a4,80009032 <sbi_get_insn+0x98>
    8000900a:	70a2                	ld	ra,40(sp)
    8000900c:	7402                	ld	s0,32(sp)
    8000900e:	64e2                	ld	s1,24(sp)
    80009010:	6942                	ld	s2,16(sp)
    80009012:	854e                	mv	a0,s3
    80009014:	69a2                	ld	s3,8(sp)
    80009016:	6145                	addi	sp,sp,48
    80009018:	8082                	ret
    8000901a:	47b1                	li	a5,12
    8000901c:	e49c                	sd	a5,8(s1)
    8000901e:	0124b823          	sd	s2,16(s1)
    80009022:	70a2                	ld	ra,40(sp)
    80009024:	7402                	ld	s0,32(sp)
    80009026:	64e2                	ld	s1,24(sp)
    80009028:	6942                	ld	s2,16(sp)
    8000902a:	854e                	mv	a0,s3
    8000902c:	69a2                	ld	s3,8(sp)
    8000902e:	6145                	addi	sp,sp,48
    80009030:	8082                	ret
    80009032:	4785                	li	a5,1
    80009034:	e49c                	sd	a5,8(s1)
    80009036:	0124b823          	sd	s2,16(s1)
    8000903a:	70a2                	ld	ra,40(sp)
    8000903c:	7402                	ld	s0,32(sp)
    8000903e:	64e2                	ld	s1,24(sp)
    80009040:	6942                	ld	s2,16(sp)
    80009042:	854e                	mv	a0,s3
    80009044:	69a2                	ld	s3,8(sp)
    80009046:	6145                	addi	sp,sp,48
    80009048:	8082                	ret
    8000904a:	47d1                	li	a5,20
    8000904c:	e49c                	sd	a5,8(s1)
    8000904e:	0124b823          	sd	s2,16(s1)
    80009052:	70a2                	ld	ra,40(sp)
    80009054:	7402                	ld	s0,32(sp)
    80009056:	64e2                	ld	s1,24(sp)
    80009058:	6942                	ld	s2,16(sp)
    8000905a:	854e                	mv	a0,s3
    8000905c:	69a2                	ld	s3,8(sp)
    8000905e:	6145                	addi	sp,sp,48
    80009060:	8082                	ret

0000000080009062 <clint_time_rd64>:
    80009062:	1141                	addi	sp,sp,-16
    80009064:	e422                	sd	s0,8(sp)
    80009066:	0800                	addi	s0,sp,16
    80009068:	6108                	ld	a0,0(a0)
    8000906a:	6422                	ld	s0,8(sp)
    8000906c:	0141                	addi	sp,sp,16
    8000906e:	8082                	ret

0000000080009070 <clint_time_wr64>:
    80009070:	1141                	addi	sp,sp,-16
    80009072:	e422                	sd	s0,8(sp)
    80009074:	0800                	addi	s0,sp,16
    80009076:	e188                	sd	a0,0(a1)
    80009078:	6422                	ld	s0,8(sp)
    8000907a:	0141                	addi	sp,sp,16
    8000907c:	8082                	ret

000000008000907e <clint_time_rd32>:
    8000907e:	1141                	addi	sp,sp,-16
    80009080:	e422                	sd	s0,8(sp)
    80009082:	0800                	addi	s0,sp,16
    80009084:	00450613          	addi	a2,a0,4
    80009088:	4218                	lw	a4,0(a2)
    8000908a:	2701                	sext.w	a4,a4
    8000908c:	411c                	lw	a5,0(a0)
    8000908e:	0007869b          	sext.w	a3,a5
    80009092:	421c                	lw	a5,0(a2)
    80009094:	2781                	sext.w	a5,a5
    80009096:	fee799e3          	bne	a5,a4,80009088 <clint_time_rd32+0xa>
    8000909a:	6422                	ld	s0,8(sp)
    8000909c:	02069513          	slli	a0,a3,0x20
    800090a0:	1782                	slli	a5,a5,0x20
    800090a2:	9101                	srli	a0,a0,0x20
    800090a4:	8d5d                	or	a0,a0,a5
    800090a6:	0141                	addi	sp,sp,16
    800090a8:	8082                	ret

00000000800090aa <clint_time_wr32>:
    800090aa:	1141                	addi	sp,sp,-16
    800090ac:	e422                	sd	s0,8(sp)
    800090ae:	0800                	addi	s0,sp,16
    800090b0:	c188                	sw	a0,0(a1)
    800090b2:	9101                	srli	a0,a0,0x20
    800090b4:	0591                	addi	a1,a1,4
    800090b6:	c188                	sw	a0,0(a1)
    800090b8:	6422                	ld	s0,8(sp)
    800090ba:	0141                	addi	sp,sp,16
    800090bc:	8082                	ret

00000000800090be <clint_ipi_send>:
    800090be:	1141                	addi	sp,sp,-16
    800090c0:	e422                	sd	s0,8(sp)
    800090c2:	0800                	addi	s0,sp,16
    800090c4:	00006797          	auipc	a5,0x6
    800090c8:	0047a783          	lw	a5,4(a5) # 8000f0c8 <clint_ipi_hart_count>
    800090cc:	00f57f63          	bgeu	a0,a5,800090ea <clint_ipi_send+0x2c>
    800090d0:	0140000f          	fence	w,o
    800090d4:	02051793          	slli	a5,a0,0x20
    800090d8:	01e7d513          	srli	a0,a5,0x1e
    800090dc:	00006797          	auipc	a5,0x6
    800090e0:	fdc7b783          	ld	a5,-36(a5) # 8000f0b8 <clint_ipi>
    800090e4:	953e                	add	a0,a0,a5
    800090e6:	4785                	li	a5,1
    800090e8:	c11c                	sw	a5,0(a0)
    800090ea:	6422                	ld	s0,8(sp)
    800090ec:	0141                	addi	sp,sp,16
    800090ee:	8082                	ret

00000000800090f0 <clint_ipi_clear>:
    800090f0:	1141                	addi	sp,sp,-16
    800090f2:	e422                	sd	s0,8(sp)
    800090f4:	0800                	addi	s0,sp,16
    800090f6:	00006797          	auipc	a5,0x6
    800090fa:	fd27a783          	lw	a5,-46(a5) # 8000f0c8 <clint_ipi_hart_count>
    800090fe:	00f57f63          	bgeu	a0,a5,8000911c <clint_ipi_clear+0x2c>
    80009102:	0140000f          	fence	w,o
    80009106:	02051793          	slli	a5,a0,0x20
    8000910a:	01e7d513          	srli	a0,a5,0x1e
    8000910e:	00006797          	auipc	a5,0x6
    80009112:	faa7b783          	ld	a5,-86(a5) # 8000f0b8 <clint_ipi>
    80009116:	953e                	add	a0,a0,a5
    80009118:	4781                	li	a5,0
    8000911a:	c11c                	sw	a5,0(a0)
    8000911c:	6422                	ld	s0,8(sp)
    8000911e:	0141                	addi	sp,sp,16
    80009120:	8082                	ret

0000000080009122 <clint_warm_ipi_init>:
    80009122:	1141                	addi	sp,sp,-16
    80009124:	e022                	sd	s0,0(sp)
    80009126:	e406                	sd	ra,8(sp)
    80009128:	0800                	addi	s0,sp,16
    8000912a:	c54fe0ef          	jal	ra,8000757e <sbi_current_hartid>
    8000912e:	00006717          	auipc	a4,0x6
    80009132:	f9273703          	ld	a4,-110(a4) # 8000f0c0 <clint_ipi_base>
    80009136:	cb1d                	beqz	a4,8000916c <clint_warm_ipi_init+0x4a>
    80009138:	0005079b          	sext.w	a5,a0
    8000913c:	00006717          	auipc	a4,0x6
    80009140:	f8c72703          	lw	a4,-116(a4) # 8000f0c8 <clint_ipi_hart_count>
    80009144:	4501                	li	a0,0
    80009146:	00e7ff63          	bgeu	a5,a4,80009164 <clint_warm_ipi_init+0x42>
    8000914a:	0140000f          	fence	w,o
    8000914e:	02079713          	slli	a4,a5,0x20
    80009152:	01e75793          	srli	a5,a4,0x1e
    80009156:	00006717          	auipc	a4,0x6
    8000915a:	f6273703          	ld	a4,-158(a4) # 8000f0b8 <clint_ipi>
    8000915e:	97ba                	add	a5,a5,a4
    80009160:	4701                	li	a4,0
    80009162:	c398                	sw	a4,0(a5)
    80009164:	60a2                	ld	ra,8(sp)
    80009166:	6402                	ld	s0,0(sp)
    80009168:	0141                	addi	sp,sp,16
    8000916a:	8082                	ret
    8000916c:	557d                	li	a0,-1
    8000916e:	bfdd                	j	80009164 <clint_warm_ipi_init+0x42>

0000000080009170 <clint_cold_ipi_init>:
    80009170:	1141                	addi	sp,sp,-16
    80009172:	e422                	sd	s0,8(sp)
    80009174:	0800                	addi	s0,sp,16
    80009176:	6422                	ld	s0,8(sp)
    80009178:	00006797          	auipc	a5,0x6
    8000917c:	f4a7b423          	sd	a0,-184(a5) # 8000f0c0 <clint_ipi_base>
    80009180:	00006797          	auipc	a5,0x6
    80009184:	f2a7bc23          	sd	a0,-200(a5) # 8000f0b8 <clint_ipi>
    80009188:	00006797          	auipc	a5,0x6
    8000918c:	f4b7a023          	sw	a1,-192(a5) # 8000f0c8 <clint_ipi_hart_count>
    80009190:	4501                	li	a0,0
    80009192:	0141                	addi	sp,sp,16
    80009194:	8082                	ret

0000000080009196 <clint_timer_value>:
    80009196:	1141                	addi	sp,sp,-16
    80009198:	e022                	sd	s0,0(sp)
    8000919a:	e406                	sd	ra,8(sp)
    8000919c:	0800                	addi	s0,sp,16
    8000919e:	00006517          	auipc	a0,0x6
    800091a2:	f0253503          	ld	a0,-254(a0) # 8000f0a0 <clint_time_val>
    800091a6:	00005797          	auipc	a5,0x5
    800091aa:	e7a7b783          	ld	a5,-390(a5) # 8000e020 <clint_time_rd>
    800091ae:	9782                	jalr	a5
    800091b0:	60a2                	ld	ra,8(sp)
    800091b2:	6402                	ld	s0,0(sp)
    800091b4:	0141                	addi	sp,sp,16
    800091b6:	8082                	ret

00000000800091b8 <clint_timer_event_stop>:
    800091b8:	1141                	addi	sp,sp,-16
    800091ba:	e022                	sd	s0,0(sp)
    800091bc:	e406                	sd	ra,8(sp)
    800091be:	0800                	addi	s0,sp,16
    800091c0:	bbefe0ef          	jal	ra,8000757e <sbi_current_hartid>
    800091c4:	2501                	sext.w	a0,a0
    800091c6:	00006797          	auipc	a5,0x6
    800091ca:	eea7a783          	lw	a5,-278(a5) # 8000f0b0 <clint_time_hart_count>
    800091ce:	02f57163          	bgeu	a0,a5,800091f0 <clint_timer_event_stop+0x38>
    800091d2:	02051793          	slli	a5,a0,0x20
    800091d6:	01d7d513          	srli	a0,a5,0x1d
    800091da:	00006597          	auipc	a1,0x6
    800091de:	ebe5b583          	ld	a1,-322(a1) # 8000f098 <clint_time_cmp>
    800091e2:	95aa                	add	a1,a1,a0
    800091e4:	00005797          	auipc	a5,0x5
    800091e8:	e347b783          	ld	a5,-460(a5) # 8000e018 <clint_time_wr>
    800091ec:	557d                	li	a0,-1
    800091ee:	9782                	jalr	a5
    800091f0:	60a2                	ld	ra,8(sp)
    800091f2:	6402                	ld	s0,0(sp)
    800091f4:	0141                	addi	sp,sp,16
    800091f6:	8082                	ret

00000000800091f8 <clint_timer_event_start>:
    800091f8:	1101                	addi	sp,sp,-32
    800091fa:	e822                	sd	s0,16(sp)
    800091fc:	e426                	sd	s1,8(sp)
    800091fe:	ec06                	sd	ra,24(sp)
    80009200:	1000                	addi	s0,sp,32
    80009202:	84aa                	mv	s1,a0
    80009204:	b7afe0ef          	jal	ra,8000757e <sbi_current_hartid>
    80009208:	0005059b          	sext.w	a1,a0
    8000920c:	00006797          	auipc	a5,0x6
    80009210:	ea47a783          	lw	a5,-348(a5) # 8000f0b0 <clint_time_hart_count>
    80009214:	02f5f163          	bgeu	a1,a5,80009236 <clint_timer_event_start+0x3e>
    80009218:	02059793          	slli	a5,a1,0x20
    8000921c:	01d7d593          	srli	a1,a5,0x1d
    80009220:	00006797          	auipc	a5,0x6
    80009224:	e787b783          	ld	a5,-392(a5) # 8000f098 <clint_time_cmp>
    80009228:	95be                	add	a1,a1,a5
    8000922a:	8526                	mv	a0,s1
    8000922c:	00005797          	auipc	a5,0x5
    80009230:	dec7b783          	ld	a5,-532(a5) # 8000e018 <clint_time_wr>
    80009234:	9782                	jalr	a5
    80009236:	60e2                	ld	ra,24(sp)
    80009238:	6442                	ld	s0,16(sp)
    8000923a:	64a2                	ld	s1,8(sp)
    8000923c:	6105                	addi	sp,sp,32
    8000923e:	8082                	ret

0000000080009240 <clint_warm_timer_init>:
    80009240:	1141                	addi	sp,sp,-16
    80009242:	e022                	sd	s0,0(sp)
    80009244:	e406                	sd	ra,8(sp)
    80009246:	0800                	addi	s0,sp,16
    80009248:	b36fe0ef          	jal	ra,8000757e <sbi_current_hartid>
    8000924c:	2501                	sext.w	a0,a0
    8000924e:	00006797          	auipc	a5,0x6
    80009252:	e627a783          	lw	a5,-414(a5) # 8000f0b0 <clint_time_hart_count>
    80009256:	02f57b63          	bgeu	a0,a5,8000928c <clint_warm_timer_init+0x4c>
    8000925a:	00006797          	auipc	a5,0x6
    8000925e:	e4e7b783          	ld	a5,-434(a5) # 8000f0a8 <clint_time_base>
    80009262:	c78d                	beqz	a5,8000928c <clint_warm_timer_init+0x4c>
    80009264:	02051793          	slli	a5,a0,0x20
    80009268:	01d7d513          	srli	a0,a5,0x1d
    8000926c:	00006597          	auipc	a1,0x6
    80009270:	e2c5b583          	ld	a1,-468(a1) # 8000f098 <clint_time_cmp>
    80009274:	95aa                	add	a1,a1,a0
    80009276:	00005797          	auipc	a5,0x5
    8000927a:	da27b783          	ld	a5,-606(a5) # 8000e018 <clint_time_wr>
    8000927e:	557d                	li	a0,-1
    80009280:	9782                	jalr	a5
    80009282:	4501                	li	a0,0
    80009284:	60a2                	ld	ra,8(sp)
    80009286:	6402                	ld	s0,0(sp)
    80009288:	0141                	addi	sp,sp,16
    8000928a:	8082                	ret
    8000928c:	557d                	li	a0,-1
    8000928e:	bfdd                	j	80009284 <clint_warm_timer_init+0x44>

0000000080009290 <clint_cold_timer_init>:
    80009290:	1141                	addi	sp,sp,-16
    80009292:	67b1                	lui	a5,0xc
    80009294:	e422                	sd	s0,8(sp)
    80009296:	17e1                	addi	a5,a5,-8
    80009298:	0800                	addi	s0,sp,16
    8000929a:	6711                	lui	a4,0x4
    8000929c:	97aa                	add	a5,a5,a0
    8000929e:	972a                	add	a4,a4,a0
    800092a0:	00006697          	auipc	a3,0x6
    800092a4:	e0f6b023          	sd	a5,-512(a3) # 8000f0a0 <clint_time_val>
    800092a8:	00006697          	auipc	a3,0x6
    800092ac:	e0b6a423          	sw	a1,-504(a3) # 8000f0b0 <clint_time_hart_count>
    800092b0:	00006697          	auipc	a3,0x6
    800092b4:	dea6bc23          	sd	a0,-520(a3) # 8000f0a8 <clint_time_base>
    800092b8:	00006797          	auipc	a5,0x6
    800092bc:	dee7b023          	sd	a4,-544(a5) # 8000f098 <clint_time_cmp>
    800092c0:	c20d                	beqz	a2,800092e2 <clint_cold_timer_init+0x52>
    800092c2:	00000797          	auipc	a5,0x0
    800092c6:	da078793          	addi	a5,a5,-608 # 80009062 <clint_time_rd64>
    800092ca:	00005717          	auipc	a4,0x5
    800092ce:	d4f73b23          	sd	a5,-682(a4) # 8000e020 <clint_time_rd>
    800092d2:	00000797          	auipc	a5,0x0
    800092d6:	d9e78793          	addi	a5,a5,-610 # 80009070 <clint_time_wr64>
    800092da:	00005717          	auipc	a4,0x5
    800092de:	d2f73f23          	sd	a5,-706(a4) # 8000e018 <clint_time_wr>
    800092e2:	6422                	ld	s0,8(sp)
    800092e4:	4501                	li	a0,0
    800092e6:	0141                	addi	sp,sp,16
    800092e8:	8082                	ret

00000000800092ea <get_reg>:
    800092ea:	1141                	addi	sp,sp,-16
    800092ec:	e422                	sd	s0,8(sp)
    800092ee:	0800                	addi	s0,sp,16
    800092f0:	00006797          	auipc	a5,0x6
    800092f4:	de07a783          	lw	a5,-544(a5) # 8000f0d0 <uart8250_reg_shift>
    800092f8:	00f5153b          	sllw	a0,a0,a5
    800092fc:	02051793          	slli	a5,a0,0x20
    80009300:	9381                	srli	a5,a5,0x20
    80009302:	00006517          	auipc	a0,0x6
    80009306:	dd653503          	ld	a0,-554(a0) # 8000f0d8 <uart8250_base>
    8000930a:	00006717          	auipc	a4,0x6
    8000930e:	dca72703          	lw	a4,-566(a4) # 8000f0d4 <uart8250_reg_width>
    80009312:	4685                	li	a3,1
    80009314:	953e                	add	a0,a0,a5
    80009316:	02d70663          	beq	a4,a3,80009342 <get_reg+0x58>
    8000931a:	4789                	li	a5,2
    8000931c:	00f70963          	beq	a4,a5,8000932e <get_reg+0x44>
    80009320:	4108                	lw	a0,0(a0)
    80009322:	2501                	sext.w	a0,a0
    80009324:	0820000f          	fence	i,r
    80009328:	6422                	ld	s0,8(sp)
    8000932a:	0141                	addi	sp,sp,16
    8000932c:	8082                	ret
    8000932e:	00051503          	lh	a0,0(a0)
    80009332:	1542                	slli	a0,a0,0x30
    80009334:	9141                	srli	a0,a0,0x30
    80009336:	0820000f          	fence	i,r
    8000933a:	6422                	ld	s0,8(sp)
    8000933c:	2501                	sext.w	a0,a0
    8000933e:	0141                	addi	sp,sp,16
    80009340:	8082                	ret
    80009342:	00050503          	lb	a0,0(a0)
    80009346:	0ff57513          	andi	a0,a0,255
    8000934a:	0820000f          	fence	i,r
    8000934e:	6422                	ld	s0,8(sp)
    80009350:	2501                	sext.w	a0,a0
    80009352:	0141                	addi	sp,sp,16
    80009354:	8082                	ret

0000000080009356 <set_reg>:
    80009356:	1141                	addi	sp,sp,-16
    80009358:	e422                	sd	s0,8(sp)
    8000935a:	0800                	addi	s0,sp,16
    8000935c:	00006797          	auipc	a5,0x6
    80009360:	d747a783          	lw	a5,-652(a5) # 8000f0d0 <uart8250_reg_shift>
    80009364:	00f5153b          	sllw	a0,a0,a5
    80009368:	1502                	slli	a0,a0,0x20
    8000936a:	00006797          	auipc	a5,0x6
    8000936e:	d6a7a783          	lw	a5,-662(a5) # 8000f0d4 <uart8250_reg_width>
    80009372:	4705                	li	a4,1
    80009374:	9101                	srli	a0,a0,0x20
    80009376:	02e78c63          	beq	a5,a4,800093ae <set_reg+0x58>
    8000937a:	4709                	li	a4,2
    8000937c:	00e78d63          	beq	a5,a4,80009396 <set_reg+0x40>
    80009380:	0140000f          	fence	w,o
    80009384:	00006797          	auipc	a5,0x6
    80009388:	d547b783          	ld	a5,-684(a5) # 8000f0d8 <uart8250_base>
    8000938c:	953e                	add	a0,a0,a5
    8000938e:	c10c                	sw	a1,0(a0)
    80009390:	6422                	ld	s0,8(sp)
    80009392:	0141                	addi	sp,sp,16
    80009394:	8082                	ret
    80009396:	0140000f          	fence	w,o
    8000939a:	00006797          	auipc	a5,0x6
    8000939e:	d3e7b783          	ld	a5,-706(a5) # 8000f0d8 <uart8250_base>
    800093a2:	953e                	add	a0,a0,a5
    800093a4:	00b51023          	sh	a1,0(a0)
    800093a8:	6422                	ld	s0,8(sp)
    800093aa:	0141                	addi	sp,sp,16
    800093ac:	8082                	ret
    800093ae:	0140000f          	fence	w,o
    800093b2:	00006797          	auipc	a5,0x6
    800093b6:	d267b783          	ld	a5,-730(a5) # 8000f0d8 <uart8250_base>
    800093ba:	953e                	add	a0,a0,a5
    800093bc:	00b50023          	sb	a1,0(a0)
    800093c0:	6422                	ld	s0,8(sp)
    800093c2:	0141                	addi	sp,sp,16
    800093c4:	8082                	ret

00000000800093c6 <uart8250_putc>:
    800093c6:	1141                	addi	sp,sp,-16
    800093c8:	e022                	sd	s0,0(sp)
    800093ca:	e406                	sd	ra,8(sp)
    800093cc:	0800                	addi	s0,sp,16
    800093ce:	85aa                	mv	a1,a0
    800093d0:	00006e17          	auipc	t3,0x6
    800093d4:	d04e0e13          	addi	t3,t3,-764 # 8000f0d4 <uart8250_reg_width>
    800093d8:	00006317          	auipc	t1,0x6
    800093dc:	d0030313          	addi	t1,t1,-768 # 8000f0d8 <uart8250_base>
    800093e0:	00006897          	auipc	a7,0x6
    800093e4:	cf088893          	addi	a7,a7,-784 # 8000f0d0 <uart8250_reg_shift>
    800093e8:	4815                	li	a6,5
    800093ea:	4605                	li	a2,1
    800093ec:	4e89                	li	t4,2
    800093ee:	a801                	j	800093fe <uart8250_putc+0x38>
    800093f0:	439c                	lw	a5,0(a5)
    800093f2:	2781                	sext.w	a5,a5
    800093f4:	0820000f          	fence	i,r
    800093f8:	0207f793          	andi	a5,a5,32
    800093fc:	eb95                	bnez	a5,80009430 <uart8250_putc+0x6a>
    800093fe:	0008a703          	lw	a4,0(a7)
    80009402:	00033783          	ld	a5,0(t1)
    80009406:	000e2683          	lw	a3,0(t3)
    8000940a:	00e8173b          	sllw	a4,a6,a4
    8000940e:	1702                	slli	a4,a4,0x20
    80009410:	9301                	srli	a4,a4,0x20
    80009412:	97ba                	add	a5,a5,a4
    80009414:	02c68563          	beq	a3,a2,8000943e <uart8250_putc+0x78>
    80009418:	fdd69ce3          	bne	a3,t4,800093f0 <uart8250_putc+0x2a>
    8000941c:	00079783          	lh	a5,0(a5)
    80009420:	17c2                	slli	a5,a5,0x30
    80009422:	93c1                	srli	a5,a5,0x30
    80009424:	0820000f          	fence	i,r
    80009428:	2781                	sext.w	a5,a5
    8000942a:	0207f793          	andi	a5,a5,32
    8000942e:	dbe1                	beqz	a5,800093fe <uart8250_putc+0x38>
    80009430:	4501                	li	a0,0
    80009432:	f25ff0ef          	jal	ra,80009356 <set_reg>
    80009436:	60a2                	ld	ra,8(sp)
    80009438:	6402                	ld	s0,0(sp)
    8000943a:	0141                	addi	sp,sp,16
    8000943c:	8082                	ret
    8000943e:	00078783          	lb	a5,0(a5)
    80009442:	0ff7f793          	andi	a5,a5,255
    80009446:	0820000f          	fence	i,r
    8000944a:	2781                	sext.w	a5,a5
    8000944c:	b775                	j	800093f8 <uart8250_putc+0x32>

000000008000944e <uart8250_getc>:
    8000944e:	1141                	addi	sp,sp,-16
    80009450:	e422                	sd	s0,8(sp)
    80009452:	0800                	addi	s0,sp,16
    80009454:	00006517          	auipc	a0,0x6
    80009458:	c7c52503          	lw	a0,-900(a0) # 8000f0d0 <uart8250_reg_shift>
    8000945c:	00006617          	auipc	a2,0x6
    80009460:	c7860613          	addi	a2,a2,-904 # 8000f0d4 <uart8250_reg_width>
    80009464:	00006697          	auipc	a3,0x6
    80009468:	c7468693          	addi	a3,a3,-908 # 8000f0d8 <uart8250_base>
    8000946c:	4715                	li	a4,5
    8000946e:	00a7173b          	sllw	a4,a4,a0
    80009472:	629c                	ld	a5,0(a3)
    80009474:	420c                	lw	a1,0(a2)
    80009476:	1702                	slli	a4,a4,0x20
    80009478:	9301                	srli	a4,a4,0x20
    8000947a:	4505                	li	a0,1
    8000947c:	97ba                	add	a5,a5,a4
    8000947e:	04a58b63          	beq	a1,a0,800094d4 <uart8250_getc+0x86>
    80009482:	4709                	li	a4,2
    80009484:	04e58063          	beq	a1,a4,800094c4 <uart8250_getc+0x76>
    80009488:	439c                	lw	a5,0(a5)
    8000948a:	2781                	sext.w	a5,a5
    8000948c:	0820000f          	fence	i,r
    80009490:	8b85                	andi	a5,a5,1
    80009492:	c3ad                	beqz	a5,800094f4 <uart8250_getc+0xa6>
    80009494:	421c                	lw	a5,0(a2)
    80009496:	4705                	li	a4,1
    80009498:	6288                	ld	a0,0(a3)
    8000949a:	04e78563          	beq	a5,a4,800094e4 <uart8250_getc+0x96>
    8000949e:	4709                	li	a4,2
    800094a0:	00e78a63          	beq	a5,a4,800094b4 <uart8250_getc+0x66>
    800094a4:	4108                	lw	a0,0(a0)
    800094a6:	2501                	sext.w	a0,a0
    800094a8:	0820000f          	fence	i,r
    800094ac:	2501                	sext.w	a0,a0
    800094ae:	6422                	ld	s0,8(sp)
    800094b0:	0141                	addi	sp,sp,16
    800094b2:	8082                	ret
    800094b4:	00051503          	lh	a0,0(a0)
    800094b8:	1542                	slli	a0,a0,0x30
    800094ba:	9141                	srli	a0,a0,0x30
    800094bc:	0820000f          	fence	i,r
    800094c0:	2501                	sext.w	a0,a0
    800094c2:	b7ed                	j	800094ac <uart8250_getc+0x5e>
    800094c4:	00079783          	lh	a5,0(a5)
    800094c8:	17c2                	slli	a5,a5,0x30
    800094ca:	93c1                	srli	a5,a5,0x30
    800094cc:	0820000f          	fence	i,r
    800094d0:	2781                	sext.w	a5,a5
    800094d2:	bf7d                	j	80009490 <uart8250_getc+0x42>
    800094d4:	00078783          	lb	a5,0(a5)
    800094d8:	0ff7f793          	andi	a5,a5,255
    800094dc:	0820000f          	fence	i,r
    800094e0:	2781                	sext.w	a5,a5
    800094e2:	b77d                	j	80009490 <uart8250_getc+0x42>
    800094e4:	00050503          	lb	a0,0(a0)
    800094e8:	0ff57513          	andi	a0,a0,255
    800094ec:	0820000f          	fence	i,r
    800094f0:	2501                	sext.w	a0,a0
    800094f2:	bf6d                	j	800094ac <uart8250_getc+0x5e>
    800094f4:	557d                	li	a0,-1
    800094f6:	bf65                	j	800094ae <uart8250_getc+0x60>

00000000800094f8 <uart8250_init>:
    800094f8:	1101                	addi	sp,sp,-32
    800094fa:	0046161b          	slliw	a2,a2,0x4
    800094fe:	e426                	sd	s1,8(sp)
    80009500:	02c5d4bb          	divuw	s1,a1,a2
    80009504:	ec06                	sd	ra,24(sp)
    80009506:	e822                	sd	s0,16(sp)
    80009508:	1000                	addi	s0,sp,32
    8000950a:	87aa                	mv	a5,a0
    8000950c:	4581                	li	a1,0
    8000950e:	4505                	li	a0,1
    80009510:	00006617          	auipc	a2,0x6
    80009514:	bcf63423          	sd	a5,-1080(a2) # 8000f0d8 <uart8250_base>
    80009518:	00006797          	auipc	a5,0x6
    8000951c:	bad7ac23          	sw	a3,-1096(a5) # 8000f0d0 <uart8250_reg_shift>
    80009520:	00006797          	auipc	a5,0x6
    80009524:	bae7aa23          	sw	a4,-1100(a5) # 8000f0d4 <uart8250_reg_width>
    80009528:	e2fff0ef          	jal	ra,80009356 <set_reg>
    8000952c:	08000593          	li	a1,128
    80009530:	450d                	li	a0,3
    80009532:	e25ff0ef          	jal	ra,80009356 <set_reg>
    80009536:	4501                	li	a0,0
    80009538:	0ff4f593          	andi	a1,s1,255
    8000953c:	2481                	sext.w	s1,s1
    8000953e:	e19ff0ef          	jal	ra,80009356 <set_reg>
    80009542:	80a1                	srli	s1,s1,0x8
    80009544:	0ff4f593          	andi	a1,s1,255
    80009548:	4505                	li	a0,1
    8000954a:	e0dff0ef          	jal	ra,80009356 <set_reg>
    8000954e:	458d                	li	a1,3
    80009550:	450d                	li	a0,3
    80009552:	e05ff0ef          	jal	ra,80009356 <set_reg>
    80009556:	4585                	li	a1,1
    80009558:	4509                	li	a0,2
    8000955a:	dfdff0ef          	jal	ra,80009356 <set_reg>
    8000955e:	4581                	li	a1,0
    80009560:	4511                	li	a0,4
    80009562:	df5ff0ef          	jal	ra,80009356 <set_reg>
    80009566:	4515                	li	a0,5
    80009568:	d83ff0ef          	jal	ra,800092ea <get_reg>
    8000956c:	4501                	li	a0,0
    8000956e:	d7dff0ef          	jal	ra,800092ea <get_reg>
    80009572:	451d                	li	a0,7
    80009574:	4581                	li	a1,0
    80009576:	de1ff0ef          	jal	ra,80009356 <set_reg>
    8000957a:	60e2                	ld	ra,24(sp)
    8000957c:	6442                	ld	s0,16(sp)
    8000957e:	64a2                	ld	s1,8(sp)
    80009580:	4501                	li	a0,0
    80009582:	6105                	addi	sp,sp,32
    80009584:	8082                	ret

0000000080009586 <plic_set_thresh>:
    80009586:	1141                	addi	sp,sp,-16
    80009588:	00c5151b          	slliw	a0,a0,0xc
    8000958c:	e422                	sd	s0,8(sp)
    8000958e:	1502                	slli	a0,a0,0x20
    80009590:	0800                	addi	s0,sp,16
    80009592:	002007b7          	lui	a5,0x200
    80009596:	9101                	srli	a0,a0,0x20
    80009598:	953e                	add	a0,a0,a5
    8000959a:	00006797          	auipc	a5,0x6
    8000959e:	b467b783          	ld	a5,-1210(a5) # 8000f0e0 <plic_base>
    800095a2:	953e                	add	a0,a0,a5
    800095a4:	0140000f          	fence	w,o
    800095a8:	c10c                	sw	a1,0(a0)
    800095aa:	6422                	ld	s0,8(sp)
    800095ac:	0141                	addi	sp,sp,16
    800095ae:	8082                	ret

00000000800095b0 <plic_set_ie>:
    800095b0:	1141                	addi	sp,sp,-16
    800095b2:	e422                	sd	s0,8(sp)
    800095b4:	0800                	addi	s0,sp,16
    800095b6:	00006797          	auipc	a5,0x6
    800095ba:	b2a7b783          	ld	a5,-1238(a5) # 8000f0e0 <plic_base>
    800095be:	0140000f          	fence	w,o
    800095c2:	0025959b          	slliw	a1,a1,0x2
    800095c6:	1582                	slli	a1,a1,0x20
    800095c8:	0075151b          	slliw	a0,a0,0x7
    800095cc:	6709                	lui	a4,0x2
    800095ce:	9181                	srli	a1,a1,0x20
    800095d0:	1502                	slli	a0,a0,0x20
    800095d2:	95ba                	add	a1,a1,a4
    800095d4:	9101                	srli	a0,a0,0x20
    800095d6:	95aa                	add	a1,a1,a0
    800095d8:	95be                	add	a1,a1,a5
    800095da:	c190                	sw	a2,0(a1)
    800095dc:	6422                	ld	s0,8(sp)
    800095de:	0141                	addi	sp,sp,16
    800095e0:	8082                	ret

00000000800095e2 <plic_fdt_fixup>:
    800095e2:	7179                	addi	sp,sp,-48
    800095e4:	f022                	sd	s0,32(sp)
    800095e6:	ec26                	sd	s1,24(sp)
    800095e8:	f406                	sd	ra,40(sp)
    800095ea:	1800                	addi	s0,sp,48
    800095ec:	862e                	mv	a2,a1
    800095ee:	4581                	li	a1,0
    800095f0:	84aa                	mv	s1,a0
    800095f2:	4f3010ef          	jal	ra,8000b2e4 <fdt_node_offset_by_compatible>
    800095f6:	06054c63          	bltz	a0,8000966e <plic_fdt_fixup+0x8c>
    800095fa:	85aa                	mv	a1,a0
    800095fc:	fdc40693          	addi	a3,s0,-36
    80009600:	00004617          	auipc	a2,0x4
    80009604:	ae860613          	addi	a2,a2,-1304 # 8000d0e8 <illegal_insn_table+0x100>
    80009608:	8526                	mv	a0,s1
    8000960a:	4de010ef          	jal	ra,8000aae8 <fdt_getprop>
    8000960e:	c125                	beqz	a0,8000966e <plic_fdt_fixup+0x8c>
    80009610:	fdc42783          	lw	a5,-36(s0)
    80009614:	4705                	li	a4,1
    80009616:	8789                	srai	a5,a5,0x2
    80009618:	fcf42e23          	sw	a5,-36(s0)
    8000961c:	04f75963          	bge	a4,a5,8000966e <plic_fdt_fixup+0x8c>
    80009620:	0511                	addi	a0,a0,4
    80009622:	4601                	li	a2,0
    80009624:	482d                	li	a6,11
    80009626:	58fd                	li	a7,-1
    80009628:	411c                	lw	a5,0(a0)
    8000962a:	2605                	addiw	a2,a2,1
    8000962c:	0087d693          	srli	a3,a5,0x8
    80009630:	0187971b          	slliw	a4,a5,0x18
    80009634:	0187d59b          	srliw	a1,a5,0x18
    80009638:	0ff6f693          	andi	a3,a3,255
    8000963c:	83c1                	srli	a5,a5,0x10
    8000963e:	8f4d                	or	a4,a4,a1
    80009640:	0106969b          	slliw	a3,a3,0x10
    80009644:	0ff7f793          	andi	a5,a5,255
    80009648:	8f55                	or	a4,a4,a3
    8000964a:	0087979b          	slliw	a5,a5,0x8
    8000964e:	8fd9                	or	a5,a5,a4
    80009650:	2781                	sext.w	a5,a5
    80009652:	01079463          	bne	a5,a6,8000965a <plic_fdt_fixup+0x78>
    80009656:	01152023          	sw	a7,0(a0)
    8000965a:	fdc42703          	lw	a4,-36(s0)
    8000965e:	0521                	addi	a0,a0,8
    80009660:	01f7579b          	srliw	a5,a4,0x1f
    80009664:	9fb9                	addw	a5,a5,a4
    80009666:	4017d79b          	sraiw	a5,a5,0x1
    8000966a:	faf64fe3          	blt	a2,a5,80009628 <plic_fdt_fixup+0x46>
    8000966e:	70a2                	ld	ra,40(sp)
    80009670:	7402                	ld	s0,32(sp)
    80009672:	64e2                	ld	s1,24(sp)
    80009674:	6145                	addi	sp,sp,48
    80009676:	8082                	ret

0000000080009678 <plic_warm_irqchip_init>:
    80009678:	1141                	addi	sp,sp,-16
    8000967a:	e422                	sd	s0,8(sp)
    8000967c:	0800                	addi	s0,sp,16
    8000967e:	00006797          	auipc	a5,0x6
    80009682:	a6e7a783          	lw	a5,-1426(a5) # 8000f0ec <plic_hart_count>
    80009686:	00006817          	auipc	a6,0x6
    8000968a:	a6282803          	lw	a6,-1438(a6) # 8000f0e8 <plic_num_sources>
    8000968e:	0cf57663          	bgeu	a0,a5,8000975a <plic_warm_irqchip_init+0xe2>
    80009692:	0058581b          	srliw	a6,a6,0x5
    80009696:	2805                	addiw	a6,a6,1
    80009698:	0a05ca63          	bltz	a1,8000974c <plic_warm_irqchip_init+0xd4>
    8000969c:	0075971b          	slliw	a4,a1,0x7
    800096a0:	1702                	slli	a4,a4,0x20
    800096a2:	9301                	srli	a4,a4,0x20
    800096a4:	6789                	lui	a5,0x2
    800096a6:	00058e1b          	sext.w	t3,a1
    800096aa:	973e                	add	a4,a4,a5
    800096ac:	4681                	li	a3,0
    800096ae:	00006517          	auipc	a0,0x6
    800096b2:	a3250513          	addi	a0,a0,-1486 # 8000f0e0 <plic_base>
    800096b6:	4881                	li	a7,0
    800096b8:	611c                	ld	a5,0(a0)
    800096ba:	0140000f          	fence	w,o
    800096be:	97ba                	add	a5,a5,a4
    800096c0:	0117a023          	sw	a7,0(a5) # 2000 <_fw_start-0x7fffe000>
    800096c4:	0685                	addi	a3,a3,1
    800096c6:	0711                	addi	a4,a4,4
    800096c8:	ff06e8e3          	bltu	a3,a6,800096b8 <plic_warm_irqchip_init+0x40>
    800096cc:	02064a63          	bltz	a2,80009700 <plic_warm_irqchip_init+0x88>
    800096d0:	0076171b          	slliw	a4,a2,0x7
    800096d4:	1702                	slli	a4,a4,0x20
    800096d6:	9301                	srli	a4,a4,0x20
    800096d8:	6789                	lui	a5,0x2
    800096da:	0006031b          	sext.w	t1,a2
    800096de:	973e                	add	a4,a4,a5
    800096e0:	4681                	li	a3,0
    800096e2:	4881                	li	a7,0
    800096e4:	611c                	ld	a5,0(a0)
    800096e6:	0140000f          	fence	w,o
    800096ea:	97ba                	add	a5,a5,a4
    800096ec:	0117a023          	sw	a7,0(a5) # 2000 <_fw_start-0x7fffe000>
    800096f0:	0685                	addi	a3,a3,1
    800096f2:	0711                	addi	a4,a4,4
    800096f4:	ff06e8e3          	bltu	a3,a6,800096e4 <plic_warm_irqchip_init+0x6c>
    800096f8:	00058e1b          	sext.w	t3,a1
    800096fc:	0205c563          	bltz	a1,80009726 <plic_warm_irqchip_init+0xae>
    80009700:	00ce1e1b          	slliw	t3,t3,0xc
    80009704:	611c                	ld	a5,0(a0)
    80009706:	1e02                	slli	t3,t3,0x20
    80009708:	00200737          	lui	a4,0x200
    8000970c:	020e5e13          	srli	t3,t3,0x20
    80009710:	9e3a                	add	t3,t3,a4
    80009712:	9e3e                	add	t3,t3,a5
    80009714:	0140000f          	fence	w,o
    80009718:	57fd                	li	a5,-1
    8000971a:	00fe2023          	sw	a5,0(t3)
    8000971e:	0006031b          	sext.w	t1,a2
    80009722:	02064163          	bltz	a2,80009744 <plic_warm_irqchip_init+0xcc>
    80009726:	00c3131b          	slliw	t1,t1,0xc
    8000972a:	611c                	ld	a5,0(a0)
    8000972c:	1302                	slli	t1,t1,0x20
    8000972e:	00200737          	lui	a4,0x200
    80009732:	02035313          	srli	t1,t1,0x20
    80009736:	933a                	add	t1,t1,a4
    80009738:	933e                	add	t1,t1,a5
    8000973a:	0140000f          	fence	w,o
    8000973e:	57fd                	li	a5,-1
    80009740:	00f32023          	sw	a5,0(t1)
    80009744:	4501                	li	a0,0
    80009746:	6422                	ld	s0,8(sp)
    80009748:	0141                	addi	sp,sp,16
    8000974a:	8082                	ret
    8000974c:	00006517          	auipc	a0,0x6
    80009750:	99450513          	addi	a0,a0,-1644 # 8000f0e0 <plic_base>
    80009754:	f6065ee3          	bgez	a2,800096d0 <plic_warm_irqchip_init+0x58>
    80009758:	b7f5                	j	80009744 <plic_warm_irqchip_init+0xcc>
    8000975a:	557d                	li	a0,-1
    8000975c:	b7ed                	j	80009746 <plic_warm_irqchip_init+0xce>

000000008000975e <plic_cold_irqchip_init>:
    8000975e:	1141                	addi	sp,sp,-16
    80009760:	e422                	sd	s0,8(sp)
    80009762:	0800                	addi	s0,sp,16
    80009764:	00006697          	auipc	a3,0x6
    80009768:	98468693          	addi	a3,a3,-1660 # 8000f0e8 <plic_num_sources>
    8000976c:	00006817          	auipc	a6,0x6
    80009770:	97480813          	addi	a6,a6,-1676 # 8000f0e0 <plic_base>
    80009774:	00006797          	auipc	a5,0x6
    80009778:	96c7ac23          	sw	a2,-1672(a5) # 8000f0ec <plic_hart_count>
    8000977c:	c28c                	sw	a1,0(a3)
    8000977e:	00a83023          	sd	a0,0(a6)
    80009782:	c195                	beqz	a1,800097a6 <plic_cold_irqchip_init+0x48>
    80009784:	4785                	li	a5,1
    80009786:	4601                	li	a2,0
    80009788:	a019                	j	8000978e <plic_cold_irqchip_init+0x30>
    8000978a:	00083503          	ld	a0,0(a6)
    8000978e:	0140000f          	fence	w,o
    80009792:	0027971b          	slliw	a4,a5,0x2
    80009796:	1702                	slli	a4,a4,0x20
    80009798:	9301                	srli	a4,a4,0x20
    8000979a:	953a                	add	a0,a0,a4
    8000979c:	c110                	sw	a2,0(a0)
    8000979e:	4298                	lw	a4,0(a3)
    800097a0:	2785                	addiw	a5,a5,1
    800097a2:	fef774e3          	bgeu	a4,a5,8000978a <plic_cold_irqchip_init+0x2c>
    800097a6:	6422                	ld	s0,8(sp)
    800097a8:	4501                	li	a0,0
    800097aa:	0141                	addi	sp,sp,16
    800097ac:	8082                	ret

00000000800097ae <get_f32_reg>:
    800097ae:	e0000553          	fmv.x.w	a0,ft0
    800097b2:	00028067          	jr	t0
    800097b6:	e0008553          	fmv.x.w	a0,ft1
    800097ba:	00028067          	jr	t0
    800097be:	e0010553          	fmv.x.w	a0,ft2
    800097c2:	00028067          	jr	t0
    800097c6:	e0018553          	fmv.x.w	a0,ft3
    800097ca:	00028067          	jr	t0
    800097ce:	e0020553          	fmv.x.w	a0,ft4
    800097d2:	00028067          	jr	t0
    800097d6:	e0028553          	fmv.x.w	a0,ft5
    800097da:	00028067          	jr	t0
    800097de:	e0030553          	fmv.x.w	a0,ft6
    800097e2:	00028067          	jr	t0
    800097e6:	e0038553          	fmv.x.w	a0,ft7
    800097ea:	00028067          	jr	t0
    800097ee:	e0040553          	fmv.x.w	a0,fs0
    800097f2:	00028067          	jr	t0
    800097f6:	e0048553          	fmv.x.w	a0,fs1
    800097fa:	00028067          	jr	t0
    800097fe:	e0050553          	fmv.x.w	a0,fa0
    80009802:	00028067          	jr	t0
    80009806:	e0058553          	fmv.x.w	a0,fa1
    8000980a:	00028067          	jr	t0
    8000980e:	e0060553          	fmv.x.w	a0,fa2
    80009812:	00028067          	jr	t0
    80009816:	e0068553          	fmv.x.w	a0,fa3
    8000981a:	00028067          	jr	t0
    8000981e:	e0070553          	fmv.x.w	a0,fa4
    80009822:	00028067          	jr	t0
    80009826:	e0078553          	fmv.x.w	a0,fa5
    8000982a:	00028067          	jr	t0
    8000982e:	e0080553          	fmv.x.w	a0,fa6
    80009832:	00028067          	jr	t0
    80009836:	e0088553          	fmv.x.w	a0,fa7
    8000983a:	00028067          	jr	t0
    8000983e:	e0090553          	fmv.x.w	a0,fs2
    80009842:	00028067          	jr	t0
    80009846:	e0098553          	fmv.x.w	a0,fs3
    8000984a:	00028067          	jr	t0
    8000984e:	e00a0553          	fmv.x.w	a0,fs4
    80009852:	00028067          	jr	t0
    80009856:	e00a8553          	fmv.x.w	a0,fs5
    8000985a:	00028067          	jr	t0
    8000985e:	e00b0553          	fmv.x.w	a0,fs6
    80009862:	00028067          	jr	t0
    80009866:	e00b8553          	fmv.x.w	a0,fs7
    8000986a:	00028067          	jr	t0
    8000986e:	e00c0553          	fmv.x.w	a0,fs8
    80009872:	00028067          	jr	t0
    80009876:	e00c8553          	fmv.x.w	a0,fs9
    8000987a:	00028067          	jr	t0
    8000987e:	e00d0553          	fmv.x.w	a0,fs10
    80009882:	00028067          	jr	t0
    80009886:	e00d8553          	fmv.x.w	a0,fs11
    8000988a:	00028067          	jr	t0
    8000988e:	e00e0553          	fmv.x.w	a0,ft8
    80009892:	00028067          	jr	t0
    80009896:	e00e8553          	fmv.x.w	a0,ft9
    8000989a:	00028067          	jr	t0
    8000989e:	e00f0553          	fmv.x.w	a0,ft10
    800098a2:	00028067          	jr	t0
    800098a6:	e00f8553          	fmv.x.w	a0,ft11
    800098aa:	00028067          	jr	t0

00000000800098ae <put_f32_reg>:
    800098ae:	f0050053          	fmv.w.x	ft0,a0
    800098b2:	00028067          	jr	t0
    800098b6:	f00500d3          	fmv.w.x	ft1,a0
    800098ba:	00028067          	jr	t0
    800098be:	f0050153          	fmv.w.x	ft2,a0
    800098c2:	00028067          	jr	t0
    800098c6:	f00501d3          	fmv.w.x	ft3,a0
    800098ca:	00028067          	jr	t0
    800098ce:	f0050253          	fmv.w.x	ft4,a0
    800098d2:	00028067          	jr	t0
    800098d6:	f00502d3          	fmv.w.x	ft5,a0
    800098da:	00028067          	jr	t0
    800098de:	f0050353          	fmv.w.x	ft6,a0
    800098e2:	00028067          	jr	t0
    800098e6:	f00503d3          	fmv.w.x	ft7,a0
    800098ea:	00028067          	jr	t0
    800098ee:	f0050453          	fmv.w.x	fs0,a0
    800098f2:	00028067          	jr	t0
    800098f6:	f00504d3          	fmv.w.x	fs1,a0
    800098fa:	00028067          	jr	t0
    800098fe:	f0050553          	fmv.w.x	fa0,a0
    80009902:	00028067          	jr	t0
    80009906:	f00505d3          	fmv.w.x	fa1,a0
    8000990a:	00028067          	jr	t0
    8000990e:	f0050653          	fmv.w.x	fa2,a0
    80009912:	00028067          	jr	t0
    80009916:	f00506d3          	fmv.w.x	fa3,a0
    8000991a:	00028067          	jr	t0
    8000991e:	f0050753          	fmv.w.x	fa4,a0
    80009922:	00028067          	jr	t0
    80009926:	f00507d3          	fmv.w.x	fa5,a0
    8000992a:	00028067          	jr	t0
    8000992e:	f0050853          	fmv.w.x	fa6,a0
    80009932:	00028067          	jr	t0
    80009936:	f00508d3          	fmv.w.x	fa7,a0
    8000993a:	00028067          	jr	t0
    8000993e:	f0050953          	fmv.w.x	fs2,a0
    80009942:	00028067          	jr	t0
    80009946:	f00509d3          	fmv.w.x	fs3,a0
    8000994a:	00028067          	jr	t0
    8000994e:	f0050a53          	fmv.w.x	fs4,a0
    80009952:	00028067          	jr	t0
    80009956:	f0050ad3          	fmv.w.x	fs5,a0
    8000995a:	00028067          	jr	t0
    8000995e:	f0050b53          	fmv.w.x	fs6,a0
    80009962:	00028067          	jr	t0
    80009966:	f0050bd3          	fmv.w.x	fs7,a0
    8000996a:	00028067          	jr	t0
    8000996e:	f0050c53          	fmv.w.x	fs8,a0
    80009972:	00028067          	jr	t0
    80009976:	f0050cd3          	fmv.w.x	fs9,a0
    8000997a:	00028067          	jr	t0
    8000997e:	f0050d53          	fmv.w.x	fs10,a0
    80009982:	00028067          	jr	t0
    80009986:	f0050dd3          	fmv.w.x	fs11,a0
    8000998a:	00028067          	jr	t0
    8000998e:	f0050e53          	fmv.w.x	ft8,a0
    80009992:	00028067          	jr	t0
    80009996:	f0050ed3          	fmv.w.x	ft9,a0
    8000999a:	00028067          	jr	t0
    8000999e:	f0050f53          	fmv.w.x	ft10,a0
    800099a2:	00028067          	jr	t0
    800099a6:	f0050fd3          	fmv.w.x	ft11,a0
    800099aa:	00028067          	jr	t0

00000000800099ae <get_f64_reg>:
    800099ae:	e2000553          	fmv.x.d	a0,ft0
    800099b2:	00028067          	jr	t0
    800099b6:	e2008553          	fmv.x.d	a0,ft1
    800099ba:	00028067          	jr	t0
    800099be:	e2010553          	fmv.x.d	a0,ft2
    800099c2:	00028067          	jr	t0
    800099c6:	e2018553          	fmv.x.d	a0,ft3
    800099ca:	00028067          	jr	t0
    800099ce:	e2020553          	fmv.x.d	a0,ft4
    800099d2:	00028067          	jr	t0
    800099d6:	e2028553          	fmv.x.d	a0,ft5
    800099da:	00028067          	jr	t0
    800099de:	e2030553          	fmv.x.d	a0,ft6
    800099e2:	00028067          	jr	t0
    800099e6:	e2038553          	fmv.x.d	a0,ft7
    800099ea:	00028067          	jr	t0
    800099ee:	e2040553          	fmv.x.d	a0,fs0
    800099f2:	00028067          	jr	t0
    800099f6:	e2048553          	fmv.x.d	a0,fs1
    800099fa:	00028067          	jr	t0
    800099fe:	e2050553          	fmv.x.d	a0,fa0
    80009a02:	00028067          	jr	t0
    80009a06:	e2058553          	fmv.x.d	a0,fa1
    80009a0a:	00028067          	jr	t0
    80009a0e:	e2060553          	fmv.x.d	a0,fa2
    80009a12:	00028067          	jr	t0
    80009a16:	e2068553          	fmv.x.d	a0,fa3
    80009a1a:	00028067          	jr	t0
    80009a1e:	e2070553          	fmv.x.d	a0,fa4
    80009a22:	00028067          	jr	t0
    80009a26:	e2078553          	fmv.x.d	a0,fa5
    80009a2a:	00028067          	jr	t0
    80009a2e:	e2080553          	fmv.x.d	a0,fa6
    80009a32:	00028067          	jr	t0
    80009a36:	e2088553          	fmv.x.d	a0,fa7
    80009a3a:	00028067          	jr	t0
    80009a3e:	e2090553          	fmv.x.d	a0,fs2
    80009a42:	00028067          	jr	t0
    80009a46:	e2098553          	fmv.x.d	a0,fs3
    80009a4a:	00028067          	jr	t0
    80009a4e:	e20a0553          	fmv.x.d	a0,fs4
    80009a52:	00028067          	jr	t0
    80009a56:	e20a8553          	fmv.x.d	a0,fs5
    80009a5a:	00028067          	jr	t0
    80009a5e:	e20b0553          	fmv.x.d	a0,fs6
    80009a62:	00028067          	jr	t0
    80009a66:	e20b8553          	fmv.x.d	a0,fs7
    80009a6a:	00028067          	jr	t0
    80009a6e:	e20c0553          	fmv.x.d	a0,fs8
    80009a72:	00028067          	jr	t0
    80009a76:	e20c8553          	fmv.x.d	a0,fs9
    80009a7a:	00028067          	jr	t0
    80009a7e:	e20d0553          	fmv.x.d	a0,fs10
    80009a82:	00028067          	jr	t0
    80009a86:	e20d8553          	fmv.x.d	a0,fs11
    80009a8a:	00028067          	jr	t0
    80009a8e:	e20e0553          	fmv.x.d	a0,ft8
    80009a92:	00028067          	jr	t0
    80009a96:	e20e8553          	fmv.x.d	a0,ft9
    80009a9a:	00028067          	jr	t0
    80009a9e:	e20f0553          	fmv.x.d	a0,ft10
    80009aa2:	00028067          	jr	t0
    80009aa6:	e20f8553          	fmv.x.d	a0,ft11
    80009aaa:	00028067          	jr	t0

0000000080009aae <put_f64_reg>:
    80009aae:	f2050053          	fmv.d.x	ft0,a0
    80009ab2:	00028067          	jr	t0
    80009ab6:	f20500d3          	fmv.d.x	ft1,a0
    80009aba:	00028067          	jr	t0
    80009abe:	f2050153          	fmv.d.x	ft2,a0
    80009ac2:	00028067          	jr	t0
    80009ac6:	f20501d3          	fmv.d.x	ft3,a0
    80009aca:	00028067          	jr	t0
    80009ace:	f2050253          	fmv.d.x	ft4,a0
    80009ad2:	00028067          	jr	t0
    80009ad6:	f20502d3          	fmv.d.x	ft5,a0
    80009ada:	00028067          	jr	t0
    80009ade:	f2050353          	fmv.d.x	ft6,a0
    80009ae2:	00028067          	jr	t0
    80009ae6:	f20503d3          	fmv.d.x	ft7,a0
    80009aea:	00028067          	jr	t0
    80009aee:	f2050453          	fmv.d.x	fs0,a0
    80009af2:	00028067          	jr	t0
    80009af6:	f20504d3          	fmv.d.x	fs1,a0
    80009afa:	00028067          	jr	t0
    80009afe:	f2050553          	fmv.d.x	fa0,a0
    80009b02:	00028067          	jr	t0
    80009b06:	f20505d3          	fmv.d.x	fa1,a0
    80009b0a:	00028067          	jr	t0
    80009b0e:	f2050653          	fmv.d.x	fa2,a0
    80009b12:	00028067          	jr	t0
    80009b16:	f20506d3          	fmv.d.x	fa3,a0
    80009b1a:	00028067          	jr	t0
    80009b1e:	f2050753          	fmv.d.x	fa4,a0
    80009b22:	00028067          	jr	t0
    80009b26:	f20507d3          	fmv.d.x	fa5,a0
    80009b2a:	00028067          	jr	t0
    80009b2e:	f2050853          	fmv.d.x	fa6,a0
    80009b32:	00028067          	jr	t0
    80009b36:	f20508d3          	fmv.d.x	fa7,a0
    80009b3a:	00028067          	jr	t0
    80009b3e:	f2050953          	fmv.d.x	fs2,a0
    80009b42:	00028067          	jr	t0
    80009b46:	f20509d3          	fmv.d.x	fs3,a0
    80009b4a:	00028067          	jr	t0
    80009b4e:	f2050a53          	fmv.d.x	fs4,a0
    80009b52:	00028067          	jr	t0
    80009b56:	f2050ad3          	fmv.d.x	fs5,a0
    80009b5a:	00028067          	jr	t0
    80009b5e:	f2050b53          	fmv.d.x	fs6,a0
    80009b62:	00028067          	jr	t0
    80009b66:	f2050bd3          	fmv.d.x	fs7,a0
    80009b6a:	00028067          	jr	t0
    80009b6e:	f2050c53          	fmv.d.x	fs8,a0
    80009b72:	00028067          	jr	t0
    80009b76:	f2050cd3          	fmv.d.x	fs9,a0
    80009b7a:	00028067          	jr	t0
    80009b7e:	f2050d53          	fmv.d.x	fs10,a0
    80009b82:	00028067          	jr	t0
    80009b86:	f2050dd3          	fmv.d.x	fs11,a0
    80009b8a:	00028067          	jr	t0
    80009b8e:	f2050e53          	fmv.d.x	ft8,a0
    80009b92:	00028067          	jr	t0
    80009b96:	f2050ed3          	fmv.d.x	ft9,a0
    80009b9a:	00028067          	jr	t0
    80009b9e:	f2050f53          	fmv.d.x	ft10,a0
    80009ba2:	00028067          	jr	t0
    80009ba6:	f2050fd3          	fmv.d.x	ft11,a0
    80009baa:	00028067          	jr	t0

0000000080009bae <sbi_emulate_csr_read>:
    80009bae:	1101                	addi	sp,sp,-32
    80009bb0:	e822                	sd	s0,16(sp)
    80009bb2:	e04a                	sd	s2,0(sp)
    80009bb4:	ec06                	sd	ra,24(sp)
    80009bb6:	e426                	sd	s1,8(sp)
    80009bb8:	1000                	addi	s0,sp,32
    80009bba:	10964e83          	lbu	t4,265(a2)
    80009bbe:	10864783          	lbu	a5,264(a2)
    80009bc2:	10a64e03          	lbu	t3,266(a2)
    80009bc6:	10b64303          	lbu	t1,267(a2)
    80009bca:	10c64883          	lbu	a7,268(a2)
    80009bce:	0ea2                	slli	t4,t4,0x8
    80009bd0:	10d64803          	lbu	a6,269(a2)
    80009bd4:	00feeeb3          	or	t4,t4,a5
    80009bd8:	0e42                	slli	t3,t3,0x10
    80009bda:	10e64783          	lbu	a5,270(a2)
    80009bde:	01de6e33          	or	t3,t3,t4
    80009be2:	0362                	slli	t1,t1,0x18
    80009be4:	10f64483          	lbu	s1,271(a2)
    80009be8:	01c36333          	or	t1,t1,t3
    80009bec:	02089613          	slli	a2,a7,0x20
    80009bf0:	006668b3          	or	a7,a2,t1
    80009bf4:	02881613          	slli	a2,a6,0x28
    80009bf8:	01166633          	or	a2,a2,a7
    80009bfc:	17c2                	slli	a5,a5,0x30
    80009bfe:	8fd1                	or	a5,a5,a2
    80009c00:	14e2                	slli	s1,s1,0x38
    80009c02:	8cdd                	or	s1,s1,a5
    80009c04:	00b4d813          	srli	a6,s1,0xb
    80009c08:	00387813          	andi	a6,a6,3
    80009c0c:	909d                	srli	s1,s1,0x27
    80009c0e:	87aa                	mv	a5,a0
    80009c10:	893a                	mv	s2,a4
    80009c12:	8536                	mv	a0,a3
    80009c14:	8885                	andi	s1,s1,1
    80009c16:	04081563          	bnez	a6,80009c60 <sbi_emulate_csr_read+0xb2>
    80009c1a:	10602873          	csrr	a6,scounteren
    80009c1e:	6605                	lui	a2,0x1
    80009c20:	b0460693          	addi	a3,a2,-1276 # b04 <_fw_start-0x7ffff4fc>
    80009c24:	16d78363          	beq	a5,a3,80009d8a <sbi_emulate_csr_read+0x1dc>
    80009c28:	0ef6c963          	blt	a3,a5,80009d1a <sbi_emulate_csr_read+0x16c>
    80009c2c:	60500693          	li	a3,1541
    80009c30:	04d78963          	beq	a5,a3,80009c82 <sbi_emulate_csr_read+0xd4>
    80009c34:	06f6db63          	bge	a3,a5,80009caa <sbi_emulate_csr_read+0xfc>
    80009c38:	b0360613          	addi	a2,a2,-1277
    80009c3c:	04c79363          	bne	a5,a2,80009c82 <sbi_emulate_csr_read+0xd4>
    80009c40:	00887813          	andi	a6,a6,8
    80009c44:	0e080763          	beqz	a6,80009d32 <sbi_emulate_csr_read+0x184>
    80009c48:	b03027f3          	csrr	a5,mhpmcounter3
    80009c4c:	4481                	li	s1,0
    80009c4e:	00f93023          	sd	a5,0(s2)
    80009c52:	60e2                	ld	ra,24(sp)
    80009c54:	6442                	ld	s0,16(sp)
    80009c56:	6902                	ld	s2,0(sp)
    80009c58:	8526                	mv	a0,s1
    80009c5a:	64a2                	ld	s1,8(sp)
    80009c5c:	6105                	addi	sp,sp,32
    80009c5e:	8082                	ret
    80009c60:	6605                	lui	a2,0x1
    80009c62:	b0460693          	addi	a3,a2,-1276 # b04 <_fw_start-0x7ffff4fc>
    80009c66:	12d78663          	beq	a5,a3,80009d92 <sbi_emulate_csr_read+0x1e4>
    80009c6a:	06f6c463          	blt	a3,a5,80009cd2 <sbi_emulate_csr_read+0x124>
    80009c6e:	60500693          	li	a3,1541
    80009c72:	0ed78d63          	beq	a5,a3,80009d6c <sbi_emulate_csr_read+0x1be>
    80009c76:	02f6da63          	bge	a3,a5,80009caa <sbi_emulate_csr_read+0xfc>
    80009c7a:	b0360613          	addi	a2,a2,-1277
    80009c7e:	fcc785e3          	beq	a5,a2,80009c48 <sbi_emulate_csr_read+0x9a>
    80009c82:	86ae                	mv	a3,a1
    80009c84:	873e                	mv	a4,a5
    80009c86:	00003617          	auipc	a2,0x3
    80009c8a:	4a260613          	addi	a2,a2,1186 # 8000d128 <__func__.1>
    80009c8e:	00003597          	auipc	a1,0x3
    80009c92:	47258593          	addi	a1,a1,1138 # 8000d100 <illegal_insn_table+0x118>
    80009c96:	fdefb0ef          	jal	ra,80005474 <sbi_dprintf>
    80009c9a:	60e2                	ld	ra,24(sp)
    80009c9c:	6442                	ld	s0,16(sp)
    80009c9e:	54f9                	li	s1,-2
    80009ca0:	6902                	ld	s2,0(sp)
    80009ca2:	8526                	mv	a0,s1
    80009ca4:	64a2                	ld	s1,8(sp)
    80009ca6:	6105                	addi	sp,sp,32
    80009ca8:	8082                	ret
    80009caa:	32300693          	li	a3,803
    80009cae:	0ed78e63          	beq	a5,a3,80009daa <sbi_emulate_csr_read+0x1fc>
    80009cb2:	32400693          	li	a3,804
    80009cb6:	fcd796e3          	bne	a5,a3,80009c82 <sbi_emulate_csr_read+0xd4>
    80009cba:	324027f3          	csrr	a5,mhpmevent4
    80009cbe:	00f93023          	sd	a5,0(s2)
    80009cc2:	60e2                	ld	ra,24(sp)
    80009cc4:	6442                	ld	s0,16(sp)
    80009cc6:	4481                	li	s1,0
    80009cc8:	6902                	ld	s2,0(sp)
    80009cca:	8526                	mv	a0,s1
    80009ccc:	64a2                	ld	s1,8(sp)
    80009cce:	6105                	addi	sp,sp,32
    80009cd0:	8082                	ret
    80009cd2:	c0160693          	addi	a3,a2,-1023
    80009cd6:	06d78e63          	beq	a5,a3,80009d52 <sbi_emulate_csr_read+0x1a4>
    80009cda:	c0260693          	addi	a3,a2,-1022
    80009cde:	00d79e63          	bne	a5,a3,80009cfa <sbi_emulate_csr_read+0x14c>
    80009ce2:	b02027f3          	csrr	a5,minstret
    80009ce6:	00f93023          	sd	a5,0(s2)
    80009cea:	60e2                	ld	ra,24(sp)
    80009cec:	6442                	ld	s0,16(sp)
    80009cee:	4481                	li	s1,0
    80009cf0:	6902                	ld	s2,0(sp)
    80009cf2:	8526                	mv	a0,s1
    80009cf4:	64a2                	ld	s1,8(sp)
    80009cf6:	6105                	addi	sp,sp,32
    80009cf8:	8082                	ret
    80009cfa:	c0060613          	addi	a2,a2,-1024
    80009cfe:	f8c792e3          	bne	a5,a2,80009c82 <sbi_emulate_csr_read+0xd4>
    80009d02:	b00027f3          	csrr	a5,mcycle
    80009d06:	00f93023          	sd	a5,0(s2)
    80009d0a:	60e2                	ld	ra,24(sp)
    80009d0c:	6442                	ld	s0,16(sp)
    80009d0e:	4481                	li	s1,0
    80009d10:	6902                	ld	s2,0(sp)
    80009d12:	8526                	mv	a0,s1
    80009d14:	64a2                	ld	s1,8(sp)
    80009d16:	6105                	addi	sp,sp,32
    80009d18:	8082                	ret
    80009d1a:	c0160693          	addi	a3,a2,-1023
    80009d1e:	02d78663          	beq	a5,a3,80009d4a <sbi_emulate_csr_read+0x19c>
    80009d22:	c0260693          	addi	a3,a2,-1022
    80009d26:	00d79863          	bne	a5,a3,80009d36 <sbi_emulate_csr_read+0x188>
    80009d2a:	00487813          	andi	a6,a6,4
    80009d2e:	fa081ae3          	bnez	a6,80009ce2 <sbi_emulate_csr_read+0x134>
    80009d32:	54fd                	li	s1,-1
    80009d34:	bf39                	j	80009c52 <sbi_emulate_csr_read+0xa4>
    80009d36:	c0060613          	addi	a2,a2,-1024
    80009d3a:	f4c794e3          	bne	a5,a2,80009c82 <sbi_emulate_csr_read+0xd4>
    80009d3e:	00187813          	andi	a6,a6,1
    80009d42:	fc0810e3          	bnez	a6,80009d02 <sbi_emulate_csr_read+0x154>
    80009d46:	54fd                	li	s1,-1
    80009d48:	b729                	j	80009c52 <sbi_emulate_csr_read+0xa4>
    80009d4a:	00287813          	andi	a6,a6,2
    80009d4e:	fe0802e3          	beqz	a6,80009d32 <sbi_emulate_csr_read+0x184>
    80009d52:	c8a5                	beqz	s1,80009dc2 <sbi_emulate_csr_read+0x214>
    80009d54:	9a8f80ef          	jal	ra,80001efc <sbi_timer_virt_value>
    80009d58:	00a93023          	sd	a0,0(s2)
    80009d5c:	60e2                	ld	ra,24(sp)
    80009d5e:	6442                	ld	s0,16(sp)
    80009d60:	4481                	li	s1,0
    80009d62:	6902                	ld	s2,0(sp)
    80009d64:	8526                	mv	a0,s1
    80009d66:	64a2                	ld	s1,8(sp)
    80009d68:	6105                	addi	sp,sp,32
    80009d6a:	8082                	ret
    80009d6c:	4685                	li	a3,1
    80009d6e:	f0d81ae3          	bne	a6,a3,80009c82 <sbi_emulate_csr_read+0xd4>
    80009d72:	f881                	bnez	s1,80009c82 <sbi_emulate_csr_read+0xd4>
    80009d74:	a94f80ef          	jal	ra,80002008 <sbi_timer_get_delta>
    80009d78:	00a93023          	sd	a0,0(s2)
    80009d7c:	60e2                	ld	ra,24(sp)
    80009d7e:	6442                	ld	s0,16(sp)
    80009d80:	6902                	ld	s2,0(sp)
    80009d82:	8526                	mv	a0,s1
    80009d84:	64a2                	ld	s1,8(sp)
    80009d86:	6105                	addi	sp,sp,32
    80009d88:	8082                	ret
    80009d8a:	01087813          	andi	a6,a6,16
    80009d8e:	fa0802e3          	beqz	a6,80009d32 <sbi_emulate_csr_read+0x184>
    80009d92:	b04027f3          	csrr	a5,mhpmcounter4
    80009d96:	00f93023          	sd	a5,0(s2)
    80009d9a:	60e2                	ld	ra,24(sp)
    80009d9c:	6442                	ld	s0,16(sp)
    80009d9e:	4481                	li	s1,0
    80009da0:	6902                	ld	s2,0(sp)
    80009da2:	8526                	mv	a0,s1
    80009da4:	64a2                	ld	s1,8(sp)
    80009da6:	6105                	addi	sp,sp,32
    80009da8:	8082                	ret
    80009daa:	323027f3          	csrr	a5,mhpmevent3
    80009dae:	00f93023          	sd	a5,0(s2)
    80009db2:	60e2                	ld	ra,24(sp)
    80009db4:	6442                	ld	s0,16(sp)
    80009db6:	4481                	li	s1,0
    80009db8:	6902                	ld	s2,0(sp)
    80009dba:	8526                	mv	a0,s1
    80009dbc:	64a2                	ld	s1,8(sp)
    80009dbe:	6105                	addi	sp,sp,32
    80009dc0:	8082                	ret
    80009dc2:	852f80ef          	jal	ra,80001e14 <sbi_timer_value>
    80009dc6:	bf49                	j	80009d58 <sbi_emulate_csr_read+0x1aa>

0000000080009dc8 <sbi_emulate_csr_write>:
    80009dc8:	1101                	addi	sp,sp,-32
    80009dca:	e822                	sd	s0,16(sp)
    80009dcc:	ec06                	sd	ra,24(sp)
    80009dce:	e426                	sd	s1,8(sp)
    80009dd0:	1000                	addi	s0,sp,32
    80009dd2:	6805                	lui	a6,0x1
    80009dd4:	b0380893          	addi	a7,a6,-1277 # b03 <_fw_start-0x7ffff4fd>
    80009dd8:	87aa                	mv	a5,a0
    80009dda:	11150b63          	beq	a0,a7,80009ef0 <sbi_emulate_csr_write+0x128>
    80009dde:	8536                	mv	a0,a3
    80009de0:	08f8c163          	blt	a7,a5,80009e62 <sbi_emulate_csr_write+0x9a>
    80009de4:	32400813          	li	a6,804
    80009de8:	11078d63          	beq	a5,a6,80009f02 <sbi_emulate_csr_write+0x13a>
    80009dec:	60500813          	li	a6,1541
    80009df0:	0b079763          	bne	a5,a6,80009e9e <sbi_emulate_csr_write+0xd6>
    80009df4:	10964e83          	lbu	t4,265(a2)
    80009df8:	10864683          	lbu	a3,264(a2)
    80009dfc:	10a64e03          	lbu	t3,266(a2)
    80009e00:	10b64303          	lbu	t1,267(a2)
    80009e04:	10c64883          	lbu	a7,268(a2)
    80009e08:	0ea2                	slli	t4,t4,0x8
    80009e0a:	10d64803          	lbu	a6,269(a2)
    80009e0e:	00deeeb3          	or	t4,t4,a3
    80009e12:	0e42                	slli	t3,t3,0x10
    80009e14:	10e64683          	lbu	a3,270(a2)
    80009e18:	01de6e33          	or	t3,t3,t4
    80009e1c:	0362                	slli	t1,t1,0x18
    80009e1e:	10f64483          	lbu	s1,271(a2)
    80009e22:	01c36333          	or	t1,t1,t3
    80009e26:	02089613          	slli	a2,a7,0x20
    80009e2a:	006668b3          	or	a7,a2,t1
    80009e2e:	02881613          	slli	a2,a6,0x28
    80009e32:	01166633          	or	a2,a2,a7
    80009e36:	16c2                	slli	a3,a3,0x30
    80009e38:	8ed1                	or	a3,a3,a2
    80009e3a:	14e2                	slli	s1,s1,0x38
    80009e3c:	8cd5                	or	s1,s1,a3
    80009e3e:	00b4d693          	srli	a3,s1,0xb
    80009e42:	8a8d                	andi	a3,a3,3
    80009e44:	4605                	li	a2,1
    80009e46:	06c69963          	bne	a3,a2,80009eb8 <sbi_emulate_csr_write+0xf0>
    80009e4a:	909d                	srli	s1,s1,0x27
    80009e4c:	8885                	andi	s1,s1,1
    80009e4e:	e4ad                	bnez	s1,80009eb8 <sbi_emulate_csr_write+0xf0>
    80009e50:	85ba                	mv	a1,a4
    80009e52:	9cef80ef          	jal	ra,80002020 <sbi_timer_set_delta>
    80009e56:	60e2                	ld	ra,24(sp)
    80009e58:	6442                	ld	s0,16(sp)
    80009e5a:	8526                	mv	a0,s1
    80009e5c:	64a2                	ld	s1,8(sp)
    80009e5e:	6105                	addi	sp,sp,32
    80009e60:	8082                	ret
    80009e62:	c0080613          	addi	a2,a6,-1024
    80009e66:	06c78c63          	beq	a5,a2,80009ede <sbi_emulate_csr_write+0x116>
    80009e6a:	c0280613          	addi	a2,a6,-1022
    80009e6e:	00c79b63          	bne	a5,a2,80009e84 <sbi_emulate_csr_write+0xbc>
    80009e72:	b0271073          	csrw	minstret,a4
    80009e76:	60e2                	ld	ra,24(sp)
    80009e78:	6442                	ld	s0,16(sp)
    80009e7a:	4481                	li	s1,0
    80009e7c:	8526                	mv	a0,s1
    80009e7e:	64a2                	ld	s1,8(sp)
    80009e80:	6105                	addi	sp,sp,32
    80009e82:	8082                	ret
    80009e84:	b0480813          	addi	a6,a6,-1276
    80009e88:	03079863          	bne	a5,a6,80009eb8 <sbi_emulate_csr_write+0xf0>
    80009e8c:	b0471073          	csrw	mhpmcounter4,a4
    80009e90:	60e2                	ld	ra,24(sp)
    80009e92:	6442                	ld	s0,16(sp)
    80009e94:	4481                	li	s1,0
    80009e96:	8526                	mv	a0,s1
    80009e98:	64a2                	ld	s1,8(sp)
    80009e9a:	6105                	addi	sp,sp,32
    80009e9c:	8082                	ret
    80009e9e:	32300613          	li	a2,803
    80009ea2:	00c79b63          	bne	a5,a2,80009eb8 <sbi_emulate_csr_write+0xf0>
    80009ea6:	32371073          	csrw	mhpmevent3,a4
    80009eaa:	60e2                	ld	ra,24(sp)
    80009eac:	6442                	ld	s0,16(sp)
    80009eae:	4481                	li	s1,0
    80009eb0:	8526                	mv	a0,s1
    80009eb2:	64a2                	ld	s1,8(sp)
    80009eb4:	6105                	addi	sp,sp,32
    80009eb6:	8082                	ret
    80009eb8:	86ae                	mv	a3,a1
    80009eba:	873e                	mv	a4,a5
    80009ebc:	00003617          	auipc	a2,0x3
    80009ec0:	28460613          	addi	a2,a2,644 # 8000d140 <__func__.0>
    80009ec4:	00003597          	auipc	a1,0x3
    80009ec8:	23c58593          	addi	a1,a1,572 # 8000d100 <illegal_insn_table+0x118>
    80009ecc:	da8fb0ef          	jal	ra,80005474 <sbi_dprintf>
    80009ed0:	60e2                	ld	ra,24(sp)
    80009ed2:	6442                	ld	s0,16(sp)
    80009ed4:	54f9                	li	s1,-2
    80009ed6:	8526                	mv	a0,s1
    80009ed8:	64a2                	ld	s1,8(sp)
    80009eda:	6105                	addi	sp,sp,32
    80009edc:	8082                	ret
    80009ede:	b0071073          	csrw	mcycle,a4
    80009ee2:	60e2                	ld	ra,24(sp)
    80009ee4:	6442                	ld	s0,16(sp)
    80009ee6:	4481                	li	s1,0
    80009ee8:	8526                	mv	a0,s1
    80009eea:	64a2                	ld	s1,8(sp)
    80009eec:	6105                	addi	sp,sp,32
    80009eee:	8082                	ret
    80009ef0:	b0371073          	csrw	mhpmcounter3,a4
    80009ef4:	60e2                	ld	ra,24(sp)
    80009ef6:	6442                	ld	s0,16(sp)
    80009ef8:	4481                	li	s1,0
    80009efa:	8526                	mv	a0,s1
    80009efc:	64a2                	ld	s1,8(sp)
    80009efe:	6105                	addi	sp,sp,32
    80009f00:	8082                	ret
    80009f02:	32471073          	csrw	mhpmevent4,a4
    80009f06:	60e2                	ld	ra,24(sp)
    80009f08:	6442                	ld	s0,16(sp)
    80009f0a:	4481                	li	s1,0
    80009f0c:	8526                	mv	a0,s1
    80009f0e:	64a2                	ld	s1,8(sp)
    80009f10:	6105                	addi	sp,sp,32
    80009f12:	8082                	ret

0000000080009f14 <fdt_mem_rsv>:
    80009f14:	1141                	addi	sp,sp,-16
    80009f16:	e422                	sd	s0,8(sp)
    80009f18:	0800                	addi	s0,sp,16
    80009f1a:	01054703          	lbu	a4,16(a0)
    80009f1e:	01154783          	lbu	a5,17(a0)
    80009f22:	01254683          	lbu	a3,18(a0)
    80009f26:	01354603          	lbu	a2,19(a0)
    80009f2a:	0107979b          	slliw	a5,a5,0x10
    80009f2e:	0187171b          	slliw	a4,a4,0x18
    80009f32:	8f5d                	or	a4,a4,a5
    80009f34:	8f51                	or	a4,a4,a2
    80009f36:	0086979b          	slliw	a5,a3,0x8
    80009f3a:	8fd9                	or	a5,a5,a4
    80009f3c:	0045971b          	slliw	a4,a1,0x4
    80009f40:	0007869b          	sext.w	a3,a5
    80009f44:	9f3d                	addw	a4,a4,a5
    80009f46:	04d76263          	bltu	a4,a3,80009f8a <fdt_mem_rsv+0x76>
    80009f4a:	00454783          	lbu	a5,4(a0)
    80009f4e:	00554803          	lbu	a6,5(a0)
    80009f52:	00754883          	lbu	a7,7(a0)
    80009f56:	00654603          	lbu	a2,6(a0)
    80009f5a:	0187979b          	slliw	a5,a5,0x18
    80009f5e:	0108181b          	slliw	a6,a6,0x10
    80009f62:	0107e7b3          	or	a5,a5,a6
    80009f66:	0117e7b3          	or	a5,a5,a7
    80009f6a:	0086161b          	slliw	a2,a2,0x8
    80009f6e:	8fd1                	or	a5,a5,a2
    80009f70:	1782                	slli	a5,a5,0x20
    80009f72:	9381                	srli	a5,a5,0x20
    80009f74:	17c1                	addi	a5,a5,-16
    80009f76:	00e7ea63          	bltu	a5,a4,80009f8a <fdt_mem_rsv+0x76>
    80009f7a:	6422                	ld	s0,8(sp)
    80009f7c:	1682                	slli	a3,a3,0x20
    80009f7e:	0592                	slli	a1,a1,0x4
    80009f80:	9281                	srli	a3,a3,0x20
    80009f82:	95b6                	add	a1,a1,a3
    80009f84:	952e                	add	a0,a0,a1
    80009f86:	0141                	addi	sp,sp,16
    80009f88:	8082                	ret
    80009f8a:	6422                	ld	s0,8(sp)
    80009f8c:	4501                	li	a0,0
    80009f8e:	0141                	addi	sp,sp,16
    80009f90:	8082                	ret

0000000080009f92 <fdt_get_property_by_offset_>:
    80009f92:	7179                	addi	sp,sp,-48
    80009f94:	f022                	sd	s0,32(sp)
    80009f96:	ec26                	sd	s1,24(sp)
    80009f98:	e84a                	sd	s2,16(sp)
    80009f9a:	e44e                	sd	s3,8(sp)
    80009f9c:	f406                	sd	ra,40(sp)
    80009f9e:	1800                	addi	s0,sp,48
    80009fa0:	84aa                	mv	s1,a0
    80009fa2:	89ae                	mv	s3,a1
    80009fa4:	8932                	mv	s2,a2
    80009fa6:	22f010ef          	jal	ra,8000b9d4 <fdt_check_prop_offset_>
    80009faa:	06054563          	bltz	a0,8000a014 <fdt_get_property_by_offset_+0x82>
    80009fae:	0084c783          	lbu	a5,8(s1)
    80009fb2:	0094c703          	lbu	a4,9(s1)
    80009fb6:	00b4c683          	lbu	a3,11(s1)
    80009fba:	00a4c583          	lbu	a1,10(s1)
    80009fbe:	0187979b          	slliw	a5,a5,0x18
    80009fc2:	0107171b          	slliw	a4,a4,0x10
    80009fc6:	8fd9                	or	a5,a5,a4
    80009fc8:	0085959b          	slliw	a1,a1,0x8
    80009fcc:	8fd5                	or	a5,a5,a3
    80009fce:	8fcd                	or	a5,a5,a1
    80009fd0:	1782                	slli	a5,a5,0x20
    80009fd2:	9381                	srli	a5,a5,0x20
    80009fd4:	013785b3          	add	a1,a5,s3
    80009fd8:	00b48533          	add	a0,s1,a1
    80009fdc:	02090563          	beqz	s2,8000a006 <fdt_get_property_by_offset_+0x74>
    80009fe0:	00454783          	lbu	a5,4(a0)
    80009fe4:	00554683          	lbu	a3,5(a0)
    80009fe8:	00754603          	lbu	a2,7(a0)
    80009fec:	00654703          	lbu	a4,6(a0)
    80009ff0:	0187979b          	slliw	a5,a5,0x18
    80009ff4:	0106969b          	slliw	a3,a3,0x10
    80009ff8:	8fd5                	or	a5,a5,a3
    80009ffa:	8fd1                	or	a5,a5,a2
    80009ffc:	0087171b          	slliw	a4,a4,0x8
    8000a000:	8fd9                	or	a5,a5,a4
    8000a002:	00f92023          	sw	a5,0(s2)
    8000a006:	70a2                	ld	ra,40(sp)
    8000a008:	7402                	ld	s0,32(sp)
    8000a00a:	64e2                	ld	s1,24(sp)
    8000a00c:	6942                	ld	s2,16(sp)
    8000a00e:	69a2                	ld	s3,8(sp)
    8000a010:	6145                	addi	sp,sp,48
    8000a012:	8082                	ret
    8000a014:	87aa                	mv	a5,a0
    8000a016:	4501                	li	a0,0
    8000a018:	fe0915e3          	bnez	s2,8000a002 <fdt_get_property_by_offset_+0x70>
    8000a01c:	b7ed                	j	8000a006 <fdt_get_property_by_offset_+0x74>

000000008000a01e <fdt_get_string>:
    8000a01e:	715d                	addi	sp,sp,-80
    8000a020:	e0a2                	sd	s0,64(sp)
    8000a022:	fc26                	sd	s1,56(sp)
    8000a024:	f44e                	sd	s3,40(sp)
    8000a026:	f052                	sd	s4,32(sp)
    8000a028:	e486                	sd	ra,72(sp)
    8000a02a:	f84a                	sd	s2,48(sp)
    8000a02c:	ec56                	sd	s5,24(sp)
    8000a02e:	e85a                	sd	s6,16(sp)
    8000a030:	e45e                	sd	s7,8(sp)
    8000a032:	0880                	addi	s0,sp,80
    8000a034:	00c54b83          	lbu	s7,12(a0)
    8000a038:	00d54903          	lbu	s2,13(a0)
    8000a03c:	00e54a83          	lbu	s5,14(a0)
    8000a040:	00f54b03          	lbu	s6,15(a0)
    8000a044:	84aa                	mv	s1,a0
    8000a046:	8a2e                	mv	s4,a1
    8000a048:	89b2                	mv	s3,a2
    8000a04a:	420010ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000a04e:	14051763          	bnez	a0,8000a19c <fdt_get_string+0x17e>
    8000a052:	0044c783          	lbu	a5,4(s1)
    8000a056:	0054c683          	lbu	a3,5(s1)
    8000a05a:	0074c583          	lbu	a1,7(s1)
    8000a05e:	0064c603          	lbu	a2,6(s1)
    8000a062:	0109171b          	slliw	a4,s2,0x10
    8000a066:	018b9b9b          	slliw	s7,s7,0x18
    8000a06a:	0106969b          	slliw	a3,a3,0x10
    8000a06e:	01776733          	or	a4,a4,s7
    8000a072:	0187979b          	slliw	a5,a5,0x18
    8000a076:	8fd5                	or	a5,a5,a3
    8000a078:	01676733          	or	a4,a4,s6
    8000a07c:	008a9a9b          	slliw	s5,s5,0x8
    8000a080:	01576733          	or	a4,a4,s5
    8000a084:	8fcd                	or	a5,a5,a1
    8000a086:	0086161b          	slliw	a2,a2,0x8
    8000a08a:	0147073b          	addw	a4,a4,s4
    8000a08e:	8fd1                	or	a5,a5,a2
    8000a090:	0007069b          	sext.w	a3,a4
    8000a094:	2781                	sext.w	a5,a5
    8000a096:	000a051b          	sext.w	a0,s4
    8000a09a:	10f6f063          	bgeu	a3,a5,8000a19a <fdt_get_string+0x17c>
    8000a09e:	0004c683          	lbu	a3,0(s1)
    8000a0a2:	0014c583          	lbu	a1,1(s1)
    8000a0a6:	0034c803          	lbu	a6,3(s1)
    8000a0aa:	0024c603          	lbu	a2,2(s1)
    8000a0ae:	0105959b          	slliw	a1,a1,0x10
    8000a0b2:	0186969b          	slliw	a3,a3,0x18
    8000a0b6:	8ecd                	or	a3,a3,a1
    8000a0b8:	0086161b          	slliw	a2,a2,0x8
    8000a0bc:	0106e6b3          	or	a3,a3,a6
    8000a0c0:	8ed1                	or	a3,a3,a2
    8000a0c2:	9f99                	subw	a5,a5,a4
    8000a0c4:	d00e0637          	lui	a2,0xd00e0
    8000a0c8:	0007859b          	sext.w	a1,a5
    8000a0cc:	2681                	sext.w	a3,a3
    8000a0ce:	1782                	slli	a5,a5,0x20
    8000a0d0:	eed60613          	addi	a2,a2,-275 # ffffffffd00dfeed <_enclave_end+0xffffffff4e9dfeed>
    8000a0d4:	9381                	srli	a5,a5,0x20
    8000a0d6:	06c68363          	beq	a3,a2,8000a13c <fdt_get_string+0x11e>
    8000a0da:	2ff20637          	lui	a2,0x2ff20
    8000a0de:	11260613          	addi	a2,a2,274 # 2ff20112 <_fw_start-0x500dfeee>
    8000a0e2:	0cc69e63          	bne	a3,a2,8000a1be <fdt_get_string+0x1a0>
    8000a0e6:	0a0a5a63          	bgez	s4,8000a19a <fdt_get_string+0x17c>
    8000a0ea:	0204c683          	lbu	a3,32(s1)
    8000a0ee:	0214c583          	lbu	a1,33(s1)
    8000a0f2:	0234c803          	lbu	a6,35(s1)
    8000a0f6:	0224c603          	lbu	a2,34(s1)
    8000a0fa:	0186969b          	slliw	a3,a3,0x18
    8000a0fe:	0105959b          	slliw	a1,a1,0x10
    8000a102:	8ecd                	or	a3,a3,a1
    8000a104:	0106e6b3          	or	a3,a3,a6
    8000a108:	0086161b          	slliw	a2,a2,0x8
    8000a10c:	8ed1                	or	a3,a3,a2
    8000a10e:	40d006bb          	negw	a3,a3
    8000a112:	08d56463          	bltu	a0,a3,8000a19a <fdt_get_string+0x17c>
    8000a116:	41400a3b          	negw	s4,s4
    8000a11a:	0afa6d63          	bltu	s4,a5,8000a1d4 <fdt_get_string+0x1b6>
    8000a11e:	1702                	slli	a4,a4,0x20
    8000a120:	9301                	srli	a4,a4,0x20
    8000a122:	94ba                	add	s1,s1,a4
    8000a124:	863e                	mv	a2,a5
    8000a126:	4581                	li	a1,0
    8000a128:	8526                	mv	a0,s1
    8000a12a:	ec9f90ef          	jal	ra,80003ff2 <sbi_memchr>
    8000a12e:	c54d                	beqz	a0,8000a1d8 <fdt_get_string+0x1ba>
    8000a130:	06098b63          	beqz	s3,8000a1a6 <fdt_get_string+0x188>
    8000a134:	8d05                	sub	a0,a0,s1
    8000a136:	00a9a023          	sw	a0,0(s3)
    8000a13a:	a0b5                	j	8000a1a6 <fdt_get_string+0x188>
    8000a13c:	040a4f63          	bltz	s4,8000a19a <fdt_get_string+0x17c>
    8000a140:	0144c683          	lbu	a3,20(s1)
    8000a144:	0154c803          	lbu	a6,21(s1)
    8000a148:	0174c883          	lbu	a7,23(s1)
    8000a14c:	0164c603          	lbu	a2,22(s1)
    8000a150:	0186969b          	slliw	a3,a3,0x18
    8000a154:	0108181b          	slliw	a6,a6,0x10
    8000a158:	0106e6b3          	or	a3,a3,a6
    8000a15c:	0086161b          	slliw	a2,a2,0x8
    8000a160:	0116e6b3          	or	a3,a3,a7
    8000a164:	8ed1                	or	a3,a3,a2
    8000a166:	2681                	sext.w	a3,a3
    8000a168:	4641                	li	a2,16
    8000a16a:	fad67ae3          	bgeu	a2,a3,8000a11e <fdt_get_string+0x100>
    8000a16e:	0204c683          	lbu	a3,32(s1)
    8000a172:	0214c803          	lbu	a6,33(s1)
    8000a176:	0234c883          	lbu	a7,35(s1)
    8000a17a:	0224c603          	lbu	a2,34(s1)
    8000a17e:	0186969b          	slliw	a3,a3,0x18
    8000a182:	0108181b          	slliw	a6,a6,0x10
    8000a186:	0106e6b3          	or	a3,a3,a6
    8000a18a:	0116e6b3          	or	a3,a3,a7
    8000a18e:	0086161b          	slliw	a2,a2,0x8
    8000a192:	8ed1                	or	a3,a3,a2
    8000a194:	2681                	sext.w	a3,a3
    8000a196:	02d56663          	bltu	a0,a3,8000a1c2 <fdt_get_string+0x1a4>
    8000a19a:	5571                	li	a0,-4
    8000a19c:	4481                	li	s1,0
    8000a19e:	00098463          	beqz	s3,8000a1a6 <fdt_get_string+0x188>
    8000a1a2:	00a9a023          	sw	a0,0(s3)
    8000a1a6:	60a6                	ld	ra,72(sp)
    8000a1a8:	6406                	ld	s0,64(sp)
    8000a1aa:	7942                	ld	s2,48(sp)
    8000a1ac:	79a2                	ld	s3,40(sp)
    8000a1ae:	7a02                	ld	s4,32(sp)
    8000a1b0:	6ae2                	ld	s5,24(sp)
    8000a1b2:	6b42                	ld	s6,16(sp)
    8000a1b4:	6ba2                	ld	s7,8(sp)
    8000a1b6:	8526                	mv	a0,s1
    8000a1b8:	74e2                	ld	s1,56(sp)
    8000a1ba:	6161                	addi	sp,sp,80
    8000a1bc:	8082                	ret
    8000a1be:	554d                	li	a0,-13
    8000a1c0:	bff1                	j	8000a19c <fdt_get_string+0x17e>
    8000a1c2:	9e89                	subw	a3,a3,a0
    8000a1c4:	0006861b          	sext.w	a2,a3
    8000a1c8:	f4b67be3          	bgeu	a2,a1,8000a11e <fdt_get_string+0x100>
    8000a1cc:	02069793          	slli	a5,a3,0x20
    8000a1d0:	9381                	srli	a5,a5,0x20
    8000a1d2:	b7b1                	j	8000a11e <fdt_get_string+0x100>
    8000a1d4:	87d2                	mv	a5,s4
    8000a1d6:	b7a1                	j	8000a11e <fdt_get_string+0x100>
    8000a1d8:	5561                	li	a0,-8
    8000a1da:	b7c9                	j	8000a19c <fdt_get_string+0x17e>

000000008000a1dc <fdt_get_property_namelen_>:
    8000a1dc:	7159                	addi	sp,sp,-112
    8000a1de:	f0a2                	sd	s0,96(sp)
    8000a1e0:	eca6                	sd	s1,88(sp)
    8000a1e2:	e8ca                	sd	s2,80(sp)
    8000a1e4:	e4ce                	sd	s3,72(sp)
    8000a1e6:	f85a                	sd	s6,48(sp)
    8000a1e8:	f45e                	sd	s7,40(sp)
    8000a1ea:	ec66                	sd	s9,24(sp)
    8000a1ec:	f486                	sd	ra,104(sp)
    8000a1ee:	e0d2                	sd	s4,64(sp)
    8000a1f0:	fc56                	sd	s5,56(sp)
    8000a1f2:	f062                	sd	s8,32(sp)
    8000a1f4:	e86a                	sd	s10,16(sp)
    8000a1f6:	1880                	addi	s0,sp,112
    8000a1f8:	84aa                	mv	s1,a0
    8000a1fa:	8b32                	mv	s6,a2
    8000a1fc:	89b6                	mv	s3,a3
    8000a1fe:	893a                	mv	s2,a4
    8000a200:	8bbe                	mv	s7,a5
    8000a202:	79c010ef          	jal	ra,8000b99e <fdt_check_node_offset_>
    8000a206:	8caa                	mv	s9,a0
    8000a208:	02054563          	bltz	a0,8000a232 <fdt_get_property_namelen_+0x56>
    8000a20c:	4a8d                	li	s5,3
    8000a20e:	4a25                	li	s4,9
    8000a210:	4c11                	li	s8,4
    8000a212:	85e6                	mv	a1,s9
    8000a214:	f9c40613          	addi	a2,s0,-100
    8000a218:	8526                	mv	a0,s1
    8000a21a:	642010ef          	jal	ra,8000b85c <fdt_next_tag>
    8000a21e:	2501                	sext.w	a0,a0
    8000a220:	01550963          	beq	a0,s5,8000a232 <fdt_get_property_namelen_+0x56>
    8000a224:	f9c42c83          	lw	s9,-100(s0)
    8000a228:	0d450563          	beq	a0,s4,8000a2f2 <fdt_get_property_namelen_+0x116>
    8000a22c:	ff8503e3          	beq	a0,s8,8000a212 <fdt_get_property_namelen_+0x36>
    8000a230:	5cfd                	li	s9,-1
    8000a232:	4a8d                	li	s5,3
    8000a234:	4a25                	li	s4,9
    8000a236:	4c11                	li	s8,4
    8000a238:	060ccb63          	bltz	s9,8000a2ae <fdt_get_property_namelen_+0xd2>
    8000a23c:	864a                	mv	a2,s2
    8000a23e:	85e6                	mv	a1,s9
    8000a240:	8526                	mv	a0,s1
    8000a242:	d51ff0ef          	jal	ra,80009f92 <fdt_get_property_by_offset_>
    8000a246:	8d2a                	mv	s10,a0
    8000a248:	c94d                	beqz	a0,8000a2fa <fdt_get_property_namelen_+0x11e>
    8000a24a:	00854583          	lbu	a1,8(a0)
    8000a24e:	00954703          	lbu	a4,9(a0)
    8000a252:	00b54683          	lbu	a3,11(a0)
    8000a256:	00a54783          	lbu	a5,10(a0)
    8000a25a:	0185959b          	slliw	a1,a1,0x18
    8000a25e:	0107171b          	slliw	a4,a4,0x10
    8000a262:	8dd9                	or	a1,a1,a4
    8000a264:	8dd5                	or	a1,a1,a3
    8000a266:	0087979b          	slliw	a5,a5,0x8
    8000a26a:	8ddd                	or	a1,a1,a5
    8000a26c:	f9c40613          	addi	a2,s0,-100
    8000a270:	2581                	sext.w	a1,a1
    8000a272:	8526                	mv	a0,s1
    8000a274:	dabff0ef          	jal	ra,8000a01e <fdt_get_string>
    8000a278:	c509                	beqz	a0,8000a282 <fdt_get_property_namelen_+0xa6>
    8000a27a:	f9c42783          	lw	a5,-100(s0)
    8000a27e:	07378063          	beq	a5,s3,8000a2de <fdt_get_property_namelen_+0x102>
    8000a282:	85e6                	mv	a1,s9
    8000a284:	8526                	mv	a0,s1
    8000a286:	74e010ef          	jal	ra,8000b9d4 <fdt_check_prop_offset_>
    8000a28a:	8caa                	mv	s9,a0
    8000a28c:	02054163          	bltz	a0,8000a2ae <fdt_get_property_namelen_+0xd2>
    8000a290:	85e6                	mv	a1,s9
    8000a292:	f9c40613          	addi	a2,s0,-100
    8000a296:	8526                	mv	a0,s1
    8000a298:	5c4010ef          	jal	ra,8000b85c <fdt_next_tag>
    8000a29c:	2501                	sext.w	a0,a0
    8000a29e:	f9550de3          	beq	a0,s5,8000a238 <fdt_get_property_namelen_+0x5c>
    8000a2a2:	f9c42c83          	lw	s9,-100(s0)
    8000a2a6:	03451863          	bne	a0,s4,8000a2d6 <fdt_get_property_namelen_+0xfa>
    8000a2aa:	040cda63          	bgez	s9,8000a2fe <fdt_get_property_namelen_+0x122>
    8000a2ae:	4d01                	li	s10,0
    8000a2b0:	00090463          	beqz	s2,8000a2b8 <fdt_get_property_namelen_+0xdc>
    8000a2b4:	01992023          	sw	s9,0(s2)
    8000a2b8:	70a6                	ld	ra,104(sp)
    8000a2ba:	7406                	ld	s0,96(sp)
    8000a2bc:	64e6                	ld	s1,88(sp)
    8000a2be:	6946                	ld	s2,80(sp)
    8000a2c0:	69a6                	ld	s3,72(sp)
    8000a2c2:	6a06                	ld	s4,64(sp)
    8000a2c4:	7ae2                	ld	s5,56(sp)
    8000a2c6:	7b42                	ld	s6,48(sp)
    8000a2c8:	7ba2                	ld	s7,40(sp)
    8000a2ca:	7c02                	ld	s8,32(sp)
    8000a2cc:	6ce2                	ld	s9,24(sp)
    8000a2ce:	856a                	mv	a0,s10
    8000a2d0:	6d42                	ld	s10,16(sp)
    8000a2d2:	6165                	addi	sp,sp,112
    8000a2d4:	8082                	ret
    8000a2d6:	fb850de3          	beq	a0,s8,8000a290 <fdt_get_property_namelen_+0xb4>
    8000a2da:	5cfd                	li	s9,-1
    8000a2dc:	bfc9                	j	8000a2ae <fdt_get_property_namelen_+0xd2>
    8000a2de:	864e                	mv	a2,s3
    8000a2e0:	85da                	mv	a1,s6
    8000a2e2:	cdff90ef          	jal	ra,80003fc0 <sbi_memcmp>
    8000a2e6:	fd51                	bnez	a0,8000a282 <fdt_get_property_namelen_+0xa6>
    8000a2e8:	fc0b88e3          	beqz	s7,8000a2b8 <fdt_get_property_namelen_+0xdc>
    8000a2ec:	019ba023          	sw	s9,0(s7)
    8000a2f0:	b7e1                	j	8000a2b8 <fdt_get_property_namelen_+0xdc>
    8000a2f2:	f40cc0e3          	bltz	s9,8000a232 <fdt_get_property_namelen_+0x56>
    8000a2f6:	5cd5                	li	s9,-11
    8000a2f8:	bf2d                	j	8000a232 <fdt_get_property_namelen_+0x56>
    8000a2fa:	5ccd                	li	s9,-13
    8000a2fc:	bf4d                	j	8000a2ae <fdt_get_property_namelen_+0xd2>
    8000a2fe:	5cd5                	li	s9,-11
    8000a300:	b77d                	j	8000a2ae <fdt_get_property_namelen_+0xd2>

000000008000a302 <fdt_string>:
    8000a302:	1141                	addi	sp,sp,-16
    8000a304:	e022                	sd	s0,0(sp)
    8000a306:	e406                	sd	ra,8(sp)
    8000a308:	0800                	addi	s0,sp,16
    8000a30a:	4601                	li	a2,0
    8000a30c:	d13ff0ef          	jal	ra,8000a01e <fdt_get_string>
    8000a310:	60a2                	ld	ra,8(sp)
    8000a312:	6402                	ld	s0,0(sp)
    8000a314:	0141                	addi	sp,sp,16
    8000a316:	8082                	ret

000000008000a318 <fdt_get_mem_rsv>:
    8000a318:	7139                	addi	sp,sp,-64
    8000a31a:	f822                	sd	s0,48(sp)
    8000a31c:	f426                	sd	s1,40(sp)
    8000a31e:	f04a                	sd	s2,32(sp)
    8000a320:	ec4e                	sd	s3,24(sp)
    8000a322:	e852                	sd	s4,16(sp)
    8000a324:	e456                	sd	s5,8(sp)
    8000a326:	fc06                	sd	ra,56(sp)
    8000a328:	0080                	addi	s0,sp,64
    8000a32a:	8a2a                	mv	s4,a0
    8000a32c:	8aae                	mv	s5,a1
    8000a32e:	8932                	mv	s2,a2
    8000a330:	84b6                	mv	s1,a3
    8000a332:	138010ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000a336:	89aa                	mv	s3,a0
    8000a338:	ed59                	bnez	a0,8000a3d6 <fdt_get_mem_rsv+0xbe>
    8000a33a:	85d6                	mv	a1,s5
    8000a33c:	8552                	mv	a0,s4
    8000a33e:	bd7ff0ef          	jal	ra,80009f14 <fdt_mem_rsv>
    8000a342:	c545                	beqz	a0,8000a3ea <fdt_get_mem_rsv+0xd2>
    8000a344:	00054703          	lbu	a4,0(a0)
    8000a348:	00154683          	lbu	a3,1(a0)
    8000a34c:	00754883          	lbu	a7,7(a0)
    8000a350:	00254783          	lbu	a5,2(a0)
    8000a354:	00354803          	lbu	a6,3(a0)
    8000a358:	16c2                	slli	a3,a3,0x30
    8000a35a:	1762                	slli	a4,a4,0x38
    8000a35c:	00454583          	lbu	a1,4(a0)
    8000a360:	8f55                	or	a4,a4,a3
    8000a362:	00554603          	lbu	a2,5(a0)
    8000a366:	01176733          	or	a4,a4,a7
    8000a36a:	17a2                	slli	a5,a5,0x28
    8000a36c:	00654683          	lbu	a3,6(a0)
    8000a370:	8fd9                	or	a5,a5,a4
    8000a372:	02081713          	slli	a4,a6,0x20
    8000a376:	8fd9                	or	a5,a5,a4
    8000a378:	01859713          	slli	a4,a1,0x18
    8000a37c:	8fd9                	or	a5,a5,a4
    8000a37e:	01061713          	slli	a4,a2,0x10
    8000a382:	8fd9                	or	a5,a5,a4
    8000a384:	00869713          	slli	a4,a3,0x8
    8000a388:	8fd9                	or	a5,a5,a4
    8000a38a:	00f93023          	sd	a5,0(s2)
    8000a38e:	00854703          	lbu	a4,8(a0)
    8000a392:	00954683          	lbu	a3,9(a0)
    8000a396:	00f54883          	lbu	a7,15(a0)
    8000a39a:	00a54783          	lbu	a5,10(a0)
    8000a39e:	00b54803          	lbu	a6,11(a0)
    8000a3a2:	16c2                	slli	a3,a3,0x30
    8000a3a4:	1762                	slli	a4,a4,0x38
    8000a3a6:	00c54583          	lbu	a1,12(a0)
    8000a3aa:	8f55                	or	a4,a4,a3
    8000a3ac:	00d54603          	lbu	a2,13(a0)
    8000a3b0:	01176733          	or	a4,a4,a7
    8000a3b4:	17a2                	slli	a5,a5,0x28
    8000a3b6:	00e54683          	lbu	a3,14(a0)
    8000a3ba:	8fd9                	or	a5,a5,a4
    8000a3bc:	02081713          	slli	a4,a6,0x20
    8000a3c0:	8fd9                	or	a5,a5,a4
    8000a3c2:	01859713          	slli	a4,a1,0x18
    8000a3c6:	8fd9                	or	a5,a5,a4
    8000a3c8:	01061713          	slli	a4,a2,0x10
    8000a3cc:	8fd9                	or	a5,a5,a4
    8000a3ce:	00869713          	slli	a4,a3,0x8
    8000a3d2:	8fd9                	or	a5,a5,a4
    8000a3d4:	e09c                	sd	a5,0(s1)
    8000a3d6:	70e2                	ld	ra,56(sp)
    8000a3d8:	7442                	ld	s0,48(sp)
    8000a3da:	74a2                	ld	s1,40(sp)
    8000a3dc:	7902                	ld	s2,32(sp)
    8000a3de:	6a42                	ld	s4,16(sp)
    8000a3e0:	6aa2                	ld	s5,8(sp)
    8000a3e2:	854e                	mv	a0,s3
    8000a3e4:	69e2                	ld	s3,24(sp)
    8000a3e6:	6121                	addi	sp,sp,64
    8000a3e8:	8082                	ret
    8000a3ea:	59f1                	li	s3,-4
    8000a3ec:	b7ed                	j	8000a3d6 <fdt_get_mem_rsv+0xbe>

000000008000a3ee <fdt_num_mem_rsv>:
    8000a3ee:	1101                	addi	sp,sp,-32
    8000a3f0:	e822                	sd	s0,16(sp)
    8000a3f2:	e426                	sd	s1,8(sp)
    8000a3f4:	e04a                	sd	s2,0(sp)
    8000a3f6:	ec06                	sd	ra,24(sp)
    8000a3f8:	1000                	addi	s0,sp,32
    8000a3fa:	84aa                	mv	s1,a0
    8000a3fc:	4901                	li	s2,0
    8000a3fe:	a0a9                	j	8000a448 <fdt_num_mem_rsv+0x5a>
    8000a400:	00854703          	lbu	a4,8(a0)
    8000a404:	00954683          	lbu	a3,9(a0)
    8000a408:	00f54583          	lbu	a1,15(a0)
    8000a40c:	00a54783          	lbu	a5,10(a0)
    8000a410:	16c2                	slli	a3,a3,0x30
    8000a412:	00b54883          	lbu	a7,11(a0)
    8000a416:	1762                	slli	a4,a4,0x38
    8000a418:	8f55                	or	a4,a4,a3
    8000a41a:	00c54803          	lbu	a6,12(a0)
    8000a41e:	8f4d                	or	a4,a4,a1
    8000a420:	00d54603          	lbu	a2,13(a0)
    8000a424:	17a2                	slli	a5,a5,0x28
    8000a426:	8fd9                	or	a5,a5,a4
    8000a428:	00e54683          	lbu	a3,14(a0)
    8000a42c:	02089713          	slli	a4,a7,0x20
    8000a430:	8fd9                	or	a5,a5,a4
    8000a432:	01881713          	slli	a4,a6,0x18
    8000a436:	8fd9                	or	a5,a5,a4
    8000a438:	01061713          	slli	a4,a2,0x10
    8000a43c:	8fd9                	or	a5,a5,a4
    8000a43e:	00869713          	slli	a4,a3,0x8
    8000a442:	8fd9                	or	a5,a5,a4
    8000a444:	cb81                	beqz	a5,8000a454 <fdt_num_mem_rsv+0x66>
    8000a446:	2905                	addiw	s2,s2,1
    8000a448:	85ca                	mv	a1,s2
    8000a44a:	8526                	mv	a0,s1
    8000a44c:	ac9ff0ef          	jal	ra,80009f14 <fdt_mem_rsv>
    8000a450:	f945                	bnez	a0,8000a400 <fdt_num_mem_rsv+0x12>
    8000a452:	5961                	li	s2,-8
    8000a454:	60e2                	ld	ra,24(sp)
    8000a456:	6442                	ld	s0,16(sp)
    8000a458:	64a2                	ld	s1,8(sp)
    8000a45a:	854a                	mv	a0,s2
    8000a45c:	6902                	ld	s2,0(sp)
    8000a45e:	6105                	addi	sp,sp,32
    8000a460:	8082                	ret

000000008000a462 <fdt_get_name>:
    8000a462:	715d                	addi	sp,sp,-80
    8000a464:	e0a2                	sd	s0,64(sp)
    8000a466:	fc26                	sd	s1,56(sp)
    8000a468:	f44e                	sd	s3,40(sp)
    8000a46a:	f052                	sd	s4,32(sp)
    8000a46c:	e486                	sd	ra,72(sp)
    8000a46e:	f84a                	sd	s2,48(sp)
    8000a470:	ec56                	sd	s5,24(sp)
    8000a472:	e85a                	sd	s6,16(sp)
    8000a474:	e45e                	sd	s7,8(sp)
    8000a476:	0880                	addi	s0,sp,80
    8000a478:	00854903          	lbu	s2,8(a0)
    8000a47c:	00954b83          	lbu	s7,9(a0)
    8000a480:	00a54a83          	lbu	s5,10(a0)
    8000a484:	00b54b03          	lbu	s6,11(a0)
    8000a488:	84aa                	mv	s1,a0
    8000a48a:	8a2e                	mv	s4,a1
    8000a48c:	89b2                	mv	s3,a2
    8000a48e:	7dd000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000a492:	c115                	beqz	a0,8000a4b6 <fdt_get_name+0x54>
    8000a494:	4481                	li	s1,0
    8000a496:	00098463          	beqz	s3,8000a49e <fdt_get_name+0x3c>
    8000a49a:	00a9a023          	sw	a0,0(s3)
    8000a49e:	60a6                	ld	ra,72(sp)
    8000a4a0:	6406                	ld	s0,64(sp)
    8000a4a2:	7942                	ld	s2,48(sp)
    8000a4a4:	79a2                	ld	s3,40(sp)
    8000a4a6:	7a02                	ld	s4,32(sp)
    8000a4a8:	6ae2                	ld	s5,24(sp)
    8000a4aa:	6b42                	ld	s6,16(sp)
    8000a4ac:	6ba2                	ld	s7,8(sp)
    8000a4ae:	8526                	mv	a0,s1
    8000a4b0:	74e2                	ld	s1,56(sp)
    8000a4b2:	6161                	addi	sp,sp,80
    8000a4b4:	8082                	ret
    8000a4b6:	85d2                	mv	a1,s4
    8000a4b8:	8526                	mv	a0,s1
    8000a4ba:	4e4010ef          	jal	ra,8000b99e <fdt_check_node_offset_>
    8000a4be:	fc054be3          	bltz	a0,8000a494 <fdt_get_name+0x32>
    8000a4c2:	0144c783          	lbu	a5,20(s1)
    8000a4c6:	0154c683          	lbu	a3,21(s1)
    8000a4ca:	0189151b          	slliw	a0,s2,0x18
    8000a4ce:	010b9b9b          	slliw	s7,s7,0x10
    8000a4d2:	01756533          	or	a0,a0,s7
    8000a4d6:	0174c603          	lbu	a2,23(s1)
    8000a4da:	0164c703          	lbu	a4,22(s1)
    8000a4de:	01656533          	or	a0,a0,s6
    8000a4e2:	008a9a9b          	slliw	s5,s5,0x8
    8000a4e6:	0187979b          	slliw	a5,a5,0x18
    8000a4ea:	0106969b          	slliw	a3,a3,0x10
    8000a4ee:	01556533          	or	a0,a0,s5
    8000a4f2:	8fd5                	or	a5,a5,a3
    8000a4f4:	1502                	slli	a0,a0,0x20
    8000a4f6:	0087171b          	slliw	a4,a4,0x8
    8000a4fa:	9101                	srli	a0,a0,0x20
    8000a4fc:	8fd1                	or	a5,a5,a2
    8000a4fe:	8fd9                	or	a5,a5,a4
    8000a500:	014505b3          	add	a1,a0,s4
    8000a504:	94ae                	add	s1,s1,a1
    8000a506:	2781                	sext.w	a5,a5
    8000a508:	473d                	li	a4,15
    8000a50a:	0491                	addi	s1,s1,4
    8000a50c:	00f77a63          	bgeu	a4,a5,8000a520 <fdt_get_name+0xbe>
    8000a510:	f80987e3          	beqz	s3,8000a49e <fdt_get_name+0x3c>
    8000a514:	8526                	mv	a0,s1
    8000a516:	903f90ef          	jal	ra,80003e18 <sbi_strlen>
    8000a51a:	00a9a023          	sw	a0,0(s3)
    8000a51e:	b741                	j	8000a49e <fdt_get_name+0x3c>
    8000a520:	02f00593          	li	a1,47
    8000a524:	8526                	mv	a0,s1
    8000a526:	9bff90ef          	jal	ra,80003ee4 <sbi_strrchr>
    8000a52a:	c511                	beqz	a0,8000a536 <fdt_get_name+0xd4>
    8000a52c:	00150493          	addi	s1,a0,1
    8000a530:	fe0992e3          	bnez	s3,8000a514 <fdt_get_name+0xb2>
    8000a534:	b7ad                	j	8000a49e <fdt_get_name+0x3c>
    8000a536:	5555                	li	a0,-11
    8000a538:	bfb1                	j	8000a494 <fdt_get_name+0x32>

000000008000a53a <fdt_subnode_offset_namelen.part.0>:
    8000a53a:	715d                	addi	sp,sp,-80
    8000a53c:	e0a2                	sd	s0,64(sp)
    8000a53e:	fc26                	sd	s1,56(sp)
    8000a540:	f44e                	sd	s3,40(sp)
    8000a542:	f052                	sd	s4,32(sp)
    8000a544:	ec56                	sd	s5,24(sp)
    8000a546:	e85a                	sd	s6,16(sp)
    8000a548:	0880                	addi	s0,sp,80
    8000a54a:	e486                	sd	ra,72(sp)
    8000a54c:	f84a                	sd	s2,48(sp)
    8000a54e:	fa042c23          	sw	zero,-72(s0)
    8000a552:	84ae                	mv	s1,a1
    8000a554:	89aa                	mv	s3,a0
    8000a556:	8b32                	mv	s6,a2
    8000a558:	8a36                	mv	s4,a3
    8000a55a:	4a85                	li	s5,1
    8000a55c:	0405ca63          	bltz	a1,8000a5b0 <fdt_subnode_offset_namelen.part.0+0x76>
    8000a560:	85a6                	mv	a1,s1
    8000a562:	fb840613          	addi	a2,s0,-72
    8000a566:	854e                	mv	a0,s3
    8000a568:	4a2010ef          	jal	ra,8000ba0a <fdt_next_node>
    8000a56c:	fb842783          	lw	a5,-72(s0)
    8000a570:	84aa                	mv	s1,a0
    8000a572:	04054a63          	bltz	a0,8000a5c6 <fdt_subnode_offset_namelen.part.0+0x8c>
    8000a576:	0407ca63          	bltz	a5,8000a5ca <fdt_subnode_offset_namelen.part.0+0x90>
    8000a57a:	ff5793e3          	bne	a5,s5,8000a560 <fdt_subnode_offset_namelen.part.0+0x26>
    8000a57e:	fbc40613          	addi	a2,s0,-68
    8000a582:	85a6                	mv	a1,s1
    8000a584:	854e                	mv	a0,s3
    8000a586:	eddff0ef          	jal	ra,8000a462 <fdt_get_name>
    8000a58a:	8652                	mv	a2,s4
    8000a58c:	85da                	mv	a1,s6
    8000a58e:	d969                	beqz	a0,8000a560 <fdt_subnode_offset_namelen.part.0+0x26>
    8000a590:	fbc42703          	lw	a4,-68(s0)
    8000a594:	fd4746e3          	blt	a4,s4,8000a560 <fdt_subnode_offset_namelen.part.0+0x26>
    8000a598:	01450933          	add	s2,a0,s4
    8000a59c:	a25f90ef          	jal	ra,80003fc0 <sbi_memcmp>
    8000a5a0:	f161                	bnez	a0,8000a560 <fdt_subnode_offset_namelen.part.0+0x26>
    8000a5a2:	00094783          	lbu	a5,0(s2)
    8000a5a6:	8652                	mv	a2,s4
    8000a5a8:	04000593          	li	a1,64
    8000a5ac:	855a                	mv	a0,s6
    8000a5ae:	e385                	bnez	a5,8000a5ce <fdt_subnode_offset_namelen.part.0+0x94>
    8000a5b0:	60a6                	ld	ra,72(sp)
    8000a5b2:	6406                	ld	s0,64(sp)
    8000a5b4:	7942                	ld	s2,48(sp)
    8000a5b6:	79a2                	ld	s3,40(sp)
    8000a5b8:	7a02                	ld	s4,32(sp)
    8000a5ba:	6ae2                	ld	s5,24(sp)
    8000a5bc:	6b42                	ld	s6,16(sp)
    8000a5be:	8526                	mv	a0,s1
    8000a5c0:	74e2                	ld	s1,56(sp)
    8000a5c2:	6161                	addi	sp,sp,80
    8000a5c4:	8082                	ret
    8000a5c6:	fe07d5e3          	bgez	a5,8000a5b0 <fdt_subnode_offset_namelen.part.0+0x76>
    8000a5ca:	54fd                	li	s1,-1
    8000a5cc:	b7d5                	j	8000a5b0 <fdt_subnode_offset_namelen.part.0+0x76>
    8000a5ce:	a25f90ef          	jal	ra,80003ff2 <sbi_memchr>
    8000a5d2:	04000793          	li	a5,64
    8000a5d6:	f549                	bnez	a0,8000a560 <fdt_subnode_offset_namelen.part.0+0x26>
    8000a5d8:	00094703          	lbu	a4,0(s2)
    8000a5dc:	f8f712e3          	bne	a4,a5,8000a560 <fdt_subnode_offset_namelen.part.0+0x26>
    8000a5e0:	bfc1                	j	8000a5b0 <fdt_subnode_offset_namelen.part.0+0x76>

000000008000a5e2 <fdt_subnode_offset_namelen>:
    8000a5e2:	7179                	addi	sp,sp,-48
    8000a5e4:	f022                	sd	s0,32(sp)
    8000a5e6:	ec26                	sd	s1,24(sp)
    8000a5e8:	e84a                	sd	s2,16(sp)
    8000a5ea:	e44e                	sd	s3,8(sp)
    8000a5ec:	e052                	sd	s4,0(sp)
    8000a5ee:	f406                	sd	ra,40(sp)
    8000a5f0:	1800                	addi	s0,sp,48
    8000a5f2:	84aa                	mv	s1,a0
    8000a5f4:	892e                	mv	s2,a1
    8000a5f6:	89b2                	mv	s3,a2
    8000a5f8:	8a36                	mv	s4,a3
    8000a5fa:	671000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000a5fe:	e519                	bnez	a0,8000a60c <fdt_subnode_offset_namelen+0x2a>
    8000a600:	86d2                	mv	a3,s4
    8000a602:	864e                	mv	a2,s3
    8000a604:	85ca                	mv	a1,s2
    8000a606:	8526                	mv	a0,s1
    8000a608:	f33ff0ef          	jal	ra,8000a53a <fdt_subnode_offset_namelen.part.0>
    8000a60c:	70a2                	ld	ra,40(sp)
    8000a60e:	7402                	ld	s0,32(sp)
    8000a610:	64e2                	ld	s1,24(sp)
    8000a612:	6942                	ld	s2,16(sp)
    8000a614:	69a2                	ld	s3,8(sp)
    8000a616:	6a02                	ld	s4,0(sp)
    8000a618:	6145                	addi	sp,sp,48
    8000a61a:	8082                	ret

000000008000a61c <fdt_subnode_offset>:
    8000a61c:	7179                	addi	sp,sp,-48
    8000a61e:	f022                	sd	s0,32(sp)
    8000a620:	ec26                	sd	s1,24(sp)
    8000a622:	e84a                	sd	s2,16(sp)
    8000a624:	e44e                	sd	s3,8(sp)
    8000a626:	e052                	sd	s4,0(sp)
    8000a628:	f406                	sd	ra,40(sp)
    8000a62a:	1800                	addi	s0,sp,48
    8000a62c:	84aa                	mv	s1,a0
    8000a62e:	8532                	mv	a0,a2
    8000a630:	8932                	mv	s2,a2
    8000a632:	89ae                	mv	s3,a1
    8000a634:	fe4f90ef          	jal	ra,80003e18 <sbi_strlen>
    8000a638:	8a2a                	mv	s4,a0
    8000a63a:	8526                	mv	a0,s1
    8000a63c:	62f000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000a640:	e901                	bnez	a0,8000a650 <fdt_subnode_offset+0x34>
    8000a642:	000a069b          	sext.w	a3,s4
    8000a646:	864a                	mv	a2,s2
    8000a648:	85ce                	mv	a1,s3
    8000a64a:	8526                	mv	a0,s1
    8000a64c:	eefff0ef          	jal	ra,8000a53a <fdt_subnode_offset_namelen.part.0>
    8000a650:	70a2                	ld	ra,40(sp)
    8000a652:	7402                	ld	s0,32(sp)
    8000a654:	64e2                	ld	s1,24(sp)
    8000a656:	6942                	ld	s2,16(sp)
    8000a658:	69a2                	ld	s3,8(sp)
    8000a65a:	6a02                	ld	s4,0(sp)
    8000a65c:	6145                	addi	sp,sp,48
    8000a65e:	8082                	ret

000000008000a660 <fdt_first_property_offset>:
    8000a660:	715d                	addi	sp,sp,-80
    8000a662:	e0a2                	sd	s0,64(sp)
    8000a664:	fc26                	sd	s1,56(sp)
    8000a666:	f84a                	sd	s2,48(sp)
    8000a668:	e486                	sd	ra,72(sp)
    8000a66a:	f44e                	sd	s3,40(sp)
    8000a66c:	f052                	sd	s4,32(sp)
    8000a66e:	ec56                	sd	s5,24(sp)
    8000a670:	0880                	addi	s0,sp,80
    8000a672:	892a                	mv	s2,a0
    8000a674:	32a010ef          	jal	ra,8000b99e <fdt_check_node_offset_>
    8000a678:	84aa                	mv	s1,a0
    8000a67a:	02054663          	bltz	a0,8000a6a6 <fdt_first_property_offset+0x46>
    8000a67e:	4a0d                	li	s4,3
    8000a680:	49a5                	li	s3,9
    8000a682:	4a91                	li	s5,4
    8000a684:	85a6                	mv	a1,s1
    8000a686:	fbc40613          	addi	a2,s0,-68
    8000a68a:	854a                	mv	a0,s2
    8000a68c:	1d0010ef          	jal	ra,8000b85c <fdt_next_tag>
    8000a690:	0005079b          	sext.w	a5,a0
    8000a694:	01478963          	beq	a5,s4,8000a6a6 <fdt_first_property_offset+0x46>
    8000a698:	fbc42483          	lw	s1,-68(s0)
    8000a69c:	01378f63          	beq	a5,s3,8000a6ba <fdt_first_property_offset+0x5a>
    8000a6a0:	ff5782e3          	beq	a5,s5,8000a684 <fdt_first_property_offset+0x24>
    8000a6a4:	54fd                	li	s1,-1
    8000a6a6:	60a6                	ld	ra,72(sp)
    8000a6a8:	6406                	ld	s0,64(sp)
    8000a6aa:	7942                	ld	s2,48(sp)
    8000a6ac:	79a2                	ld	s3,40(sp)
    8000a6ae:	7a02                	ld	s4,32(sp)
    8000a6b0:	6ae2                	ld	s5,24(sp)
    8000a6b2:	8526                	mv	a0,s1
    8000a6b4:	74e2                	ld	s1,56(sp)
    8000a6b6:	6161                	addi	sp,sp,80
    8000a6b8:	8082                	ret
    8000a6ba:	fe04c6e3          	bltz	s1,8000a6a6 <fdt_first_property_offset+0x46>
    8000a6be:	54d5                	li	s1,-11
    8000a6c0:	b7dd                	j	8000a6a6 <fdt_first_property_offset+0x46>

000000008000a6c2 <fdt_next_property_offset>:
    8000a6c2:	715d                	addi	sp,sp,-80
    8000a6c4:	e0a2                	sd	s0,64(sp)
    8000a6c6:	fc26                	sd	s1,56(sp)
    8000a6c8:	f84a                	sd	s2,48(sp)
    8000a6ca:	e486                	sd	ra,72(sp)
    8000a6cc:	f44e                	sd	s3,40(sp)
    8000a6ce:	f052                	sd	s4,32(sp)
    8000a6d0:	ec56                	sd	s5,24(sp)
    8000a6d2:	0880                	addi	s0,sp,80
    8000a6d4:	892a                	mv	s2,a0
    8000a6d6:	2fe010ef          	jal	ra,8000b9d4 <fdt_check_prop_offset_>
    8000a6da:	84aa                	mv	s1,a0
    8000a6dc:	02054663          	bltz	a0,8000a708 <fdt_next_property_offset+0x46>
    8000a6e0:	4a0d                	li	s4,3
    8000a6e2:	49a5                	li	s3,9
    8000a6e4:	4a91                	li	s5,4
    8000a6e6:	85a6                	mv	a1,s1
    8000a6e8:	fbc40613          	addi	a2,s0,-68
    8000a6ec:	854a                	mv	a0,s2
    8000a6ee:	16e010ef          	jal	ra,8000b85c <fdt_next_tag>
    8000a6f2:	0005079b          	sext.w	a5,a0
    8000a6f6:	01478963          	beq	a5,s4,8000a708 <fdt_next_property_offset+0x46>
    8000a6fa:	fbc42483          	lw	s1,-68(s0)
    8000a6fe:	01378f63          	beq	a5,s3,8000a71c <fdt_next_property_offset+0x5a>
    8000a702:	ff5782e3          	beq	a5,s5,8000a6e6 <fdt_next_property_offset+0x24>
    8000a706:	54fd                	li	s1,-1
    8000a708:	60a6                	ld	ra,72(sp)
    8000a70a:	6406                	ld	s0,64(sp)
    8000a70c:	7942                	ld	s2,48(sp)
    8000a70e:	79a2                	ld	s3,40(sp)
    8000a710:	7a02                	ld	s4,32(sp)
    8000a712:	6ae2                	ld	s5,24(sp)
    8000a714:	8526                	mv	a0,s1
    8000a716:	74e2                	ld	s1,56(sp)
    8000a718:	6161                	addi	sp,sp,80
    8000a71a:	8082                	ret
    8000a71c:	fe04c6e3          	bltz	s1,8000a708 <fdt_next_property_offset+0x46>
    8000a720:	54d5                	li	s1,-11
    8000a722:	b7dd                	j	8000a708 <fdt_next_property_offset+0x46>

000000008000a724 <fdt_get_property_by_offset>:
    8000a724:	01454783          	lbu	a5,20(a0)
    8000a728:	01554683          	lbu	a3,21(a0)
    8000a72c:	01754803          	lbu	a6,23(a0)
    8000a730:	01654703          	lbu	a4,22(a0)
    8000a734:	0106969b          	slliw	a3,a3,0x10
    8000a738:	0187979b          	slliw	a5,a5,0x18
    8000a73c:	8fd5                	or	a5,a5,a3
    8000a73e:	0107e7b3          	or	a5,a5,a6
    8000a742:	0087171b          	slliw	a4,a4,0x8
    8000a746:	8fd9                	or	a5,a5,a4
    8000a748:	2781                	sext.w	a5,a5
    8000a74a:	46bd                	li	a3,15
    8000a74c:	00f6fc63          	bgeu	a3,a5,8000a764 <fdt_get_property_by_offset+0x40>
    8000a750:	1141                	addi	sp,sp,-16
    8000a752:	e022                	sd	s0,0(sp)
    8000a754:	e406                	sd	ra,8(sp)
    8000a756:	0800                	addi	s0,sp,16
    8000a758:	83bff0ef          	jal	ra,80009f92 <fdt_get_property_by_offset_>
    8000a75c:	60a2                	ld	ra,8(sp)
    8000a75e:	6402                	ld	s0,0(sp)
    8000a760:	0141                	addi	sp,sp,16
    8000a762:	8082                	ret
    8000a764:	4501                	li	a0,0
    8000a766:	c601                	beqz	a2,8000a76e <fdt_get_property_by_offset+0x4a>
    8000a768:	57d9                	li	a5,-10
    8000a76a:	c21c                	sw	a5,0(a2)
    8000a76c:	8082                	ret
    8000a76e:	8082                	ret

000000008000a770 <fdt_get_property_namelen>:
    8000a770:	01454783          	lbu	a5,20(a0)
    8000a774:	01554883          	lbu	a7,21(a0)
    8000a778:	01754303          	lbu	t1,23(a0)
    8000a77c:	01654803          	lbu	a6,22(a0)
    8000a780:	0108989b          	slliw	a7,a7,0x10
    8000a784:	0187979b          	slliw	a5,a5,0x18
    8000a788:	0117e7b3          	or	a5,a5,a7
    8000a78c:	0067e7b3          	or	a5,a5,t1
    8000a790:	0088181b          	slliw	a6,a6,0x8
    8000a794:	0107e7b3          	or	a5,a5,a6
    8000a798:	2781                	sext.w	a5,a5
    8000a79a:	48bd                	li	a7,15
    8000a79c:	00f8fd63          	bgeu	a7,a5,8000a7b6 <fdt_get_property_namelen+0x46>
    8000a7a0:	1141                	addi	sp,sp,-16
    8000a7a2:	e022                	sd	s0,0(sp)
    8000a7a4:	e406                	sd	ra,8(sp)
    8000a7a6:	0800                	addi	s0,sp,16
    8000a7a8:	4781                	li	a5,0
    8000a7aa:	a33ff0ef          	jal	ra,8000a1dc <fdt_get_property_namelen_>
    8000a7ae:	60a2                	ld	ra,8(sp)
    8000a7b0:	6402                	ld	s0,0(sp)
    8000a7b2:	0141                	addi	sp,sp,16
    8000a7b4:	8082                	ret
    8000a7b6:	4501                	li	a0,0
    8000a7b8:	c701                	beqz	a4,8000a7c0 <fdt_get_property_namelen+0x50>
    8000a7ba:	57d9                	li	a5,-10
    8000a7bc:	c31c                	sw	a5,0(a4)
    8000a7be:	8082                	ret
    8000a7c0:	8082                	ret

000000008000a7c2 <fdt_get_property>:
    8000a7c2:	7179                	addi	sp,sp,-48
    8000a7c4:	f022                	sd	s0,32(sp)
    8000a7c6:	ec26                	sd	s1,24(sp)
    8000a7c8:	e84a                	sd	s2,16(sp)
    8000a7ca:	e44e                	sd	s3,8(sp)
    8000a7cc:	e052                	sd	s4,0(sp)
    8000a7ce:	f406                	sd	ra,40(sp)
    8000a7d0:	1800                	addi	s0,sp,48
    8000a7d2:	84aa                	mv	s1,a0
    8000a7d4:	8532                	mv	a0,a2
    8000a7d6:	8932                	mv	s2,a2
    8000a7d8:	89b6                	mv	s3,a3
    8000a7da:	8a2e                	mv	s4,a1
    8000a7dc:	e3cf90ef          	jal	ra,80003e18 <sbi_strlen>
    8000a7e0:	0144c783          	lbu	a5,20(s1)
    8000a7e4:	0154c603          	lbu	a2,21(s1)
    8000a7e8:	0174c683          	lbu	a3,23(s1)
    8000a7ec:	0164c703          	lbu	a4,22(s1)
    8000a7f0:	0187979b          	slliw	a5,a5,0x18
    8000a7f4:	0106161b          	slliw	a2,a2,0x10
    8000a7f8:	8fd1                	or	a5,a5,a2
    8000a7fa:	0087171b          	slliw	a4,a4,0x8
    8000a7fe:	8fd5                	or	a5,a5,a3
    8000a800:	8fd9                	or	a5,a5,a4
    8000a802:	2781                	sext.w	a5,a5
    8000a804:	473d                	li	a4,15
    8000a806:	02f77363          	bgeu	a4,a5,8000a82c <fdt_get_property+0x6a>
    8000a80a:	0005069b          	sext.w	a3,a0
    8000a80e:	4781                	li	a5,0
    8000a810:	874e                	mv	a4,s3
    8000a812:	864a                	mv	a2,s2
    8000a814:	85d2                	mv	a1,s4
    8000a816:	8526                	mv	a0,s1
    8000a818:	9c5ff0ef          	jal	ra,8000a1dc <fdt_get_property_namelen_>
    8000a81c:	70a2                	ld	ra,40(sp)
    8000a81e:	7402                	ld	s0,32(sp)
    8000a820:	64e2                	ld	s1,24(sp)
    8000a822:	6942                	ld	s2,16(sp)
    8000a824:	69a2                	ld	s3,8(sp)
    8000a826:	6a02                	ld	s4,0(sp)
    8000a828:	6145                	addi	sp,sp,48
    8000a82a:	8082                	ret
    8000a82c:	4501                	li	a0,0
    8000a82e:	fe0987e3          	beqz	s3,8000a81c <fdt_get_property+0x5a>
    8000a832:	57d9                	li	a5,-10
    8000a834:	00f9a023          	sw	a5,0(s3)
    8000a838:	70a2                	ld	ra,40(sp)
    8000a83a:	7402                	ld	s0,32(sp)
    8000a83c:	64e2                	ld	s1,24(sp)
    8000a83e:	6942                	ld	s2,16(sp)
    8000a840:	69a2                	ld	s3,8(sp)
    8000a842:	6a02                	ld	s4,0(sp)
    8000a844:	6145                	addi	sp,sp,48
    8000a846:	8082                	ret

000000008000a848 <fdt_getprop_namelen>:
    8000a848:	7179                	addi	sp,sp,-48
    8000a84a:	f022                	sd	s0,32(sp)
    8000a84c:	ec26                	sd	s1,24(sp)
    8000a84e:	1800                	addi	s0,sp,48
    8000a850:	f406                	sd	ra,40(sp)
    8000a852:	fdc40793          	addi	a5,s0,-36
    8000a856:	84aa                	mv	s1,a0
    8000a858:	985ff0ef          	jal	ra,8000a1dc <fdt_get_property_namelen_>
    8000a85c:	c12d                	beqz	a0,8000a8be <fdt_getprop_namelen+0x76>
    8000a85e:	0144c783          	lbu	a5,20(s1)
    8000a862:	0154c683          	lbu	a3,21(s1)
    8000a866:	0174c603          	lbu	a2,23(s1)
    8000a86a:	0164c703          	lbu	a4,22(s1)
    8000a86e:	0187979b          	slliw	a5,a5,0x18
    8000a872:	0106969b          	slliw	a3,a3,0x10
    8000a876:	8fd5                	or	a5,a5,a3
    8000a878:	0087171b          	slliw	a4,a4,0x8
    8000a87c:	8fd1                	or	a5,a5,a2
    8000a87e:	8fd9                	or	a5,a5,a4
    8000a880:	2781                	sext.w	a5,a5
    8000a882:	473d                	li	a4,15
    8000a884:	02f76c63          	bltu	a4,a5,8000a8bc <fdt_getprop_namelen+0x74>
    8000a888:	fdc42783          	lw	a5,-36(s0)
    8000a88c:	07b1                	addi	a5,a5,12
    8000a88e:	8b9d                	andi	a5,a5,7
    8000a890:	c795                	beqz	a5,8000a8bc <fdt_getprop_namelen+0x74>
    8000a892:	00454783          	lbu	a5,4(a0)
    8000a896:	00554683          	lbu	a3,5(a0)
    8000a89a:	00754603          	lbu	a2,7(a0)
    8000a89e:	00654703          	lbu	a4,6(a0)
    8000a8a2:	0187979b          	slliw	a5,a5,0x18
    8000a8a6:	0106969b          	slliw	a3,a3,0x10
    8000a8aa:	8fd5                	or	a5,a5,a3
    8000a8ac:	0087171b          	slliw	a4,a4,0x8
    8000a8b0:	8fd1                	or	a5,a5,a2
    8000a8b2:	8fd9                	or	a5,a5,a4
    8000a8b4:	2781                	sext.w	a5,a5
    8000a8b6:	471d                	li	a4,7
    8000a8b8:	00f76863          	bltu	a4,a5,8000a8c8 <fdt_getprop_namelen+0x80>
    8000a8bc:	0531                	addi	a0,a0,12
    8000a8be:	70a2                	ld	ra,40(sp)
    8000a8c0:	7402                	ld	s0,32(sp)
    8000a8c2:	64e2                	ld	s1,24(sp)
    8000a8c4:	6145                	addi	sp,sp,48
    8000a8c6:	8082                	ret
    8000a8c8:	0541                	addi	a0,a0,16
    8000a8ca:	bfd5                	j	8000a8be <fdt_getprop_namelen+0x76>

000000008000a8cc <fdt_path_offset_namelen>:
    8000a8cc:	715d                	addi	sp,sp,-80
    8000a8ce:	e0a2                	sd	s0,64(sp)
    8000a8d0:	fc26                	sd	s1,56(sp)
    8000a8d2:	f84a                	sd	s2,48(sp)
    8000a8d4:	f44e                	sd	s3,40(sp)
    8000a8d6:	f052                	sd	s4,32(sp)
    8000a8d8:	e486                	sd	ra,72(sp)
    8000a8da:	ec56                	sd	s5,24(sp)
    8000a8dc:	e85a                	sd	s6,16(sp)
    8000a8de:	e45e                	sd	s7,8(sp)
    8000a8e0:	0880                	addi	s0,sp,80
    8000a8e2:	8a2a                	mv	s4,a0
    8000a8e4:	84ae                	mv	s1,a1
    8000a8e6:	8932                	mv	s2,a2
    8000a8e8:	383000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000a8ec:	89aa                	mv	s3,a0
    8000a8ee:	e135                	bnez	a0,8000a952 <fdt_path_offset_namelen+0x86>
    8000a8f0:	0004c703          	lbu	a4,0(s1)
    8000a8f4:	02f00793          	li	a5,47
    8000a8f8:	01248bb3          	add	s7,s1,s2
    8000a8fc:	06f71763          	bne	a4,a5,8000a96a <fdt_path_offset_namelen+0x9e>
    8000a900:	02f00913          	li	s2,47
    8000a904:	0174e663          	bltu	s1,s7,8000a910 <fdt_path_offset_namelen+0x44>
    8000a908:	a0a9                	j	8000a952 <fdt_path_offset_namelen+0x86>
    8000a90a:	0485                	addi	s1,s1,1
    8000a90c:	049b8363          	beq	s7,s1,8000a952 <fdt_path_offset_namelen+0x86>
    8000a910:	0004c783          	lbu	a5,0(s1)
    8000a914:	ff278be3          	beq	a5,s2,8000a90a <fdt_path_offset_namelen+0x3e>
    8000a918:	409b8b33          	sub	s6,s7,s1
    8000a91c:	865a                	mv	a2,s6
    8000a91e:	02f00593          	li	a1,47
    8000a922:	8526                	mv	a0,s1
    8000a924:	ecef90ef          	jal	ra,80003ff2 <sbi_memchr>
    8000a928:	8aaa                	mv	s5,a0
    8000a92a:	c155                	beqz	a0,8000a9ce <fdt_path_offset_namelen+0x102>
    8000a92c:	40950b33          	sub	s6,a0,s1
    8000a930:	8552                	mv	a0,s4
    8000a932:	339000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000a936:	e951                	bnez	a0,8000a9ca <fdt_path_offset_namelen+0xfe>
    8000a938:	85ce                	mv	a1,s3
    8000a93a:	000b069b          	sext.w	a3,s6
    8000a93e:	8626                	mv	a2,s1
    8000a940:	8552                	mv	a0,s4
    8000a942:	bf9ff0ef          	jal	ra,8000a53a <fdt_subnode_offset_namelen.part.0>
    8000a946:	89aa                	mv	s3,a0
    8000a948:	0009c563          	bltz	s3,8000a952 <fdt_path_offset_namelen+0x86>
    8000a94c:	84d6                	mv	s1,s5
    8000a94e:	bf5d                	j	8000a904 <fdt_path_offset_namelen+0x38>
    8000a950:	59ed                	li	s3,-5
    8000a952:	60a6                	ld	ra,72(sp)
    8000a954:	6406                	ld	s0,64(sp)
    8000a956:	74e2                	ld	s1,56(sp)
    8000a958:	7942                	ld	s2,48(sp)
    8000a95a:	7a02                	ld	s4,32(sp)
    8000a95c:	6ae2                	ld	s5,24(sp)
    8000a95e:	6b42                	ld	s6,16(sp)
    8000a960:	6ba2                	ld	s7,8(sp)
    8000a962:	854e                	mv	a0,s3
    8000a964:	79a2                	ld	s3,40(sp)
    8000a966:	6161                	addi	sp,sp,80
    8000a968:	8082                	ret
    8000a96a:	864a                	mv	a2,s2
    8000a96c:	02f00593          	li	a1,47
    8000a970:	8526                	mv	a0,s1
    8000a972:	e80f90ef          	jal	ra,80003ff2 <sbi_memchr>
    8000a976:	892a                	mv	s2,a0
    8000a978:	cd29                	beqz	a0,8000a9d2 <fdt_path_offset_namelen+0x106>
    8000a97a:	00002517          	auipc	a0,0x2
    8000a97e:	7de50513          	addi	a0,a0,2014 # 8000d158 <__func__.0+0x18>
    8000a982:	c96f90ef          	jal	ra,80003e18 <sbi_strlen>
    8000a986:	0005061b          	sext.w	a2,a0
    8000a98a:	00002597          	auipc	a1,0x2
    8000a98e:	7ce58593          	addi	a1,a1,1998 # 8000d158 <__func__.0+0x18>
    8000a992:	8552                	mv	a0,s4
    8000a994:	f39ff0ef          	jal	ra,8000a8cc <fdt_path_offset_namelen>
    8000a998:	85aa                	mv	a1,a0
    8000a99a:	409906bb          	subw	a3,s2,s1
    8000a99e:	fa0549e3          	bltz	a0,8000a950 <fdt_path_offset_namelen+0x84>
    8000a9a2:	8626                	mv	a2,s1
    8000a9a4:	4701                	li	a4,0
    8000a9a6:	8552                	mv	a0,s4
    8000a9a8:	ea1ff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000a9ac:	84aa                	mv	s1,a0
    8000a9ae:	d14d                	beqz	a0,8000a950 <fdt_path_offset_namelen+0x84>
    8000a9b0:	c68f90ef          	jal	ra,80003e18 <sbi_strlen>
    8000a9b4:	0005061b          	sext.w	a2,a0
    8000a9b8:	85a6                	mv	a1,s1
    8000a9ba:	8552                	mv	a0,s4
    8000a9bc:	f11ff0ef          	jal	ra,8000a8cc <fdt_path_offset_namelen>
    8000a9c0:	84ca                	mv	s1,s2
    8000a9c2:	89aa                	mv	s3,a0
    8000a9c4:	02f00913          	li	s2,47
    8000a9c8:	bf35                	j	8000a904 <fdt_path_offset_namelen+0x38>
    8000a9ca:	89aa                	mv	s3,a0
    8000a9cc:	bfb5                	j	8000a948 <fdt_path_offset_namelen+0x7c>
    8000a9ce:	8ade                	mv	s5,s7
    8000a9d0:	b785                	j	8000a930 <fdt_path_offset_namelen+0x64>
    8000a9d2:	895e                	mv	s2,s7
    8000a9d4:	b75d                	j	8000a97a <fdt_path_offset_namelen+0xae>

000000008000a9d6 <fdt_path_offset>:
    8000a9d6:	1101                	addi	sp,sp,-32
    8000a9d8:	ec06                	sd	ra,24(sp)
    8000a9da:	e822                	sd	s0,16(sp)
    8000a9dc:	e426                	sd	s1,8(sp)
    8000a9de:	e04a                	sd	s2,0(sp)
    8000a9e0:	1000                	addi	s0,sp,32
    8000a9e2:	892a                	mv	s2,a0
    8000a9e4:	852e                	mv	a0,a1
    8000a9e6:	84ae                	mv	s1,a1
    8000a9e8:	c30f90ef          	jal	ra,80003e18 <sbi_strlen>
    8000a9ec:	0005061b          	sext.w	a2,a0
    8000a9f0:	85a6                	mv	a1,s1
    8000a9f2:	854a                	mv	a0,s2
    8000a9f4:	ed9ff0ef          	jal	ra,8000a8cc <fdt_path_offset_namelen>
    8000a9f8:	60e2                	ld	ra,24(sp)
    8000a9fa:	6442                	ld	s0,16(sp)
    8000a9fc:	64a2                	ld	s1,8(sp)
    8000a9fe:	6902                	ld	s2,0(sp)
    8000aa00:	6105                	addi	sp,sp,32
    8000aa02:	8082                	ret

000000008000aa04 <fdt_getprop_by_offset>:
    8000aa04:	715d                	addi	sp,sp,-80
    8000aa06:	e0a2                	sd	s0,64(sp)
    8000aa08:	fc26                	sd	s1,56(sp)
    8000aa0a:	f84a                	sd	s2,48(sp)
    8000aa0c:	f44e                	sd	s3,40(sp)
    8000aa0e:	f052                	sd	s4,32(sp)
    8000aa10:	ec56                	sd	s5,24(sp)
    8000aa12:	e486                	sd	ra,72(sp)
    8000aa14:	0880                	addi	s0,sp,80
    8000aa16:	8a32                	mv	s4,a2
    8000aa18:	8636                	mv	a2,a3
    8000aa1a:	8ab6                	mv	s5,a3
    8000aa1c:	892a                	mv	s2,a0
    8000aa1e:	89ae                	mv	s3,a1
    8000aa20:	d72ff0ef          	jal	ra,80009f92 <fdt_get_property_by_offset_>
    8000aa24:	84aa                	mv	s1,a0
    8000aa26:	cd49                	beqz	a0,8000aac0 <fdt_getprop_by_offset+0xbc>
    8000aa28:	020a0c63          	beqz	s4,8000aa60 <fdt_getprop_by_offset+0x5c>
    8000aa2c:	00854583          	lbu	a1,8(a0)
    8000aa30:	00954703          	lbu	a4,9(a0)
    8000aa34:	00b54683          	lbu	a3,11(a0)
    8000aa38:	00a54783          	lbu	a5,10(a0)
    8000aa3c:	0185959b          	slliw	a1,a1,0x18
    8000aa40:	0107171b          	slliw	a4,a4,0x10
    8000aa44:	8dd9                	or	a1,a1,a4
    8000aa46:	8dd5                	or	a1,a1,a3
    8000aa48:	0087979b          	slliw	a5,a5,0x8
    8000aa4c:	8ddd                	or	a1,a1,a5
    8000aa4e:	fbc40613          	addi	a2,s0,-68
    8000aa52:	2581                	sext.w	a1,a1
    8000aa54:	854a                	mv	a0,s2
    8000aa56:	dc8ff0ef          	jal	ra,8000a01e <fdt_get_string>
    8000aa5a:	cd3d                	beqz	a0,8000aad8 <fdt_getprop_by_offset+0xd4>
    8000aa5c:	00aa3023          	sd	a0,0(s4)
    8000aa60:	01494783          	lbu	a5,20(s2)
    8000aa64:	01594683          	lbu	a3,21(s2)
    8000aa68:	01794603          	lbu	a2,23(s2)
    8000aa6c:	01694703          	lbu	a4,22(s2)
    8000aa70:	0187979b          	slliw	a5,a5,0x18
    8000aa74:	0106969b          	slliw	a3,a3,0x10
    8000aa78:	8fd5                	or	a5,a5,a3
    8000aa7a:	0087171b          	slliw	a4,a4,0x8
    8000aa7e:	8fd1                	or	a5,a5,a2
    8000aa80:	8fd9                	or	a5,a5,a4
    8000aa82:	2781                	sext.w	a5,a5
    8000aa84:	473d                	li	a4,15
    8000aa86:	02f76c63          	bltu	a4,a5,8000aabe <fdt_getprop_by_offset+0xba>
    8000aa8a:	09b1                	addi	s3,s3,12
    8000aa8c:	0079f993          	andi	s3,s3,7
    8000aa90:	02098763          	beqz	s3,8000aabe <fdt_getprop_by_offset+0xba>
    8000aa94:	0044c783          	lbu	a5,4(s1)
    8000aa98:	0054c683          	lbu	a3,5(s1)
    8000aa9c:	0074c603          	lbu	a2,7(s1)
    8000aaa0:	0064c703          	lbu	a4,6(s1)
    8000aaa4:	0187979b          	slliw	a5,a5,0x18
    8000aaa8:	0106969b          	slliw	a3,a3,0x10
    8000aaac:	8fd5                	or	a5,a5,a3
    8000aaae:	0087171b          	slliw	a4,a4,0x8
    8000aab2:	8fd1                	or	a5,a5,a2
    8000aab4:	8fd9                	or	a5,a5,a4
    8000aab6:	2781                	sext.w	a5,a5
    8000aab8:	471d                	li	a4,7
    8000aaba:	00f76d63          	bltu	a4,a5,8000aad4 <fdt_getprop_by_offset+0xd0>
    8000aabe:	04b1                	addi	s1,s1,12
    8000aac0:	60a6                	ld	ra,72(sp)
    8000aac2:	6406                	ld	s0,64(sp)
    8000aac4:	7942                	ld	s2,48(sp)
    8000aac6:	79a2                	ld	s3,40(sp)
    8000aac8:	7a02                	ld	s4,32(sp)
    8000aaca:	6ae2                	ld	s5,24(sp)
    8000aacc:	8526                	mv	a0,s1
    8000aace:	74e2                	ld	s1,56(sp)
    8000aad0:	6161                	addi	sp,sp,80
    8000aad2:	8082                	ret
    8000aad4:	04c1                	addi	s1,s1,16
    8000aad6:	b7ed                	j	8000aac0 <fdt_getprop_by_offset+0xbc>
    8000aad8:	000a8663          	beqz	s5,8000aae4 <fdt_getprop_by_offset+0xe0>
    8000aadc:	fbc42783          	lw	a5,-68(s0)
    8000aae0:	00faa023          	sw	a5,0(s5)
    8000aae4:	4481                	li	s1,0
    8000aae6:	bfe9                	j	8000aac0 <fdt_getprop_by_offset+0xbc>

000000008000aae8 <fdt_getprop>:
    8000aae8:	7179                	addi	sp,sp,-48
    8000aaea:	f406                	sd	ra,40(sp)
    8000aaec:	f022                	sd	s0,32(sp)
    8000aaee:	ec26                	sd	s1,24(sp)
    8000aaf0:	e84a                	sd	s2,16(sp)
    8000aaf2:	e44e                	sd	s3,8(sp)
    8000aaf4:	e052                	sd	s4,0(sp)
    8000aaf6:	1800                	addi	s0,sp,48
    8000aaf8:	892a                	mv	s2,a0
    8000aafa:	8532                	mv	a0,a2
    8000aafc:	8a36                	mv	s4,a3
    8000aafe:	84b2                	mv	s1,a2
    8000ab00:	89ae                	mv	s3,a1
    8000ab02:	b16f90ef          	jal	ra,80003e18 <sbi_strlen>
    8000ab06:	8752                	mv	a4,s4
    8000ab08:	0005069b          	sext.w	a3,a0
    8000ab0c:	8626                	mv	a2,s1
    8000ab0e:	85ce                	mv	a1,s3
    8000ab10:	854a                	mv	a0,s2
    8000ab12:	d37ff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000ab16:	70a2                	ld	ra,40(sp)
    8000ab18:	7402                	ld	s0,32(sp)
    8000ab1a:	64e2                	ld	s1,24(sp)
    8000ab1c:	6942                	ld	s2,16(sp)
    8000ab1e:	69a2                	ld	s3,8(sp)
    8000ab20:	6a02                	ld	s4,0(sp)
    8000ab22:	6145                	addi	sp,sp,48
    8000ab24:	8082                	ret

000000008000ab26 <fdt_get_phandle>:
    8000ab26:	7179                	addi	sp,sp,-48
    8000ab28:	f022                	sd	s0,32(sp)
    8000ab2a:	ec26                	sd	s1,24(sp)
    8000ab2c:	e84a                	sd	s2,16(sp)
    8000ab2e:	1800                	addi	s0,sp,48
    8000ab30:	f406                	sd	ra,40(sp)
    8000ab32:	84aa                	mv	s1,a0
    8000ab34:	00002517          	auipc	a0,0x2
    8000ab38:	63450513          	addi	a0,a0,1588 # 8000d168 <__func__.0+0x28>
    8000ab3c:	892e                	mv	s2,a1
    8000ab3e:	adaf90ef          	jal	ra,80003e18 <sbi_strlen>
    8000ab42:	0005069b          	sext.w	a3,a0
    8000ab46:	fdc40713          	addi	a4,s0,-36
    8000ab4a:	00002617          	auipc	a2,0x2
    8000ab4e:	61e60613          	addi	a2,a2,1566 # 8000d168 <__func__.0+0x28>
    8000ab52:	85ca                	mv	a1,s2
    8000ab54:	8526                	mv	a0,s1
    8000ab56:	cf3ff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000ab5a:	c519                	beqz	a0,8000ab68 <fdt_get_phandle+0x42>
    8000ab5c:	fdc42683          	lw	a3,-36(s0)
    8000ab60:	4711                	li	a4,4
    8000ab62:	87aa                	mv	a5,a0
    8000ab64:	04e68263          	beq	a3,a4,8000aba8 <fdt_get_phandle+0x82>
    8000ab68:	00002517          	auipc	a0,0x2
    8000ab6c:	60850513          	addi	a0,a0,1544 # 8000d170 <__func__.0+0x30>
    8000ab70:	aa8f90ef          	jal	ra,80003e18 <sbi_strlen>
    8000ab74:	0005069b          	sext.w	a3,a0
    8000ab78:	fdc40713          	addi	a4,s0,-36
    8000ab7c:	00002617          	auipc	a2,0x2
    8000ab80:	5f460613          	addi	a2,a2,1524 # 8000d170 <__func__.0+0x30>
    8000ab84:	85ca                	mv	a1,s2
    8000ab86:	8526                	mv	a0,s1
    8000ab88:	cc1ff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000ab8c:	87aa                	mv	a5,a0
    8000ab8e:	c529                	beqz	a0,8000abd8 <fdt_get_phandle+0xb2>
    8000ab90:	fdc42683          	lw	a3,-36(s0)
    8000ab94:	4711                	li	a4,4
    8000ab96:	4501                	li	a0,0
    8000ab98:	00e68863          	beq	a3,a4,8000aba8 <fdt_get_phandle+0x82>
    8000ab9c:	70a2                	ld	ra,40(sp)
    8000ab9e:	7402                	ld	s0,32(sp)
    8000aba0:	64e2                	ld	s1,24(sp)
    8000aba2:	6942                	ld	s2,16(sp)
    8000aba4:	6145                	addi	sp,sp,48
    8000aba6:	8082                	ret
    8000aba8:	0007c503          	lbu	a0,0(a5)
    8000abac:	0017c703          	lbu	a4,1(a5)
    8000abb0:	0037c683          	lbu	a3,3(a5)
    8000abb4:	0027c783          	lbu	a5,2(a5)
    8000abb8:	0185151b          	slliw	a0,a0,0x18
    8000abbc:	0107171b          	slliw	a4,a4,0x10
    8000abc0:	70a2                	ld	ra,40(sp)
    8000abc2:	7402                	ld	s0,32(sp)
    8000abc4:	8d59                	or	a0,a0,a4
    8000abc6:	8d55                	or	a0,a0,a3
    8000abc8:	0087979b          	slliw	a5,a5,0x8
    8000abcc:	8d5d                	or	a0,a0,a5
    8000abce:	64e2                	ld	s1,24(sp)
    8000abd0:	6942                	ld	s2,16(sp)
    8000abd2:	2501                	sext.w	a0,a0
    8000abd4:	6145                	addi	sp,sp,48
    8000abd6:	8082                	ret
    8000abd8:	70a2                	ld	ra,40(sp)
    8000abda:	7402                	ld	s0,32(sp)
    8000abdc:	64e2                	ld	s1,24(sp)
    8000abde:	6942                	ld	s2,16(sp)
    8000abe0:	4501                	li	a0,0
    8000abe2:	6145                	addi	sp,sp,48
    8000abe4:	8082                	ret

000000008000abe6 <fdt_get_max_phandle>:
    8000abe6:	7179                	addi	sp,sp,-48
    8000abe8:	f022                	sd	s0,32(sp)
    8000abea:	e84a                	sd	s2,16(sp)
    8000abec:	f406                	sd	ra,40(sp)
    8000abee:	ec26                	sd	s1,24(sp)
    8000abf0:	e44e                	sd	s3,8(sp)
    8000abf2:	e052                	sd	s4,0(sp)
    8000abf4:	1800                	addi	s0,sp,48
    8000abf6:	4601                	li	a2,0
    8000abf8:	55fd                	li	a1,-1
    8000abfa:	892a                	mv	s2,a0
    8000abfc:	60f000ef          	jal	ra,8000ba0a <fdt_next_node>
    8000ac00:	57fd                	li	a5,-1
    8000ac02:	04f50863          	beq	a0,a5,8000ac52 <fdt_get_max_phandle+0x6c>
    8000ac06:	84aa                	mv	s1,a0
    8000ac08:	4981                	li	s3,0
    8000ac0a:	5a7d                	li	s4,-1
    8000ac0c:	0404c163          	bltz	s1,8000ac4e <fdt_get_max_phandle+0x68>
    8000ac10:	85a6                	mv	a1,s1
    8000ac12:	854a                	mv	a0,s2
    8000ac14:	f13ff0ef          	jal	ra,8000ab26 <fdt_get_phandle>
    8000ac18:	87aa                	mv	a5,a0
    8000ac1a:	2781                	sext.w	a5,a5
    8000ac1c:	85a6                	mv	a1,s1
    8000ac1e:	4601                	li	a2,0
    8000ac20:	854a                	mv	a0,s2
    8000ac22:	01478863          	beq	a5,s4,8000ac32 <fdt_get_max_phandle+0x4c>
    8000ac26:	873e                	mv	a4,a5
    8000ac28:	0137f363          	bgeu	a5,s3,8000ac2e <fdt_get_max_phandle+0x48>
    8000ac2c:	874e                	mv	a4,s3
    8000ac2e:	0007099b          	sext.w	s3,a4
    8000ac32:	5d9000ef          	jal	ra,8000ba0a <fdt_next_node>
    8000ac36:	84aa                	mv	s1,a0
    8000ac38:	fd451ae3          	bne	a0,s4,8000ac0c <fdt_get_max_phandle+0x26>
    8000ac3c:	70a2                	ld	ra,40(sp)
    8000ac3e:	7402                	ld	s0,32(sp)
    8000ac40:	64e2                	ld	s1,24(sp)
    8000ac42:	6942                	ld	s2,16(sp)
    8000ac44:	6a02                	ld	s4,0(sp)
    8000ac46:	854e                	mv	a0,s3
    8000ac48:	69a2                	ld	s3,8(sp)
    8000ac4a:	6145                	addi	sp,sp,48
    8000ac4c:	8082                	ret
    8000ac4e:	59fd                	li	s3,-1
    8000ac50:	b7f5                	j	8000ac3c <fdt_get_max_phandle+0x56>
    8000ac52:	4981                	li	s3,0
    8000ac54:	b7e5                	j	8000ac3c <fdt_get_max_phandle+0x56>

000000008000ac56 <fdt_get_alias_namelen>:
    8000ac56:	7179                	addi	sp,sp,-48
    8000ac58:	f022                	sd	s0,32(sp)
    8000ac5a:	ec26                	sd	s1,24(sp)
    8000ac5c:	e84a                	sd	s2,16(sp)
    8000ac5e:	e44e                	sd	s3,8(sp)
    8000ac60:	f406                	sd	ra,40(sp)
    8000ac62:	1800                	addi	s0,sp,48
    8000ac64:	84aa                	mv	s1,a0
    8000ac66:	00002517          	auipc	a0,0x2
    8000ac6a:	4f250513          	addi	a0,a0,1266 # 8000d158 <__func__.0+0x18>
    8000ac6e:	892e                	mv	s2,a1
    8000ac70:	89b2                	mv	s3,a2
    8000ac72:	9a6f90ef          	jal	ra,80003e18 <sbi_strlen>
    8000ac76:	0005061b          	sext.w	a2,a0
    8000ac7a:	00002597          	auipc	a1,0x2
    8000ac7e:	4de58593          	addi	a1,a1,1246 # 8000d158 <__func__.0+0x18>
    8000ac82:	8526                	mv	a0,s1
    8000ac84:	c49ff0ef          	jal	ra,8000a8cc <fdt_path_offset_namelen>
    8000ac88:	02054063          	bltz	a0,8000aca8 <fdt_get_alias_namelen+0x52>
    8000ac8c:	85aa                	mv	a1,a0
    8000ac8e:	86ce                	mv	a3,s3
    8000ac90:	864a                	mv	a2,s2
    8000ac92:	8526                	mv	a0,s1
    8000ac94:	4701                	li	a4,0
    8000ac96:	bb3ff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000ac9a:	70a2                	ld	ra,40(sp)
    8000ac9c:	7402                	ld	s0,32(sp)
    8000ac9e:	64e2                	ld	s1,24(sp)
    8000aca0:	6942                	ld	s2,16(sp)
    8000aca2:	69a2                	ld	s3,8(sp)
    8000aca4:	6145                	addi	sp,sp,48
    8000aca6:	8082                	ret
    8000aca8:	70a2                	ld	ra,40(sp)
    8000acaa:	7402                	ld	s0,32(sp)
    8000acac:	64e2                	ld	s1,24(sp)
    8000acae:	6942                	ld	s2,16(sp)
    8000acb0:	69a2                	ld	s3,8(sp)
    8000acb2:	4501                	li	a0,0
    8000acb4:	6145                	addi	sp,sp,48
    8000acb6:	8082                	ret

000000008000acb8 <fdt_get_alias>:
    8000acb8:	7179                	addi	sp,sp,-48
    8000acba:	f406                	sd	ra,40(sp)
    8000acbc:	f022                	sd	s0,32(sp)
    8000acbe:	ec26                	sd	s1,24(sp)
    8000acc0:	e84a                	sd	s2,16(sp)
    8000acc2:	e44e                	sd	s3,8(sp)
    8000acc4:	1800                	addi	s0,sp,48
    8000acc6:	84aa                	mv	s1,a0
    8000acc8:	852e                	mv	a0,a1
    8000acca:	892e                	mv	s2,a1
    8000accc:	94cf90ef          	jal	ra,80003e18 <sbi_strlen>
    8000acd0:	89aa                	mv	s3,a0
    8000acd2:	00002517          	auipc	a0,0x2
    8000acd6:	48650513          	addi	a0,a0,1158 # 8000d158 <__func__.0+0x18>
    8000acda:	93ef90ef          	jal	ra,80003e18 <sbi_strlen>
    8000acde:	0005061b          	sext.w	a2,a0
    8000ace2:	00002597          	auipc	a1,0x2
    8000ace6:	47658593          	addi	a1,a1,1142 # 8000d158 <__func__.0+0x18>
    8000acea:	8526                	mv	a0,s1
    8000acec:	be1ff0ef          	jal	ra,8000a8cc <fdt_path_offset_namelen>
    8000acf0:	02054163          	bltz	a0,8000ad12 <fdt_get_alias+0x5a>
    8000acf4:	2981                	sext.w	s3,s3
    8000acf6:	85aa                	mv	a1,a0
    8000acf8:	86ce                	mv	a3,s3
    8000acfa:	864a                	mv	a2,s2
    8000acfc:	8526                	mv	a0,s1
    8000acfe:	4701                	li	a4,0
    8000ad00:	b49ff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000ad04:	70a2                	ld	ra,40(sp)
    8000ad06:	7402                	ld	s0,32(sp)
    8000ad08:	64e2                	ld	s1,24(sp)
    8000ad0a:	6942                	ld	s2,16(sp)
    8000ad0c:	69a2                	ld	s3,8(sp)
    8000ad0e:	6145                	addi	sp,sp,48
    8000ad10:	8082                	ret
    8000ad12:	70a2                	ld	ra,40(sp)
    8000ad14:	7402                	ld	s0,32(sp)
    8000ad16:	64e2                	ld	s1,24(sp)
    8000ad18:	6942                	ld	s2,16(sp)
    8000ad1a:	69a2                	ld	s3,8(sp)
    8000ad1c:	4501                	li	a0,0
    8000ad1e:	6145                	addi	sp,sp,48
    8000ad20:	8082                	ret

000000008000ad22 <fdt_get_path>:
    8000ad22:	7159                	addi	sp,sp,-112
    8000ad24:	f0a2                	sd	s0,96(sp)
    8000ad26:	e0d2                	sd	s4,64(sp)
    8000ad28:	fc56                	sd	s5,56(sp)
    8000ad2a:	f85a                	sd	s6,48(sp)
    8000ad2c:	f45e                	sd	s7,40(sp)
    8000ad2e:	f062                	sd	s8,32(sp)
    8000ad30:	f486                	sd	ra,104(sp)
    8000ad32:	eca6                	sd	s1,88(sp)
    8000ad34:	e8ca                	sd	s2,80(sp)
    8000ad36:	e4ce                	sd	s3,72(sp)
    8000ad38:	ec66                	sd	s9,24(sp)
    8000ad3a:	1880                	addi	s0,sp,112
    8000ad3c:	8b2a                	mv	s6,a0
    8000ad3e:	8a2e                	mv	s4,a1
    8000ad40:	8c32                	mv	s8,a2
    8000ad42:	8bb6                	mv	s7,a3
    8000ad44:	726000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000ad48:	8aaa                	mv	s5,a0
    8000ad4a:	e509                	bnez	a0,8000ad54 <fdt_get_path+0x32>
    8000ad4c:	4785                	li	a5,1
    8000ad4e:	0377c163          	blt	a5,s7,8000ad70 <fdt_get_path+0x4e>
    8000ad52:	5af5                	li	s5,-3
    8000ad54:	70a6                	ld	ra,104(sp)
    8000ad56:	7406                	ld	s0,96(sp)
    8000ad58:	64e6                	ld	s1,88(sp)
    8000ad5a:	6946                	ld	s2,80(sp)
    8000ad5c:	69a6                	ld	s3,72(sp)
    8000ad5e:	6a06                	ld	s4,64(sp)
    8000ad60:	7b42                	ld	s6,48(sp)
    8000ad62:	7ba2                	ld	s7,40(sp)
    8000ad64:	7c02                	ld	s8,32(sp)
    8000ad66:	6ce2                	ld	s9,24(sp)
    8000ad68:	8556                	mv	a0,s5
    8000ad6a:	7ae2                	ld	s5,56(sp)
    8000ad6c:	6165                	addi	sp,sp,112
    8000ad6e:	8082                	ret
    8000ad70:	f8042c23          	sw	zero,-104(s0)
    8000ad74:	4c81                	li	s9,0
    8000ad76:	4481                	li	s1,0
    8000ad78:	4981                	li	s3,0
    8000ad7a:	02f00913          	li	s2,47
    8000ad7e:	0b9a4063          	blt	s4,s9,8000ae1e <fdt_get_path+0xfc>
    8000ad82:	f9842683          	lw	a3,-104(s0)
    8000ad86:	0136de63          	bge	a3,s3,8000ada2 <fdt_get_path+0x80>
    8000ad8a:	ffe48793          	addi	a5,s1,-2
    8000ad8e:	97e2                	add	a5,a5,s8
    8000ad90:	0007c703          	lbu	a4,0(a5)
    8000ad94:	34fd                	addiw	s1,s1,-1
    8000ad96:	17fd                	addi	a5,a5,-1
    8000ad98:	ff271ce3          	bne	a4,s2,8000ad90 <fdt_get_path+0x6e>
    8000ad9c:	39fd                	addiw	s3,s3,-1
    8000ad9e:	ff3696e3          	bne	a3,s3,8000ad8a <fdt_get_path+0x68>
    8000ada2:	02d9d663          	bge	s3,a3,8000adce <fdt_get_path+0xac>
    8000ada6:	079a0063          	beq	s4,s9,8000ae06 <fdt_get_path+0xe4>
    8000adaa:	85e6                	mv	a1,s9
    8000adac:	f9840613          	addi	a2,s0,-104
    8000adb0:	855a                	mv	a0,s6
    8000adb2:	459000ef          	jal	ra,8000ba0a <fdt_next_node>
    8000adb6:	8caa                	mv	s9,a0
    8000adb8:	fc0553e3          	bgez	a0,8000ad7e <fdt_get_path+0x5c>
    8000adbc:	57fd                	li	a5,-1
    8000adbe:	06f50063          	beq	a0,a5,8000ae1e <fdt_get_path+0xfc>
    8000adc2:	57f1                	li	a5,-4
    8000adc4:	8aaa                	mv	s5,a0
    8000adc6:	f8f517e3          	bne	a0,a5,8000ad54 <fdt_get_path+0x32>
    8000adca:	5ad5                	li	s5,-11
    8000adcc:	b761                	j	8000ad54 <fdt_get_path+0x32>
    8000adce:	85e6                	mv	a1,s9
    8000add0:	f9c40613          	addi	a2,s0,-100
    8000add4:	855a                	mv	a0,s6
    8000add6:	e8cff0ef          	jal	ra,8000a462 <fdt_get_name>
    8000adda:	85aa                	mv	a1,a0
    8000addc:	c139                	beqz	a0,8000ae22 <fdt_get_path+0x100>
    8000adde:	f9c42603          	lw	a2,-100(s0)
    8000ade2:	009607bb          	addw	a5,a2,s1
    8000ade6:	fd77d0e3          	bge	a5,s7,8000ada6 <fdt_get_path+0x84>
    8000adea:	009c0533          	add	a0,s8,s1
    8000adee:	960f90ef          	jal	ra,80003f4e <sbi_memcpy>
    8000adf2:	f9c42783          	lw	a5,-100(s0)
    8000adf6:	2985                	addiw	s3,s3,1
    8000adf8:	9fa5                	addw	a5,a5,s1
    8000adfa:	84be                	mv	s1,a5
    8000adfc:	97e2                	add	a5,a5,s8
    8000adfe:	2485                	addiw	s1,s1,1
    8000ae00:	01278023          	sb	s2,0(a5)
    8000ae04:	b74d                	j	8000ada6 <fdt_get_path+0x84>
    8000ae06:	f9842783          	lw	a5,-104(s0)
    8000ae0a:	f537d4e3          	bge	a5,s3,8000ad52 <fdt_get_path+0x30>
    8000ae0e:	4785                	li	a5,1
    8000ae10:	0097d363          	bge	a5,s1,8000ae16 <fdt_get_path+0xf4>
    8000ae14:	34fd                	addiw	s1,s1,-1
    8000ae16:	94e2                	add	s1,s1,s8
    8000ae18:	00048023          	sb	zero,0(s1)
    8000ae1c:	bf25                	j	8000ad54 <fdt_get_path+0x32>
    8000ae1e:	5af1                	li	s5,-4
    8000ae20:	bf15                	j	8000ad54 <fdt_get_path+0x32>
    8000ae22:	f9c42a83          	lw	s5,-100(s0)
    8000ae26:	b73d                	j	8000ad54 <fdt_get_path+0x32>

000000008000ae28 <fdt_supernode_atdepth_offset>:
    8000ae28:	715d                	addi	sp,sp,-80
    8000ae2a:	e0a2                	sd	s0,64(sp)
    8000ae2c:	fc26                	sd	s1,56(sp)
    8000ae2e:	f84a                	sd	s2,48(sp)
    8000ae30:	f44e                	sd	s3,40(sp)
    8000ae32:	f052                	sd	s4,32(sp)
    8000ae34:	e486                	sd	ra,72(sp)
    8000ae36:	ec56                	sd	s5,24(sp)
    8000ae38:	0880                	addi	s0,sp,80
    8000ae3a:	89aa                	mv	s3,a0
    8000ae3c:	84ae                	mv	s1,a1
    8000ae3e:	8932                	mv	s2,a2
    8000ae40:	8a36                	mv	s4,a3
    8000ae42:	628000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000ae46:	87aa                	mv	a5,a0
    8000ae48:	e501                	bnez	a0,8000ae50 <fdt_supernode_atdepth_offset+0x28>
    8000ae4a:	00095d63          	bgez	s2,8000ae64 <fdt_supernode_atdepth_offset+0x3c>
    8000ae4e:	57fd                	li	a5,-1
    8000ae50:	60a6                	ld	ra,72(sp)
    8000ae52:	6406                	ld	s0,64(sp)
    8000ae54:	74e2                	ld	s1,56(sp)
    8000ae56:	7942                	ld	s2,48(sp)
    8000ae58:	79a2                	ld	s3,40(sp)
    8000ae5a:	7a02                	ld	s4,32(sp)
    8000ae5c:	6ae2                	ld	s5,24(sp)
    8000ae5e:	853e                	mv	a0,a5
    8000ae60:	6161                	addi	sp,sp,80
    8000ae62:	8082                	ret
    8000ae64:	fa042e23          	sw	zero,-68(s0)
    8000ae68:	5acd                	li	s5,-13
    8000ae6a:	85be                	mv	a1,a5
    8000ae6c:	fbc40613          	addi	a2,s0,-68
    8000ae70:	854e                	mv	a0,s3
    8000ae72:	02f4c763          	blt	s1,a5,8000aea0 <fdt_supernode_atdepth_offset+0x78>
    8000ae76:	fbc42703          	lw	a4,-68(s0)
    8000ae7a:	02e90163          	beq	s2,a4,8000ae9c <fdt_supernode_atdepth_offset+0x74>
    8000ae7e:	02f48363          	beq	s1,a5,8000aea4 <fdt_supernode_atdepth_offset+0x7c>
    8000ae82:	389000ef          	jal	ra,8000ba0a <fdt_next_node>
    8000ae86:	87aa                	mv	a5,a0
    8000ae88:	fe0551e3          	bgez	a0,8000ae6a <fdt_supernode_atdepth_offset+0x42>
    8000ae8c:	577d                	li	a4,-1
    8000ae8e:	00e50963          	beq	a0,a4,8000aea0 <fdt_supernode_atdepth_offset+0x78>
    8000ae92:	5771                	li	a4,-4
    8000ae94:	fae51ee3          	bne	a0,a4,8000ae50 <fdt_supernode_atdepth_offset+0x28>
    8000ae98:	57d5                	li	a5,-11
    8000ae9a:	bf5d                	j	8000ae50 <fdt_supernode_atdepth_offset+0x28>
    8000ae9c:	8abe                	mv	s5,a5
    8000ae9e:	b7c5                	j	8000ae7e <fdt_supernode_atdepth_offset+0x56>
    8000aea0:	57f1                	li	a5,-4
    8000aea2:	b77d                	j	8000ae50 <fdt_supernode_atdepth_offset+0x28>
    8000aea4:	000a0463          	beqz	s4,8000aeac <fdt_supernode_atdepth_offset+0x84>
    8000aea8:	00ea2023          	sw	a4,0(s4)
    8000aeac:	fb2741e3          	blt	a4,s2,8000ae4e <fdt_supernode_atdepth_offset+0x26>
    8000aeb0:	87d6                	mv	a5,s5
    8000aeb2:	bf79                	j	8000ae50 <fdt_supernode_atdepth_offset+0x28>

000000008000aeb4 <fdt_node_depth>:
    8000aeb4:	1101                	addi	sp,sp,-32
    8000aeb6:	e822                	sd	s0,16(sp)
    8000aeb8:	ec06                	sd	ra,24(sp)
    8000aeba:	1000                	addi	s0,sp,32
    8000aebc:	fec40693          	addi	a3,s0,-20
    8000aec0:	4601                	li	a2,0
    8000aec2:	f67ff0ef          	jal	ra,8000ae28 <fdt_supernode_atdepth_offset>
    8000aec6:	e519                	bnez	a0,8000aed4 <fdt_node_depth+0x20>
    8000aec8:	fec42503          	lw	a0,-20(s0)
    8000aecc:	60e2                	ld	ra,24(sp)
    8000aece:	6442                	ld	s0,16(sp)
    8000aed0:	6105                	addi	sp,sp,32
    8000aed2:	8082                	ret
    8000aed4:	fe054ce3          	bltz	a0,8000aecc <fdt_node_depth+0x18>
    8000aed8:	60e2                	ld	ra,24(sp)
    8000aeda:	6442                	ld	s0,16(sp)
    8000aedc:	554d                	li	a0,-13
    8000aede:	6105                	addi	sp,sp,32
    8000aee0:	8082                	ret

000000008000aee2 <fdt_parent_offset>:
    8000aee2:	7179                	addi	sp,sp,-48
    8000aee4:	f022                	sd	s0,32(sp)
    8000aee6:	ec26                	sd	s1,24(sp)
    8000aee8:	e84a                	sd	s2,16(sp)
    8000aeea:	1800                	addi	s0,sp,48
    8000aeec:	f406                	sd	ra,40(sp)
    8000aeee:	fdc40693          	addi	a3,s0,-36
    8000aef2:	4601                	li	a2,0
    8000aef4:	84aa                	mv	s1,a0
    8000aef6:	892e                	mv	s2,a1
    8000aef8:	f31ff0ef          	jal	ra,8000ae28 <fdt_supernode_atdepth_offset>
    8000aefc:	e115                	bnez	a0,8000af20 <fdt_parent_offset+0x3e>
    8000aefe:	fdc42503          	lw	a0,-36(s0)
    8000af02:	00054963          	bltz	a0,8000af14 <fdt_parent_offset+0x32>
    8000af06:	fff5061b          	addiw	a2,a0,-1
    8000af0a:	4681                	li	a3,0
    8000af0c:	85ca                	mv	a1,s2
    8000af0e:	8526                	mv	a0,s1
    8000af10:	f19ff0ef          	jal	ra,8000ae28 <fdt_supernode_atdepth_offset>
    8000af14:	70a2                	ld	ra,40(sp)
    8000af16:	7402                	ld	s0,32(sp)
    8000af18:	64e2                	ld	s1,24(sp)
    8000af1a:	6942                	ld	s2,16(sp)
    8000af1c:	6145                	addi	sp,sp,48
    8000af1e:	8082                	ret
    8000af20:	fe054ae3          	bltz	a0,8000af14 <fdt_parent_offset+0x32>
    8000af24:	70a2                	ld	ra,40(sp)
    8000af26:	7402                	ld	s0,32(sp)
    8000af28:	64e2                	ld	s1,24(sp)
    8000af2a:	6942                	ld	s2,16(sp)
    8000af2c:	554d                	li	a0,-13
    8000af2e:	6145                	addi	sp,sp,48
    8000af30:	8082                	ret

000000008000af32 <fdt_node_offset_by_prop_value>:
    8000af32:	715d                	addi	sp,sp,-80
    8000af34:	e0a2                	sd	s0,64(sp)
    8000af36:	fc26                	sd	s1,56(sp)
    8000af38:	f84a                	sd	s2,48(sp)
    8000af3a:	f44e                	sd	s3,40(sp)
    8000af3c:	f052                	sd	s4,32(sp)
    8000af3e:	ec56                	sd	s5,24(sp)
    8000af40:	e85a                	sd	s6,16(sp)
    8000af42:	e486                	sd	ra,72(sp)
    8000af44:	0880                	addi	s0,sp,80
    8000af46:	892a                	mv	s2,a0
    8000af48:	8b2e                	mv	s6,a1
    8000af4a:	89b2                	mv	s3,a2
    8000af4c:	8ab6                	mv	s5,a3
    8000af4e:	8a3a                	mv	s4,a4
    8000af50:	51a000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000af54:	84aa                	mv	s1,a0
    8000af56:	cd01                	beqz	a0,8000af6e <fdt_node_offset_by_prop_value+0x3c>
    8000af58:	60a6                	ld	ra,72(sp)
    8000af5a:	6406                	ld	s0,64(sp)
    8000af5c:	7942                	ld	s2,48(sp)
    8000af5e:	79a2                	ld	s3,40(sp)
    8000af60:	7a02                	ld	s4,32(sp)
    8000af62:	6ae2                	ld	s5,24(sp)
    8000af64:	6b42                	ld	s6,16(sp)
    8000af66:	8526                	mv	a0,s1
    8000af68:	74e2                	ld	s1,56(sp)
    8000af6a:	6161                	addi	sp,sp,80
    8000af6c:	8082                	ret
    8000af6e:	4601                	li	a2,0
    8000af70:	85da                	mv	a1,s6
    8000af72:	854a                	mv	a0,s2
    8000af74:	297000ef          	jal	ra,8000ba0a <fdt_next_node>
    8000af78:	84aa                	mv	s1,a0
    8000af7a:	00055b63          	bgez	a0,8000af90 <fdt_node_offset_by_prop_value+0x5e>
    8000af7e:	bfe9                	j	8000af58 <fdt_node_offset_by_prop_value+0x26>
    8000af80:	85a6                	mv	a1,s1
    8000af82:	4601                	li	a2,0
    8000af84:	854a                	mv	a0,s2
    8000af86:	285000ef          	jal	ra,8000ba0a <fdt_next_node>
    8000af8a:	84aa                	mv	s1,a0
    8000af8c:	fc0546e3          	bltz	a0,8000af58 <fdt_node_offset_by_prop_value+0x26>
    8000af90:	854e                	mv	a0,s3
    8000af92:	e87f80ef          	jal	ra,80003e18 <sbi_strlen>
    8000af96:	0005069b          	sext.w	a3,a0
    8000af9a:	fbc40713          	addi	a4,s0,-68
    8000af9e:	85a6                	mv	a1,s1
    8000afa0:	864e                	mv	a2,s3
    8000afa2:	854a                	mv	a0,s2
    8000afa4:	8a5ff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000afa8:	dd61                	beqz	a0,8000af80 <fdt_node_offset_by_prop_value+0x4e>
    8000afaa:	fbc42783          	lw	a5,-68(s0)
    8000afae:	fd4799e3          	bne	a5,s4,8000af80 <fdt_node_offset_by_prop_value+0x4e>
    8000afb2:	8652                	mv	a2,s4
    8000afb4:	85d6                	mv	a1,s5
    8000afb6:	80af90ef          	jal	ra,80003fc0 <sbi_memcmp>
    8000afba:	f179                	bnez	a0,8000af80 <fdt_node_offset_by_prop_value+0x4e>
    8000afbc:	bf71                	j	8000af58 <fdt_node_offset_by_prop_value+0x26>

000000008000afbe <fdt_node_offset_by_phandle>:
    8000afbe:	7179                	addi	sp,sp,-48
    8000afc0:	f022                	sd	s0,32(sp)
    8000afc2:	f406                	sd	ra,40(sp)
    8000afc4:	ec26                	sd	s1,24(sp)
    8000afc6:	e84a                	sd	s2,16(sp)
    8000afc8:	e44e                	sd	s3,8(sp)
    8000afca:	1800                	addi	s0,sp,48
    8000afcc:	fff5871b          	addiw	a4,a1,-1
    8000afd0:	57f5                	li	a5,-3
    8000afd2:	04e7ec63          	bltu	a5,a4,8000b02a <fdt_node_offset_by_phandle+0x6c>
    8000afd6:	89ae                	mv	s3,a1
    8000afd8:	892a                	mv	s2,a0
    8000afda:	490000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000afde:	84aa                	mv	s1,a0
    8000afe0:	c909                	beqz	a0,8000aff2 <fdt_node_offset_by_phandle+0x34>
    8000afe2:	70a2                	ld	ra,40(sp)
    8000afe4:	7402                	ld	s0,32(sp)
    8000afe6:	6942                	ld	s2,16(sp)
    8000afe8:	69a2                	ld	s3,8(sp)
    8000afea:	8526                	mv	a0,s1
    8000afec:	64e2                	ld	s1,24(sp)
    8000afee:	6145                	addi	sp,sp,48
    8000aff0:	8082                	ret
    8000aff2:	4601                	li	a2,0
    8000aff4:	55fd                	li	a1,-1
    8000aff6:	854a                	mv	a0,s2
    8000aff8:	a821                	j	8000b010 <fdt_node_offset_by_phandle+0x52>
    8000affa:	85aa                	mv	a1,a0
    8000affc:	854a                	mv	a0,s2
    8000affe:	b29ff0ef          	jal	ra,8000ab26 <fdt_get_phandle>
    8000b002:	87aa                	mv	a5,a0
    8000b004:	2781                	sext.w	a5,a5
    8000b006:	85a6                	mv	a1,s1
    8000b008:	4601                	li	a2,0
    8000b00a:	854a                	mv	a0,s2
    8000b00c:	fd378be3          	beq	a5,s3,8000afe2 <fdt_node_offset_by_phandle+0x24>
    8000b010:	1fb000ef          	jal	ra,8000ba0a <fdt_next_node>
    8000b014:	84aa                	mv	s1,a0
    8000b016:	fe0552e3          	bgez	a0,8000affa <fdt_node_offset_by_phandle+0x3c>
    8000b01a:	70a2                	ld	ra,40(sp)
    8000b01c:	7402                	ld	s0,32(sp)
    8000b01e:	6942                	ld	s2,16(sp)
    8000b020:	69a2                	ld	s3,8(sp)
    8000b022:	8526                	mv	a0,s1
    8000b024:	64e2                	ld	s1,24(sp)
    8000b026:	6145                	addi	sp,sp,48
    8000b028:	8082                	ret
    8000b02a:	54e9                	li	s1,-6
    8000b02c:	bf5d                	j	8000afe2 <fdt_node_offset_by_phandle+0x24>

000000008000b02e <fdt_stringlist_contains>:
    8000b02e:	7139                	addi	sp,sp,-64
    8000b030:	f822                	sd	s0,48(sp)
    8000b032:	f426                	sd	s1,40(sp)
    8000b034:	f04a                	sd	s2,32(sp)
    8000b036:	ec4e                	sd	s3,24(sp)
    8000b038:	e852                	sd	s4,16(sp)
    8000b03a:	e456                	sd	s5,8(sp)
    8000b03c:	fc06                	sd	ra,56(sp)
    8000b03e:	0080                	addi	s0,sp,64
    8000b040:	892a                	mv	s2,a0
    8000b042:	8532                	mv	a0,a2
    8000b044:	8a32                	mv	s4,a2
    8000b046:	84ae                	mv	s1,a1
    8000b048:	dd1f80ef          	jal	ra,80003e18 <sbi_strlen>
    8000b04c:	00050a9b          	sext.w	s5,a0
    8000b050:	0015099b          	addiw	s3,a0,1
    8000b054:	0154df63          	bge	s1,s5,8000b072 <fdt_stringlist_contains+0x44>
    8000b058:	a80d                	j	8000b08a <fdt_stringlist_contains+0x5c>
    8000b05a:	f99f80ef          	jal	ra,80003ff2 <sbi_memchr>
    8000b05e:	34fd                	addiw	s1,s1,-1
    8000b060:	41250933          	sub	s2,a0,s2
    8000b064:	412484bb          	subw	s1,s1,s2
    8000b068:	c10d                	beqz	a0,8000b08a <fdt_stringlist_contains+0x5c>
    8000b06a:	00150913          	addi	s2,a0,1
    8000b06e:	0154ce63          	blt	s1,s5,8000b08a <fdt_stringlist_contains+0x5c>
    8000b072:	85ca                	mv	a1,s2
    8000b074:	864e                	mv	a2,s3
    8000b076:	8552                	mv	a0,s4
    8000b078:	f49f80ef          	jal	ra,80003fc0 <sbi_memcmp>
    8000b07c:	87aa                	mv	a5,a0
    8000b07e:	8626                	mv	a2,s1
    8000b080:	854a                	mv	a0,s2
    8000b082:	4581                	li	a1,0
    8000b084:	fbf9                	bnez	a5,8000b05a <fdt_stringlist_contains+0x2c>
    8000b086:	4505                	li	a0,1
    8000b088:	a011                	j	8000b08c <fdt_stringlist_contains+0x5e>
    8000b08a:	4501                	li	a0,0
    8000b08c:	70e2                	ld	ra,56(sp)
    8000b08e:	7442                	ld	s0,48(sp)
    8000b090:	74a2                	ld	s1,40(sp)
    8000b092:	7902                	ld	s2,32(sp)
    8000b094:	69e2                	ld	s3,24(sp)
    8000b096:	6a42                	ld	s4,16(sp)
    8000b098:	6aa2                	ld	s5,8(sp)
    8000b09a:	6121                	addi	sp,sp,64
    8000b09c:	8082                	ret

000000008000b09e <fdt_stringlist_count>:
    8000b09e:	7139                	addi	sp,sp,-64
    8000b0a0:	f822                	sd	s0,48(sp)
    8000b0a2:	f426                	sd	s1,40(sp)
    8000b0a4:	f04a                	sd	s2,32(sp)
    8000b0a6:	ec4e                	sd	s3,24(sp)
    8000b0a8:	0080                	addi	s0,sp,64
    8000b0aa:	fc06                	sd	ra,56(sp)
    8000b0ac:	892a                	mv	s2,a0
    8000b0ae:	8532                	mv	a0,a2
    8000b0b0:	84b2                	mv	s1,a2
    8000b0b2:	89ae                	mv	s3,a1
    8000b0b4:	d65f80ef          	jal	ra,80003e18 <sbi_strlen>
    8000b0b8:	0005069b          	sext.w	a3,a0
    8000b0bc:	fcc40713          	addi	a4,s0,-52
    8000b0c0:	8626                	mv	a2,s1
    8000b0c2:	85ce                	mv	a1,s3
    8000b0c4:	854a                	mv	a0,s2
    8000b0c6:	f82ff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000b0ca:	c129                	beqz	a0,8000b10c <fdt_stringlist_count+0x6e>
    8000b0cc:	fcc42903          	lw	s2,-52(s0)
    8000b0d0:	84aa                	mv	s1,a0
    8000b0d2:	4981                	li	s3,0
    8000b0d4:	992a                	add	s2,s2,a0
    8000b0d6:	01256663          	bltu	a0,s2,8000b0e2 <fdt_stringlist_count+0x44>
    8000b0da:	a00d                	j	8000b0fc <fdt_stringlist_count+0x5e>
    8000b0dc:	2985                	addiw	s3,s3,1
    8000b0de:	0124ff63          	bgeu	s1,s2,8000b0fc <fdt_stringlist_count+0x5e>
    8000b0e2:	409905b3          	sub	a1,s2,s1
    8000b0e6:	8526                	mv	a0,s1
    8000b0e8:	d5bf80ef          	jal	ra,80003e42 <sbi_strnlen>
    8000b0ec:	0015079b          	addiw	a5,a0,1
    8000b0f0:	fcf42623          	sw	a5,-52(s0)
    8000b0f4:	94be                	add	s1,s1,a5
    8000b0f6:	fe9973e3          	bgeu	s2,s1,8000b0dc <fdt_stringlist_count+0x3e>
    8000b0fa:	59c5                	li	s3,-15
    8000b0fc:	70e2                	ld	ra,56(sp)
    8000b0fe:	7442                	ld	s0,48(sp)
    8000b100:	74a2                	ld	s1,40(sp)
    8000b102:	7902                	ld	s2,32(sp)
    8000b104:	854e                	mv	a0,s3
    8000b106:	69e2                	ld	s3,24(sp)
    8000b108:	6121                	addi	sp,sp,64
    8000b10a:	8082                	ret
    8000b10c:	fcc42983          	lw	s3,-52(s0)
    8000b110:	70e2                	ld	ra,56(sp)
    8000b112:	7442                	ld	s0,48(sp)
    8000b114:	74a2                	ld	s1,40(sp)
    8000b116:	7902                	ld	s2,32(sp)
    8000b118:	854e                	mv	a0,s3
    8000b11a:	69e2                	ld	s3,24(sp)
    8000b11c:	6121                	addi	sp,sp,64
    8000b11e:	8082                	ret

000000008000b120 <fdt_stringlist_search>:
    8000b120:	715d                	addi	sp,sp,-80
    8000b122:	e0a2                	sd	s0,64(sp)
    8000b124:	fc26                	sd	s1,56(sp)
    8000b126:	f84a                	sd	s2,48(sp)
    8000b128:	f44e                	sd	s3,40(sp)
    8000b12a:	ec56                	sd	s5,24(sp)
    8000b12c:	0880                	addi	s0,sp,80
    8000b12e:	e486                	sd	ra,72(sp)
    8000b130:	f052                	sd	s4,32(sp)
    8000b132:	892a                	mv	s2,a0
    8000b134:	8532                	mv	a0,a2
    8000b136:	84b2                	mv	s1,a2
    8000b138:	89ae                	mv	s3,a1
    8000b13a:	8ab6                	mv	s5,a3
    8000b13c:	cddf80ef          	jal	ra,80003e18 <sbi_strlen>
    8000b140:	0005069b          	sext.w	a3,a0
    8000b144:	fbc40713          	addi	a4,s0,-68
    8000b148:	8626                	mv	a2,s1
    8000b14a:	85ce                	mv	a1,s3
    8000b14c:	854a                	mv	a0,s2
    8000b14e:	efaff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000b152:	c925                	beqz	a0,8000b1c2 <fdt_stringlist_search+0xa2>
    8000b154:	84aa                	mv	s1,a0
    8000b156:	8556                	mv	a0,s5
    8000b158:	cc1f80ef          	jal	ra,80003e18 <sbi_strlen>
    8000b15c:	fbc42903          	lw	s2,-68(s0)
    8000b160:	00150a1b          	addiw	s4,a0,1
    8000b164:	4981                	li	s3,0
    8000b166:	9926                	add	s2,s2,s1
    8000b168:	0124e763          	bltu	s1,s2,8000b176 <fdt_stringlist_search+0x56>
    8000b16c:	a081                	j	8000b1ac <fdt_stringlist_search+0x8c>
    8000b16e:	84ba                	mv	s1,a4
    8000b170:	2985                	addiw	s3,s3,1
    8000b172:	0324fd63          	bgeu	s1,s2,8000b1ac <fdt_stringlist_search+0x8c>
    8000b176:	409905b3          	sub	a1,s2,s1
    8000b17a:	8526                	mv	a0,s1
    8000b17c:	cc7f80ef          	jal	ra,80003e42 <sbi_strnlen>
    8000b180:	0015079b          	addiw	a5,a0,1
    8000b184:	faf42e23          	sw	a5,-68(s0)
    8000b188:	00f48733          	add	a4,s1,a5
    8000b18c:	02e96e63          	bltu	s2,a4,8000b1c8 <fdt_stringlist_search+0xa8>
    8000b190:	fd479fe3          	bne	a5,s4,8000b16e <fdt_stringlist_search+0x4e>
    8000b194:	8652                	mv	a2,s4
    8000b196:	85d6                	mv	a1,s5
    8000b198:	8526                	mv	a0,s1
    8000b19a:	e27f80ef          	jal	ra,80003fc0 <sbi_memcmp>
    8000b19e:	c901                	beqz	a0,8000b1ae <fdt_stringlist_search+0x8e>
    8000b1a0:	fbc42783          	lw	a5,-68(s0)
    8000b1a4:	2985                	addiw	s3,s3,1
    8000b1a6:	94be                	add	s1,s1,a5
    8000b1a8:	fd24e7e3          	bltu	s1,s2,8000b176 <fdt_stringlist_search+0x56>
    8000b1ac:	59fd                	li	s3,-1
    8000b1ae:	60a6                	ld	ra,72(sp)
    8000b1b0:	6406                	ld	s0,64(sp)
    8000b1b2:	74e2                	ld	s1,56(sp)
    8000b1b4:	7942                	ld	s2,48(sp)
    8000b1b6:	7a02                	ld	s4,32(sp)
    8000b1b8:	6ae2                	ld	s5,24(sp)
    8000b1ba:	854e                	mv	a0,s3
    8000b1bc:	79a2                	ld	s3,40(sp)
    8000b1be:	6161                	addi	sp,sp,80
    8000b1c0:	8082                	ret
    8000b1c2:	fbc42983          	lw	s3,-68(s0)
    8000b1c6:	b7e5                	j	8000b1ae <fdt_stringlist_search+0x8e>
    8000b1c8:	59c5                	li	s3,-15
    8000b1ca:	b7d5                	j	8000b1ae <fdt_stringlist_search+0x8e>

000000008000b1cc <fdt_stringlist_get>:
    8000b1cc:	715d                	addi	sp,sp,-80
    8000b1ce:	e0a2                	sd	s0,64(sp)
    8000b1d0:	fc26                	sd	s1,56(sp)
    8000b1d2:	f84a                	sd	s2,48(sp)
    8000b1d4:	f44e                	sd	s3,40(sp)
    8000b1d6:	f052                	sd	s4,32(sp)
    8000b1d8:	ec56                	sd	s5,24(sp)
    8000b1da:	0880                	addi	s0,sp,80
    8000b1dc:	e486                	sd	ra,72(sp)
    8000b1de:	892a                	mv	s2,a0
    8000b1e0:	8532                	mv	a0,a2
    8000b1e2:	84b2                	mv	s1,a2
    8000b1e4:	8aae                	mv	s5,a1
    8000b1e6:	89b6                	mv	s3,a3
    8000b1e8:	8a3a                	mv	s4,a4
    8000b1ea:	c2ff80ef          	jal	ra,80003e18 <sbi_strlen>
    8000b1ee:	0005069b          	sext.w	a3,a0
    8000b1f2:	fbc40713          	addi	a4,s0,-68
    8000b1f6:	8626                	mv	a2,s1
    8000b1f8:	85d6                	mv	a1,s5
    8000b1fa:	854a                	mv	a0,s2
    8000b1fc:	e4cff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000b200:	c535                	beqz	a0,8000b26c <fdt_stringlist_get+0xa0>
    8000b202:	fbc42903          	lw	s2,-68(s0)
    8000b206:	84aa                	mv	s1,a0
    8000b208:	992a                	add	s2,s2,a0
    8000b20a:	01256863          	bltu	a0,s2,8000b21a <fdt_stringlist_get+0x4e>
    8000b20e:	a099                	j	8000b254 <fdt_stringlist_get+0x88>
    8000b210:	04098963          	beqz	s3,8000b262 <fdt_stringlist_get+0x96>
    8000b214:	39fd                	addiw	s3,s3,-1
    8000b216:	0324ff63          	bgeu	s1,s2,8000b254 <fdt_stringlist_get+0x88>
    8000b21a:	409905b3          	sub	a1,s2,s1
    8000b21e:	8526                	mv	a0,s1
    8000b220:	c23f80ef          	jal	ra,80003e42 <sbi_strnlen>
    8000b224:	0015061b          	addiw	a2,a0,1
    8000b228:	86a6                	mv	a3,s1
    8000b22a:	fac42e23          	sw	a2,-68(s0)
    8000b22e:	94b2                	add	s1,s1,a2
    8000b230:	fe9970e3          	bgeu	s2,s1,8000b210 <fdt_stringlist_get+0x44>
    8000b234:	020a0563          	beqz	s4,8000b25e <fdt_stringlist_get+0x92>
    8000b238:	57c5                	li	a5,-15
    8000b23a:	00fa2023          	sw	a5,0(s4)
    8000b23e:	4681                	li	a3,0
    8000b240:	60a6                	ld	ra,72(sp)
    8000b242:	6406                	ld	s0,64(sp)
    8000b244:	74e2                	ld	s1,56(sp)
    8000b246:	7942                	ld	s2,48(sp)
    8000b248:	79a2                	ld	s3,40(sp)
    8000b24a:	7a02                	ld	s4,32(sp)
    8000b24c:	6ae2                	ld	s5,24(sp)
    8000b24e:	8536                	mv	a0,a3
    8000b250:	6161                	addi	sp,sp,80
    8000b252:	8082                	ret
    8000b254:	000a0563          	beqz	s4,8000b25e <fdt_stringlist_get+0x92>
    8000b258:	57fd                	li	a5,-1
    8000b25a:	00fa2023          	sw	a5,0(s4)
    8000b25e:	4681                	li	a3,0
    8000b260:	b7c5                	j	8000b240 <fdt_stringlist_get+0x74>
    8000b262:	fc0a0fe3          	beqz	s4,8000b240 <fdt_stringlist_get+0x74>
    8000b266:	00aa2023          	sw	a0,0(s4)
    8000b26a:	bfd9                	j	8000b240 <fdt_stringlist_get+0x74>
    8000b26c:	fe0a09e3          	beqz	s4,8000b25e <fdt_stringlist_get+0x92>
    8000b270:	fbc42783          	lw	a5,-68(s0)
    8000b274:	4681                	li	a3,0
    8000b276:	00fa2023          	sw	a5,0(s4)
    8000b27a:	b7d9                	j	8000b240 <fdt_stringlist_get+0x74>

000000008000b27c <fdt_node_check_compatible>:
    8000b27c:	7139                	addi	sp,sp,-64
    8000b27e:	f822                	sd	s0,48(sp)
    8000b280:	f426                	sd	s1,40(sp)
    8000b282:	f04a                	sd	s2,32(sp)
    8000b284:	ec4e                	sd	s3,24(sp)
    8000b286:	0080                	addi	s0,sp,64
    8000b288:	fc06                	sd	ra,56(sp)
    8000b28a:	84aa                	mv	s1,a0
    8000b28c:	00002517          	auipc	a0,0x2
    8000b290:	ef450513          	addi	a0,a0,-268 # 8000d180 <__func__.0+0x40>
    8000b294:	892e                	mv	s2,a1
    8000b296:	89b2                	mv	s3,a2
    8000b298:	b81f80ef          	jal	ra,80003e18 <sbi_strlen>
    8000b29c:	0005069b          	sext.w	a3,a0
    8000b2a0:	fcc40713          	addi	a4,s0,-52
    8000b2a4:	00002617          	auipc	a2,0x2
    8000b2a8:	edc60613          	addi	a2,a2,-292 # 8000d180 <__func__.0+0x40>
    8000b2ac:	85ca                	mv	a1,s2
    8000b2ae:	8526                	mv	a0,s1
    8000b2b0:	d98ff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000b2b4:	cd19                	beqz	a0,8000b2d2 <fdt_node_check_compatible+0x56>
    8000b2b6:	fcc42583          	lw	a1,-52(s0)
    8000b2ba:	864e                	mv	a2,s3
    8000b2bc:	d73ff0ef          	jal	ra,8000b02e <fdt_stringlist_contains>
    8000b2c0:	70e2                	ld	ra,56(sp)
    8000b2c2:	7442                	ld	s0,48(sp)
    8000b2c4:	74a2                	ld	s1,40(sp)
    8000b2c6:	7902                	ld	s2,32(sp)
    8000b2c8:	69e2                	ld	s3,24(sp)
    8000b2ca:	00153513          	seqz	a0,a0
    8000b2ce:	6121                	addi	sp,sp,64
    8000b2d0:	8082                	ret
    8000b2d2:	fcc42503          	lw	a0,-52(s0)
    8000b2d6:	70e2                	ld	ra,56(sp)
    8000b2d8:	7442                	ld	s0,48(sp)
    8000b2da:	74a2                	ld	s1,40(sp)
    8000b2dc:	7902                	ld	s2,32(sp)
    8000b2de:	69e2                	ld	s3,24(sp)
    8000b2e0:	6121                	addi	sp,sp,64
    8000b2e2:	8082                	ret

000000008000b2e4 <fdt_node_offset_by_compatible>:
    8000b2e4:	715d                	addi	sp,sp,-80
    8000b2e6:	e0a2                	sd	s0,64(sp)
    8000b2e8:	fc26                	sd	s1,56(sp)
    8000b2ea:	f84a                	sd	s2,48(sp)
    8000b2ec:	f052                	sd	s4,32(sp)
    8000b2ee:	e486                	sd	ra,72(sp)
    8000b2f0:	f44e                	sd	s3,40(sp)
    8000b2f2:	ec56                	sd	s5,24(sp)
    8000b2f4:	0880                	addi	s0,sp,80
    8000b2f6:	892a                	mv	s2,a0
    8000b2f8:	84ae                	mv	s1,a1
    8000b2fa:	8a32                	mv	s4,a2
    8000b2fc:	16e000ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000b300:	c911                	beqz	a0,8000b314 <fdt_node_offset_by_compatible+0x30>
    8000b302:	60a6                	ld	ra,72(sp)
    8000b304:	6406                	ld	s0,64(sp)
    8000b306:	74e2                	ld	s1,56(sp)
    8000b308:	7942                	ld	s2,48(sp)
    8000b30a:	79a2                	ld	s3,40(sp)
    8000b30c:	7a02                	ld	s4,32(sp)
    8000b30e:	6ae2                	ld	s5,24(sp)
    8000b310:	6161                	addi	sp,sp,80
    8000b312:	8082                	ret
    8000b314:	85a6                	mv	a1,s1
    8000b316:	4601                	li	a2,0
    8000b318:	854a                	mv	a0,s2
    8000b31a:	6f0000ef          	jal	ra,8000ba0a <fdt_next_node>
    8000b31e:	84aa                	mv	s1,a0
    8000b320:	fe0541e3          	bltz	a0,8000b302 <fdt_node_offset_by_compatible+0x1e>
    8000b324:	00002997          	auipc	s3,0x2
    8000b328:	e5c98993          	addi	s3,s3,-420 # 8000d180 <__func__.0+0x40>
    8000b32c:	5afd                	li	s5,-1
    8000b32e:	a831                	j	8000b34a <fdt_node_offset_by_compatible+0x66>
    8000b330:	fbc42583          	lw	a1,-68(s0)
    8000b334:	cfbff0ef          	jal	ra,8000b02e <fdt_stringlist_contains>
    8000b338:	ed05                	bnez	a0,8000b370 <fdt_node_offset_by_compatible+0x8c>
    8000b33a:	85a6                	mv	a1,s1
    8000b33c:	4601                	li	a2,0
    8000b33e:	854a                	mv	a0,s2
    8000b340:	6ca000ef          	jal	ra,8000ba0a <fdt_next_node>
    8000b344:	84aa                	mv	s1,a0
    8000b346:	02054563          	bltz	a0,8000b370 <fdt_node_offset_by_compatible+0x8c>
    8000b34a:	854e                	mv	a0,s3
    8000b34c:	acdf80ef          	jal	ra,80003e18 <sbi_strlen>
    8000b350:	0005069b          	sext.w	a3,a0
    8000b354:	864e                	mv	a2,s3
    8000b356:	fbc40713          	addi	a4,s0,-68
    8000b35a:	85a6                	mv	a1,s1
    8000b35c:	854a                	mv	a0,s2
    8000b35e:	ceaff0ef          	jal	ra,8000a848 <fdt_getprop_namelen>
    8000b362:	8652                	mv	a2,s4
    8000b364:	f571                	bnez	a0,8000b330 <fdt_node_offset_by_compatible+0x4c>
    8000b366:	fbc42503          	lw	a0,-68(s0)
    8000b36a:	f9554ce3          	blt	a0,s5,8000b302 <fdt_node_offset_by_compatible+0x1e>
    8000b36e:	f571                	bnez	a0,8000b33a <fdt_node_offset_by_compatible+0x56>
    8000b370:	8526                	mv	a0,s1
    8000b372:	bf41                	j	8000b302 <fdt_node_offset_by_compatible+0x1e>

000000008000b374 <fdt_check_full>:
    8000b374:	715d                	addi	sp,sp,-80
    8000b376:	e0a2                	sd	s0,64(sp)
    8000b378:	e486                	sd	ra,72(sp)
    8000b37a:	0880                	addi	s0,sp,80
    8000b37c:	fc26                	sd	s1,56(sp)
    8000b37e:	f84a                	sd	s2,48(sp)
    8000b380:	f44e                	sd	s3,40(sp)
    8000b382:	f052                	sd	s4,32(sp)
    8000b384:	ec56                	sd	s5,24(sp)
    8000b386:	e85a                	sd	s6,16(sp)
    8000b388:	fa042a23          	sw	zero,-76(s0)
    8000b38c:	47ed                	li	a5,27
    8000b38e:	0cb7f763          	bgeu	a5,a1,8000b45c <fdt_check_full+0xe8>
    8000b392:	89ae                	mv	s3,a1
    8000b394:	84aa                	mv	s1,a0
    8000b396:	1e0000ef          	jal	ra,8000b576 <fdt_check_header>
    8000b39a:	faa42823          	sw	a0,-80(s0)
    8000b39e:	892a                	mv	s2,a0
    8000b3a0:	ed05                	bnez	a0,8000b3d8 <fdt_check_full+0x64>
    8000b3a2:	0044c783          	lbu	a5,4(s1)
    8000b3a6:	0054c683          	lbu	a3,5(s1)
    8000b3aa:	0074c603          	lbu	a2,7(s1)
    8000b3ae:	0064c703          	lbu	a4,6(s1)
    8000b3b2:	0187979b          	slliw	a5,a5,0x18
    8000b3b6:	0106969b          	slliw	a3,a3,0x10
    8000b3ba:	8fd5                	or	a5,a5,a3
    8000b3bc:	8fd1                	or	a5,a5,a2
    8000b3be:	0087171b          	slliw	a4,a4,0x8
    8000b3c2:	8fd9                	or	a5,a5,a4
    8000b3c4:	1782                	slli	a5,a5,0x20
    8000b3c6:	9381                	srli	a5,a5,0x20
    8000b3c8:	08f9ea63          	bltu	s3,a5,8000b45c <fdt_check_full+0xe8>
    8000b3cc:	8526                	mv	a0,s1
    8000b3ce:	820ff0ef          	jal	ra,8000a3ee <fdt_num_mem_rsv>
    8000b3d2:	00055e63          	bgez	a0,8000b3ee <fdt_check_full+0x7a>
    8000b3d6:	892a                	mv	s2,a0
    8000b3d8:	60a6                	ld	ra,72(sp)
    8000b3da:	6406                	ld	s0,64(sp)
    8000b3dc:	74e2                	ld	s1,56(sp)
    8000b3de:	79a2                	ld	s3,40(sp)
    8000b3e0:	7a02                	ld	s4,32(sp)
    8000b3e2:	6ae2                	ld	s5,24(sp)
    8000b3e4:	6b42                	ld	s6,16(sp)
    8000b3e6:	854a                	mv	a0,s2
    8000b3e8:	7942                	ld	s2,48(sp)
    8000b3ea:	6161                	addi	sp,sp,80
    8000b3ec:	8082                	ret
    8000b3ee:	fb442b03          	lw	s6,-76(s0)
    8000b3f2:	4a01                	li	s4,0
    8000b3f4:	4aa5                	li	s5,9
    8000b3f6:	00002997          	auipc	s3,0x2
    8000b3fa:	d9698993          	addi	s3,s3,-618 # 8000d18c <__func__.0+0x4c>
    8000b3fe:	fb440613          	addi	a2,s0,-76
    8000b402:	85da                	mv	a1,s6
    8000b404:	8526                	mv	a0,s1
    8000b406:	456000ef          	jal	ra,8000b85c <fdt_next_tag>
    8000b40a:	fb442703          	lw	a4,-76(s0)
    8000b40e:	2501                	sext.w	a0,a0
    8000b410:	04074863          	bltz	a4,8000b460 <fdt_check_full+0xec>
    8000b414:	00aaec63          	bltu	s5,a0,8000b42c <fdt_check_full+0xb8>
    8000b418:	050a                	slli	a0,a0,0x2
    8000b41a:	954e                	add	a0,a0,s3
    8000b41c:	411c                	lw	a5,0(a0)
    8000b41e:	97ce                	add	a5,a5,s3
    8000b420:	8782                	jr	a5
    8000b422:	000a0963          	beqz	s4,8000b434 <fdt_check_full+0xc0>
    8000b426:	3a7d                	addiw	s4,s4,-1
    8000b428:	8b3a                	mv	s6,a4
    8000b42a:	bfd1                	j	8000b3fe <fdt_check_full+0x8a>
    8000b42c:	594d                	li	s2,-13
    8000b42e:	b76d                	j	8000b3d8 <fdt_check_full+0x64>
    8000b430:	fa0a04e3          	beqz	s4,8000b3d8 <fdt_check_full+0x64>
    8000b434:	5955                	li	s2,-11
    8000b436:	b74d                	j	8000b3d8 <fdt_check_full+0x64>
    8000b438:	fb040693          	addi	a3,s0,-80
    8000b43c:	fb840613          	addi	a2,s0,-72
    8000b440:	85da                	mv	a1,s6
    8000b442:	8526                	mv	a0,s1
    8000b444:	dc0ff0ef          	jal	ra,8000aa04 <fdt_getprop_by_offset>
    8000b448:	cd11                	beqz	a0,8000b464 <fdt_check_full+0xf0>
    8000b44a:	fb442703          	lw	a4,-76(s0)
    8000b44e:	8b3a                	mv	s6,a4
    8000b450:	b77d                	j	8000b3fe <fdt_check_full+0x8a>
    8000b452:	2a05                	addiw	s4,s4,1
    8000b454:	fe0a40e3          	bltz	s4,8000b434 <fdt_check_full+0xc0>
    8000b458:	8b3a                	mv	s6,a4
    8000b45a:	b755                	j	8000b3fe <fdt_check_full+0x8a>
    8000b45c:	5961                	li	s2,-8
    8000b45e:	bfad                	j	8000b3d8 <fdt_check_full+0x64>
    8000b460:	893a                	mv	s2,a4
    8000b462:	bf9d                	j	8000b3d8 <fdt_check_full+0x64>
    8000b464:	fb042903          	lw	s2,-80(s0)
    8000b468:	bf85                	j	8000b3d8 <fdt_check_full+0x64>

000000008000b46a <fdt_ro_probe_>:
    8000b46a:	1141                	addi	sp,sp,-16
    8000b46c:	e422                	sd	s0,8(sp)
    8000b46e:	0800                	addi	s0,sp,16
    8000b470:	00054783          	lbu	a5,0(a0)
    8000b474:	00154683          	lbu	a3,1(a0)
    8000b478:	00354603          	lbu	a2,3(a0)
    8000b47c:	00254703          	lbu	a4,2(a0)
    8000b480:	0187979b          	slliw	a5,a5,0x18
    8000b484:	0106969b          	slliw	a3,a3,0x10
    8000b488:	8fd5                	or	a5,a5,a3
    8000b48a:	0087171b          	slliw	a4,a4,0x8
    8000b48e:	8fd1                	or	a5,a5,a2
    8000b490:	8fd9                	or	a5,a5,a4
    8000b492:	d00e0737          	lui	a4,0xd00e0
    8000b496:	2781                	sext.w	a5,a5
    8000b498:	eed70713          	addi	a4,a4,-275 # ffffffffd00dfeed <_enclave_end+0xffffffff4e9dfeed>
    8000b49c:	02e78f63          	beq	a5,a4,8000b4da <fdt_ro_probe_+0x70>
    8000b4a0:	2ff20737          	lui	a4,0x2ff20
    8000b4a4:	11270713          	addi	a4,a4,274 # 2ff20112 <_fw_start-0x500dfeee>
    8000b4a8:	08e79663          	bne	a5,a4,8000b534 <fdt_ro_probe_+0xca>
    8000b4ac:	02454783          	lbu	a5,36(a0)
    8000b4b0:	02554683          	lbu	a3,37(a0)
    8000b4b4:	02754603          	lbu	a2,39(a0)
    8000b4b8:	02654703          	lbu	a4,38(a0)
    8000b4bc:	0187979b          	slliw	a5,a5,0x18
    8000b4c0:	0106969b          	slliw	a3,a3,0x10
    8000b4c4:	8fd5                	or	a5,a5,a3
    8000b4c6:	8fd1                	or	a5,a5,a2
    8000b4c8:	0087171b          	slliw	a4,a4,0x8
    8000b4cc:	8fd9                	or	a5,a5,a4
    8000b4ce:	2781                	sext.w	a5,a5
    8000b4d0:	4501                	li	a0,0
    8000b4d2:	c3bd                	beqz	a5,8000b538 <fdt_ro_probe_+0xce>
    8000b4d4:	6422                	ld	s0,8(sp)
    8000b4d6:	0141                	addi	sp,sp,16
    8000b4d8:	8082                	ret
    8000b4da:	01454783          	lbu	a5,20(a0)
    8000b4de:	01554683          	lbu	a3,21(a0)
    8000b4e2:	01754603          	lbu	a2,23(a0)
    8000b4e6:	01654703          	lbu	a4,22(a0)
    8000b4ea:	0187979b          	slliw	a5,a5,0x18
    8000b4ee:	0106969b          	slliw	a3,a3,0x10
    8000b4f2:	8fd5                	or	a5,a5,a3
    8000b4f4:	0087171b          	slliw	a4,a4,0x8
    8000b4f8:	8fd1                	or	a5,a5,a2
    8000b4fa:	8fd9                	or	a5,a5,a4
    8000b4fc:	2781                	sext.w	a5,a5
    8000b4fe:	4705                	li	a4,1
    8000b500:	02f77863          	bgeu	a4,a5,8000b530 <fdt_ro_probe_+0xc6>
    8000b504:	01854783          	lbu	a5,24(a0)
    8000b508:	01954683          	lbu	a3,25(a0)
    8000b50c:	01b54603          	lbu	a2,27(a0)
    8000b510:	01a54703          	lbu	a4,26(a0)
    8000b514:	0187979b          	slliw	a5,a5,0x18
    8000b518:	0106969b          	slliw	a3,a3,0x10
    8000b51c:	8fd5                	or	a5,a5,a3
    8000b51e:	0087171b          	slliw	a4,a4,0x8
    8000b522:	8fd1                	or	a5,a5,a2
    8000b524:	8fd9                	or	a5,a5,a4
    8000b526:	2781                	sext.w	a5,a5
    8000b528:	4745                	li	a4,17
    8000b52a:	4501                	li	a0,0
    8000b52c:	faf774e3          	bgeu	a4,a5,8000b4d4 <fdt_ro_probe_+0x6a>
    8000b530:	5559                	li	a0,-10
    8000b532:	b74d                	j	8000b4d4 <fdt_ro_probe_+0x6a>
    8000b534:	555d                	li	a0,-9
    8000b536:	bf79                	j	8000b4d4 <fdt_ro_probe_+0x6a>
    8000b538:	5565                	li	a0,-7
    8000b53a:	bf69                	j	8000b4d4 <fdt_ro_probe_+0x6a>

000000008000b53c <fdt_header_size_>:
    8000b53c:	1141                	addi	sp,sp,-16
    8000b53e:	e422                	sd	s0,8(sp)
    8000b540:	0800                	addi	s0,sp,16
    8000b542:	4705                	li	a4,1
    8000b544:	02a77563          	bgeu	a4,a0,8000b56e <fdt_header_size_+0x32>
    8000b548:	87aa                	mv	a5,a0
    8000b54a:	4709                	li	a4,2
    8000b54c:	02000513          	li	a0,32
    8000b550:	00e78763          	beq	a5,a4,8000b55e <fdt_header_size_+0x22>
    8000b554:	4741                	li	a4,16
    8000b556:	02400513          	li	a0,36
    8000b55a:	00f76563          	bltu	a4,a5,8000b564 <fdt_header_size_+0x28>
    8000b55e:	6422                	ld	s0,8(sp)
    8000b560:	0141                	addi	sp,sp,16
    8000b562:	8082                	ret
    8000b564:	6422                	ld	s0,8(sp)
    8000b566:	02800513          	li	a0,40
    8000b56a:	0141                	addi	sp,sp,16
    8000b56c:	8082                	ret
    8000b56e:	6422                	ld	s0,8(sp)
    8000b570:	4571                	li	a0,28
    8000b572:	0141                	addi	sp,sp,16
    8000b574:	8082                	ret

000000008000b576 <fdt_check_header>:
    8000b576:	1141                	addi	sp,sp,-16
    8000b578:	e422                	sd	s0,8(sp)
    8000b57a:	0800                	addi	s0,sp,16
    8000b57c:	00154703          	lbu	a4,1(a0)
    8000b580:	00054603          	lbu	a2,0(a0)
    8000b584:	00354583          	lbu	a1,3(a0)
    8000b588:	00254683          	lbu	a3,2(a0)
    8000b58c:	0107171b          	slliw	a4,a4,0x10
    8000b590:	0186161b          	slliw	a2,a2,0x18
    8000b594:	8f51                	or	a4,a4,a2
    8000b596:	0086969b          	slliw	a3,a3,0x8
    8000b59a:	8f4d                	or	a4,a4,a1
    8000b59c:	8f55                	or	a4,a4,a3
    8000b59e:	d00e06b7          	lui	a3,0xd00e0
    8000b5a2:	2701                	sext.w	a4,a4
    8000b5a4:	eed68693          	addi	a3,a3,-275 # ffffffffd00dfeed <_enclave_end+0xffffffff4e9dfeed>
    8000b5a8:	1cd71363          	bne	a4,a3,8000b76e <fdt_check_header+0x1f8>
    8000b5ac:	01454703          	lbu	a4,20(a0)
    8000b5b0:	01554603          	lbu	a2,21(a0)
    8000b5b4:	01754583          	lbu	a1,23(a0)
    8000b5b8:	01654683          	lbu	a3,22(a0)
    8000b5bc:	0187171b          	slliw	a4,a4,0x18
    8000b5c0:	0106161b          	slliw	a2,a2,0x10
    8000b5c4:	8f51                	or	a4,a4,a2
    8000b5c6:	0086969b          	slliw	a3,a3,0x8
    8000b5ca:	8f4d                	or	a4,a4,a1
    8000b5cc:	8f55                	or	a4,a4,a3
    8000b5ce:	2701                	sext.w	a4,a4
    8000b5d0:	4685                	li	a3,1
    8000b5d2:	87aa                	mv	a5,a0
    8000b5d4:	5559                	li	a0,-10
    8000b5d6:	14e6f963          	bgeu	a3,a4,8000b728 <fdt_check_header+0x1b2>
    8000b5da:	4689                	li	a3,2
    8000b5dc:	02000593          	li	a1,32
    8000b5e0:	00d70963          	beq	a4,a3,8000b5f2 <fdt_check_header+0x7c>
    8000b5e4:	46c1                	li	a3,16
    8000b5e6:	02400593          	li	a1,36
    8000b5ea:	00e6f463          	bgeu	a3,a4,8000b5f2 <fdt_check_header+0x7c>
    8000b5ee:	02800593          	li	a1,40
    8000b5f2:	0187c683          	lbu	a3,24(a5)
    8000b5f6:	0197c503          	lbu	a0,25(a5)
    8000b5fa:	01b7c803          	lbu	a6,27(a5)
    8000b5fe:	01a7c603          	lbu	a2,26(a5)
    8000b602:	0186969b          	slliw	a3,a3,0x18
    8000b606:	0105151b          	slliw	a0,a0,0x10
    8000b60a:	8ec9                	or	a3,a3,a0
    8000b60c:	0086161b          	slliw	a2,a2,0x8
    8000b610:	0106e6b3          	or	a3,a3,a6
    8000b614:	8ed1                	or	a3,a3,a2
    8000b616:	2681                	sext.w	a3,a3
    8000b618:	4645                	li	a2,17
    8000b61a:	14d66863          	bltu	a2,a3,8000b76a <fdt_check_header+0x1f4>
    8000b61e:	14d76663          	bltu	a4,a3,8000b76a <fdt_check_header+0x1f4>
    8000b622:	0047c683          	lbu	a3,4(a5)
    8000b626:	0057c503          	lbu	a0,5(a5)
    8000b62a:	0077c803          	lbu	a6,7(a5)
    8000b62e:	0067c603          	lbu	a2,6(a5)
    8000b632:	0105151b          	slliw	a0,a0,0x10
    8000b636:	0186969b          	slliw	a3,a3,0x18
    8000b63a:	8ec9                	or	a3,a3,a0
    8000b63c:	0086161b          	slliw	a2,a2,0x8
    8000b640:	0106e6b3          	or	a3,a3,a6
    8000b644:	8ed1                	or	a3,a3,a2
    8000b646:	02069513          	slli	a0,a3,0x20
    8000b64a:	9101                	srli	a0,a0,0x20
    8000b64c:	0006861b          	sext.w	a2,a3
    8000b650:	12b56163          	bltu	a0,a1,8000b772 <fdt_check_header+0x1fc>
    8000b654:	10064f63          	bltz	a2,8000b772 <fdt_check_header+0x1fc>
    8000b658:	0107c683          	lbu	a3,16(a5)
    8000b65c:	0117c803          	lbu	a6,17(a5)
    8000b660:	0137c883          	lbu	a7,19(a5)
    8000b664:	0127c503          	lbu	a0,18(a5)
    8000b668:	0108181b          	slliw	a6,a6,0x10
    8000b66c:	0186969b          	slliw	a3,a3,0x18
    8000b670:	0106e6b3          	or	a3,a3,a6
    8000b674:	0085151b          	slliw	a0,a0,0x8
    8000b678:	0116e6b3          	or	a3,a3,a7
    8000b67c:	8ec9                	or	a3,a3,a0
    8000b67e:	2681                	sext.w	a3,a3
    8000b680:	0005881b          	sext.w	a6,a1
    8000b684:	5561                	li	a0,-8
    8000b686:	0ab6e163          	bltu	a3,a1,8000b728 <fdt_check_header+0x1b2>
    8000b68a:	08d66f63          	bltu	a2,a3,8000b728 <fdt_check_header+0x1b2>
    8000b68e:	0097c683          	lbu	a3,9(a5)
    8000b692:	0087c883          	lbu	a7,8(a5)
    8000b696:	00b7c303          	lbu	t1,11(a5)
    8000b69a:	00a7c583          	lbu	a1,10(a5)
    8000b69e:	0106969b          	slliw	a3,a3,0x10
    8000b6a2:	0188989b          	slliw	a7,a7,0x18
    8000b6a6:	0116e6b3          	or	a3,a3,a7
    8000b6aa:	0085959b          	slliw	a1,a1,0x8
    8000b6ae:	0066e6b3          	or	a3,a3,t1
    8000b6b2:	8ecd                	or	a3,a3,a1
    8000b6b4:	45c1                	li	a1,16
    8000b6b6:	2681                	sext.w	a3,a3
    8000b6b8:	06e5eb63          	bltu	a1,a4,8000b72e <fdt_check_header+0x1b8>
    8000b6bc:	0706e663          	bltu	a3,a6,8000b728 <fdt_check_header+0x1b2>
    8000b6c0:	06d66463          	bltu	a2,a3,8000b728 <fdt_check_header+0x1b2>
    8000b6c4:	00c7c703          	lbu	a4,12(a5)
    8000b6c8:	00d7c583          	lbu	a1,13(a5)
    8000b6cc:	00f7c503          	lbu	a0,15(a5)
    8000b6d0:	00e7c683          	lbu	a3,14(a5)
    8000b6d4:	0105959b          	slliw	a1,a1,0x10
    8000b6d8:	0187171b          	slliw	a4,a4,0x18
    8000b6dc:	8f4d                	or	a4,a4,a1
    8000b6de:	8f49                	or	a4,a4,a0
    8000b6e0:	0086969b          	slliw	a3,a3,0x8
    8000b6e4:	8f55                	or	a4,a4,a3
    8000b6e6:	2701                	sext.w	a4,a4
    8000b6e8:	0207c683          	lbu	a3,32(a5)
    8000b6ec:	0217c883          	lbu	a7,33(a5)
    8000b6f0:	0227c583          	lbu	a1,34(a5)
    8000b6f4:	0237c303          	lbu	t1,35(a5)
    8000b6f8:	5561                	li	a0,-8
    8000b6fa:	03076763          	bltu	a4,a6,8000b728 <fdt_check_header+0x1b2>
    8000b6fe:	02e66563          	bltu	a2,a4,8000b728 <fdt_check_header+0x1b2>
    8000b702:	0186979b          	slliw	a5,a3,0x18
    8000b706:	0108989b          	slliw	a7,a7,0x10
    8000b70a:	0117e7b3          	or	a5,a5,a7
    8000b70e:	0067e7b3          	or	a5,a5,t1
    8000b712:	0085959b          	slliw	a1,a1,0x8
    8000b716:	8fcd                	or	a5,a5,a1
    8000b718:	9fb9                	addw	a5,a5,a4
    8000b71a:	00e7e763          	bltu	a5,a4,8000b728 <fdt_check_header+0x1b2>
    8000b71e:	00f63533          	sltu	a0,a2,a5
    8000b722:	40a00533          	neg	a0,a0
    8000b726:	9961                	andi	a0,a0,-8
    8000b728:	6422                	ld	s0,8(sp)
    8000b72a:	0141                	addi	sp,sp,16
    8000b72c:	8082                	ret
    8000b72e:	0247c703          	lbu	a4,36(a5)
    8000b732:	0257c883          	lbu	a7,37(a5)
    8000b736:	0267c583          	lbu	a1,38(a5)
    8000b73a:	0277c303          	lbu	t1,39(a5)
    8000b73e:	ff06e5e3          	bltu	a3,a6,8000b728 <fdt_check_header+0x1b2>
    8000b742:	fed663e3          	bltu	a2,a3,8000b728 <fdt_check_header+0x1b2>
    8000b746:	0187171b          	slliw	a4,a4,0x18
    8000b74a:	0108989b          	slliw	a7,a7,0x10
    8000b74e:	01176733          	or	a4,a4,a7
    8000b752:	00676733          	or	a4,a4,t1
    8000b756:	0085959b          	slliw	a1,a1,0x8
    8000b75a:	8f4d                	or	a4,a4,a1
    8000b75c:	9f35                	addw	a4,a4,a3
    8000b75e:	fcd765e3          	bltu	a4,a3,8000b728 <fdt_check_header+0x1b2>
    8000b762:	5561                	li	a0,-8
    8000b764:	fce662e3          	bltu	a2,a4,8000b728 <fdt_check_header+0x1b2>
    8000b768:	bfb1                	j	8000b6c4 <fdt_check_header+0x14e>
    8000b76a:	5559                	li	a0,-10
    8000b76c:	bf75                	j	8000b728 <fdt_check_header+0x1b2>
    8000b76e:	555d                	li	a0,-9
    8000b770:	bf65                	j	8000b728 <fdt_check_header+0x1b2>
    8000b772:	5561                	li	a0,-8
    8000b774:	bf55                	j	8000b728 <fdt_check_header+0x1b2>

000000008000b776 <fdt_offset_ptr>:
    8000b776:	1141                	addi	sp,sp,-16
    8000b778:	e422                	sd	s0,8(sp)
    8000b77a:	0800                	addi	s0,sp,16
    8000b77c:	00854703          	lbu	a4,8(a0)
    8000b780:	00954783          	lbu	a5,9(a0)
    8000b784:	00b54803          	lbu	a6,11(a0)
    8000b788:	00a54683          	lbu	a3,10(a0)
    8000b78c:	0107979b          	slliw	a5,a5,0x10
    8000b790:	0187171b          	slliw	a4,a4,0x18
    8000b794:	8f5d                	or	a4,a4,a5
    8000b796:	01076733          	or	a4,a4,a6
    8000b79a:	0086979b          	slliw	a5,a3,0x8
    8000b79e:	8fd9                	or	a5,a5,a4
    8000b7a0:	00b7883b          	addw	a6,a5,a1
    8000b7a4:	0ab86863          	bltu	a6,a1,8000b854 <fdt_offset_ptr+0xde>
    8000b7a8:	00c806bb          	addw	a3,a6,a2
    8000b7ac:	0b06e463          	bltu	a3,a6,8000b854 <fdt_offset_ptr+0xde>
    8000b7b0:	00454703          	lbu	a4,4(a0)
    8000b7b4:	00554883          	lbu	a7,5(a0)
    8000b7b8:	00754e03          	lbu	t3,7(a0)
    8000b7bc:	00654803          	lbu	a6,6(a0)
    8000b7c0:	0187171b          	slliw	a4,a4,0x18
    8000b7c4:	0108989b          	slliw	a7,a7,0x10
    8000b7c8:	01176733          	or	a4,a4,a7
    8000b7cc:	01c76733          	or	a4,a4,t3
    8000b7d0:	0088181b          	slliw	a6,a6,0x8
    8000b7d4:	01076733          	or	a4,a4,a6
    8000b7d8:	2701                	sext.w	a4,a4
    8000b7da:	06d76d63          	bltu	a4,a3,8000b854 <fdt_offset_ptr+0xde>
    8000b7de:	01454703          	lbu	a4,20(a0)
    8000b7e2:	01554803          	lbu	a6,21(a0)
    8000b7e6:	01754883          	lbu	a7,23(a0)
    8000b7ea:	01654683          	lbu	a3,22(a0)
    8000b7ee:	0187171b          	slliw	a4,a4,0x18
    8000b7f2:	0108181b          	slliw	a6,a6,0x10
    8000b7f6:	01076733          	or	a4,a4,a6
    8000b7fa:	0086969b          	slliw	a3,a3,0x8
    8000b7fe:	01176733          	or	a4,a4,a7
    8000b802:	8f55                	or	a4,a4,a3
    8000b804:	2701                	sext.w	a4,a4
    8000b806:	46c1                	li	a3,16
    8000b808:	2781                	sext.w	a5,a5
    8000b80a:	02e6fe63          	bgeu	a3,a4,8000b846 <fdt_offset_ptr+0xd0>
    8000b80e:	0005831b          	sext.w	t1,a1
    8000b812:	00c3063b          	addw	a2,t1,a2
    8000b816:	02666f63          	bltu	a2,t1,8000b854 <fdt_offset_ptr+0xde>
    8000b81a:	02454703          	lbu	a4,36(a0)
    8000b81e:	02554803          	lbu	a6,37(a0)
    8000b822:	02754883          	lbu	a7,39(a0)
    8000b826:	02654683          	lbu	a3,38(a0)
    8000b82a:	0187171b          	slliw	a4,a4,0x18
    8000b82e:	0108181b          	slliw	a6,a6,0x10
    8000b832:	01076733          	or	a4,a4,a6
    8000b836:	01176733          	or	a4,a4,a7
    8000b83a:	0086969b          	slliw	a3,a3,0x8
    8000b83e:	8f55                	or	a4,a4,a3
    8000b840:	2701                	sext.w	a4,a4
    8000b842:	00c76963          	bltu	a4,a2,8000b854 <fdt_offset_ptr+0xde>
    8000b846:	6422                	ld	s0,8(sp)
    8000b848:	1782                	slli	a5,a5,0x20
    8000b84a:	9381                	srli	a5,a5,0x20
    8000b84c:	97ae                	add	a5,a5,a1
    8000b84e:	953e                	add	a0,a0,a5
    8000b850:	0141                	addi	sp,sp,16
    8000b852:	8082                	ret
    8000b854:	6422                	ld	s0,8(sp)
    8000b856:	4501                	li	a0,0
    8000b858:	0141                	addi	sp,sp,16
    8000b85a:	8082                	ret

000000008000b85c <fdt_next_tag>:
    8000b85c:	7139                	addi	sp,sp,-64
    8000b85e:	f822                	sd	s0,48(sp)
    8000b860:	ec4e                	sd	s3,24(sp)
    8000b862:	e852                	sd	s4,16(sp)
    8000b864:	e456                	sd	s5,8(sp)
    8000b866:	fc06                	sd	ra,56(sp)
    8000b868:	f426                	sd	s1,40(sp)
    8000b86a:	f04a                	sd	s2,32(sp)
    8000b86c:	e05a                	sd	s6,0(sp)
    8000b86e:	0080                	addi	s0,sp,64
    8000b870:	57e1                	li	a5,-8
    8000b872:	89b2                	mv	s3,a2
    8000b874:	c21c                	sw	a5,0(a2)
    8000b876:	4611                	li	a2,4
    8000b878:	8a2a                	mv	s4,a0
    8000b87a:	8aae                	mv	s5,a1
    8000b87c:	efbff0ef          	jal	ra,8000b776 <fdt_offset_ptr>
    8000b880:	c13d                	beqz	a0,8000b8e6 <fdt_next_tag+0x8a>
    8000b882:	411c                	lw	a5,0(a0)
    8000b884:	5755                	li	a4,-11
    8000b886:	00e9a023          	sw	a4,0(s3)
    8000b88a:	0087d713          	srli	a4,a5,0x8
    8000b88e:	0187949b          	slliw	s1,a5,0x18
    8000b892:	0187d69b          	srliw	a3,a5,0x18
    8000b896:	0ff77713          	andi	a4,a4,255
    8000b89a:	83c1                	srli	a5,a5,0x10
    8000b89c:	8cd5                	or	s1,s1,a3
    8000b89e:	0107171b          	slliw	a4,a4,0x10
    8000b8a2:	0ff7f793          	andi	a5,a5,255
    8000b8a6:	0087979b          	slliw	a5,a5,0x8
    8000b8aa:	8cd9                	or	s1,s1,a4
    8000b8ac:	8cdd                	or	s1,s1,a5
    8000b8ae:	2481                	sext.w	s1,s1
    8000b8b0:	47a5                	li	a5,9
    8000b8b2:	000a8b1b          	sext.w	s6,s5
    8000b8b6:	004a891b          	addiw	s2,s5,4
    8000b8ba:	0297e663          	bltu	a5,s1,8000b8e6 <fdt_next_tag+0x8a>
    8000b8be:	00002697          	auipc	a3,0x2
    8000b8c2:	8f668693          	addi	a3,a3,-1802 # 8000d1b4 <__func__.0+0x74>
    8000b8c6:	00249713          	slli	a4,s1,0x2
    8000b8ca:	9736                	add	a4,a4,a3
    8000b8cc:	431c                	lw	a5,0(a4)
    8000b8ce:	97b6                	add	a5,a5,a3
    8000b8d0:	8782                	jr	a5
    8000b8d2:	00054783          	lbu	a5,0(a0)
    8000b8d6:	c3e9                	beqz	a5,8000b998 <fdt_next_tag+0x13c>
    8000b8d8:	85ca                	mv	a1,s2
    8000b8da:	4605                	li	a2,1
    8000b8dc:	8552                	mv	a0,s4
    8000b8de:	e99ff0ef          	jal	ra,8000b776 <fdt_offset_ptr>
    8000b8e2:	2905                	addiw	s2,s2,1
    8000b8e4:	f57d                	bnez	a0,8000b8d2 <fdt_next_tag+0x76>
    8000b8e6:	44a5                	li	s1,9
    8000b8e8:	70e2                	ld	ra,56(sp)
    8000b8ea:	7442                	ld	s0,48(sp)
    8000b8ec:	7902                	ld	s2,32(sp)
    8000b8ee:	69e2                	ld	s3,24(sp)
    8000b8f0:	6a42                	ld	s4,16(sp)
    8000b8f2:	6aa2                	ld	s5,8(sp)
    8000b8f4:	6b02                	ld	s6,0(sp)
    8000b8f6:	8526                	mv	a0,s1
    8000b8f8:	74a2                	ld	s1,40(sp)
    8000b8fa:	6121                	addi	sp,sp,64
    8000b8fc:	8082                	ret
    8000b8fe:	4611                	li	a2,4
    8000b900:	85d6                	mv	a1,s5
    8000b902:	8552                	mv	a0,s4
    8000b904:	e73ff0ef          	jal	ra,8000b776 <fdt_offset_ptr>
    8000b908:	dd79                	beqz	a0,8000b8e6 <fdt_next_tag+0x8a>
    8000b90a:	290d                	addiw	s2,s2,3
    8000b90c:	ffc97913          	andi	s2,s2,-4
    8000b910:	0129a023          	sw	s2,0(s3)
    8000b914:	bfd1                	j	8000b8e8 <fdt_next_tag+0x8c>
    8000b916:	4611                	li	a2,4
    8000b918:	85ca                	mv	a1,s2
    8000b91a:	8552                	mv	a0,s4
    8000b91c:	e5bff0ef          	jal	ra,8000b776 <fdt_offset_ptr>
    8000b920:	d179                	beqz	a0,8000b8e6 <fdt_next_tag+0x8a>
    8000b922:	4118                	lw	a4,0(a0)
    8000b924:	014a4783          	lbu	a5,20(s4)
    8000b928:	015a4503          	lbu	a0,21(s4)
    8000b92c:	00875613          	srli	a2,a4,0x8
    8000b930:	017a4803          	lbu	a6,23(s4)
    8000b934:	016a4583          	lbu	a1,22(s4)
    8000b938:	0187169b          	slliw	a3,a4,0x18
    8000b93c:	0187589b          	srliw	a7,a4,0x18
    8000b940:	0ff67613          	andi	a2,a2,255
    8000b944:	8341                	srli	a4,a4,0x10
    8000b946:	0187979b          	slliw	a5,a5,0x18
    8000b94a:	0105151b          	slliw	a0,a0,0x10
    8000b94e:	0106161b          	slliw	a2,a2,0x10
    8000b952:	0116e6b3          	or	a3,a3,a7
    8000b956:	0ff77713          	andi	a4,a4,255
    8000b95a:	8fc9                	or	a5,a5,a0
    8000b95c:	8ed1                	or	a3,a3,a2
    8000b95e:	0087171b          	slliw	a4,a4,0x8
    8000b962:	0085961b          	slliw	a2,a1,0x8
    8000b966:	0107e7b3          	or	a5,a5,a6
    8000b96a:	8f55                	or	a4,a4,a3
    8000b96c:	8fd1                	or	a5,a5,a2
    8000b96e:	2b31                	addiw	s6,s6,12
    8000b970:	00eb093b          	addw	s2,s6,a4
    8000b974:	2781                	sext.w	a5,a5
    8000b976:	46bd                	li	a3,15
    8000b978:	864a                	mv	a2,s2
    8000b97a:	2701                	sext.w	a4,a4
    8000b97c:	00f6eb63          	bltu	a3,a5,8000b992 <fdt_next_tag+0x136>
    8000b980:	479d                	li	a5,7
    8000b982:	00e7f863          	bgeu	a5,a4,8000b992 <fdt_next_tag+0x136>
    8000b986:	007b7b13          	andi	s6,s6,7
    8000b98a:	000b0463          	beqz	s6,8000b992 <fdt_next_tag+0x136>
    8000b98e:	2911                	addiw	s2,s2,4
    8000b990:	864a                	mv	a2,s2
    8000b992:	4156063b          	subw	a2,a2,s5
    8000b996:	b7ad                	j	8000b900 <fdt_next_tag+0xa4>
    8000b998:	4159063b          	subw	a2,s2,s5
    8000b99c:	b795                	j	8000b900 <fdt_next_tag+0xa4>

000000008000b99e <fdt_check_node_offset_>:
    8000b99e:	1101                	addi	sp,sp,-32
    8000b9a0:	e822                	sd	s0,16(sp)
    8000b9a2:	ec06                	sd	ra,24(sp)
    8000b9a4:	1000                	addi	s0,sp,32
    8000b9a6:	feb42623          	sw	a1,-20(s0)
    8000b9aa:	0205c363          	bltz	a1,8000b9d0 <fdt_check_node_offset_+0x32>
    8000b9ae:	0035f793          	andi	a5,a1,3
    8000b9b2:	ef99                	bnez	a5,8000b9d0 <fdt_check_node_offset_+0x32>
    8000b9b4:	fec40613          	addi	a2,s0,-20
    8000b9b8:	ea5ff0ef          	jal	ra,8000b85c <fdt_next_tag>
    8000b9bc:	2501                	sext.w	a0,a0
    8000b9be:	4785                	li	a5,1
    8000b9c0:	00f51863          	bne	a0,a5,8000b9d0 <fdt_check_node_offset_+0x32>
    8000b9c4:	fec42503          	lw	a0,-20(s0)
    8000b9c8:	60e2                	ld	ra,24(sp)
    8000b9ca:	6442                	ld	s0,16(sp)
    8000b9cc:	6105                	addi	sp,sp,32
    8000b9ce:	8082                	ret
    8000b9d0:	5571                	li	a0,-4
    8000b9d2:	bfdd                	j	8000b9c8 <fdt_check_node_offset_+0x2a>

000000008000b9d4 <fdt_check_prop_offset_>:
    8000b9d4:	1101                	addi	sp,sp,-32
    8000b9d6:	e822                	sd	s0,16(sp)
    8000b9d8:	ec06                	sd	ra,24(sp)
    8000b9da:	1000                	addi	s0,sp,32
    8000b9dc:	feb42623          	sw	a1,-20(s0)
    8000b9e0:	0205c363          	bltz	a1,8000ba06 <fdt_check_prop_offset_+0x32>
    8000b9e4:	0035f793          	andi	a5,a1,3
    8000b9e8:	ef99                	bnez	a5,8000ba06 <fdt_check_prop_offset_+0x32>
    8000b9ea:	fec40613          	addi	a2,s0,-20
    8000b9ee:	e6fff0ef          	jal	ra,8000b85c <fdt_next_tag>
    8000b9f2:	2501                	sext.w	a0,a0
    8000b9f4:	478d                	li	a5,3
    8000b9f6:	00f51863          	bne	a0,a5,8000ba06 <fdt_check_prop_offset_+0x32>
    8000b9fa:	fec42503          	lw	a0,-20(s0)
    8000b9fe:	60e2                	ld	ra,24(sp)
    8000ba00:	6442                	ld	s0,16(sp)
    8000ba02:	6105                	addi	sp,sp,32
    8000ba04:	8082                	ret
    8000ba06:	5571                	li	a0,-4
    8000ba08:	bfdd                	j	8000b9fe <fdt_check_prop_offset_+0x2a>

000000008000ba0a <fdt_next_node>:
    8000ba0a:	715d                	addi	sp,sp,-80
    8000ba0c:	e0a2                	sd	s0,64(sp)
    8000ba0e:	f84a                	sd	s2,48(sp)
    8000ba10:	f44e                	sd	s3,40(sp)
    8000ba12:	0880                	addi	s0,sp,80
    8000ba14:	e486                	sd	ra,72(sp)
    8000ba16:	fc26                	sd	s1,56(sp)
    8000ba18:	f052                	sd	s4,32(sp)
    8000ba1a:	ec56                	sd	s5,24(sp)
    8000ba1c:	e85a                	sd	s6,16(sp)
    8000ba1e:	fa042c23          	sw	zero,-72(s0)
    8000ba22:	89aa                	mv	s3,a0
    8000ba24:	8932                	mv	s2,a2
    8000ba26:	0805d863          	bgez	a1,8000bab6 <fdt_next_node+0xac>
    8000ba2a:	4481                	li	s1,0
    8000ba2c:	85a6                	mv	a1,s1
    8000ba2e:	fb840613          	addi	a2,s0,-72
    8000ba32:	854e                	mv	a0,s3
    8000ba34:	e29ff0ef          	jal	ra,8000b85c <fdt_next_tag>
    8000ba38:	4b09                	li	s6,2
    8000ba3a:	2501                	sext.w	a0,a0
    8000ba3c:	4aa5                	li	s5,9
    8000ba3e:	4a05                	li	s4,1
    8000ba40:	03650163          	beq	a0,s6,8000ba62 <fdt_next_node+0x58>
    8000ba44:	05550e63          	beq	a0,s5,8000baa0 <fdt_next_node+0x96>
    8000ba48:	03450a63          	beq	a0,s4,8000ba7c <fdt_next_node+0x72>
    8000ba4c:	fb842483          	lw	s1,-72(s0)
    8000ba50:	fb840613          	addi	a2,s0,-72
    8000ba54:	854e                	mv	a0,s3
    8000ba56:	85a6                	mv	a1,s1
    8000ba58:	e05ff0ef          	jal	ra,8000b85c <fdt_next_tag>
    8000ba5c:	2501                	sext.w	a0,a0
    8000ba5e:	ff6513e3          	bne	a0,s6,8000ba44 <fdt_next_node+0x3a>
    8000ba62:	fe0905e3          	beqz	s2,8000ba4c <fdt_next_node+0x42>
    8000ba66:	00092783          	lw	a5,0(s2)
    8000ba6a:	fff7871b          	addiw	a4,a5,-1
    8000ba6e:	00e92023          	sw	a4,0(s2)
    8000ba72:	fc075de3          	bgez	a4,8000ba4c <fdt_next_node+0x42>
    8000ba76:	fb842483          	lw	s1,-72(s0)
    8000ba7a:	a801                	j	8000ba8a <fdt_next_node+0x80>
    8000ba7c:	00090763          	beqz	s2,8000ba8a <fdt_next_node+0x80>
    8000ba80:	00092783          	lw	a5,0(s2)
    8000ba84:	2785                	addiw	a5,a5,1
    8000ba86:	00f92023          	sw	a5,0(s2)
    8000ba8a:	60a6                	ld	ra,72(sp)
    8000ba8c:	6406                	ld	s0,64(sp)
    8000ba8e:	7942                	ld	s2,48(sp)
    8000ba90:	79a2                	ld	s3,40(sp)
    8000ba92:	7a02                	ld	s4,32(sp)
    8000ba94:	6ae2                	ld	s5,24(sp)
    8000ba96:	6b42                	ld	s6,16(sp)
    8000ba98:	8526                	mv	a0,s1
    8000ba9a:	74e2                	ld	s1,56(sp)
    8000ba9c:	6161                	addi	sp,sp,80
    8000ba9e:	8082                	ret
    8000baa0:	fb842483          	lw	s1,-72(s0)
    8000baa4:	0004d763          	bgez	s1,8000bab2 <fdt_next_node+0xa8>
    8000baa8:	57e1                	li	a5,-8
    8000baaa:	fef490e3          	bne	s1,a5,8000ba8a <fdt_next_node+0x80>
    8000baae:	fc091ee3          	bnez	s2,8000ba8a <fdt_next_node+0x80>
    8000bab2:	54fd                	li	s1,-1
    8000bab4:	bfd9                	j	8000ba8a <fdt_next_node+0x80>
    8000bab6:	fab42e23          	sw	a1,-68(s0)
    8000baba:	0035f793          	andi	a5,a1,3
    8000babe:	e385                	bnez	a5,8000bade <fdt_next_node+0xd4>
    8000bac0:	fbc40613          	addi	a2,s0,-68
    8000bac4:	d99ff0ef          	jal	ra,8000b85c <fdt_next_tag>
    8000bac8:	2501                	sext.w	a0,a0
    8000baca:	4785                	li	a5,1
    8000bacc:	00f51963          	bne	a0,a5,8000bade <fdt_next_node+0xd4>
    8000bad0:	fbc42483          	lw	s1,-68(s0)
    8000bad4:	fa942c23          	sw	s1,-72(s0)
    8000bad8:	f404dae3          	bgez	s1,8000ba2c <fdt_next_node+0x22>
    8000badc:	b77d                	j	8000ba8a <fdt_next_node+0x80>
    8000bade:	54f1                	li	s1,-4
    8000bae0:	b76d                	j	8000ba8a <fdt_next_node+0x80>

000000008000bae2 <fdt_first_subnode>:
    8000bae2:	1101                	addi	sp,sp,-32
    8000bae4:	e822                	sd	s0,16(sp)
    8000bae6:	ec06                	sd	ra,24(sp)
    8000bae8:	1000                	addi	s0,sp,32
    8000baea:	fec40613          	addi	a2,s0,-20
    8000baee:	fe042623          	sw	zero,-20(s0)
    8000baf2:	f19ff0ef          	jal	ra,8000ba0a <fdt_next_node>
    8000baf6:	00054b63          	bltz	a0,8000bb0c <fdt_first_subnode+0x2a>
    8000bafa:	fec42703          	lw	a4,-20(s0)
    8000bafe:	4785                	li	a5,1
    8000bb00:	00f71663          	bne	a4,a5,8000bb0c <fdt_first_subnode+0x2a>
    8000bb04:	60e2                	ld	ra,24(sp)
    8000bb06:	6442                	ld	s0,16(sp)
    8000bb08:	6105                	addi	sp,sp,32
    8000bb0a:	8082                	ret
    8000bb0c:	557d                	li	a0,-1
    8000bb0e:	bfdd                	j	8000bb04 <fdt_first_subnode+0x22>

000000008000bb10 <fdt_next_subnode>:
    8000bb10:	7179                	addi	sp,sp,-48
    8000bb12:	f022                	sd	s0,32(sp)
    8000bb14:	ec26                	sd	s1,24(sp)
    8000bb16:	e84a                	sd	s2,16(sp)
    8000bb18:	1800                	addi	s0,sp,48
    8000bb1a:	f406                	sd	ra,40(sp)
    8000bb1c:	4785                	li	a5,1
    8000bb1e:	84aa                	mv	s1,a0
    8000bb20:	fcf42e23          	sw	a5,-36(s0)
    8000bb24:	4905                	li	s2,1
    8000bb26:	a039                	j	8000bb34 <fdt_next_subnode+0x24>
    8000bb28:	fdc42783          	lw	a5,-36(s0)
    8000bb2c:	00f05c63          	blez	a5,8000bb44 <fdt_next_subnode+0x34>
    8000bb30:	01278b63          	beq	a5,s2,8000bb46 <fdt_next_subnode+0x36>
    8000bb34:	fdc40613          	addi	a2,s0,-36
    8000bb38:	8526                	mv	a0,s1
    8000bb3a:	ed1ff0ef          	jal	ra,8000ba0a <fdt_next_node>
    8000bb3e:	85aa                	mv	a1,a0
    8000bb40:	fe0554e3          	bgez	a0,8000bb28 <fdt_next_subnode+0x18>
    8000bb44:	557d                	li	a0,-1
    8000bb46:	70a2                	ld	ra,40(sp)
    8000bb48:	7402                	ld	s0,32(sp)
    8000bb4a:	64e2                	ld	s1,24(sp)
    8000bb4c:	6942                	ld	s2,16(sp)
    8000bb4e:	6145                	addi	sp,sp,48
    8000bb50:	8082                	ret

000000008000bb52 <fdt_find_string_>:
    8000bb52:	7179                	addi	sp,sp,-48
    8000bb54:	f022                	sd	s0,32(sp)
    8000bb56:	ec26                	sd	s1,24(sp)
    8000bb58:	e84a                	sd	s2,16(sp)
    8000bb5a:	e44e                	sd	s3,8(sp)
    8000bb5c:	e052                	sd	s4,0(sp)
    8000bb5e:	f406                	sd	ra,40(sp)
    8000bb60:	1800                	addi	s0,sp,48
    8000bb62:	84aa                	mv	s1,a0
    8000bb64:	8532                	mv	a0,a2
    8000bb66:	892e                	mv	s2,a1
    8000bb68:	8a32                	mv	s4,a2
    8000bb6a:	aaef80ef          	jal	ra,80003e18 <sbi_strlen>
    8000bb6e:	0015099b          	addiw	s3,a0,1
    8000bb72:	41390933          	sub	s2,s2,s3
    8000bb76:	9926                	add	s2,s2,s1
    8000bb78:	00997663          	bgeu	s2,s1,8000bb84 <fdt_find_string_+0x32>
    8000bb7c:	a01d                	j	8000bba2 <fdt_find_string_+0x50>
    8000bb7e:	0485                	addi	s1,s1,1
    8000bb80:	02996163          	bltu	s2,s1,8000bba2 <fdt_find_string_+0x50>
    8000bb84:	8526                	mv	a0,s1
    8000bb86:	864e                	mv	a2,s3
    8000bb88:	85d2                	mv	a1,s4
    8000bb8a:	c36f80ef          	jal	ra,80003fc0 <sbi_memcmp>
    8000bb8e:	f965                	bnez	a0,8000bb7e <fdt_find_string_+0x2c>
    8000bb90:	70a2                	ld	ra,40(sp)
    8000bb92:	7402                	ld	s0,32(sp)
    8000bb94:	6942                	ld	s2,16(sp)
    8000bb96:	69a2                	ld	s3,8(sp)
    8000bb98:	6a02                	ld	s4,0(sp)
    8000bb9a:	8526                	mv	a0,s1
    8000bb9c:	64e2                	ld	s1,24(sp)
    8000bb9e:	6145                	addi	sp,sp,48
    8000bba0:	8082                	ret
    8000bba2:	70a2                	ld	ra,40(sp)
    8000bba4:	7402                	ld	s0,32(sp)
    8000bba6:	64e2                	ld	s1,24(sp)
    8000bba8:	6942                	ld	s2,16(sp)
    8000bbaa:	69a2                	ld	s3,8(sp)
    8000bbac:	6a02                	ld	s4,0(sp)
    8000bbae:	4501                	li	a0,0
    8000bbb0:	6145                	addi	sp,sp,48
    8000bbb2:	8082                	ret

000000008000bbb4 <fdt_move>:
    8000bbb4:	7179                	addi	sp,sp,-48
    8000bbb6:	f022                	sd	s0,32(sp)
    8000bbb8:	ec26                	sd	s1,24(sp)
    8000bbba:	e84a                	sd	s2,16(sp)
    8000bbbc:	e44e                	sd	s3,8(sp)
    8000bbbe:	e052                	sd	s4,0(sp)
    8000bbc0:	f406                	sd	ra,40(sp)
    8000bbc2:	1800                	addi	s0,sp,48
    8000bbc4:	84aa                	mv	s1,a0
    8000bbc6:	8a2e                	mv	s4,a1
    8000bbc8:	89b2                	mv	s3,a2
    8000bbca:	8a1ff0ef          	jal	ra,8000b46a <fdt_ro_probe_>
    8000bbce:	892a                	mv	s2,a0
    8000bbd0:	ed05                	bnez	a0,8000bc08 <fdt_move+0x54>
    8000bbd2:	0044c783          	lbu	a5,4(s1)
    8000bbd6:	0054c703          	lbu	a4,5(s1)
    8000bbda:	0074c683          	lbu	a3,7(s1)
    8000bbde:	0064c603          	lbu	a2,6(s1)
    8000bbe2:	0187979b          	slliw	a5,a5,0x18
    8000bbe6:	0107171b          	slliw	a4,a4,0x10
    8000bbea:	8fd9                	or	a5,a5,a4
    8000bbec:	8fd5                	or	a5,a5,a3
    8000bbee:	0086161b          	slliw	a2,a2,0x8
    8000bbf2:	8fd1                	or	a5,a5,a2
    8000bbf4:	2781                	sext.w	a5,a5
    8000bbf6:	02f9e263          	bltu	s3,a5,8000bc1a <fdt_move+0x66>
    8000bbfa:	02079613          	slli	a2,a5,0x20
    8000bbfe:	9201                	srli	a2,a2,0x20
    8000bc00:	85a6                	mv	a1,s1
    8000bc02:	8552                	mv	a0,s4
    8000bc04:	b6cf80ef          	jal	ra,80003f70 <sbi_memmove>
    8000bc08:	70a2                	ld	ra,40(sp)
    8000bc0a:	7402                	ld	s0,32(sp)
    8000bc0c:	64e2                	ld	s1,24(sp)
    8000bc0e:	69a2                	ld	s3,8(sp)
    8000bc10:	6a02                	ld	s4,0(sp)
    8000bc12:	854a                	mv	a0,s2
    8000bc14:	6942                	ld	s2,16(sp)
    8000bc16:	6145                	addi	sp,sp,48
    8000bc18:	8082                	ret
    8000bc1a:	5975                	li	s2,-3
    8000bc1c:	b7f5                	j	8000bc08 <fdt_move+0x54>
	...
