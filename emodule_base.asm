
emodules/emodule_base/emodule_base.bin:     file format elf64-littleriscv


Disassembly of section .text:

00000000c0600000 <_start>:
    c0600000:	00000a17          	auipc	s4,0x0
    c0600004:	030a0a13          	addi	s4,s4,48 # c0600030 <_start+0x30>
    c0600008:	40ca0a33          	sub	s4,s4,a2
    c060000c:	00300b1b          	addiw	s6,zero,3
    c0600010:	0b7a                	slli	s6,s6,0x1e
    c0600012:	9a5a                	add	s4,s4,s6
    c0600014:	105a1073          	csrw	stvec,s4
    c0600018:	0006f117          	auipc	sp,0x6f
    c060001c:	fe810113          	addi	sp,sp,-24 # c066f000 <_temp_stack_end>
    c0600020:	3a1000ef          	jal	ra,c0600bc0 <init_mem>
    c0600024:	812e                	mv	sp,a1
    c0600026:	12000073          	sfence.vma
    c060002a:	18051073          	csrw	satp,a0
    c060002e:	0001                	nop
    c0600030:	12000073          	sfence.vma
    c0600034:	00002b97          	auipc	s7,0x2
    c0600038:	e3cb8b93          	addi	s7,s7,-452 # c0601e70 <trap_handler>
    c060003c:	105b9073          	csrw	stvec,s7
    c0600040:	8532                	mv	a0,a2
    c0600042:	85b6                	mv	a1,a3
    c0600044:	376000ef          	jal	ra,c06003ba <prepare_boot>
    c0600048:	14011173          	csrrw	sp,sscratch,sp
    c060004c:	10200073          	sret

00000000c0600050 <log>:
    c0600050:	7111                	addi	sp,sp,-256
    c0600052:	e406                	sd	ra,8(sp)
    c0600054:	ec0e                	sd	gp,24(sp)
    c0600056:	f012                	sd	tp,32(sp)
    c0600058:	f416                	sd	t0,40(sp)
    c060005a:	f81a                	sd	t1,48(sp)
    c060005c:	fc1e                	sd	t2,56(sp)
    c060005e:	e0a2                	sd	s0,64(sp)
    c0600060:	e4a6                	sd	s1,72(sp)
    c0600062:	e8aa                	sd	a0,80(sp)
    c0600064:	ecae                	sd	a1,88(sp)
    c0600066:	f0b2                	sd	a2,96(sp)
    c0600068:	f4b6                	sd	a3,104(sp)
    c060006a:	f8ba                	sd	a4,112(sp)
    c060006c:	fcbe                	sd	a5,120(sp)
    c060006e:	e142                	sd	a6,128(sp)
    c0600070:	e546                	sd	a7,136(sp)
    c0600072:	e94a                	sd	s2,144(sp)
    c0600074:	ed4e                	sd	s3,152(sp)
    c0600076:	f152                	sd	s4,160(sp)
    c0600078:	f556                	sd	s5,168(sp)
    c060007a:	f95a                	sd	s6,176(sp)
    c060007c:	fd5e                	sd	s7,184(sp)
    c060007e:	e1e2                	sd	s8,192(sp)
    c0600080:	e5e6                	sd	s9,200(sp)
    c0600082:	e9ea                	sd	s10,208(sp)
    c0600084:	edee                	sd	s11,216(sp)
    c0600086:	f1f2                	sd	t3,224(sp)
    c0600088:	f5f6                	sd	t4,232(sp)
    c060008a:	f9fa                	sd	t5,240(sp)
    c060008c:	fdfe                	sd	t6,248(sp)
    c060008e:	539010ef          	jal	ra,c0601dc6 <show_reg>
    c0600092:	60a2                	ld	ra,8(sp)
    c0600094:	61e2                	ld	gp,24(sp)
    c0600096:	7202                	ld	tp,32(sp)
    c0600098:	72a2                	ld	t0,40(sp)
    c060009a:	7342                	ld	t1,48(sp)
    c060009c:	73e2                	ld	t2,56(sp)
    c060009e:	6406                	ld	s0,64(sp)
    c06000a0:	64a6                	ld	s1,72(sp)
    c06000a2:	6546                	ld	a0,80(sp)
    c06000a4:	65e6                	ld	a1,88(sp)
    c06000a6:	7606                	ld	a2,96(sp)
    c06000a8:	76a6                	ld	a3,104(sp)
    c06000aa:	7746                	ld	a4,112(sp)
    c06000ac:	77e6                	ld	a5,120(sp)
    c06000ae:	680a                	ld	a6,128(sp)
    c06000b0:	68aa                	ld	a7,136(sp)
    c06000b2:	694a                	ld	s2,144(sp)
    c06000b4:	69ea                	ld	s3,152(sp)
    c06000b6:	7a0a                	ld	s4,160(sp)
    c06000b8:	7aaa                	ld	s5,168(sp)
    c06000ba:	7b4a                	ld	s6,176(sp)
    c06000bc:	7bea                	ld	s7,184(sp)
    c06000be:	6c0e                	ld	s8,192(sp)
    c06000c0:	6cae                	ld	s9,200(sp)
    c06000c2:	6d4e                	ld	s10,208(sp)
    c06000c4:	6dee                	ld	s11,216(sp)
    c06000c6:	7e0e                	ld	t3,224(sp)
    c06000c8:	7eae                	ld	t4,232(sp)
    c06000ca:	7f4e                	ld	t5,240(sp)
    c06000cc:	7fee                	ld	t6,248(sp)
    c06000ce:	6111                	addi	sp,sp,256
    c06000d0:	8082                	ret
	...

00000000c06000d4 <init_usr_stack>:
    c06000d4:	1101                	addi	sp,sp,-32
    c06000d6:	ec22                	sd	s0,24(sp)
    c06000d8:	1000                	addi	s0,sp,32
    c06000da:	fea43423          	sd	a0,-24(s0)
    c06000de:	fe843783          	ld	a5,-24(s0)
    c06000e2:	17e1                	addi	a5,a5,-8
    c06000e4:	fef43423          	sd	a5,-24(s0)
    c06000e8:	fe843783          	ld	a5,-24(s0)
    c06000ec:	0007b023          	sd	zero,0(a5)
    c06000f0:	fe843783          	ld	a5,-24(s0)
    c06000f4:	17e1                	addi	a5,a5,-8
    c06000f6:	fef43423          	sd	a5,-24(s0)
    c06000fa:	fe843783          	ld	a5,-24(s0)
    c06000fe:	0007b023          	sd	zero,0(a5)
    c0600102:	fe843783          	ld	a5,-24(s0)
    c0600106:	17e1                	addi	a5,a5,-8
    c0600108:	fef43423          	sd	a5,-24(s0)
    c060010c:	fe843783          	ld	a5,-24(s0)
    c0600110:	4705                	li	a4,1
    c0600112:	e398                	sd	a4,0(a5)
    c0600114:	fe843783          	ld	a5,-24(s0)
    c0600118:	17e1                	addi	a5,a5,-8
    c060011a:	fef43423          	sd	a5,-24(s0)
    c060011e:	fe843783          	ld	a5,-24(s0)
    c0600122:	4731                	li	a4,12
    c0600124:	e398                	sd	a4,0(a5)
    c0600126:	fe843783          	ld	a5,-24(s0)
    c060012a:	17e1                	addi	a5,a5,-8
    c060012c:	fef43423          	sd	a5,-24(s0)
    c0600130:	fe843783          	ld	a5,-24(s0)
    c0600134:	4705                	li	a4,1
    c0600136:	e398                	sd	a4,0(a5)
    c0600138:	fe843783          	ld	a5,-24(s0)
    c060013c:	17e1                	addi	a5,a5,-8
    c060013e:	fef43423          	sd	a5,-24(s0)
    c0600142:	fe843783          	ld	a5,-24(s0)
    c0600146:	472d                	li	a4,11
    c0600148:	e398                	sd	a4,0(a5)
    c060014a:	fe843783          	ld	a5,-24(s0)
    c060014e:	17e1                	addi	a5,a5,-8
    c0600150:	fef43423          	sd	a5,-24(s0)
    c0600154:	fe843783          	ld	a5,-24(s0)
    c0600158:	4705                	li	a4,1
    c060015a:	e398                	sd	a4,0(a5)
    c060015c:	fe843783          	ld	a5,-24(s0)
    c0600160:	17e1                	addi	a5,a5,-8
    c0600162:	fef43423          	sd	a5,-24(s0)
    c0600166:	fe843783          	ld	a5,-24(s0)
    c060016a:	4749                	li	a4,18
    c060016c:	e398                	sd	a4,0(a5)
    c060016e:	fe843783          	ld	a5,-24(s0)
    c0600172:	17e1                	addi	a5,a5,-8
    c0600174:	fef43423          	sd	a5,-24(s0)
    c0600178:	fe843783          	ld	a5,-24(s0)
    c060017c:	4705                	li	a4,1
    c060017e:	e398                	sd	a4,0(a5)
    c0600180:	fe843783          	ld	a5,-24(s0)
    c0600184:	17e1                	addi	a5,a5,-8
    c0600186:	fef43423          	sd	a5,-24(s0)
    c060018a:	fe843783          	ld	a5,-24(s0)
    c060018e:	4735                	li	a4,13
    c0600190:	e398                	sd	a4,0(a5)
    c0600192:	fe843783          	ld	a5,-24(s0)
    c0600196:	17e1                	addi	a5,a5,-8
    c0600198:	fef43423          	sd	a5,-24(s0)
    c060019c:	fe843783          	ld	a5,-24(s0)
    c06001a0:	6f56f737          	lui	a4,0x6f56f
    c06001a4:	0706                	slli	a4,a4,0x1
    c06001a6:	ead70713          	addi	a4,a4,-339 # 6f56eead <_start-0x51091153>
    c06001aa:	e398                	sd	a4,0(a5)
    c06001ac:	fe843783          	ld	a5,-24(s0)
    c06001b0:	17e1                	addi	a5,a5,-8
    c06001b2:	fef43423          	sd	a5,-24(s0)
    c06001b6:	fe843783          	ld	a5,-24(s0)
    c06001ba:	4765                	li	a4,25
    c06001bc:	e398                	sd	a4,0(a5)
    c06001be:	fe843783          	ld	a5,-24(s0)
    c06001c2:	17e1                	addi	a5,a5,-8
    c06001c4:	fef43423          	sd	a5,-24(s0)
    c06001c8:	fe843783          	ld	a5,-24(s0)
    c06001cc:	0007b023          	sd	zero,0(a5)
    c06001d0:	fe843783          	ld	a5,-24(s0)
    c06001d4:	17e1                	addi	a5,a5,-8
    c06001d6:	fef43423          	sd	a5,-24(s0)
    c06001da:	fe843783          	ld	a5,-24(s0)
    c06001de:	475d                	li	a4,23
    c06001e0:	e398                	sd	a4,0(a5)
    c06001e2:	fe843783          	ld	a5,-24(s0)
    c06001e6:	17e1                	addi	a5,a5,-8
    c06001e8:	fef43423          	sd	a5,-24(s0)
    c06001ec:	fe843783          	ld	a5,-24(s0)
    c06001f0:	0007b023          	sd	zero,0(a5)
    c06001f4:	fe843783          	ld	a5,-24(s0)
    c06001f8:	17e1                	addi	a5,a5,-8
    c06001fa:	fef43423          	sd	a5,-24(s0)
    c06001fe:	fe843783          	ld	a5,-24(s0)
    c0600202:	477d                	li	a4,31
    c0600204:	e398                	sd	a4,0(a5)
    c0600206:	fe843783          	ld	a5,-24(s0)
    c060020a:	17e1                	addi	a5,a5,-8
    c060020c:	fef43423          	sd	a5,-24(s0)
    c0600210:	fe843783          	ld	a5,-24(s0)
    c0600214:	6705                	lui	a4,0x1
    c0600216:	e398                	sd	a4,0(a5)
    c0600218:	fe843783          	ld	a5,-24(s0)
    c060021c:	17e1                	addi	a5,a5,-8
    c060021e:	fef43423          	sd	a5,-24(s0)
    c0600222:	fe843783          	ld	a5,-24(s0)
    c0600226:	4719                	li	a4,6
    c0600228:	e398                	sd	a4,0(a5)
    c060022a:	fe843783          	ld	a5,-24(s0)
    c060022e:	17e1                	addi	a5,a5,-8
    c0600230:	fef43423          	sd	a5,-24(s0)
    c0600234:	fe843783          	ld	a5,-24(s0)
    c0600238:	0007b023          	sd	zero,0(a5)
    c060023c:	fe843783          	ld	a5,-24(s0)
    c0600240:	17e1                	addi	a5,a5,-8
    c0600242:	fef43423          	sd	a5,-24(s0)
    c0600246:	fe843783          	ld	a5,-24(s0)
    c060024a:	02000713          	li	a4,32
    c060024e:	e398                	sd	a4,0(a5)
    c0600250:	fe843783          	ld	a5,-24(s0)
    c0600254:	17e1                	addi	a5,a5,-8
    c0600256:	fef43423          	sd	a5,-24(s0)
    c060025a:	fe843783          	ld	a5,-24(s0)
    c060025e:	6705                	lui	a4,0x1
    c0600260:	12d70713          	addi	a4,a4,301 # 112d <_start-0xc05feed3>
    c0600264:	e398                	sd	a4,0(a5)
    c0600266:	fe843783          	ld	a5,-24(s0)
    c060026a:	17e1                	addi	a5,a5,-8
    c060026c:	fef43423          	sd	a5,-24(s0)
    c0600270:	fe843783          	ld	a5,-24(s0)
    c0600274:	4741                	li	a4,16
    c0600276:	e398                	sd	a4,0(a5)
    c0600278:	fe843783          	ld	a5,-24(s0)
    c060027c:	17e1                	addi	a5,a5,-8
    c060027e:	fef43423          	sd	a5,-24(s0)
    c0600282:	fe843783          	ld	a5,-24(s0)
    c0600286:	0007b023          	sd	zero,0(a5)
    c060028a:	fe843783          	ld	a5,-24(s0)
    c060028e:	17e1                	addi	a5,a5,-8
    c0600290:	fef43423          	sd	a5,-24(s0)
    c0600294:	fe843783          	ld	a5,-24(s0)
    c0600298:	4759                	li	a4,22
    c060029a:	e398                	sd	a4,0(a5)
    c060029c:	fe843783          	ld	a5,-24(s0)
    c06002a0:	17e1                	addi	a5,a5,-8
    c06002a2:	fef43423          	sd	a5,-24(s0)
    c06002a6:	fe843783          	ld	a5,-24(s0)
    c06002aa:	03900713          	li	a4,57
    c06002ae:	e398                	sd	a4,0(a5)
    c06002b0:	fe843783          	ld	a5,-24(s0)
    c06002b4:	17e1                	addi	a5,a5,-8
    c06002b6:	fef43423          	sd	a5,-24(s0)
    c06002ba:	fe843783          	ld	a5,-24(s0)
    c06002be:	0007b023          	sd	zero,0(a5)
    c06002c2:	fe843783          	ld	a5,-24(s0)
    c06002c6:	17e1                	addi	a5,a5,-8
    c06002c8:	fef43423          	sd	a5,-24(s0)
    c06002cc:	fe843783          	ld	a5,-24(s0)
    c06002d0:	470d                	li	a4,3
    c06002d2:	e398                	sd	a4,0(a5)
    c06002d4:	fe843783          	ld	a5,-24(s0)
    c06002d8:	853e                	mv	a0,a5
    c06002da:	6462                	ld	s0,24(sp)
    c06002dc:	6105                	addi	sp,sp,32
    c06002de:	8082                	ret

00000000c06002e0 <memset>:
    c06002e0:	7179                	addi	sp,sp,-48
    c06002e2:	f422                	sd	s0,40(sp)
    c06002e4:	1800                	addi	s0,sp,48
    c06002e6:	fea43423          	sd	a0,-24(s0)
    c06002ea:	87ae                	mv	a5,a1
    c06002ec:	fcc43c23          	sd	a2,-40(s0)
    c06002f0:	fef42223          	sw	a5,-28(s0)
    c06002f4:	fe843783          	ld	a5,-24(s0)
    c06002f8:	853e                	mv	a0,a5
    c06002fa:	7422                	ld	s0,40(sp)
    c06002fc:	6145                	addi	sp,sp,48
    c06002fe:	8082                	ret

00000000c0600300 <init_other_driver>:
    c0600300:	de010113          	addi	sp,sp,-544
    c0600304:	20113c23          	sd	ra,536(sp)
    c0600308:	20813823          	sd	s0,528(sp)
    c060030c:	1400                	addi	s0,sp,544
    c060030e:	de840793          	addi	a5,s0,-536
    c0600312:	20000713          	li	a4,512
    c0600316:	863a                	mv	a2,a4
    c0600318:	4581                	li	a1,0
    c060031a:	853e                	mv	a0,a5
    c060031c:	fc5ff0ef          	jal	ra,c06002e0 <memset>
    c0600320:	00000797          	auipc	a5,0x0
    c0600324:	7b078793          	addi	a5,a5,1968 # c0600ad0 <init_console_driver>
    c0600328:	def43423          	sd	a5,-536(s0)
    c060032c:	fe042623          	sw	zero,-20(s0)
    c0600330:	a0a5                	j	c0600398 <init_other_driver+0x98>
    c0600332:	fec42783          	lw	a5,-20(s0)
    c0600336:	078e                	slli	a5,a5,0x3
    c0600338:	ff040713          	addi	a4,s0,-16
    c060033c:	97ba                	add	a5,a5,a4
    c060033e:	df87b783          	ld	a5,-520(a5)
    c0600342:	c7b1                	beqz	a5,c060038e <init_other_driver+0x8e>
    c0600344:	fec42783          	lw	a5,-20(s0)
    c0600348:	078e                	slli	a5,a5,0x3
    c060034a:	ff040713          	addi	a4,s0,-16
    c060034e:	97ba                	add	a5,a5,a4
    c0600350:	df87b703          	ld	a4,-520(a5)
    c0600354:	00067697          	auipc	a3,0x67
    c0600358:	eac68693          	addi	a3,a3,-340 # c0667200 <drv_init_list>
    c060035c:	fec42783          	lw	a5,-20(s0)
    c0600360:	078e                	slli	a5,a5,0x3
    c0600362:	97b6                	add	a5,a5,a3
    c0600364:	e398                	sd	a4,0(a5)
    c0600366:	00067717          	auipc	a4,0x67
    c060036a:	e9a70713          	addi	a4,a4,-358 # c0667200 <drv_init_list>
    c060036e:	fec42783          	lw	a5,-20(s0)
    c0600372:	078e                	slli	a5,a5,0x3
    c0600374:	97ba                	add	a5,a5,a4
    c0600376:	639c                	ld	a5,0(a5)
    c0600378:	9782                	jalr	a5
    c060037a:	86aa                	mv	a3,a0
    c060037c:	00067717          	auipc	a4,0x67
    c0600380:	c8470713          	addi	a4,a4,-892 # c0667000 <peri_reg_list>
    c0600384:	fec42783          	lw	a5,-20(s0)
    c0600388:	078e                	slli	a5,a5,0x3
    c060038a:	97ba                	add	a5,a5,a4
    c060038c:	e394                	sd	a3,0(a5)
    c060038e:	fec42783          	lw	a5,-20(s0)
    c0600392:	2785                	addiw	a5,a5,1
    c0600394:	fef42623          	sw	a5,-20(s0)
    c0600398:	fec42783          	lw	a5,-20(s0)
    c060039c:	0007871b          	sext.w	a4,a5
    c06003a0:	03f00793          	li	a5,63
    c06003a4:	f8e7d7e3          	bge	a5,a4,c0600332 <init_other_driver+0x32>
    c06003a8:	0001                	nop
    c06003aa:	0001                	nop
    c06003ac:	21813083          	ld	ra,536(sp)
    c06003b0:	21013403          	ld	s0,528(sp)
    c06003b4:	22010113          	addi	sp,sp,544
    c06003b8:	8082                	ret

00000000c06003ba <prepare_boot>:
    c06003ba:	7139                	addi	sp,sp,-64
    c06003bc:	fc06                	sd	ra,56(sp)
    c06003be:	f822                	sd	s0,48(sp)
    c06003c0:	0080                	addi	s0,sp,64
    c06003c2:	fca43423          	sd	a0,-56(s0)
    c06003c6:	fcb43023          	sd	a1,-64(s0)
    c06003ca:	f37ff0ef          	jal	ra,c0600300 <init_other_driver>
    c06003ce:	100027f3          	csrr	a5,sstatus
    c06003d2:	fef43423          	sd	a5,-24(s0)
    c06003d6:	fe843783          	ld	a5,-24(s0)
    c06003da:	fef43023          	sd	a5,-32(s0)
    c06003de:	fe043703          	ld	a4,-32(s0)
    c06003e2:	000407b7          	lui	a5,0x40
    c06003e6:	8fd9                	or	a5,a5,a4
    c06003e8:	fef43023          	sd	a5,-32(s0)
    c06003ec:	fe043783          	ld	a5,-32(s0)
    c06003f0:	10079073          	csrw	sstatus,a5
    c06003f4:	fc043503          	ld	a0,-64(s0)
    c06003f8:	cddff0ef          	jal	ra,c06000d4 <init_usr_stack>
    c06003fc:	fca43023          	sd	a0,-64(s0)
    c0600400:	20200793          	li	a5,514
    c0600404:	fcf43c23          	sd	a5,-40(s0)
    c0600408:	fd843783          	ld	a5,-40(s0)
    c060040c:	10479073          	csrw	sie,a5
    c0600410:	00004517          	auipc	a0,0x4
    c0600414:	bf050513          	addi	a0,a0,-1040 # c0604000 <_init_data_end>
    c0600418:	0eb010ef          	jal	ra,c0601d02 <printd>
    c060041c:	fe043703          	ld	a4,-32(s0)
    c0600420:	fffc07b7          	lui	a5,0xfffc0
    c0600424:	eee78793          	addi	a5,a5,-274 # fffffffffffbfeee <_temp_stack_end+0xffffffff3f950eee>
    c0600428:	8ff9                	and	a5,a5,a4
    c060042a:	fef43023          	sd	a5,-32(s0)
    c060042e:	fe043783          	ld	a5,-32(s0)
    c0600432:	0227e793          	ori	a5,a5,34
    c0600436:	fef43023          	sd	a5,-32(s0)
    c060043a:	fe043783          	ld	a5,-32(s0)
    c060043e:	10079073          	csrw	sstatus,a5
    c0600442:	fc843583          	ld	a1,-56(s0)
    c0600446:	00004517          	auipc	a0,0x4
    c060044a:	bd250513          	addi	a0,a0,-1070 # c0604018 <_init_data_end+0x18>
    c060044e:	0b5010ef          	jal	ra,c0601d02 <printd>
    c0600452:	fc843783          	ld	a5,-56(s0)
    c0600456:	14179073          	csrw	sepc,a5
    c060045a:	fc043783          	ld	a5,-64(s0)
    c060045e:	14079073          	csrw	sscratch,a5
    c0600462:	0001                	nop
    c0600464:	70e2                	ld	ra,56(sp)
    c0600466:	7442                	ld	s0,48(sp)
    c0600468:	6121                	addi	sp,sp,64
    c060046a:	8082                	ret

00000000c060046c <__pt2pte>:
    c060046c:	1101                	addi	sp,sp,-32
    c060046e:	ec22                	sd	s0,24(sp)
    c0600470:	1000                	addi	s0,sp,32
    c0600472:	87aa                	mv	a5,a0
    c0600474:	fef41723          	sh	a5,-18(s0)
    c0600478:	47bd                	li	a5,15
    c060047a:	853e                	mv	a0,a5
    c060047c:	6462                	ld	s0,24(sp)
    c060047e:	6105                	addi	sp,sp,32
    c0600480:	8082                	ret

00000000c0600482 <elf_load>:
    c0600482:	7171                	addi	sp,sp,-176
    c0600484:	f506                	sd	ra,168(sp)
    c0600486:	f122                	sd	s0,160(sp)
    c0600488:	ed26                	sd	s1,152(sp)
    c060048a:	e94a                	sd	s2,144(sp)
    c060048c:	e54e                	sd	s3,136(sp)
    c060048e:	1900                	addi	s0,sp,176
    c0600490:	f6a43423          	sd	a0,-152(s0)
    c0600494:	f6b43023          	sd	a1,-160(s0)
    c0600498:	87b2                	mv	a5,a2
    c060049a:	f4d43823          	sd	a3,-176(s0)
    c060049e:	f4f40fa3          	sb	a5,-161(s0)
    c06004a2:	f6043503          	ld	a0,-160(s0)
    c06004a6:	16c000ef          	jal	ra,c0600612 <elf_check>
    c06004aa:	87aa                	mv	a5,a0
    c06004ac:	c399                	beqz	a5,c06004b2 <elf_load+0x30>
    c06004ae:	57fd                	li	a5,-1
    c06004b0:	aa89                	j	c0600602 <elf_load+0x180>
    c06004b2:	f6043783          	ld	a5,-160(s0)
    c06004b6:	fcf43023          	sd	a5,-64(s0)
    c06004ba:	fc043783          	ld	a5,-64(s0)
    c06004be:	7398                	ld	a4,32(a5)
    c06004c0:	f6043783          	ld	a5,-160(s0)
    c06004c4:	97ba                	add	a5,a5,a4
    c06004c6:	faf43c23          	sd	a5,-72(s0)
    c06004ca:	fc042623          	sw	zero,-52(s0)
    c06004ce:	a239                	j	c06005dc <elf_load+0x15a>
    c06004d0:	fcc42703          	lw	a4,-52(s0)
    c06004d4:	87ba                	mv	a5,a4
    c06004d6:	078e                	slli	a5,a5,0x3
    c06004d8:	8f99                	sub	a5,a5,a4
    c06004da:	078e                	slli	a5,a5,0x3
    c06004dc:	873e                	mv	a4,a5
    c06004de:	fb843783          	ld	a5,-72(s0)
    c06004e2:	97ba                	add	a5,a5,a4
    c06004e4:	0007b803          	ld	a6,0(a5)
    c06004e8:	6788                	ld	a0,8(a5)
    c06004ea:	6b8c                	ld	a1,16(a5)
    c06004ec:	6f90                	ld	a2,24(a5)
    c06004ee:	7394                	ld	a3,32(a5)
    c06004f0:	7798                	ld	a4,40(a5)
    c06004f2:	7b9c                	ld	a5,48(a5)
    c06004f4:	f7043c23          	sd	a6,-136(s0)
    c06004f8:	f8a43023          	sd	a0,-128(s0)
    c06004fc:	f8b43423          	sd	a1,-120(s0)
    c0600500:	f8c43823          	sd	a2,-112(s0)
    c0600504:	f8d43c23          	sd	a3,-104(s0)
    c0600508:	fae43023          	sd	a4,-96(s0)
    c060050c:	faf43423          	sd	a5,-88(s0)
    c0600510:	f7842783          	lw	a5,-136(s0)
    c0600514:	873e                	mv	a4,a5
    c0600516:	4785                	li	a5,1
    c0600518:	0af71d63          	bne	a4,a5,c06005d2 <elf_load+0x150>
    c060051c:	f9843703          	ld	a4,-104(s0)
    c0600520:	6785                	lui	a5,0x1
    c0600522:	17fd                	addi	a5,a5,-1
    c0600524:	97ba                	add	a5,a5,a4
    c0600526:	83b1                	srli	a5,a5,0xc
    c0600528:	0785                	addi	a5,a5,1
    c060052a:	faf43823          	sd	a5,-80(s0)
    c060052e:	f6843483          	ld	s1,-152(s0)
    c0600532:	f8843703          	ld	a4,-120(s0)
    c0600536:	77fd                	lui	a5,0xfffff
    c0600538:	00f77933          	and	s2,a4,a5
    c060053c:	f8043703          	ld	a4,-128(s0)
    c0600540:	f6043783          	ld	a5,-160(s0)
    c0600544:	973e                	add	a4,a4,a5
    c0600546:	77fd                	lui	a5,0xfffff
    c0600548:	00f779b3          	and	s3,a4,a5
    c060054c:	f7c42783          	lw	a5,-132(s0)
    c0600550:	17c2                	slli	a5,a5,0x30
    c0600552:	93c1                	srli	a5,a5,0x30
    c0600554:	853e                	mv	a0,a5
    c0600556:	f17ff0ef          	jal	ra,c060046c <__pt2pte>
    c060055a:	87aa                	mv	a5,a0
    c060055c:	0107e793          	ori	a5,a5,16
    c0600560:	873e                	mv	a4,a5
    c0600562:	fb043683          	ld	a3,-80(s0)
    c0600566:	864e                	mv	a2,s3
    c0600568:	85ca                	mv	a1,s2
    c060056a:	8526                	mv	a0,s1
    c060056c:	087020ef          	jal	ra,c0602df2 <map_page>
    c0600570:	fb043783          	ld	a5,-80(s0)
    c0600574:	00c79713          	slli	a4,a5,0xc
    c0600578:	fa043783          	ld	a5,-96(s0)
    c060057c:	04f77a63          	bgeu	a4,a5,c06005d0 <elf_load+0x14e>
    c0600580:	fa043703          	ld	a4,-96(s0)
    c0600584:	f9843783          	ld	a5,-104(s0)
    c0600588:	8f1d                	sub	a4,a4,a5
    c060058a:	6785                	lui	a5,0x1
    c060058c:	17fd                	addi	a5,a5,-1
    c060058e:	97ba                	add	a5,a5,a4
    c0600590:	83b1                	srli	a5,a5,0xc
    c0600592:	faf43823          	sd	a5,-80(s0)
    c0600596:	f6843483          	ld	s1,-152(s0)
    c060059a:	f8843703          	ld	a4,-120(s0)
    c060059e:	f9843783          	ld	a5,-104(s0)
    c06005a2:	973e                	add	a4,a4,a5
    c06005a4:	77fd                	lui	a5,0xfffff
    c06005a6:	00f77933          	and	s2,a4,a5
    c06005aa:	f7c42783          	lw	a5,-132(s0)
    c06005ae:	17c2                	slli	a5,a5,0x30
    c06005b0:	93c1                	srli	a5,a5,0x30
    c06005b2:	853e                	mv	a0,a5
    c06005b4:	eb9ff0ef          	jal	ra,c060046c <__pt2pte>
    c06005b8:	87aa                	mv	a5,a0
    c06005ba:	0107e793          	ori	a5,a5,16
    c06005be:	f5f44703          	lbu	a4,-161(s0)
    c06005c2:	86be                	mv	a3,a5
    c06005c4:	fb043603          	ld	a2,-80(s0)
    c06005c8:	85ca                	mv	a1,s2
    c06005ca:	8526                	mv	a0,s1
    c06005cc:	16d020ef          	jal	ra,c0602f38 <alloc_page>
    c06005d0:	0001                	nop
    c06005d2:	fcc42783          	lw	a5,-52(s0)
    c06005d6:	2785                	addiw	a5,a5,1
    c06005d8:	fcf42623          	sw	a5,-52(s0)
    c06005dc:	fc043783          	ld	a5,-64(s0)
    c06005e0:	0387d783          	lhu	a5,56(a5) # fffffffffffff038 <_temp_stack_end+0xffffffff3f990038>
    c06005e4:	0007871b          	sext.w	a4,a5
    c06005e8:	fcc42783          	lw	a5,-52(s0)
    c06005ec:	2781                	sext.w	a5,a5
    c06005ee:	eee7c1e3          	blt	a5,a4,c06004d0 <elf_load+0x4e>
    c06005f2:	f5043783          	ld	a5,-176(s0)
    c06005f6:	10000737          	lui	a4,0x10000
    c06005fa:	e398                	sd	a4,0(a5)
    c06005fc:	fc043783          	ld	a5,-64(s0)
    c0600600:	6f9c                	ld	a5,24(a5)
    c0600602:	853e                	mv	a0,a5
    c0600604:	70aa                	ld	ra,168(sp)
    c0600606:	740a                	ld	s0,160(sp)
    c0600608:	64ea                	ld	s1,152(sp)
    c060060a:	694a                	ld	s2,144(sp)
    c060060c:	69aa                	ld	s3,136(sp)
    c060060e:	614d                	addi	sp,sp,176
    c0600610:	8082                	ret

00000000c0600612 <elf_check>:
    c0600612:	7139                	addi	sp,sp,-64
    c0600614:	fc06                	sd	ra,56(sp)
    c0600616:	f822                	sd	s0,48(sp)
    c0600618:	0080                	addi	s0,sp,64
    c060061a:	fca43423          	sd	a0,-56(s0)
    c060061e:	fc843783          	ld	a5,-56(s0)
    c0600622:	fef43423          	sd	a5,-24(s0)
    c0600626:	fe843783          	ld	a5,-24(s0)
    c060062a:	0007c783          	lbu	a5,0(a5)
    c060062e:	873e                	mv	a4,a5
    c0600630:	07f00793          	li	a5,127
    c0600634:	04f71063          	bne	a4,a5,c0600674 <elf_check+0x62>
    c0600638:	fe843783          	ld	a5,-24(s0)
    c060063c:	0785                	addi	a5,a5,1
    c060063e:	0007c783          	lbu	a5,0(a5)
    c0600642:	873e                	mv	a4,a5
    c0600644:	04500793          	li	a5,69
    c0600648:	02f71663          	bne	a4,a5,c0600674 <elf_check+0x62>
    c060064c:	fe843783          	ld	a5,-24(s0)
    c0600650:	0789                	addi	a5,a5,2
    c0600652:	0007c783          	lbu	a5,0(a5)
    c0600656:	873e                	mv	a4,a5
    c0600658:	04c00793          	li	a5,76
    c060065c:	00f71c63          	bne	a4,a5,c0600674 <elf_check+0x62>
    c0600660:	fe843783          	ld	a5,-24(s0)
    c0600664:	078d                	addi	a5,a5,3
    c0600666:	0007c783          	lbu	a5,0(a5)
    c060066a:	873e                	mv	a4,a5
    c060066c:	04600793          	li	a5,70
    c0600670:	00f70a63          	beq	a4,a5,c0600684 <elf_check+0x72>
    c0600674:	00004517          	auipc	a0,0x4
    c0600678:	9c450513          	addi	a0,a0,-1596 # c0604038 <_init_data_end+0x38>
    c060067c:	686010ef          	jal	ra,c0601d02 <printd>
    c0600680:	57fd                	li	a5,-1
    c0600682:	a849                	j	c0600714 <elf_check+0x102>
    c0600684:	fe843783          	ld	a5,-24(s0)
    c0600688:	0791                	addi	a5,a5,4
    c060068a:	0007c783          	lbu	a5,0(a5)
    c060068e:	873e                	mv	a4,a5
    c0600690:	4789                	li	a5,2
    c0600692:	00f71563          	bne	a4,a5,c060069c <elf_check+0x8a>
    c0600696:	04000793          	li	a5,64
    c060069a:	a019                	j	c06006a0 <elf_check+0x8e>
    c060069c:	02000793          	li	a5,32
    c06006a0:	fef403a3          	sb	a5,-25(s0)
    c06006a4:	fe744783          	lbu	a5,-25(s0)
    c06006a8:	0ff7f713          	andi	a4,a5,255
    c06006ac:	04000793          	li	a5,64
    c06006b0:	00f70a63          	beq	a4,a5,c06006c4 <elf_check+0xb2>
    c06006b4:	00004517          	auipc	a0,0x4
    c06006b8:	99450513          	addi	a0,a0,-1644 # c0604048 <_init_data_end+0x48>
    c06006bc:	646010ef          	jal	ra,c0601d02 <printd>
    c06006c0:	57fd                	li	a5,-1
    c06006c2:	a889                	j	c0600714 <elf_check+0x102>
    c06006c4:	fc843783          	ld	a5,-56(s0)
    c06006c8:	fcf43c23          	sd	a5,-40(s0)
    c06006cc:	fd843783          	ld	a5,-40(s0)
    c06006d0:	0107d783          	lhu	a5,16(a5)
    c06006d4:	0007871b          	sext.w	a4,a5
    c06006d8:	4789                	li	a5,2
    c06006da:	00f70a63          	beq	a4,a5,c06006ee <elf_check+0xdc>
    c06006de:	00004517          	auipc	a0,0x4
    c06006e2:	98250513          	addi	a0,a0,-1662 # c0604060 <_init_data_end+0x60>
    c06006e6:	61c010ef          	jal	ra,c0601d02 <printd>
    c06006ea:	57fd                	li	a5,-1
    c06006ec:	a025                	j	c0600714 <elf_check+0x102>
    c06006ee:	fd843783          	ld	a5,-40(s0)
    c06006f2:	0127d783          	lhu	a5,18(a5)
    c06006f6:	0007871b          	sext.w	a4,a5
    c06006fa:	0f300793          	li	a5,243
    c06006fe:	00f70a63          	beq	a4,a5,c0600712 <elf_check+0x100>
    c0600702:	00004517          	auipc	a0,0x4
    c0600706:	97650513          	addi	a0,a0,-1674 # c0604078 <_init_data_end+0x78>
    c060070a:	5f8010ef          	jal	ra,c0601d02 <printd>
    c060070e:	57fd                	li	a5,-1
    c0600710:	a011                	j	c0600714 <elf_check+0x102>
    c0600712:	4781                	li	a5,0
    c0600714:	853e                	mv	a0,a5
    c0600716:	70e2                	ld	ra,56(sp)
    c0600718:	7442                	ld	s0,48(sp)
    c060071a:	6121                	addi	sp,sp,64
    c060071c:	8082                	ret

00000000c060071e <handle_interrupt>:
    c060071e:	715d                	addi	sp,sp,-80
    c0600720:	e486                	sd	ra,72(sp)
    c0600722:	e0a2                	sd	s0,64(sp)
    c0600724:	0880                	addi	s0,sp,80
    c0600726:	fca43423          	sd	a0,-56(s0)
    c060072a:	fcb43023          	sd	a1,-64(s0)
    c060072e:	fac43c23          	sd	a2,-72(s0)
    c0600732:	fad43823          	sd	a3,-80(s0)
    c0600736:	fc043703          	ld	a4,-64(s0)
    c060073a:	47a5                	li	a5,9
    c060073c:	06f70563          	beq	a4,a5,c06007a6 <handle_interrupt+0x88>
    c0600740:	fc043703          	ld	a4,-64(s0)
    c0600744:	47a5                	li	a5,9
    c0600746:	06e7ed63          	bltu	a5,a4,c06007c0 <handle_interrupt+0xa2>
    c060074a:	fc043703          	ld	a4,-64(s0)
    c060074e:	4785                	li	a5,1
    c0600750:	02f70a63          	beq	a4,a5,c0600784 <handle_interrupt+0x66>
    c0600754:	fc043703          	ld	a4,-64(s0)
    c0600758:	4795                	li	a5,5
    c060075a:	06f71363          	bne	a4,a5,c06007c0 <handle_interrupt+0xa2>
    c060075e:	fb043683          	ld	a3,-80(s0)
    c0600762:	fb843603          	ld	a2,-72(s0)
    c0600766:	fc043583          	ld	a1,-64(s0)
    c060076a:	00004517          	auipc	a0,0x4
    c060076e:	92e50513          	addi	a0,a0,-1746 # c0604098 <_init_data_end+0x98>
    c0600772:	590010ef          	jal	ra,c0601d02 <printd>
    c0600776:	02000793          	li	a5,32
    c060077a:	1447b7f3          	csrrc	a5,sip,a5
    c060077e:	fcf43c23          	sd	a5,-40(s0)
    c0600782:	a081                	j	c06007c2 <handle_interrupt+0xa4>
    c0600784:	fb043683          	ld	a3,-80(s0)
    c0600788:	fb843603          	ld	a2,-72(s0)
    c060078c:	fc043583          	ld	a1,-64(s0)
    c0600790:	00004517          	auipc	a0,0x4
    c0600794:	90850513          	addi	a0,a0,-1784 # c0604098 <_init_data_end+0x98>
    c0600798:	56a010ef          	jal	ra,c0601d02 <printd>
    c060079c:	144177f3          	csrrci	a5,sip,2
    c06007a0:	fcf43823          	sd	a5,-48(s0)
    c06007a4:	a839                	j	c06007c2 <handle_interrupt+0xa4>
    c06007a6:	20000793          	li	a5,512
    c06007aa:	1447b7f3          	csrrc	a5,sip,a5
    c06007ae:	fef43423          	sd	a5,-24(s0)
    c06007b2:	20000793          	li	a5,512
    c06007b6:	1047b7f3          	csrrc	a5,sie,a5
    c06007ba:	fef43023          	sd	a5,-32(s0)
    c06007be:	a011                	j	c06007c2 <handle_interrupt+0xa4>
    c06007c0:	0001                	nop
    c06007c2:	0001                	nop
    c06007c4:	60a6                	ld	ra,72(sp)
    c06007c6:	6406                	ld	s0,64(sp)
    c06007c8:	6161                	addi	sp,sp,80
    c06007ca:	8082                	ret

00000000c06007cc <handle_exception>:
    c06007cc:	7179                	addi	sp,sp,-48
    c06007ce:	f406                	sd	ra,40(sp)
    c06007d0:	f022                	sd	s0,32(sp)
    c06007d2:	1800                	addi	s0,sp,48
    c06007d4:	fea43423          	sd	a0,-24(s0)
    c06007d8:	feb43023          	sd	a1,-32(s0)
    c06007dc:	fcc43c23          	sd	a2,-40(s0)
    c06007e0:	fcd43823          	sd	a3,-48(s0)
    c06007e4:	fd043683          	ld	a3,-48(s0)
    c06007e8:	fd843603          	ld	a2,-40(s0)
    c06007ec:	fe043583          	ld	a1,-32(s0)
    c06007f0:	00004517          	auipc	a0,0x4
    c06007f4:	8d850513          	addi	a0,a0,-1832 # c06040c8 <_init_data_end+0xc8>
    c06007f8:	50a010ef          	jal	ra,c0601d02 <printd>
    c06007fc:	4501                	li	a0,0
    c06007fe:	4581                	li	a1,0
    c0600800:	4601                	li	a2,0
    c0600802:	19100813          	li	a6,401
    c0600806:	192617b7          	lui	a5,0x19261
    c060080a:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c060080e:	00000073          	ecall
    c0600812:	0001                	nop
    c0600814:	70a2                	ld	ra,40(sp)
    c0600816:	7402                	ld	s0,32(sp)
    c0600818:	6145                	addi	sp,sp,48
    c060081a:	8082                	ret

00000000c060081c <handle_syscall>:
    c060081c:	7159                	addi	sp,sp,-112
    c060081e:	f486                	sd	ra,104(sp)
    c0600820:	f0a2                	sd	s0,96(sp)
    c0600822:	1880                	addi	s0,sp,112
    c0600824:	faa43423          	sd	a0,-88(s0)
    c0600828:	fab43023          	sd	a1,-96(s0)
    c060082c:	f8c43c23          	sd	a2,-104(s0)
    c0600830:	f8d43823          	sd	a3,-112(s0)
    c0600834:	100027f3          	csrr	a5,sstatus
    c0600838:	fef43023          	sd	a5,-32(s0)
    c060083c:	fe043783          	ld	a5,-32(s0)
    c0600840:	fcf43c23          	sd	a5,-40(s0)
    c0600844:	fd843703          	ld	a4,-40(s0)
    c0600848:	000407b7          	lui	a5,0x40
    c060084c:	8fd9                	or	a5,a5,a4
    c060084e:	fcf43c23          	sd	a5,-40(s0)
    c0600852:	fd843783          	ld	a5,-40(s0)
    c0600856:	10079073          	csrw	sstatus,a5
    c060085a:	fa043703          	ld	a4,-96(s0)
    c060085e:	47a1                	li	a5,8
    c0600860:	00f70c63          	beq	a4,a5,c0600878 <handle_syscall+0x5c>
    c0600864:	f9043683          	ld	a3,-112(s0)
    c0600868:	f9843603          	ld	a2,-104(s0)
    c060086c:	fa043583          	ld	a1,-96(s0)
    c0600870:	fa843503          	ld	a0,-88(s0)
    c0600874:	f59ff0ef          	jal	ra,c06007cc <handle_exception>
    c0600878:	fa843783          	ld	a5,-88(s0)
    c060087c:	67dc                	ld	a5,136(a5)
    c060087e:	fcf43823          	sd	a5,-48(s0)
    c0600882:	fa843783          	ld	a5,-88(s0)
    c0600886:	6bbc                	ld	a5,80(a5)
    c0600888:	fcf43423          	sd	a5,-56(s0)
    c060088c:	fa843783          	ld	a5,-88(s0)
    c0600890:	6fbc                	ld	a5,88(a5)
    c0600892:	fcf43023          	sd	a5,-64(s0)
    c0600896:	fe043423          	sd	zero,-24(s0)
    c060089a:	fd043583          	ld	a1,-48(s0)
    c060089e:	00004517          	auipc	a0,0x4
    c06008a2:	85250513          	addi	a0,a0,-1966 # c06040f0 <_init_data_end+0xf0>
    c06008a6:	45c010ef          	jal	ra,c0601d02 <printd>
    c06008aa:	fd043703          	ld	a4,-48(s0)
    c06008ae:	19200793          	li	a5,402
    c06008b2:	12f70b63          	beq	a4,a5,c06009e8 <handle_syscall+0x1cc>
    c06008b6:	fd043703          	ld	a4,-48(s0)
    c06008ba:	19200793          	li	a5,402
    c06008be:	14e7e363          	bltu	a5,a4,c0600a04 <handle_syscall+0x1e8>
    c06008c2:	fd043703          	ld	a4,-48(s0)
    c06008c6:	0d600793          	li	a5,214
    c06008ca:	0af70b63          	beq	a4,a5,c0600980 <handle_syscall+0x164>
    c06008ce:	fd043703          	ld	a4,-48(s0)
    c06008d2:	0d600793          	li	a5,214
    c06008d6:	12e7e763          	bltu	a5,a4,c0600a04 <handle_syscall+0x1e8>
    c06008da:	fd043703          	ld	a4,-48(s0)
    c06008de:	0a900793          	li	a5,169
    c06008e2:	0af70f63          	beq	a4,a5,c06009a0 <handle_syscall+0x184>
    c06008e6:	fd043703          	ld	a4,-48(s0)
    c06008ea:	0a900793          	li	a5,169
    c06008ee:	10e7eb63          	bltu	a5,a4,c0600a04 <handle_syscall+0x1e8>
    c06008f2:	fd043703          	ld	a4,-48(s0)
    c06008f6:	05d00793          	li	a5,93
    c06008fa:	0af70f63          	beq	a4,a5,c06009b8 <handle_syscall+0x19c>
    c06008fe:	fd043703          	ld	a4,-48(s0)
    c0600902:	05d00793          	li	a5,93
    c0600906:	0ee7ef63          	bltu	a5,a4,c0600a04 <handle_syscall+0x1e8>
    c060090a:	fd043703          	ld	a4,-48(s0)
    c060090e:	05000793          	li	a5,80
    c0600912:	02f70563          	beq	a4,a5,c060093c <handle_syscall+0x120>
    c0600916:	fd043703          	ld	a4,-48(s0)
    c060091a:	05000793          	li	a5,80
    c060091e:	0ee7e363          	bltu	a5,a4,c0600a04 <handle_syscall+0x1e8>
    c0600922:	fd043703          	ld	a4,-48(s0)
    c0600926:	03900793          	li	a5,57
    c060092a:	04f70363          	beq	a4,a5,c0600970 <handle_syscall+0x154>
    c060092e:	fd043703          	ld	a4,-48(s0)
    c0600932:	04000793          	li	a5,64
    c0600936:	00f70d63          	beq	a4,a5,c0600950 <handle_syscall+0x134>
    c060093a:	a0e9                	j	c0600a04 <handle_syscall+0x1e8>
    c060093c:	fc043583          	ld	a1,-64(s0)
    c0600940:	fc843503          	ld	a0,-56(s0)
    c0600944:	4c1000ef          	jal	ra,c0601604 <ebi_fstat>
    c0600948:	87aa                	mv	a5,a0
    c060094a:	fef43423          	sd	a5,-24(s0)
    c060094e:	a0e5                	j	c0600a36 <handle_syscall+0x21a>
    c0600950:	00003517          	auipc	a0,0x3
    c0600954:	7c050513          	addi	a0,a0,1984 # c0604110 <_init_data_end+0x110>
    c0600958:	3aa010ef          	jal	ra,c0601d02 <printd>
    c060095c:	fc043583          	ld	a1,-64(s0)
    c0600960:	fc843503          	ld	a0,-56(s0)
    c0600964:	62d000ef          	jal	ra,c0601790 <ebi_write>
    c0600968:	87aa                	mv	a5,a0
    c060096a:	fef43423          	sd	a5,-24(s0)
    c060096e:	a0e1                	j	c0600a36 <handle_syscall+0x21a>
    c0600970:	fc843503          	ld	a0,-56(s0)
    c0600974:	687000ef          	jal	ra,c06017fa <ebi_close>
    c0600978:	87aa                	mv	a5,a0
    c060097a:	fef43423          	sd	a5,-24(s0)
    c060097e:	a865                	j	c0600a36 <handle_syscall+0x21a>
    c0600980:	fc843583          	ld	a1,-56(s0)
    c0600984:	00003517          	auipc	a0,0x3
    c0600988:	7ac50513          	addi	a0,a0,1964 # c0604130 <_init_data_end+0x130>
    c060098c:	376010ef          	jal	ra,c0601d02 <printd>
    c0600990:	fc843503          	ld	a0,-56(s0)
    c0600994:	4f9000ef          	jal	ra,c060168c <ebi_brk>
    c0600998:	87aa                	mv	a5,a0
    c060099a:	fef43423          	sd	a5,-24(s0)
    c060099e:	a861                	j	c0600a36 <handle_syscall+0x21a>
    c06009a0:	fc843783          	ld	a5,-56(s0)
    c06009a4:	fc043703          	ld	a4,-64(s0)
    c06009a8:	85ba                	mv	a1,a4
    c06009aa:	853e                	mv	a0,a5
    c06009ac:	663000ef          	jal	ra,c060180e <ebi_gettimeofday>
    c06009b0:	87aa                	mv	a5,a0
    c06009b2:	fef43423          	sd	a5,-24(s0)
    c06009b6:	a041                	j	c0600a36 <handle_syscall+0x21a>
    c06009b8:	00003517          	auipc	a0,0x3
    c06009bc:	7a050513          	addi	a0,a0,1952 # c0604158 <_init_data_end+0x158>
    c06009c0:	342010ef          	jal	ra,c0601d02 <printd>
    c06009c4:	0006d797          	auipc	a5,0x6d
    c06009c8:	a7478793          	addi	a5,a5,-1420 # c066d438 <enclave_id>
    c06009cc:	639c                	ld	a5,0(a5)
    c06009ce:	853e                	mv	a0,a5
    c06009d0:	fc843583          	ld	a1,-56(s0)
    c06009d4:	4601                	li	a2,0
    c06009d6:	19100813          	li	a6,401
    c06009da:	192617b7          	lui	a5,0x19261
    c06009de:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c06009e2:	00000073          	ecall
    c06009e6:	a881                	j	c0600a36 <handle_syscall+0x21a>
    c06009e8:	0006d797          	auipc	a5,0x6d
    c06009ec:	a5078793          	addi	a5,a5,-1456 # c066d438 <enclave_id>
    c06009f0:	639c                	ld	a5,0(a5)
    c06009f2:	853e                	mv	a0,a5
    c06009f4:	fc843583          	ld	a1,-56(s0)
    c06009f8:	4601                	li	a2,0
    c06009fa:	19200893          	li	a7,402
    c06009fe:	00000073          	ecall
    c0600a02:	a815                	j	c0600a36 <handle_syscall+0x21a>
    c0600a04:	fd043583          	ld	a1,-48(s0)
    c0600a08:	00003517          	auipc	a0,0x3
    c0600a0c:	77050513          	addi	a0,a0,1904 # c0604178 <_init_data_end+0x178>
    c0600a10:	2f2010ef          	jal	ra,c0601d02 <printd>
    c0600a14:	0006d797          	auipc	a5,0x6d
    c0600a18:	a2478793          	addi	a5,a5,-1500 # c066d438 <enclave_id>
    c0600a1c:	639c                	ld	a5,0(a5)
    c0600a1e:	853e                	mv	a0,a5
    c0600a20:	4581                	li	a1,0
    c0600a22:	4601                	li	a2,0
    c0600a24:	19100813          	li	a6,401
    c0600a28:	192617b7          	lui	a5,0x19261
    c0600a2c:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c0600a30:	00000073          	ecall
    c0600a34:	0001                	nop
    c0600a36:	f9843583          	ld	a1,-104(s0)
    c0600a3a:	00003517          	auipc	a0,0x3
    c0600a3e:	75e50513          	addi	a0,a0,1886 # c0604198 <_init_data_end+0x198>
    c0600a42:	2c0010ef          	jal	ra,c0601d02 <printd>
    c0600a46:	f9843783          	ld	a5,-104(s0)
    c0600a4a:	0791                	addi	a5,a5,4
    c0600a4c:	14179073          	csrw	sepc,a5
    c0600a50:	141027f3          	csrr	a5,sepc
    c0600a54:	faf43c23          	sd	a5,-72(s0)
    c0600a58:	fb843783          	ld	a5,-72(s0)
    c0600a5c:	85be                	mv	a1,a5
    c0600a5e:	00003517          	auipc	a0,0x3
    c0600a62:	77250513          	addi	a0,a0,1906 # c06041d0 <_init_data_end+0x1d0>
    c0600a66:	29c010ef          	jal	ra,c0601d02 <printd>
    c0600a6a:	fd843783          	ld	a5,-40(s0)
    c0600a6e:	eee7f793          	andi	a5,a5,-274
    c0600a72:	fcf43c23          	sd	a5,-40(s0)
    c0600a76:	fd843783          	ld	a5,-40(s0)
    c0600a7a:	10079073          	csrw	sstatus,a5
    c0600a7e:	00003517          	auipc	a0,0x3
    c0600a82:	78a50513          	addi	a0,a0,1930 # c0604208 <_init_data_end+0x208>
    c0600a86:	27c010ef          	jal	ra,c0601d02 <printd>
    c0600a8a:	fa843783          	ld	a5,-88(s0)
    c0600a8e:	05078793          	addi	a5,a5,80
    c0600a92:	fe843703          	ld	a4,-24(s0)
    c0600a96:	e398                	sd	a4,0(a5)
    c0600a98:	0001                	nop
    c0600a9a:	70a6                	ld	ra,104(sp)
    c0600a9c:	7406                	ld	s0,96(sp)
    c0600a9e:	6165                	addi	sp,sp,112
    c0600aa0:	8082                	ret

00000000c0600aa2 <unimplemented_exception>:
    c0600aa2:	7179                	addi	sp,sp,-48
    c0600aa4:	f406                	sd	ra,40(sp)
    c0600aa6:	f022                	sd	s0,32(sp)
    c0600aa8:	1800                	addi	s0,sp,48
    c0600aaa:	fea43423          	sd	a0,-24(s0)
    c0600aae:	feb43023          	sd	a1,-32(s0)
    c0600ab2:	fcc43c23          	sd	a2,-40(s0)
    c0600ab6:	fcd43823          	sd	a3,-48(s0)
    c0600aba:	00003517          	auipc	a0,0x3
    c0600abe:	77e50513          	addi	a0,a0,1918 # c0604238 <_init_data_end+0x238>
    c0600ac2:	240010ef          	jal	ra,c0601d02 <printd>
    c0600ac6:	0001                	nop
    c0600ac8:	70a2                	ld	ra,40(sp)
    c0600aca:	7402                	ld	s0,32(sp)
    c0600acc:	6145                	addi	sp,sp,48
    c0600ace:	8082                	ret

00000000c0600ad0 <init_console_driver>:
    c0600ad0:	7179                	addi	sp,sp,-48
    c0600ad2:	f406                	sd	ra,40(sp)
    c0600ad4:	f022                	sd	s0,32(sp)
    c0600ad6:	1800                	addi	s0,sp,48
    c0600ad8:	00003517          	auipc	a0,0x3
    c0600adc:	77850513          	addi	a0,a0,1912 # c0604250 <_init_data_end+0x250>
    c0600ae0:	222010ef          	jal	ra,c0601d02 <printd>
    c0600ae4:	0006d797          	auipc	a5,0x6d
    c0600ae8:	95c78793          	addi	a5,a5,-1700 # c066d440 <drv_addr_list>
    c0600aec:	639c                	ld	a5,0(a5)
    c0600aee:	639c                	ld	a5,0(a5)
    c0600af0:	fef43423          	sd	a5,-24(s0)
    c0600af4:	fe843783          	ld	a5,-24(s0)
    c0600af8:	fef43023          	sd	a5,-32(s0)
    c0600afc:	fe043783          	ld	a5,-32(s0)
    c0600b00:	4681                	li	a3,0
    c0600b02:	4601                	li	a2,0
    c0600b04:	4581                	li	a1,0
    c0600b06:	557d                	li	a0,-1
    c0600b08:	9782                	jalr	a5
    c0600b0a:	87aa                	mv	a5,a0
    c0600b0c:	fcf43c23          	sd	a5,-40(s0)
    c0600b10:	0006d797          	auipc	a5,0x6d
    c0600b14:	94078793          	addi	a5,a5,-1728 # c066d450 <pt_root>
    c0600b18:	639c                	ld	a5,0(a5)
    c0600b1a:	873e                	mv	a4,a5
    c0600b1c:	fd843783          	ld	a5,-40(s0)
    c0600b20:	639c                	ld	a5,0(a5)
    c0600b22:	40000613          	li	a2,1024
    c0600b26:	85be                	mv	a1,a5
    c0600b28:	853a                	mv	a0,a4
    c0600b2a:	37c020ef          	jal	ra,c0602ea6 <ioremap>
    c0600b2e:	fca43823          	sd	a0,-48(s0)
    c0600b32:	fd843783          	ld	a5,-40(s0)
    c0600b36:	639c                	ld	a5,0(a5)
    c0600b38:	853e                	mv	a0,a5
    c0600b3a:	fd043583          	ld	a1,-48(s0)
    c0600b3e:	fd843783          	ld	a5,-40(s0)
    c0600b42:	6798                	ld	a4,8(a5)
    c0600b44:	6785                	lui	a5,0x1
    c0600b46:	17fd                	addi	a5,a5,-1
    c0600b48:	973e                	add	a4,a4,a5
    c0600b4a:	77fd                	lui	a5,0xfffff
    c0600b4c:	8ff9                	and	a5,a5,a4
    c0600b4e:	863e                	mv	a2,a5
    c0600b50:	1a400813          	li	a6,420
    c0600b54:	192617b7          	lui	a5,0x19261
    c0600b58:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c0600b5c:	00000073          	ecall
    c0600b60:	fe043783          	ld	a5,-32(s0)
    c0600b64:	4681                	li	a3,0
    c0600b66:	4601                	li	a2,0
    c0600b68:	fd043583          	ld	a1,-48(s0)
    c0600b6c:	4501                	li	a0,0
    c0600b6e:	9782                	jalr	a5
    c0600b70:	00003517          	auipc	a0,0x3
    c0600b74:	6f850513          	addi	a0,a0,1784 # c0604268 <_init_data_end+0x268>
    c0600b78:	18a010ef          	jal	ra,c0601d02 <printd>
    c0600b7c:	fd843783          	ld	a5,-40(s0)
    c0600b80:	853e                	mv	a0,a5
    c0600b82:	70a2                	ld	ra,40(sp)
    c0600b84:	7402                	ld	s0,32(sp)
    c0600b86:	6145                	addi	sp,sp,48
    c0600b88:	8082                	ret

00000000c0600b8a <page_map_register>:
    c0600b8a:	1141                	addi	sp,sp,-16
    c0600b8c:	e422                	sd	s0,8(sp)
    c0600b8e:	0800                	addi	s0,sp,16
    c0600b90:	0006d797          	auipc	a5,0x6d
    c0600b94:	8c078793          	addi	a5,a5,-1856 # c066d450 <pt_root>
    c0600b98:	639c                	ld	a5,0(a5)
    c0600b9a:	853e                	mv	a0,a5
    c0600b9c:	00067797          	auipc	a5,0x67
    c0600ba0:	89478793          	addi	a5,a5,-1900 # c0667430 <inv_map>
    c0600ba4:	85be                	mv	a1,a5
    c0600ba6:	4601                	li	a2,0
    c0600ba8:	19600813          	li	a6,406
    c0600bac:	192617b7          	lui	a5,0x19261
    c0600bb0:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c0600bb4:	00000073          	ecall
    c0600bb8:	0001                	nop
    c0600bba:	6422                	ld	s0,8(sp)
    c0600bbc:	0141                	addi	sp,sp,16
    c0600bbe:	8082                	ret

00000000c0600bc0 <init_mem>:
    c0600bc0:	7141                	addi	sp,sp,-496
    c0600bc2:	f786                	sd	ra,488(sp)
    c0600bc4:	f3a2                	sd	s0,480(sp)
    c0600bc6:	efa6                	sd	s1,472(sp)
    c0600bc8:	1b80                	addi	s0,sp,496
    c0600bca:	e4a43423          	sd	a0,-440(s0)
    c0600bce:	e4b43023          	sd	a1,-448(s0)
    c0600bd2:	e2c43c23          	sd	a2,-456(s0)
    c0600bd6:	e2d43823          	sd	a3,-464(s0)
    c0600bda:	e2e43423          	sd	a4,-472(s0)
    c0600bde:	e2f43023          	sd	a5,-480(s0)
    c0600be2:	e1043c23          	sd	a6,-488(s0)
    c0600be6:	0006d797          	auipc	a5,0x6d
    c0600bea:	88278793          	addi	a5,a5,-1918 # c066d468 <EDRV_PA_START>
    c0600bee:	e3843703          	ld	a4,-456(s0)
    c0600bf2:	e398                	sd	a4,0(a5)
    c0600bf4:	0006d797          	auipc	a5,0x6d
    c0600bf8:	87478793          	addi	a5,a5,-1932 # c066d468 <EDRV_PA_START>
    c0600bfc:	639c                	ld	a5,0(a5)
    c0600bfe:	470d                	li	a4,3
    c0600c00:	077a                	slli	a4,a4,0x1e
    c0600c02:	8f1d                	sub	a4,a4,a5
    c0600c04:	0006d797          	auipc	a5,0x6d
    c0600c08:	86c78793          	addi	a5,a5,-1940 # c066d470 <EDRV_VA_PA_OFFSET>
    c0600c0c:	e398                	sd	a4,0(a5)
    c0600c0e:	0006d797          	auipc	a5,0x6d
    c0600c12:	85278793          	addi	a5,a5,-1966 # c066d460 <va_top>
    c0600c16:	470d                	li	a4,3
    c0600c18:	077a                	slli	a4,a4,0x1e
    c0600c1a:	e398                	sd	a4,0(a5)
    c0600c1c:	e4043583          	ld	a1,-448(s0)
    c0600c20:	00003517          	auipc	a0,0x3
    c0600c24:	67050513          	addi	a0,a0,1648 # c0604290 <_init_data_end+0x290>
    c0600c28:	0da010ef          	jal	ra,c0601d02 <printd>
    c0600c2c:	e3843583          	ld	a1,-456(s0)
    c0600c30:	00003517          	auipc	a0,0x3
    c0600c34:	68050513          	addi	a0,a0,1664 # c06042b0 <_init_data_end+0x2b0>
    c0600c38:	0ca010ef          	jal	ra,c0601d02 <printd>
    c0600c3c:	0006d797          	auipc	a5,0x6d
    c0600c40:	83478793          	addi	a5,a5,-1996 # c066d470 <EDRV_VA_PA_OFFSET>
    c0600c44:	639c                	ld	a5,0(a5)
    c0600c46:	85be                	mv	a1,a5
    c0600c48:	00003517          	auipc	a0,0x3
    c0600c4c:	69050513          	addi	a0,a0,1680 # c06042d8 <_init_data_end+0x2d8>
    c0600c50:	0b2010ef          	jal	ra,c0601d02 <printd>
    c0600c54:	0006d797          	auipc	a5,0x6d
    c0600c58:	80c78793          	addi	a5,a5,-2036 # c066d460 <va_top>
    c0600c5c:	639c                	ld	a5,0(a5)
    c0600c5e:	85be                	mv	a1,a5
    c0600c60:	00003517          	auipc	a0,0x3
    c0600c64:	6a050513          	addi	a0,a0,1696 # c0604300 <_init_data_end+0x300>
    c0600c68:	09a010ef          	jal	ra,c0601d02 <printd>
    c0600c6c:	0006c797          	auipc	a5,0x6c
    c0600c70:	7cc78793          	addi	a5,a5,1996 # c066d438 <enclave_id>
    c0600c74:	e4043703          	ld	a4,-448(s0)
    c0600c78:	e398                	sd	a4,0(a5)
    c0600c7a:	105027f3          	csrr	a5,stvec
    c0600c7e:	fcf43823          	sd	a5,-48(s0)
    c0600c82:	fd043783          	ld	a5,-48(s0)
    c0600c86:	fcf43423          	sd	a5,-56(s0)
    c0600c8a:	fc843583          	ld	a1,-56(s0)
    c0600c8e:	00003517          	auipc	a0,0x3
    c0600c92:	69a50513          	addi	a0,a0,1690 # c0604328 <_init_data_end+0x328>
    c0600c96:	06c010ef          	jal	ra,c0601d02 <printd>
    c0600c9a:	fffff797          	auipc	a5,0xfffff
    c0600c9e:	36678793          	addi	a5,a5,870 # c0600000 <_start>
    c0600ca2:	fcf43023          	sd	a5,-64(s0)
    c0600ca6:	0006d797          	auipc	a5,0x6d
    c0600caa:	35a78793          	addi	a5,a5,858 # c066e000 <_drv_console_end>
    c0600cae:	faf43c23          	sd	a5,-72(s0)
    c0600cb2:	fb843703          	ld	a4,-72(s0)
    c0600cb6:	fc043783          	ld	a5,-64(s0)
    c0600cba:	40f707b3          	sub	a5,a4,a5
    c0600cbe:	faf43823          	sd	a5,-80(s0)
    c0600cc2:	fffff597          	auipc	a1,0xfffff
    c0600cc6:	33e58593          	addi	a1,a1,830 # c0600000 <_start>
    c0600cca:	00003517          	auipc	a0,0x3
    c0600cce:	68650513          	addi	a0,a0,1670 # c0604350 <_init_data_end+0x350>
    c0600cd2:	030010ef          	jal	ra,c0601d02 <printd>
    c0600cd6:	0006d597          	auipc	a1,0x6d
    c0600cda:	32a58593          	addi	a1,a1,810 # c066e000 <_drv_console_end>
    c0600cde:	00003517          	auipc	a0,0x3
    c0600ce2:	6a250513          	addi	a0,a0,1698 # c0604380 <_init_data_end+0x380>
    c0600ce6:	01c010ef          	jal	ra,c0601d02 <printd>
    c0600cea:	fb043583          	ld	a1,-80(s0)
    c0600cee:	00003517          	auipc	a0,0x3
    c0600cf2:	6ba50513          	addi	a0,a0,1722 # c06043a8 <_init_data_end+0x3a8>
    c0600cf6:	00c010ef          	jal	ra,c0601d02 <printd>
    c0600cfa:	fc042e23          	sw	zero,-36(s0)
    c0600cfe:	e2843783          	ld	a5,-472(s0)
    c0600d02:	639c                	ld	a5,0(a5)
    c0600d04:	85be                	mv	a1,a5
    c0600d06:	00003517          	auipc	a0,0x3
    c0600d0a:	6ca50513          	addi	a0,a0,1738 # c06043d0 <_init_data_end+0x3d0>
    c0600d0e:	7f5000ef          	jal	ra,c0601d02 <printd>
    c0600d12:	a0c1                	j	c0600dd2 <init_mem+0x212>
    c0600d14:	fdc42703          	lw	a4,-36(s0)
    c0600d18:	87ba                	mv	a5,a4
    c0600d1a:	0786                	slli	a5,a5,0x1
    c0600d1c:	97ba                	add	a5,a5,a4
    c0600d1e:	078e                	slli	a5,a5,0x3
    c0600d20:	873e                	mv	a4,a5
    c0600d22:	e2843783          	ld	a5,-472(s0)
    c0600d26:	97ba                	add	a5,a5,a4
    c0600d28:	6390                	ld	a2,0(a5)
    c0600d2a:	0006c797          	auipc	a5,0x6c
    c0600d2e:	74678793          	addi	a5,a5,1862 # c066d470 <EDRV_VA_PA_OFFSET>
    c0600d32:	6394                	ld	a3,0(a5)
    c0600d34:	fdc42703          	lw	a4,-36(s0)
    c0600d38:	87ba                	mv	a5,a4
    c0600d3a:	0786                	slli	a5,a5,0x1
    c0600d3c:	97ba                	add	a5,a5,a4
    c0600d3e:	078e                	slli	a5,a5,0x3
    c0600d40:	873e                	mv	a4,a5
    c0600d42:	e2843783          	ld	a5,-472(s0)
    c0600d46:	97ba                	add	a5,a5,a4
    c0600d48:	00d60733          	add	a4,a2,a3
    c0600d4c:	e398                	sd	a4,0(a5)
    c0600d4e:	fdc42703          	lw	a4,-36(s0)
    c0600d52:	87ba                	mv	a5,a4
    c0600d54:	0786                	slli	a5,a5,0x1
    c0600d56:	97ba                	add	a5,a5,a4
    c0600d58:	078e                	slli	a5,a5,0x3
    c0600d5a:	873e                	mv	a4,a5
    c0600d5c:	e2843783          	ld	a5,-472(s0)
    c0600d60:	97ba                	add	a5,a5,a4
    c0600d62:	6790                	ld	a2,8(a5)
    c0600d64:	0006c797          	auipc	a5,0x6c
    c0600d68:	70c78793          	addi	a5,a5,1804 # c066d470 <EDRV_VA_PA_OFFSET>
    c0600d6c:	6394                	ld	a3,0(a5)
    c0600d6e:	fdc42703          	lw	a4,-36(s0)
    c0600d72:	87ba                	mv	a5,a4
    c0600d74:	0786                	slli	a5,a5,0x1
    c0600d76:	97ba                	add	a5,a5,a4
    c0600d78:	078e                	slli	a5,a5,0x3
    c0600d7a:	873e                	mv	a4,a5
    c0600d7c:	e2843783          	ld	a5,-472(s0)
    c0600d80:	97ba                	add	a5,a5,a4
    c0600d82:	00d60733          	add	a4,a2,a3
    c0600d86:	e798                	sd	a4,8(a5)
    c0600d88:	fdc42703          	lw	a4,-36(s0)
    c0600d8c:	87ba                	mv	a5,a4
    c0600d8e:	0786                	slli	a5,a5,0x1
    c0600d90:	97ba                	add	a5,a5,a4
    c0600d92:	078e                	slli	a5,a5,0x3
    c0600d94:	873e                	mv	a4,a5
    c0600d96:	e2843783          	ld	a5,-472(s0)
    c0600d9a:	97ba                	add	a5,a5,a4
    c0600d9c:	6390                	ld	a2,0(a5)
    c0600d9e:	fdc42703          	lw	a4,-36(s0)
    c0600da2:	87ba                	mv	a5,a4
    c0600da4:	0786                	slli	a5,a5,0x1
    c0600da6:	97ba                	add	a5,a5,a4
    c0600da8:	078e                	slli	a5,a5,0x3
    c0600daa:	873e                	mv	a4,a5
    c0600dac:	e2843783          	ld	a5,-472(s0)
    c0600db0:	97ba                	add	a5,a5,a4
    c0600db2:	6798                	ld	a4,8(a5)
    c0600db4:	fdc42783          	lw	a5,-36(s0)
    c0600db8:	86ba                	mv	a3,a4
    c0600dba:	85be                	mv	a1,a5
    c0600dbc:	00003517          	auipc	a0,0x3
    c0600dc0:	64450513          	addi	a0,a0,1604 # c0604400 <_init_data_end+0x400>
    c0600dc4:	73f000ef          	jal	ra,c0601d02 <printd>
    c0600dc8:	fdc42783          	lw	a5,-36(s0)
    c0600dcc:	2785                	addiw	a5,a5,1
    c0600dce:	fcf42e23          	sw	a5,-36(s0)
    c0600dd2:	fdc42703          	lw	a4,-36(s0)
    c0600dd6:	87ba                	mv	a5,a4
    c0600dd8:	0786                	slli	a5,a5,0x1
    c0600dda:	97ba                	add	a5,a5,a4
    c0600ddc:	078e                	slli	a5,a5,0x3
    c0600dde:	873e                	mv	a4,a5
    c0600de0:	e2843783          	ld	a5,-472(s0)
    c0600de4:	97ba                	add	a5,a5,a4
    c0600de6:	639c                	ld	a5,0(a5)
    c0600de8:	f795                	bnez	a5,c0600d14 <init_mem+0x154>
    c0600dea:	0006c797          	auipc	a5,0x6c
    c0600dee:	65678793          	addi	a5,a5,1622 # c066d440 <drv_addr_list>
    c0600df2:	e2843703          	ld	a4,-472(s0)
    c0600df6:	e398                	sd	a4,0(a5)
    c0600df8:	0006c797          	auipc	a5,0x6c
    c0600dfc:	64878793          	addi	a5,a5,1608 # c066d440 <drv_addr_list>
    c0600e00:	6398                	ld	a4,0(a5)
    c0600e02:	0006c797          	auipc	a5,0x6c
    c0600e06:	66e78793          	addi	a5,a5,1646 # c066d470 <EDRV_VA_PA_OFFSET>
    c0600e0a:	639c                	ld	a5,0(a5)
    c0600e0c:	973e                	add	a4,a4,a5
    c0600e0e:	0006c797          	auipc	a5,0x6c
    c0600e12:	63278793          	addi	a5,a5,1586 # c066d440 <drv_addr_list>
    c0600e16:	e398                	sd	a4,0(a5)
    c0600e18:	0006c797          	auipc	a5,0x6c
    c0600e1c:	62878793          	addi	a5,a5,1576 # c066d440 <drv_addr_list>
    c0600e20:	639c                	ld	a5,0(a5)
    c0600e22:	e2843683          	ld	a3,-472(s0)
    c0600e26:	0006c617          	auipc	a2,0x6c
    c0600e2a:	61a60613          	addi	a2,a2,1562 # c066d440 <drv_addr_list>
    c0600e2e:	85be                	mv	a1,a5
    c0600e30:	00003517          	auipc	a0,0x3
    c0600e34:	61050513          	addi	a0,a0,1552 # c0604440 <_init_data_end+0x440>
    c0600e38:	6cb000ef          	jal	ra,c0601d02 <printd>
    c0600e3c:	e2843703          	ld	a4,-472(s0)
    c0600e40:	6785                	lui	a5,0x1
    c0600e42:	5ff78793          	addi	a5,a5,1535 # 15ff <_start-0xc05fea01>
    c0600e46:	973e                	add	a4,a4,a5
    c0600e48:	77fd                	lui	a5,0xfffff
    c0600e4a:	8ff9                	and	a5,a5,a4
    c0600e4c:	faf43423          	sd	a5,-88(s0)
    c0600e50:	e3843703          	ld	a4,-456(s0)
    c0600e54:	008007b7          	lui	a5,0x800
    c0600e58:	97ba                	add	a5,a5,a4
    c0600e5a:	faf43023          	sd	a5,-96(s0)
    c0600e5e:	fa043703          	ld	a4,-96(s0)
    c0600e62:	fa843783          	ld	a5,-88(s0)
    c0600e66:	8f1d                	sub	a4,a4,a5
    c0600e68:	77fd                	lui	a5,0xfffff
    c0600e6a:	8ff9                	and	a5,a5,a4
    c0600e6c:	f8f43c23          	sd	a5,-104(s0)
    c0600e70:	fa043603          	ld	a2,-96(s0)
    c0600e74:	fa843583          	ld	a1,-88(s0)
    c0600e78:	00003517          	auipc	a0,0x3
    c0600e7c:	61050513          	addi	a0,a0,1552 # c0604488 <_init_data_end+0x488>
    c0600e80:	683000ef          	jal	ra,c0601d02 <printd>
    c0600e84:	f9843583          	ld	a1,-104(s0)
    c0600e88:	00003517          	auipc	a0,0x3
    c0600e8c:	64850513          	addi	a0,a0,1608 # c06044d0 <_init_data_end+0x4d0>
    c0600e90:	673000ef          	jal	ra,c0601d02 <printd>
    c0600e94:	4605                	li	a2,1
    c0600e96:	f9843583          	ld	a1,-104(s0)
    c0600e9a:	fa843503          	ld	a0,-88(s0)
    c0600e9e:	422010ef          	jal	ra,c06022c0 <spa_init>
    c0600ea2:	00003517          	auipc	a0,0x3
    c0600ea6:	65650513          	addi	a0,a0,1622 # c06044f8 <_init_data_end+0x4f8>
    c0600eaa:	659000ef          	jal	ra,c0601d02 <printd>
    c0600eae:	fa843583          	ld	a1,-88(s0)
    c0600eb2:	00003517          	auipc	a0,0x3
    c0600eb6:	66650513          	addi	a0,a0,1638 # c0604518 <_init_data_end+0x518>
    c0600eba:	649000ef          	jal	ra,c0601d02 <printd>
    c0600ebe:	e3843703          	ld	a4,-456(s0)
    c0600ec2:	e3043783          	ld	a5,-464(s0)
    c0600ec6:	973e                	add	a4,a4,a5
    c0600ec8:	6785                	lui	a5,0x1
    c0600eca:	17fd                	addi	a5,a5,-1
    c0600ecc:	973e                	add	a4,a4,a5
    c0600ece:	77fd                	lui	a5,0xfffff
    c0600ed0:	8ff9                	and	a5,a5,a4
    c0600ed2:	f8f43823          	sd	a5,-112(s0)
    c0600ed6:	00600737          	lui	a4,0x600
    c0600eda:	e3043783          	ld	a5,-464(s0)
    c0600ede:	40f707b3          	sub	a5,a4,a5
    c0600ee2:	f8f43423          	sd	a5,-120(s0)
    c0600ee6:	f8843703          	ld	a4,-120(s0)
    c0600eea:	77fd                	lui	a5,0xfffff
    c0600eec:	8ff9                	and	a5,a5,a4
    c0600eee:	4601                	li	a2,0
    c0600ef0:	85be                	mv	a1,a5
    c0600ef2:	f9043503          	ld	a0,-112(s0)
    c0600ef6:	3ca010ef          	jal	ra,c06022c0 <spa_init>
    c0600efa:	f8843603          	ld	a2,-120(s0)
    c0600efe:	f9043583          	ld	a1,-112(s0)
    c0600f02:	00003517          	auipc	a0,0x3
    c0600f06:	62e50513          	addi	a0,a0,1582 # c0604530 <_init_data_end+0x530>
    c0600f0a:	5f9000ef          	jal	ra,c0601d02 <printd>
    c0600f0e:	00003517          	auipc	a0,0x3
    c0600f12:	66250513          	addi	a0,a0,1634 # c0604570 <_init_data_end+0x570>
    c0600f16:	5ed000ef          	jal	ra,c0601d02 <printd>
    c0600f1a:	0e2020ef          	jal	ra,c0602ffc <all_zero>
    c0600f1e:	2ed010ef          	jal	ra,c0602a0a <get_page_table_root>
    c0600f22:	872a                	mv	a4,a0
    c0600f24:	0006c797          	auipc	a5,0x6c
    c0600f28:	52c78793          	addi	a5,a5,1324 # c066d450 <pt_root>
    c0600f2c:	e398                	sd	a4,0(a5)
    c0600f2e:	0006c797          	auipc	a5,0x6c
    c0600f32:	52278793          	addi	a5,a5,1314 # c066d450 <pt_root>
    c0600f36:	639c                	ld	a5,0(a5)
    c0600f38:	85be                	mv	a1,a5
    c0600f3a:	00003517          	auipc	a0,0x3
    c0600f3e:	66650513          	addi	a0,a0,1638 # c06045a0 <_init_data_end+0x5a0>
    c0600f42:	5c1000ef          	jal	ra,c0601d02 <printd>
    c0600f46:	0006c797          	auipc	a5,0x6c
    c0600f4a:	50a78793          	addi	a5,a5,1290 # c066d450 <pt_root>
    c0600f4e:	639c                	ld	a5,0(a5)
    c0600f50:	0006c697          	auipc	a3,0x6c
    c0600f54:	4f868693          	addi	a3,a3,1272 # c066d448 <prog_brk>
    c0600f58:	4601                	li	a2,0
    c0600f5a:	e3843583          	ld	a1,-456(s0)
    c0600f5e:	853e                	mv	a0,a5
    c0600f60:	d22ff0ef          	jal	ra,c0600482 <elf_load>
    c0600f64:	f8a43023          	sd	a0,-128(s0)
    c0600f68:	e2843583          	ld	a1,-472(s0)
    c0600f6c:	00003517          	auipc	a0,0x3
    c0600f70:	66450513          	addi	a0,a0,1636 # c06045d0 <_init_data_end+0x5d0>
    c0600f74:	58f000ef          	jal	ra,c0601d02 <printd>
    c0600f78:	e2843783          	ld	a5,-472(s0)
    c0600f7c:	cfcd                	beqz	a5,c0601036 <init_mem+0x476>
    c0600f7e:	e2843783          	ld	a5,-472(s0)
    c0600f82:	6398                	ld	a4,0(a5)
    c0600f84:	0006c797          	auipc	a5,0x6c
    c0600f88:	4ec78793          	addi	a5,a5,1260 # c066d470 <EDRV_VA_PA_OFFSET>
    c0600f8c:	639c                	ld	a5,0(a5)
    c0600f8e:	8f1d                	sub	a4,a4,a5
    c0600f90:	77fd                	lui	a5,0xfffff
    c0600f92:	8ff9                	and	a5,a5,a4
    c0600f94:	f6f43c23          	sd	a5,-136(s0)
    c0600f98:	e2843703          	ld	a4,-472(s0)
    c0600f9c:	6785                	lui	a5,0x1
    c0600f9e:	5ff78793          	addi	a5,a5,1535 # 15ff <_start-0xc05fea01>
    c0600fa2:	973e                	add	a4,a4,a5
    c0600fa4:	77fd                	lui	a5,0xfffff
    c0600fa6:	8ff9                	and	a5,a5,a4
    c0600fa8:	f6f43823          	sd	a5,-144(s0)
    c0600fac:	f7043703          	ld	a4,-144(s0)
    c0600fb0:	f7843783          	ld	a5,-136(s0)
    c0600fb4:	40f707b3          	sub	a5,a4,a5
    c0600fb8:	83b1                	srli	a5,a5,0xc
    c0600fba:	f6f43423          	sd	a5,-152(s0)
    c0600fbe:	f7843603          	ld	a2,-136(s0)
    c0600fc2:	f7043583          	ld	a1,-144(s0)
    c0600fc6:	00003517          	auipc	a0,0x3
    c0600fca:	63250513          	addi	a0,a0,1586 # c06045f8 <_init_data_end+0x5f8>
    c0600fce:	535000ef          	jal	ra,c0601d02 <printd>
    c0600fd2:	f6843583          	ld	a1,-152(s0)
    c0600fd6:	00003517          	auipc	a0,0x3
    c0600fda:	66250513          	addi	a0,a0,1634 # c0604638 <_init_data_end+0x638>
    c0600fde:	525000ef          	jal	ra,c0601d02 <printd>
    c0600fe2:	0006c797          	auipc	a5,0x6c
    c0600fe6:	46e78793          	addi	a5,a5,1134 # c066d450 <pt_root>
    c0600fea:	639c                	ld	a5,0(a5)
    c0600fec:	853e                	mv	a0,a5
    c0600fee:	e2843783          	ld	a5,-472(s0)
    c0600ff2:	6398                	ld	a4,0(a5)
    c0600ff4:	77fd                	lui	a5,0xfffff
    c0600ff6:	8ff9                	and	a5,a5,a4
    c0600ff8:	473d                	li	a4,15
    c0600ffa:	f6843683          	ld	a3,-152(s0)
    c0600ffe:	f7843603          	ld	a2,-136(s0)
    c0601002:	85be                	mv	a1,a5
    c0601004:	5ef010ef          	jal	ra,c0602df2 <map_page>
    c0601008:	0006c797          	auipc	a5,0x6c
    c060100c:	46878793          	addi	a5,a5,1128 # c066d470 <EDRV_VA_PA_OFFSET>
    c0601010:	6398                	ld	a4,0(a5)
    c0601012:	f7843783          	ld	a5,-136(s0)
    c0601016:	97ba                	add	a5,a5,a4
    c0601018:	853e                	mv	a0,a5
    c060101a:	417010ef          	jal	ra,c0602c30 <get_pa>
    c060101e:	87aa                	mv	a5,a0
    c0601020:	86be                	mv	a3,a5
    c0601022:	f7043603          	ld	a2,-144(s0)
    c0601026:	f7843583          	ld	a1,-136(s0)
    c060102a:	00003517          	auipc	a0,0x3
    c060102e:	63650513          	addi	a0,a0,1590 # c0604660 <_init_data_end+0x660>
    c0601032:	4d1000ef          	jal	ra,c0601d02 <printd>
    c0601036:	0006c797          	auipc	a5,0x6c
    c060103a:	41a78793          	addi	a5,a5,1050 # c066d450 <pt_root>
    c060103e:	639c                	ld	a5,0(a5)
    c0601040:	853e                	mv	a0,a5
    c0601042:	0006c797          	auipc	a5,0x6c
    c0601046:	42e78793          	addi	a5,a5,1070 # c066d470 <EDRV_VA_PA_OFFSET>
    c060104a:	6398                	ld	a4,0(a5)
    c060104c:	f9043783          	ld	a5,-112(s0)
    c0601050:	00f705b3          	add	a1,a4,a5
    c0601054:	f8843783          	ld	a5,-120(s0)
    c0601058:	83b1                	srli	a5,a5,0xc
    c060105a:	471d                	li	a4,7
    c060105c:	86be                	mv	a3,a5
    c060105e:	f9043603          	ld	a2,-112(s0)
    c0601062:	591010ef          	jal	ra,c0602df2 <map_page>
    c0601066:	f8843703          	ld	a4,-120(s0)
    c060106a:	77fd                	lui	a5,0xfffff
    c060106c:	8f7d                	and	a4,a4,a5
    c060106e:	f9043783          	ld	a5,-112(s0)
    c0601072:	00f704b3          	add	s1,a4,a5
    c0601076:	0006c797          	auipc	a5,0x6c
    c060107a:	3fa78793          	addi	a5,a5,1018 # c066d470 <EDRV_VA_PA_OFFSET>
    c060107e:	6398                	ld	a4,0(a5)
    c0601080:	f9043783          	ld	a5,-112(s0)
    c0601084:	97ba                	add	a5,a5,a4
    c0601086:	853e                	mv	a0,a5
    c0601088:	3a9010ef          	jal	ra,c0602c30 <get_pa>
    c060108c:	87aa                	mv	a5,a0
    c060108e:	86be                	mv	a3,a5
    c0601090:	8626                	mv	a2,s1
    c0601092:	f9043583          	ld	a1,-112(s0)
    c0601096:	00003517          	auipc	a0,0x3
    c060109a:	60250513          	addi	a0,a0,1538 # c0604698 <_init_data_end+0x698>
    c060109e:	465000ef          	jal	ra,c0601d02 <printd>
    c06010a2:	47c5                	li	a5,17
    c06010a4:	f6f43023          	sd	a5,-160(s0)
    c06010a8:	f6043583          	ld	a1,-160(s0)
    c06010ac:	00003517          	auipc	a0,0x3
    c06010b0:	62450513          	addi	a0,a0,1572 # c06046d0 <_init_data_end+0x6d0>
    c06010b4:	44f000ef          	jal	ra,c0601d02 <printd>
    c06010b8:	002007b7          	lui	a5,0x200
    c06010bc:	17fd                	addi	a5,a5,-1
    c06010be:	07c6                	slli	a5,a5,0x11
    c06010c0:	f4f43c23          	sd	a5,-168(s0)
    c06010c4:	004007b7          	lui	a5,0x400
    c06010c8:	17fd                	addi	a5,a5,-1
    c06010ca:	07c2                	slli	a5,a5,0x10
    c06010cc:	f4f43823          	sd	a5,-176(s0)
    c06010d0:	f5043603          	ld	a2,-176(s0)
    c06010d4:	f5843583          	ld	a1,-168(s0)
    c06010d8:	00003517          	auipc	a0,0x3
    c06010dc:	62850513          	addi	a0,a0,1576 # c0604700 <_init_data_end+0x700>
    c06010e0:	423000ef          	jal	ra,c0601d02 <printd>
    c06010e4:	0006c797          	auipc	a5,0x6c
    c06010e8:	36c78793          	addi	a5,a5,876 # c066d450 <pt_root>
    c06010ec:	639c                	ld	a5,0(a5)
    c06010ee:	4701                	li	a4,0
    c06010f0:	46dd                	li	a3,23
    c06010f2:	f6043603          	ld	a2,-160(s0)
    c06010f6:	f5843583          	ld	a1,-168(s0)
    c06010fa:	853e                	mv	a0,a5
    c06010fc:	63d010ef          	jal	ra,c0602f38 <alloc_page>
    c0601100:	f5043783          	ld	a5,-176(s0)
    c0601104:	f4f43423          	sd	a5,-184(s0)
    c0601108:	fffff797          	auipc	a5,0xfffff
    c060110c:	ef878793          	addi	a5,a5,-264 # c0600000 <_start>
    c0601110:	f4f43023          	sd	a5,-192(s0)
    c0601114:	00002797          	auipc	a5,0x2
    c0601118:	2c478793          	addi	a5,a5,708 # c06033d8 <_text_end>
    c060111c:	f2f43c23          	sd	a5,-200(s0)
    c0601120:	f3843703          	ld	a4,-200(s0)
    c0601124:	f4043783          	ld	a5,-192(s0)
    c0601128:	40f707b3          	sub	a5,a4,a5
    c060112c:	f2f43823          	sd	a5,-208(s0)
    c0601130:	f3043703          	ld	a4,-208(s0)
    c0601134:	6785                	lui	a5,0x1
    c0601136:	17fd                	addi	a5,a5,-1
    c0601138:	97ba                	add	a5,a5,a4
    c060113a:	83b1                	srli	a5,a5,0xc
    c060113c:	f2f43423          	sd	a5,-216(s0)
    c0601140:	0006c797          	auipc	a5,0x6c
    c0601144:	31078793          	addi	a5,a5,784 # c066d450 <pt_root>
    c0601148:	639c                	ld	a5,0(a5)
    c060114a:	853e                	mv	a0,a5
    c060114c:	0006c797          	auipc	a5,0x6c
    c0601150:	32478793          	addi	a5,a5,804 # c066d470 <EDRV_VA_PA_OFFSET>
    c0601154:	6398                	ld	a4,0(a5)
    c0601156:	f4043783          	ld	a5,-192(s0)
    c060115a:	97ba                	add	a5,a5,a4
    c060115c:	472d                	li	a4,11
    c060115e:	f2843683          	ld	a3,-216(s0)
    c0601162:	f4043603          	ld	a2,-192(s0)
    c0601166:	85be                	mv	a1,a5
    c0601168:	48b010ef          	jal	ra,c0602df2 <map_page>
    c060116c:	0006c797          	auipc	a5,0x6c
    c0601170:	30478793          	addi	a5,a5,772 # c066d470 <EDRV_VA_PA_OFFSET>
    c0601174:	6398                	ld	a4,0(a5)
    c0601176:	f4043783          	ld	a5,-192(s0)
    c060117a:	97ba                	add	a5,a5,a4
    c060117c:	853e                	mv	a0,a5
    c060117e:	2b3010ef          	jal	ra,c0602c30 <get_pa>
    c0601182:	87aa                	mv	a5,a0
    c0601184:	86be                	mv	a3,a5
    c0601186:	f3843603          	ld	a2,-200(s0)
    c060118a:	f4043583          	ld	a1,-192(s0)
    c060118e:	00003517          	auipc	a0,0x3
    c0601192:	5a250513          	addi	a0,a0,1442 # c0604730 <_init_data_end+0x730>
    c0601196:	36d000ef          	jal	ra,c0601d02 <printd>
    c060119a:	00005797          	auipc	a5,0x5
    c060119e:	e6678793          	addi	a5,a5,-410 # c0606000 <page_directory_pool>
    c06011a2:	f2f43023          	sd	a5,-224(s0)
    c06011a6:	00065797          	auipc	a5,0x65
    c06011aa:	e5e78793          	addi	a5,a5,-418 # c0666004 <_page_table_end>
    c06011ae:	f0f43c23          	sd	a5,-232(s0)
    c06011b2:	f1843703          	ld	a4,-232(s0)
    c06011b6:	f2043783          	ld	a5,-224(s0)
    c06011ba:	40f707b3          	sub	a5,a4,a5
    c06011be:	f0f43823          	sd	a5,-240(s0)
    c06011c2:	f1043703          	ld	a4,-240(s0)
    c06011c6:	6785                	lui	a5,0x1
    c06011c8:	17fd                	addi	a5,a5,-1
    c06011ca:	97ba                	add	a5,a5,a4
    c06011cc:	83b1                	srli	a5,a5,0xc
    c06011ce:	f0f43423          	sd	a5,-248(s0)
    c06011d2:	0006c797          	auipc	a5,0x6c
    c06011d6:	27e78793          	addi	a5,a5,638 # c066d450 <pt_root>
    c06011da:	639c                	ld	a5,0(a5)
    c06011dc:	853e                	mv	a0,a5
    c06011de:	0006c797          	auipc	a5,0x6c
    c06011e2:	29278793          	addi	a5,a5,658 # c066d470 <EDRV_VA_PA_OFFSET>
    c06011e6:	6398                	ld	a4,0(a5)
    c06011e8:	f2043783          	ld	a5,-224(s0)
    c06011ec:	97ba                	add	a5,a5,a4
    c06011ee:	471d                	li	a4,7
    c06011f0:	f0843683          	ld	a3,-248(s0)
    c06011f4:	f2043603          	ld	a2,-224(s0)
    c06011f8:	85be                	mv	a1,a5
    c06011fa:	3f9010ef          	jal	ra,c0602df2 <map_page>
    c06011fe:	0006c797          	auipc	a5,0x6c
    c0601202:	27278793          	addi	a5,a5,626 # c066d470 <EDRV_VA_PA_OFFSET>
    c0601206:	6398                	ld	a4,0(a5)
    c0601208:	f2043783          	ld	a5,-224(s0)
    c060120c:	97ba                	add	a5,a5,a4
    c060120e:	853e                	mv	a0,a5
    c0601210:	221010ef          	jal	ra,c0602c30 <get_pa>
    c0601214:	87aa                	mv	a5,a0
    c0601216:	86be                	mv	a3,a5
    c0601218:	f1843603          	ld	a2,-232(s0)
    c060121c:	f2043583          	ld	a1,-224(s0)
    c0601220:	00003517          	auipc	a0,0x3
    c0601224:	54050513          	addi	a0,a0,1344 # c0604760 <_init_data_end+0x760>
    c0601228:	2db000ef          	jal	ra,c0601d02 <printd>
    c060122c:	00003797          	auipc	a5,0x3
    c0601230:	dd478793          	addi	a5,a5,-556 # c0604000 <_init_data_end>
    c0601234:	f0f43023          	sd	a5,-256(s0)
    c0601238:	00004797          	auipc	a5,0x4
    c060123c:	08c78793          	addi	a5,a5,140 # c06052c4 <_rodata_end>
    c0601240:	eef43c23          	sd	a5,-264(s0)
    c0601244:	ef843703          	ld	a4,-264(s0)
    c0601248:	f0043783          	ld	a5,-256(s0)
    c060124c:	40f707b3          	sub	a5,a4,a5
    c0601250:	eef43823          	sd	a5,-272(s0)
    c0601254:	ef043703          	ld	a4,-272(s0)
    c0601258:	6785                	lui	a5,0x1
    c060125a:	17fd                	addi	a5,a5,-1
    c060125c:	97ba                	add	a5,a5,a4
    c060125e:	83b1                	srli	a5,a5,0xc
    c0601260:	eef43423          	sd	a5,-280(s0)
    c0601264:	0006c797          	auipc	a5,0x6c
    c0601268:	1ec78793          	addi	a5,a5,492 # c066d450 <pt_root>
    c060126c:	639c                	ld	a5,0(a5)
    c060126e:	853e                	mv	a0,a5
    c0601270:	0006c797          	auipc	a5,0x6c
    c0601274:	20078793          	addi	a5,a5,512 # c066d470 <EDRV_VA_PA_OFFSET>
    c0601278:	6398                	ld	a4,0(a5)
    c060127a:	f0043783          	ld	a5,-256(s0)
    c060127e:	97ba                	add	a5,a5,a4
    c0601280:	470d                	li	a4,3
    c0601282:	ee843683          	ld	a3,-280(s0)
    c0601286:	f0043603          	ld	a2,-256(s0)
    c060128a:	85be                	mv	a1,a5
    c060128c:	367010ef          	jal	ra,c0602df2 <map_page>
    c0601290:	0006c797          	auipc	a5,0x6c
    c0601294:	1e078793          	addi	a5,a5,480 # c066d470 <EDRV_VA_PA_OFFSET>
    c0601298:	6398                	ld	a4,0(a5)
    c060129a:	f0043783          	ld	a5,-256(s0)
    c060129e:	97ba                	add	a5,a5,a4
    c06012a0:	853e                	mv	a0,a5
    c06012a2:	18f010ef          	jal	ra,c0602c30 <get_pa>
    c06012a6:	87aa                	mv	a5,a0
    c06012a8:	86be                	mv	a3,a5
    c06012aa:	ef843603          	ld	a2,-264(s0)
    c06012ae:	f0043583          	ld	a1,-256(s0)
    c06012b2:	00003517          	auipc	a0,0x3
    c06012b6:	4e650513          	addi	a0,a0,1254 # c0604798 <_init_data_end+0x798>
    c06012ba:	249000ef          	jal	ra,c0601d02 <printd>
    c06012be:	00066797          	auipc	a5,0x66
    c06012c2:	d4278793          	addi	a5,a5,-702 # c0667000 <peri_reg_list>
    c06012c6:	eef43023          	sd	a5,-288(s0)
    c06012ca:	0006c797          	auipc	a5,0x6c
    c06012ce:	1ae78793          	addi	a5,a5,430 # c066d478 <_bss_end>
    c06012d2:	ecf43c23          	sd	a5,-296(s0)
    c06012d6:	ed843703          	ld	a4,-296(s0)
    c06012da:	ee043783          	ld	a5,-288(s0)
    c06012de:	40f707b3          	sub	a5,a4,a5
    c06012e2:	ecf43823          	sd	a5,-304(s0)
    c06012e6:	ed043703          	ld	a4,-304(s0)
    c06012ea:	6785                	lui	a5,0x1
    c06012ec:	17fd                	addi	a5,a5,-1
    c06012ee:	97ba                	add	a5,a5,a4
    c06012f0:	83b1                	srli	a5,a5,0xc
    c06012f2:	ecf43423          	sd	a5,-312(s0)
    c06012f6:	0006c797          	auipc	a5,0x6c
    c06012fa:	15a78793          	addi	a5,a5,346 # c066d450 <pt_root>
    c06012fe:	639c                	ld	a5,0(a5)
    c0601300:	853e                	mv	a0,a5
    c0601302:	0006c797          	auipc	a5,0x6c
    c0601306:	16e78793          	addi	a5,a5,366 # c066d470 <EDRV_VA_PA_OFFSET>
    c060130a:	6398                	ld	a4,0(a5)
    c060130c:	ee043783          	ld	a5,-288(s0)
    c0601310:	97ba                	add	a5,a5,a4
    c0601312:	471d                	li	a4,7
    c0601314:	ec843683          	ld	a3,-312(s0)
    c0601318:	ee043603          	ld	a2,-288(s0)
    c060131c:	85be                	mv	a1,a5
    c060131e:	2d5010ef          	jal	ra,c0602df2 <map_page>
    c0601322:	0006c797          	auipc	a5,0x6c
    c0601326:	14e78793          	addi	a5,a5,334 # c066d470 <EDRV_VA_PA_OFFSET>
    c060132a:	6398                	ld	a4,0(a5)
    c060132c:	ee043783          	ld	a5,-288(s0)
    c0601330:	97ba                	add	a5,a5,a4
    c0601332:	853e                	mv	a0,a5
    c0601334:	0fd010ef          	jal	ra,c0602c30 <get_pa>
    c0601338:	87aa                	mv	a5,a0
    c060133a:	86be                	mv	a3,a5
    c060133c:	ed843603          	ld	a2,-296(s0)
    c0601340:	ee043583          	ld	a1,-288(s0)
    c0601344:	00003517          	auipc	a0,0x3
    c0601348:	48450513          	addi	a0,a0,1156 # c06047c8 <_init_data_end+0x7c8>
    c060134c:	1b7000ef          	jal	ra,c0601d02 <printd>
    c0601350:	00003797          	auipc	a5,0x3
    c0601354:	cb078793          	addi	a5,a5,-848 # c0604000 <_init_data_end>
    c0601358:	ecf43023          	sd	a5,-320(s0)
    c060135c:	00003797          	auipc	a5,0x3
    c0601360:	ca478793          	addi	a5,a5,-860 # c0604000 <_init_data_end>
    c0601364:	eaf43c23          	sd	a5,-328(s0)
    c0601368:	eb843703          	ld	a4,-328(s0)
    c060136c:	ec043783          	ld	a5,-320(s0)
    c0601370:	40f707b3          	sub	a5,a4,a5
    c0601374:	eaf43823          	sd	a5,-336(s0)
    c0601378:	eb043703          	ld	a4,-336(s0)
    c060137c:	6785                	lui	a5,0x1
    c060137e:	17fd                	addi	a5,a5,-1
    c0601380:	97ba                	add	a5,a5,a4
    c0601382:	83b1                	srli	a5,a5,0xc
    c0601384:	eaf43423          	sd	a5,-344(s0)
    c0601388:	0006c797          	auipc	a5,0x6c
    c060138c:	0c878793          	addi	a5,a5,200 # c066d450 <pt_root>
    c0601390:	639c                	ld	a5,0(a5)
    c0601392:	853e                	mv	a0,a5
    c0601394:	0006c797          	auipc	a5,0x6c
    c0601398:	0dc78793          	addi	a5,a5,220 # c066d470 <EDRV_VA_PA_OFFSET>
    c060139c:	6398                	ld	a4,0(a5)
    c060139e:	ec043783          	ld	a5,-320(s0)
    c06013a2:	97ba                	add	a5,a5,a4
    c06013a4:	471d                	li	a4,7
    c06013a6:	ea843683          	ld	a3,-344(s0)
    c06013aa:	ec043603          	ld	a2,-320(s0)
    c06013ae:	85be                	mv	a1,a5
    c06013b0:	243010ef          	jal	ra,c0602df2 <map_page>
    c06013b4:	0006c797          	auipc	a5,0x6c
    c06013b8:	0bc78793          	addi	a5,a5,188 # c066d470 <EDRV_VA_PA_OFFSET>
    c06013bc:	6398                	ld	a4,0(a5)
    c06013be:	ec043783          	ld	a5,-320(s0)
    c06013c2:	97ba                	add	a5,a5,a4
    c06013c4:	853e                	mv	a0,a5
    c06013c6:	06b010ef          	jal	ra,c0602c30 <get_pa>
    c06013ca:	87aa                	mv	a5,a0
    c06013cc:	86be                	mv	a3,a5
    c06013ce:	eb843603          	ld	a2,-328(s0)
    c06013d2:	ec043583          	ld	a1,-320(s0)
    c06013d6:	00003517          	auipc	a0,0x3
    c06013da:	42250513          	addi	a0,a0,1058 # c06047f8 <_init_data_end+0x7f8>
    c06013de:	125000ef          	jal	ra,c0601d02 <printd>
    c06013e2:	00005797          	auipc	a5,0x5
    c06013e6:	c1e78793          	addi	a5,a5,-994 # c0606000 <page_directory_pool>
    c06013ea:	eaf43023          	sd	a5,-352(s0)
    c06013ee:	00005797          	auipc	a5,0x5
    c06013f2:	c1278793          	addi	a5,a5,-1006 # c0606000 <page_directory_pool>
    c06013f6:	e8f43c23          	sd	a5,-360(s0)
    c06013fa:	e9843703          	ld	a4,-360(s0)
    c06013fe:	ea043783          	ld	a5,-352(s0)
    c0601402:	40f707b3          	sub	a5,a4,a5
    c0601406:	e8f43823          	sd	a5,-368(s0)
    c060140a:	e9043703          	ld	a4,-368(s0)
    c060140e:	6785                	lui	a5,0x1
    c0601410:	17fd                	addi	a5,a5,-1
    c0601412:	97ba                	add	a5,a5,a4
    c0601414:	83b1                	srli	a5,a5,0xc
    c0601416:	e8f43423          	sd	a5,-376(s0)
    c060141a:	0006c797          	auipc	a5,0x6c
    c060141e:	03678793          	addi	a5,a5,54 # c066d450 <pt_root>
    c0601422:	639c                	ld	a5,0(a5)
    c0601424:	853e                	mv	a0,a5
    c0601426:	0006c797          	auipc	a5,0x6c
    c060142a:	04a78793          	addi	a5,a5,74 # c066d470 <EDRV_VA_PA_OFFSET>
    c060142e:	6398                	ld	a4,0(a5)
    c0601430:	ea043783          	ld	a5,-352(s0)
    c0601434:	97ba                	add	a5,a5,a4
    c0601436:	471d                	li	a4,7
    c0601438:	e8843683          	ld	a3,-376(s0)
    c060143c:	ea043603          	ld	a2,-352(s0)
    c0601440:	85be                	mv	a1,a5
    c0601442:	1b1010ef          	jal	ra,c0602df2 <map_page>
    c0601446:	0006c797          	auipc	a5,0x6c
    c060144a:	02a78793          	addi	a5,a5,42 # c066d470 <EDRV_VA_PA_OFFSET>
    c060144e:	6398                	ld	a4,0(a5)
    c0601450:	ea043783          	ld	a5,-352(s0)
    c0601454:	97ba                	add	a5,a5,a4
    c0601456:	853e                	mv	a0,a5
    c0601458:	7d8010ef          	jal	ra,c0602c30 <get_pa>
    c060145c:	87aa                	mv	a5,a0
    c060145e:	86be                	mv	a3,a5
    c0601460:	e9843603          	ld	a2,-360(s0)
    c0601464:	ea043583          	ld	a1,-352(s0)
    c0601468:	00003517          	auipc	a0,0x3
    c060146c:	3c850513          	addi	a0,a0,968 # c0604830 <_init_data_end+0x830>
    c0601470:	093000ef          	jal	ra,c0601d02 <printd>
    c0601474:	e5843783          	ld	a5,-424(s0)
    c0601478:	87c6                	mv	a5,a7
    c060147a:	e5843783          	ld	a5,-424(s0)
    c060147e:	85be                	mv	a1,a5
    c0601480:	00003517          	auipc	a0,0x3
    c0601484:	3e050513          	addi	a0,a0,992 # c0604860 <_init_data_end+0x860>
    c0601488:	07b000ef          	jal	ra,c0601d02 <printd>
    c060148c:	0006c797          	auipc	a5,0x6c
    c0601490:	fc478793          	addi	a5,a5,-60 # c066d450 <pt_root>
    c0601494:	639c                	ld	a5,0(a5)
    c0601496:	853e                	mv	a0,a5
    c0601498:	0006c797          	auipc	a5,0x6c
    c060149c:	fd878793          	addi	a5,a5,-40 # c066d470 <EDRV_VA_PA_OFFSET>
    c06014a0:	6398                	ld	a4,0(a5)
    c06014a2:	fa843783          	ld	a5,-88(s0)
    c06014a6:	00f705b3          	add	a1,a4,a5
    c06014aa:	f9843783          	ld	a5,-104(s0)
    c06014ae:	83b1                	srli	a5,a5,0xc
    c06014b0:	471d                	li	a4,7
    c06014b2:	86be                	mv	a3,a5
    c06014b4:	fa843603          	ld	a2,-88(s0)
    c06014b8:	13b010ef          	jal	ra,c0602df2 <map_page>
    c06014bc:	f9843703          	ld	a4,-104(s0)
    c06014c0:	77fd                	lui	a5,0xfffff
    c06014c2:	8f7d                	and	a4,a4,a5
    c06014c4:	fa843783          	ld	a5,-88(s0)
    c06014c8:	00f704b3          	add	s1,a4,a5
    c06014cc:	0006c797          	auipc	a5,0x6c
    c06014d0:	fa478793          	addi	a5,a5,-92 # c066d470 <EDRV_VA_PA_OFFSET>
    c06014d4:	6398                	ld	a4,0(a5)
    c06014d6:	fa843783          	ld	a5,-88(s0)
    c06014da:	97ba                	add	a5,a5,a4
    c06014dc:	853e                	mv	a0,a5
    c06014de:	752010ef          	jal	ra,c0602c30 <get_pa>
    c06014e2:	87aa                	mv	a5,a0
    c06014e4:	86be                	mv	a3,a5
    c06014e6:	8626                	mv	a2,s1
    c06014e8:	fa843583          	ld	a1,-88(s0)
    c06014ec:	00003517          	auipc	a0,0x3
    c06014f0:	39450513          	addi	a0,a0,916 # c0604880 <_init_data_end+0x880>
    c06014f4:	00f000ef          	jal	ra,c0601d02 <printd>
    c06014f8:	47a1                	li	a5,8
    c06014fa:	e8f43023          	sd	a5,-384(s0)
    c06014fe:	e8043583          	ld	a1,-384(s0)
    c0601502:	00003517          	auipc	a0,0x3
    c0601506:	3b650513          	addi	a0,a0,950 # c06048b8 <_init_data_end+0x8b8>
    c060150a:	7f8000ef          	jal	ra,c0601d02 <printd>
    c060150e:	15fff7b7          	lui	a5,0x15fff
    c0601512:	078e                	slli	a5,a5,0x3
    c0601514:	e6f43c23          	sd	a5,-392(s0)
    c0601518:	0006c797          	auipc	a5,0x6c
    c060151c:	f3878793          	addi	a5,a5,-200 # c066d450 <pt_root>
    c0601520:	639c                	ld	a5,0(a5)
    c0601522:	4705                	li	a4,1
    c0601524:	469d                	li	a3,7
    c0601526:	e8043603          	ld	a2,-384(s0)
    c060152a:	e7843583          	ld	a1,-392(s0)
    c060152e:	853e                	mv	a0,a5
    c0601530:	209010ef          	jal	ra,c0602f38 <alloc_page>
    c0601534:	e7843703          	ld	a4,-392(s0)
    c0601538:	67a1                	lui	a5,0x8
    c060153a:	97ba                	add	a5,a5,a4
    c060153c:	e6f43c23          	sd	a5,-392(s0)
    c0601540:	0006c797          	auipc	a5,0x6c
    c0601544:	f1078793          	addi	a5,a5,-240 # c066d450 <pt_root>
    c0601548:	639c                	ld	a5,0(a5)
    c060154a:	863e                	mv	a2,a5
    c060154c:	e7843583          	ld	a1,-392(s0)
    c0601550:	00003517          	auipc	a0,0x3
    c0601554:	39850513          	addi	a0,a0,920 # c06048e8 <_init_data_end+0x8e8>
    c0601558:	7aa000ef          	jal	ra,c0601d02 <printd>
    c060155c:	f4843583          	ld	a1,-184(s0)
    c0601560:	00003517          	auipc	a0,0x3
    c0601564:	3b850513          	addi	a0,a0,952 # c0604918 <_init_data_end+0x918>
    c0601568:	79a000ef          	jal	ra,c0601d02 <printd>
    c060156c:	0006c797          	auipc	a5,0x6c
    c0601570:	ee478793          	addi	a5,a5,-284 # c066d450 <pt_root>
    c0601574:	639c                	ld	a5,0(a5)
    c0601576:	83b1                	srli	a5,a5,0xc
    c0601578:	e6f43823          	sd	a5,-400(s0)
    c060157c:	e7043703          	ld	a4,-400(s0)
    c0601580:	57fd                	li	a5,-1
    c0601582:	17fe                	slli	a5,a5,0x3f
    c0601584:	8fd9                	or	a5,a5,a4
    c0601586:	e6f43823          	sd	a5,-400(s0)
    c060158a:	100027f3          	csrr	a5,sstatus
    c060158e:	e6f43423          	sd	a5,-408(s0)
    c0601592:	e6843783          	ld	a5,-408(s0)
    c0601596:	e6f43023          	sd	a5,-416(s0)
    c060159a:	e6043703          	ld	a4,-416(s0)
    c060159e:	000407b7          	lui	a5,0x40
    c06015a2:	8fd9                	or	a5,a5,a4
    c06015a4:	e6f43023          	sd	a5,-416(s0)
    c06015a8:	e6043783          	ld	a5,-416(s0)
    c06015ac:	10079073          	csrw	sstatus,a5
    c06015b0:	ddaff0ef          	jal	ra,c0600b8a <page_map_register>
    c06015b4:	0006c797          	auipc	a5,0x6c
    c06015b8:	eac78793          	addi	a5,a5,-340 # c066d460 <va_top>
    c06015bc:	6398                	ld	a4,0(a5)
    c06015be:	008007b7          	lui	a5,0x800
    c06015c2:	973e                	add	a4,a4,a5
    c06015c4:	0006c797          	auipc	a5,0x6c
    c06015c8:	e9c78793          	addi	a5,a5,-356 # c066d460 <va_top>
    c06015cc:	e398                	sd	a4,0(a5)
    c06015ce:	e7043783          	ld	a5,-400(s0)
    c06015d2:	853e                	mv	a0,a5
    c06015d4:	e7843783          	ld	a5,-392(s0)
    c06015d8:	85be                	mv	a1,a5
    c06015da:	f8043783          	ld	a5,-128(s0)
    c06015de:	863e                	mv	a2,a5
    c06015e0:	f4843783          	ld	a5,-184(s0)
    c06015e4:	86be                	mv	a3,a5
    c06015e6:	0001                	nop
    c06015e8:	70be                	ld	ra,488(sp)
    c06015ea:	741e                	ld	s0,480(sp)
    c06015ec:	64fe                	ld	s1,472(sp)
    c06015ee:	617d                	addi	sp,sp,496
    c06015f0:	8082                	ret

00000000c06015f2 <flush_tlb>:
    c06015f2:	1141                	addi	sp,sp,-16
    c06015f4:	e422                	sd	s0,8(sp)
    c06015f6:	0800                	addi	s0,sp,16
    c06015f8:	12000073          	sfence.vma
    c06015fc:	0001                	nop
    c06015fe:	6422                	ld	s0,8(sp)
    c0601600:	0141                	addi	sp,sp,16
    c0601602:	8082                	ret

00000000c0601604 <ebi_fstat>:
    c0601604:	7179                	addi	sp,sp,-48
    c0601606:	f422                	sd	s0,40(sp)
    c0601608:	1800                	addi	s0,sp,48
    c060160a:	fca43c23          	sd	a0,-40(s0)
    c060160e:	fcb43823          	sd	a1,-48(s0)
    c0601612:	fd043783          	ld	a5,-48(s0)
    c0601616:	fef43423          	sd	a5,-24(s0)
    c060161a:	fd843703          	ld	a4,-40(s0)
    c060161e:	4791                	li	a5,4
    c0601620:	00e7f463          	bgeu	a5,a4,c0601628 <ebi_fstat+0x24>
    c0601624:	57fd                	li	a5,-1
    c0601626:	a8b9                	j	c0601684 <ebi_fstat+0x80>
    c0601628:	fe843783          	ld	a5,-24(s0)
    c060162c:	4769                	li	a4,26
    c060162e:	e398                	sd	a4,0(a5)
    c0601630:	fe843783          	ld	a5,-24(s0)
    c0601634:	4719                	li	a4,6
    c0601636:	e798                	sd	a4,8(a5)
    c0601638:	fe843783          	ld	a5,-24(s0)
    c060163c:	4705                	li	a4,1
    c060163e:	cbd8                	sw	a4,20(a5)
    c0601640:	fe843783          	ld	a5,-24(s0)
    c0601644:	1a000713          	li	a4,416
    c0601648:	cb98                	sw	a4,16(a5)
    c060164a:	fe843783          	ld	a5,-24(s0)
    c060164e:	3e800713          	li	a4,1000
    c0601652:	cf98                	sw	a4,24(a5)
    c0601654:	fe843783          	ld	a5,-24(s0)
    c0601658:	4715                	li	a4,5
    c060165a:	cfd8                	sw	a4,28(a5)
    c060165c:	fe843783          	ld	a5,-24(s0)
    c0601660:	6725                	lui	a4,0x9
    c0601662:	80370713          	addi	a4,a4,-2045 # 8803 <_start-0xc05f77fd>
    c0601666:	f398                	sd	a4,32(a5)
    c0601668:	fe843783          	ld	a5,-24(s0)
    c060166c:	0207b823          	sd	zero,48(a5)
    c0601670:	fe843783          	ld	a5,-24(s0)
    c0601674:	40000713          	li	a4,1024
    c0601678:	df98                	sw	a4,56(a5)
    c060167a:	fe843783          	ld	a5,-24(s0)
    c060167e:	0407b023          	sd	zero,64(a5)
    c0601682:	4781                	li	a5,0
    c0601684:	853e                	mv	a0,a5
    c0601686:	7422                	ld	s0,40(sp)
    c0601688:	6145                	addi	sp,sp,48
    c060168a:	8082                	ret

00000000c060168c <ebi_brk>:
    c060168c:	7179                	addi	sp,sp,-48
    c060168e:	f406                	sd	ra,40(sp)
    c0601690:	f022                	sd	s0,32(sp)
    c0601692:	1800                	addi	s0,sp,48
    c0601694:	fca43c23          	sd	a0,-40(s0)
    c0601698:	fd843783          	ld	a5,-40(s0)
    c060169c:	eb81                	bnez	a5,c06016ac <ebi_brk+0x20>
    c060169e:	0006c797          	auipc	a5,0x6c
    c06016a2:	daa78793          	addi	a5,a5,-598 # c066d448 <prog_brk>
    c06016a6:	639c                	ld	a5,0(a5)
    c06016a8:	2781                	sext.w	a5,a5
    c06016aa:	a8f1                	j	c0601786 <ebi_brk+0xfa>
    c06016ac:	0006c797          	auipc	a5,0x6c
    c06016b0:	d9c78793          	addi	a5,a5,-612 # c066d448 <prog_brk>
    c06016b4:	639c                	ld	a5,0(a5)
    c06016b6:	85be                	mv	a1,a5
    c06016b8:	00003517          	auipc	a0,0x3
    c06016bc:	28850513          	addi	a0,a0,648 # c0604940 <_init_data_end+0x940>
    c06016c0:	642000ef          	jal	ra,c0601d02 <printd>
    c06016c4:	fd843583          	ld	a1,-40(s0)
    c06016c8:	00003517          	auipc	a0,0x3
    c06016cc:	2a850513          	addi	a0,a0,680 # c0604970 <_init_data_end+0x970>
    c06016d0:	632000ef          	jal	ra,c0601d02 <printd>
    c06016d4:	0006c797          	auipc	a5,0x6c
    c06016d8:	d7478793          	addi	a5,a5,-652 # c066d448 <prog_brk>
    c06016dc:	6398                	ld	a4,0(a5)
    c06016de:	6785                	lui	a5,0x1
    c06016e0:	17fd                	addi	a5,a5,-1
    c06016e2:	973e                	add	a4,a4,a5
    c06016e4:	77fd                	lui	a5,0xfffff
    c06016e6:	8ff9                	and	a5,a5,a4
    c06016e8:	fd843703          	ld	a4,-40(s0)
    c06016ec:	06e7fb63          	bgeu	a5,a4,c0601762 <ebi_brk+0xd6>
    c06016f0:	00003517          	auipc	a0,0x3
    c06016f4:	29050513          	addi	a0,a0,656 # c0604980 <_init_data_end+0x980>
    c06016f8:	60a000ef          	jal	ra,c0601d02 <printd>
    c06016fc:	0006c797          	auipc	a5,0x6c
    c0601700:	d4c78793          	addi	a5,a5,-692 # c066d448 <prog_brk>
    c0601704:	639c                	ld	a5,0(a5)
    c0601706:	fd843703          	ld	a4,-40(s0)
    c060170a:	8f1d                	sub	a4,a4,a5
    c060170c:	6785                	lui	a5,0x1
    c060170e:	17fd                	addi	a5,a5,-1
    c0601710:	97ba                	add	a5,a5,a4
    c0601712:	83b1                	srli	a5,a5,0xc
    c0601714:	fef43423          	sd	a5,-24(s0)
    c0601718:	fe843583          	ld	a1,-24(s0)
    c060171c:	00003517          	auipc	a0,0x3
    c0601720:	27450513          	addi	a0,a0,628 # c0604990 <_init_data_end+0x990>
    c0601724:	5de000ef          	jal	ra,c0601d02 <printd>
    c0601728:	0006c797          	auipc	a5,0x6c
    c060172c:	d2878793          	addi	a5,a5,-728 # c066d450 <pt_root>
    c0601730:	639c                	ld	a5,0(a5)
    c0601732:	853e                	mv	a0,a5
    c0601734:	0006c797          	auipc	a5,0x6c
    c0601738:	d1478793          	addi	a5,a5,-748 # c066d448 <prog_brk>
    c060173c:	6398                	ld	a4,0(a5)
    c060173e:	6785                	lui	a5,0x1
    c0601740:	17fd                	addi	a5,a5,-1
    c0601742:	973e                	add	a4,a4,a5
    c0601744:	77fd                	lui	a5,0xfffff
    c0601746:	8ff9                	and	a5,a5,a4
    c0601748:	4701                	li	a4,0
    c060174a:	46d9                	li	a3,22
    c060174c:	fe843603          	ld	a2,-24(s0)
    c0601750:	85be                	mv	a1,a5
    c0601752:	7e6010ef          	jal	ra,c0602f38 <alloc_page>
    c0601756:	00003517          	auipc	a0,0x3
    c060175a:	25a50513          	addi	a0,a0,602 # c06049b0 <_init_data_end+0x9b0>
    c060175e:	5a4000ef          	jal	ra,c0601d02 <printd>
    c0601762:	0006c797          	auipc	a5,0x6c
    c0601766:	ce678793          	addi	a5,a5,-794 # c066d448 <prog_brk>
    c060176a:	fd843703          	ld	a4,-40(s0)
    c060176e:	e398                	sd	a4,0(a5)
    c0601770:	00003517          	auipc	a0,0x3
    c0601774:	25050513          	addi	a0,a0,592 # c06049c0 <_init_data_end+0x9c0>
    c0601778:	58a000ef          	jal	ra,c0601d02 <printd>
    c060177c:	e77ff0ef          	jal	ra,c06015f2 <flush_tlb>
    c0601780:	fd843783          	ld	a5,-40(s0)
    c0601784:	2781                	sext.w	a5,a5
    c0601786:	853e                	mv	a0,a5
    c0601788:	70a2                	ld	ra,40(sp)
    c060178a:	7402                	ld	s0,32(sp)
    c060178c:	6145                	addi	sp,sp,48
    c060178e:	8082                	ret

00000000c0601790 <ebi_write>:
    c0601790:	7179                	addi	sp,sp,-48
    c0601792:	f406                	sd	ra,40(sp)
    c0601794:	f022                	sd	s0,32(sp)
    c0601796:	1800                	addi	s0,sp,48
    c0601798:	fca43c23          	sd	a0,-40(s0)
    c060179c:	fcb43823          	sd	a1,-48(s0)
    c06017a0:	0006c797          	auipc	a5,0x6c
    c06017a4:	ca078793          	addi	a5,a5,-864 # c066d440 <drv_addr_list>
    c06017a8:	639c                	ld	a5,0(a5)
    c06017aa:	639c                	ld	a5,0(a5)
    c06017ac:	fef43023          	sd	a5,-32(s0)
    c06017b0:	fd843703          	ld	a4,-40(s0)
    c06017b4:	4785                	li	a5,1
    c06017b6:	02f71c63          	bne	a4,a5,c06017ee <ebi_write+0x5e>
    c06017ba:	fd043783          	ld	a5,-48(s0)
    c06017be:	fef43423          	sd	a5,-24(s0)
    c06017c2:	a00d                	j	c06017e4 <ebi_write+0x54>
    c06017c4:	fe843783          	ld	a5,-24(s0)
    c06017c8:	0007c783          	lbu	a5,0(a5)
    c06017cc:	fe043703          	ld	a4,-32(s0)
    c06017d0:	4681                	li	a3,0
    c06017d2:	4601                	li	a2,0
    c06017d4:	85be                	mv	a1,a5
    c06017d6:	4505                	li	a0,1
    c06017d8:	9702                	jalr	a4
    c06017da:	fe843783          	ld	a5,-24(s0)
    c06017de:	0785                	addi	a5,a5,1
    c06017e0:	fef43423          	sd	a5,-24(s0)
    c06017e4:	fe843783          	ld	a5,-24(s0)
    c06017e8:	0007c783          	lbu	a5,0(a5)
    c06017ec:	ffe1                	bnez	a5,c06017c4 <ebi_write+0x34>
    c06017ee:	4781                	li	a5,0
    c06017f0:	853e                	mv	a0,a5
    c06017f2:	70a2                	ld	ra,40(sp)
    c06017f4:	7402                	ld	s0,32(sp)
    c06017f6:	6145                	addi	sp,sp,48
    c06017f8:	8082                	ret

00000000c06017fa <ebi_close>:
    c06017fa:	1101                	addi	sp,sp,-32
    c06017fc:	ec22                	sd	s0,24(sp)
    c06017fe:	1000                	addi	s0,sp,32
    c0601800:	fea43423          	sd	a0,-24(s0)
    c0601804:	4781                	li	a5,0
    c0601806:	853e                	mv	a0,a5
    c0601808:	6462                	ld	s0,24(sp)
    c060180a:	6105                	addi	sp,sp,32
    c060180c:	8082                	ret

00000000c060180e <ebi_gettimeofday>:
    c060180e:	1101                	addi	sp,sp,-32
    c0601810:	ec22                	sd	s0,24(sp)
    c0601812:	1000                	addi	s0,sp,32
    c0601814:	fea43423          	sd	a0,-24(s0)
    c0601818:	feb43023          	sd	a1,-32(s0)
    c060181c:	4781                	li	a5,0
    c060181e:	853e                	mv	a0,a5
    c0601820:	6462                	ld	s0,24(sp)
    c0601822:	6105                	addi	sp,sp,32
    c0601824:	8082                	ret

00000000c0601826 <vsnprintf>:
    c0601826:	7119                	addi	sp,sp,-128
    c0601828:	fca2                	sd	s0,120(sp)
    c060182a:	0100                	addi	s0,sp,128
    c060182c:	f8a43c23          	sd	a0,-104(s0)
    c0601830:	f8b43823          	sd	a1,-112(s0)
    c0601834:	f8c43423          	sd	a2,-120(s0)
    c0601838:	f8d43023          	sd	a3,-128(s0)
    c060183c:	fe0407a3          	sb	zero,-17(s0)
    c0601840:	fe040723          	sb	zero,-18(s0)
    c0601844:	fe043023          	sd	zero,-32(s0)
    c0601848:	ae59                	j	c0601bde <vsnprintf+0x3b8>
    c060184a:	fef44783          	lbu	a5,-17(s0)
    c060184e:	0ff7f793          	andi	a5,a5,255
    c0601852:	32078b63          	beqz	a5,c0601b88 <vsnprintf+0x362>
    c0601856:	f8843783          	ld	a5,-120(s0)
    c060185a:	0007c783          	lbu	a5,0(a5)
    c060185e:	2781                	sext.w	a5,a5
    c0601860:	f9d7869b          	addiw	a3,a5,-99
    c0601864:	0006871b          	sext.w	a4,a3
    c0601868:	47d5                	li	a5,21
    c060186a:	36e7e463          	bltu	a5,a4,c0601bd2 <vsnprintf+0x3ac>
    c060186e:	02069793          	slli	a5,a3,0x20
    c0601872:	9381                	srli	a5,a5,0x20
    c0601874:	00279713          	slli	a4,a5,0x2
    c0601878:	00003797          	auipc	a5,0x3
    c060187c:	16878793          	addi	a5,a5,360 # c06049e0 <_init_data_end+0x9e0>
    c0601880:	97ba                	add	a5,a5,a4
    c0601882:	439c                	lw	a5,0(a5)
    c0601884:	0007871b          	sext.w	a4,a5
    c0601888:	00003797          	auipc	a5,0x3
    c060188c:	15878793          	addi	a5,a5,344 # c06049e0 <_init_data_end+0x9e0>
    c0601890:	97ba                	add	a5,a5,a4
    c0601892:	8782                	jr	a5
    c0601894:	4785                	li	a5,1
    c0601896:	fef40723          	sb	a5,-18(s0)
    c060189a:	ae2d                	j	c0601bd4 <vsnprintf+0x3ae>
    c060189c:	4785                	li	a5,1
    c060189e:	fef40723          	sb	a5,-18(s0)
    c06018a2:	fe043783          	ld	a5,-32(s0)
    c06018a6:	0785                	addi	a5,a5,1
    c06018a8:	fef43023          	sd	a5,-32(s0)
    c06018ac:	fe043703          	ld	a4,-32(s0)
    c06018b0:	f9043783          	ld	a5,-112(s0)
    c06018b4:	00f77c63          	bgeu	a4,a5,c06018cc <vsnprintf+0xa6>
    c06018b8:	fe043783          	ld	a5,-32(s0)
    c06018bc:	17fd                	addi	a5,a5,-1
    c06018be:	f9843703          	ld	a4,-104(s0)
    c06018c2:	97ba                	add	a5,a5,a4
    c06018c4:	03000713          	li	a4,48
    c06018c8:	00e78023          	sb	a4,0(a5)
    c06018cc:	fe043783          	ld	a5,-32(s0)
    c06018d0:	0785                	addi	a5,a5,1
    c06018d2:	fef43023          	sd	a5,-32(s0)
    c06018d6:	fe043703          	ld	a4,-32(s0)
    c06018da:	f9043783          	ld	a5,-112(s0)
    c06018de:	00f77c63          	bgeu	a4,a5,c06018f6 <vsnprintf+0xd0>
    c06018e2:	fe043783          	ld	a5,-32(s0)
    c06018e6:	17fd                	addi	a5,a5,-1
    c06018e8:	f9843703          	ld	a4,-104(s0)
    c06018ec:	97ba                	add	a5,a5,a4
    c06018ee:	07800713          	li	a4,120
    c06018f2:	00e78023          	sb	a4,0(a5)
    c06018f6:	fee44783          	lbu	a5,-18(s0)
    c06018fa:	0ff7f793          	andi	a5,a5,255
    c06018fe:	cb89                	beqz	a5,c0601910 <vsnprintf+0xea>
    c0601900:	f8043783          	ld	a5,-128(s0)
    c0601904:	00878713          	addi	a4,a5,8
    c0601908:	f8e43023          	sd	a4,-128(s0)
    c060190c:	639c                	ld	a5,0(a5)
    c060190e:	a801                	j	c060191e <vsnprintf+0xf8>
    c0601910:	f8043783          	ld	a5,-128(s0)
    c0601914:	00878713          	addi	a4,a5,8
    c0601918:	f8e43023          	sd	a4,-128(s0)
    c060191c:	439c                	lw	a5,0(a5)
    c060191e:	faf43423          	sd	a5,-88(s0)
    c0601922:	fee44783          	lbu	a5,-18(s0)
    c0601926:	0ff7f793          	andi	a5,a5,255
    c060192a:	c399                	beqz	a5,c0601930 <vsnprintf+0x10a>
    c060192c:	47bd                	li	a5,15
    c060192e:	a011                	j	c0601932 <vsnprintf+0x10c>
    c0601930:	479d                	li	a5,7
    c0601932:	fcf42e23          	sw	a5,-36(s0)
    c0601936:	a8b5                	j	c06019b2 <vsnprintf+0x18c>
    c0601938:	fdc42783          	lw	a5,-36(s0)
    c060193c:	0027979b          	slliw	a5,a5,0x2
    c0601940:	2781                	sext.w	a5,a5
    c0601942:	fa843703          	ld	a4,-88(s0)
    c0601946:	40f757b3          	sra	a5,a4,a5
    c060194a:	2781                	sext.w	a5,a5
    c060194c:	8bbd                	andi	a5,a5,15
    c060194e:	faf42223          	sw	a5,-92(s0)
    c0601952:	fe043783          	ld	a5,-32(s0)
    c0601956:	0785                	addi	a5,a5,1
    c0601958:	fef43023          	sd	a5,-32(s0)
    c060195c:	fe043703          	ld	a4,-32(s0)
    c0601960:	f9043783          	ld	a5,-112(s0)
    c0601964:	04f77263          	bgeu	a4,a5,c06019a8 <vsnprintf+0x182>
    c0601968:	fa442783          	lw	a5,-92(s0)
    c060196c:	0007871b          	sext.w	a4,a5
    c0601970:	47a5                	li	a5,9
    c0601972:	00e7cb63          	blt	a5,a4,c0601988 <vsnprintf+0x162>
    c0601976:	fa442783          	lw	a5,-92(s0)
    c060197a:	0ff7f793          	andi	a5,a5,255
    c060197e:	0307879b          	addiw	a5,a5,48
    c0601982:	0ff7f793          	andi	a5,a5,255
    c0601986:	a809                	j	c0601998 <vsnprintf+0x172>
    c0601988:	fa442783          	lw	a5,-92(s0)
    c060198c:	0ff7f793          	andi	a5,a5,255
    c0601990:	0577879b          	addiw	a5,a5,87
    c0601994:	0ff7f793          	andi	a5,a5,255
    c0601998:	fe043703          	ld	a4,-32(s0)
    c060199c:	177d                	addi	a4,a4,-1
    c060199e:	f9843683          	ld	a3,-104(s0)
    c06019a2:	9736                	add	a4,a4,a3
    c06019a4:	00f70023          	sb	a5,0(a4)
    c06019a8:	fdc42783          	lw	a5,-36(s0)
    c06019ac:	37fd                	addiw	a5,a5,-1
    c06019ae:	fcf42e23          	sw	a5,-36(s0)
    c06019b2:	fdc42783          	lw	a5,-36(s0)
    c06019b6:	2781                	sext.w	a5,a5
    c06019b8:	f807d0e3          	bgez	a5,c0601938 <vsnprintf+0x112>
    c06019bc:	fe040723          	sb	zero,-18(s0)
    c06019c0:	fe0407a3          	sb	zero,-17(s0)
    c06019c4:	ac01                	j	c0601bd4 <vsnprintf+0x3ae>
    c06019c6:	fee44783          	lbu	a5,-18(s0)
    c06019ca:	0ff7f793          	andi	a5,a5,255
    c06019ce:	cb89                	beqz	a5,c06019e0 <vsnprintf+0x1ba>
    c06019d0:	f8043783          	ld	a5,-128(s0)
    c06019d4:	00878713          	addi	a4,a5,8
    c06019d8:	f8e43023          	sd	a4,-128(s0)
    c06019dc:	639c                	ld	a5,0(a5)
    c06019de:	a801                	j	c06019ee <vsnprintf+0x1c8>
    c06019e0:	f8043783          	ld	a5,-128(s0)
    c06019e4:	00878713          	addi	a4,a5,8
    c06019e8:	f8e43023          	sd	a4,-128(s0)
    c06019ec:	439c                	lw	a5,0(a5)
    c06019ee:	fcf43823          	sd	a5,-48(s0)
    c06019f2:	fd043783          	ld	a5,-48(s0)
    c06019f6:	0207dd63          	bgez	a5,c0601a30 <vsnprintf+0x20a>
    c06019fa:	fd043783          	ld	a5,-48(s0)
    c06019fe:	40f007b3          	neg	a5,a5
    c0601a02:	fcf43823          	sd	a5,-48(s0)
    c0601a06:	fe043783          	ld	a5,-32(s0)
    c0601a0a:	0785                	addi	a5,a5,1
    c0601a0c:	fef43023          	sd	a5,-32(s0)
    c0601a10:	fe043703          	ld	a4,-32(s0)
    c0601a14:	f9043783          	ld	a5,-112(s0)
    c0601a18:	00f77c63          	bgeu	a4,a5,c0601a30 <vsnprintf+0x20a>
    c0601a1c:	fe043783          	ld	a5,-32(s0)
    c0601a20:	17fd                	addi	a5,a5,-1
    c0601a22:	f9843703          	ld	a4,-104(s0)
    c0601a26:	97ba                	add	a5,a5,a4
    c0601a28:	02d00713          	li	a4,45
    c0601a2c:	00e78023          	sb	a4,0(a5)
    c0601a30:	4785                	li	a5,1
    c0601a32:	fcf43423          	sd	a5,-56(s0)
    c0601a36:	fd043783          	ld	a5,-48(s0)
    c0601a3a:	fcf43023          	sd	a5,-64(s0)
    c0601a3e:	a031                	j	c0601a4a <vsnprintf+0x224>
    c0601a40:	fc843783          	ld	a5,-56(s0)
    c0601a44:	0785                	addi	a5,a5,1
    c0601a46:	fcf43423          	sd	a5,-56(s0)
    c0601a4a:	fc043703          	ld	a4,-64(s0)
    c0601a4e:	47a9                	li	a5,10
    c0601a50:	02f747b3          	div	a5,a4,a5
    c0601a54:	fcf43023          	sd	a5,-64(s0)
    c0601a58:	fc043783          	ld	a5,-64(s0)
    c0601a5c:	f3f5                	bnez	a5,c0601a40 <vsnprintf+0x21a>
    c0601a5e:	fc843783          	ld	a5,-56(s0)
    c0601a62:	2781                	sext.w	a5,a5
    c0601a64:	37fd                	addiw	a5,a5,-1
    c0601a66:	2781                	sext.w	a5,a5
    c0601a68:	faf42e23          	sw	a5,-68(s0)
    c0601a6c:	a8a1                	j	c0601ac4 <vsnprintf+0x29e>
    c0601a6e:	fbc42703          	lw	a4,-68(s0)
    c0601a72:	fe043783          	ld	a5,-32(s0)
    c0601a76:	97ba                	add	a5,a5,a4
    c0601a78:	0785                	addi	a5,a5,1
    c0601a7a:	f9043703          	ld	a4,-112(s0)
    c0601a7e:	02e7f763          	bgeu	a5,a4,c0601aac <vsnprintf+0x286>
    c0601a82:	fd043703          	ld	a4,-48(s0)
    c0601a86:	47a9                	li	a5,10
    c0601a88:	02f767b3          	rem	a5,a4,a5
    c0601a8c:	0ff7f713          	andi	a4,a5,255
    c0601a90:	fbc42683          	lw	a3,-68(s0)
    c0601a94:	fe043783          	ld	a5,-32(s0)
    c0601a98:	97b6                	add	a5,a5,a3
    c0601a9a:	f9843683          	ld	a3,-104(s0)
    c0601a9e:	97b6                	add	a5,a5,a3
    c0601aa0:	0307071b          	addiw	a4,a4,48
    c0601aa4:	0ff77713          	andi	a4,a4,255
    c0601aa8:	00e78023          	sb	a4,0(a5)
    c0601aac:	fd043703          	ld	a4,-48(s0)
    c0601ab0:	47a9                	li	a5,10
    c0601ab2:	02f747b3          	div	a5,a4,a5
    c0601ab6:	fcf43823          	sd	a5,-48(s0)
    c0601aba:	fbc42783          	lw	a5,-68(s0)
    c0601abe:	37fd                	addiw	a5,a5,-1
    c0601ac0:	faf42e23          	sw	a5,-68(s0)
    c0601ac4:	fbc42783          	lw	a5,-68(s0)
    c0601ac8:	2781                	sext.w	a5,a5
    c0601aca:	fa07d2e3          	bgez	a5,c0601a6e <vsnprintf+0x248>
    c0601ace:	fc843783          	ld	a5,-56(s0)
    c0601ad2:	fe043703          	ld	a4,-32(s0)
    c0601ad6:	97ba                	add	a5,a5,a4
    c0601ad8:	fef43023          	sd	a5,-32(s0)
    c0601adc:	fe040723          	sb	zero,-18(s0)
    c0601ae0:	fe0407a3          	sb	zero,-17(s0)
    c0601ae4:	a8c5                	j	c0601bd4 <vsnprintf+0x3ae>
    c0601ae6:	f8043783          	ld	a5,-128(s0)
    c0601aea:	00878713          	addi	a4,a5,8
    c0601aee:	f8e43023          	sd	a4,-128(s0)
    c0601af2:	639c                	ld	a5,0(a5)
    c0601af4:	faf43823          	sd	a5,-80(s0)
    c0601af8:	a82d                	j	c0601b32 <vsnprintf+0x30c>
    c0601afa:	fe043783          	ld	a5,-32(s0)
    c0601afe:	0785                	addi	a5,a5,1
    c0601b00:	fef43023          	sd	a5,-32(s0)
    c0601b04:	fe043703          	ld	a4,-32(s0)
    c0601b08:	f9043783          	ld	a5,-112(s0)
    c0601b0c:	00f77e63          	bgeu	a4,a5,c0601b28 <vsnprintf+0x302>
    c0601b10:	fe043783          	ld	a5,-32(s0)
    c0601b14:	17fd                	addi	a5,a5,-1
    c0601b16:	f9843703          	ld	a4,-104(s0)
    c0601b1a:	97ba                	add	a5,a5,a4
    c0601b1c:	fb043703          	ld	a4,-80(s0)
    c0601b20:	00074703          	lbu	a4,0(a4)
    c0601b24:	00e78023          	sb	a4,0(a5)
    c0601b28:	fb043783          	ld	a5,-80(s0)
    c0601b2c:	0785                	addi	a5,a5,1
    c0601b2e:	faf43823          	sd	a5,-80(s0)
    c0601b32:	fb043783          	ld	a5,-80(s0)
    c0601b36:	0007c783          	lbu	a5,0(a5)
    c0601b3a:	f3e1                	bnez	a5,c0601afa <vsnprintf+0x2d4>
    c0601b3c:	fe040723          	sb	zero,-18(s0)
    c0601b40:	fe0407a3          	sb	zero,-17(s0)
    c0601b44:	a841                	j	c0601bd4 <vsnprintf+0x3ae>
    c0601b46:	fe043783          	ld	a5,-32(s0)
    c0601b4a:	0785                	addi	a5,a5,1
    c0601b4c:	fef43023          	sd	a5,-32(s0)
    c0601b50:	fe043703          	ld	a4,-32(s0)
    c0601b54:	f9043783          	ld	a5,-112(s0)
    c0601b58:	02f77363          	bgeu	a4,a5,c0601b7e <vsnprintf+0x358>
    c0601b5c:	f8043783          	ld	a5,-128(s0)
    c0601b60:	00878713          	addi	a4,a5,8
    c0601b64:	f8e43023          	sd	a4,-128(s0)
    c0601b68:	4394                	lw	a3,0(a5)
    c0601b6a:	fe043783          	ld	a5,-32(s0)
    c0601b6e:	17fd                	addi	a5,a5,-1
    c0601b70:	f9843703          	ld	a4,-104(s0)
    c0601b74:	97ba                	add	a5,a5,a4
    c0601b76:	0ff6f713          	andi	a4,a3,255
    c0601b7a:	00e78023          	sb	a4,0(a5)
    c0601b7e:	fe040723          	sb	zero,-18(s0)
    c0601b82:	fe0407a3          	sb	zero,-17(s0)
    c0601b86:	a0b9                	j	c0601bd4 <vsnprintf+0x3ae>
    c0601b88:	f8843783          	ld	a5,-120(s0)
    c0601b8c:	0007c783          	lbu	a5,0(a5)
    c0601b90:	873e                	mv	a4,a5
    c0601b92:	02500793          	li	a5,37
    c0601b96:	00f71663          	bne	a4,a5,c0601ba2 <vsnprintf+0x37c>
    c0601b9a:	4785                	li	a5,1
    c0601b9c:	fef407a3          	sb	a5,-17(s0)
    c0601ba0:	a815                	j	c0601bd4 <vsnprintf+0x3ae>
    c0601ba2:	fe043783          	ld	a5,-32(s0)
    c0601ba6:	0785                	addi	a5,a5,1
    c0601ba8:	fef43023          	sd	a5,-32(s0)
    c0601bac:	fe043703          	ld	a4,-32(s0)
    c0601bb0:	f9043783          	ld	a5,-112(s0)
    c0601bb4:	02f77063          	bgeu	a4,a5,c0601bd4 <vsnprintf+0x3ae>
    c0601bb8:	fe043783          	ld	a5,-32(s0)
    c0601bbc:	17fd                	addi	a5,a5,-1
    c0601bbe:	f9843703          	ld	a4,-104(s0)
    c0601bc2:	97ba                	add	a5,a5,a4
    c0601bc4:	f8843703          	ld	a4,-120(s0)
    c0601bc8:	00074703          	lbu	a4,0(a4)
    c0601bcc:	00e78023          	sb	a4,0(a5)
    c0601bd0:	a011                	j	c0601bd4 <vsnprintf+0x3ae>
    c0601bd2:	0001                	nop
    c0601bd4:	f8843783          	ld	a5,-120(s0)
    c0601bd8:	0785                	addi	a5,a5,1
    c0601bda:	f8f43423          	sd	a5,-120(s0)
    c0601bde:	f8843783          	ld	a5,-120(s0)
    c0601be2:	0007c783          	lbu	a5,0(a5)
    c0601be6:	c60792e3          	bnez	a5,c060184a <vsnprintf+0x24>
    c0601bea:	fe043703          	ld	a4,-32(s0)
    c0601bee:	f9043783          	ld	a5,-112(s0)
    c0601bf2:	00f77a63          	bgeu	a4,a5,c0601c06 <vsnprintf+0x3e0>
    c0601bf6:	f9843703          	ld	a4,-104(s0)
    c0601bfa:	fe043783          	ld	a5,-32(s0)
    c0601bfe:	97ba                	add	a5,a5,a4
    c0601c00:	00078023          	sb	zero,0(a5)
    c0601c04:	a821                	j	c0601c1c <vsnprintf+0x3f6>
    c0601c06:	f9043783          	ld	a5,-112(s0)
    c0601c0a:	cb89                	beqz	a5,c0601c1c <vsnprintf+0x3f6>
    c0601c0c:	f9043783          	ld	a5,-112(s0)
    c0601c10:	17fd                	addi	a5,a5,-1
    c0601c12:	f9843703          	ld	a4,-104(s0)
    c0601c16:	97ba                	add	a5,a5,a4
    c0601c18:	00078023          	sb	zero,0(a5)
    c0601c1c:	fe043783          	ld	a5,-32(s0)
    c0601c20:	2781                	sext.w	a5,a5
    c0601c22:	853e                	mv	a0,a5
    c0601c24:	7466                	ld	s0,120(sp)
    c0601c26:	6109                	addi	sp,sp,128
    c0601c28:	8082                	ret

00000000c0601c2a <snprintf>:
    c0601c2a:	7159                	addi	sp,sp,-112
    c0601c2c:	fc06                	sd	ra,56(sp)
    c0601c2e:	f822                	sd	s0,48(sp)
    c0601c30:	0080                	addi	s0,sp,64
    c0601c32:	fca43c23          	sd	a0,-40(s0)
    c0601c36:	fcb43823          	sd	a1,-48(s0)
    c0601c3a:	fcc43423          	sd	a2,-56(s0)
    c0601c3e:	e414                	sd	a3,8(s0)
    c0601c40:	e818                	sd	a4,16(s0)
    c0601c42:	ec1c                	sd	a5,24(s0)
    c0601c44:	03043023          	sd	a6,32(s0)
    c0601c48:	03143423          	sd	a7,40(s0)
    c0601c4c:	03040793          	addi	a5,s0,48
    c0601c50:	fcf43023          	sd	a5,-64(s0)
    c0601c54:	fc043783          	ld	a5,-64(s0)
    c0601c58:	fd878793          	addi	a5,a5,-40
    c0601c5c:	fef43023          	sd	a5,-32(s0)
    c0601c60:	fe043783          	ld	a5,-32(s0)
    c0601c64:	86be                	mv	a3,a5
    c0601c66:	fc843603          	ld	a2,-56(s0)
    c0601c6a:	fd043583          	ld	a1,-48(s0)
    c0601c6e:	fd843503          	ld	a0,-40(s0)
    c0601c72:	bb5ff0ef          	jal	ra,c0601826 <vsnprintf>
    c0601c76:	87aa                	mv	a5,a0
    c0601c78:	fef42623          	sw	a5,-20(s0)
    c0601c7c:	fec42783          	lw	a5,-20(s0)
    c0601c80:	853e                	mv	a0,a5
    c0601c82:	70e2                	ld	ra,56(sp)
    c0601c84:	7442                	ld	s0,48(sp)
    c0601c86:	6165                	addi	sp,sp,112
    c0601c88:	8082                	ret

00000000c0601c8a <putstring>:
    c0601c8a:	7179                	addi	sp,sp,-48
    c0601c8c:	f422                	sd	s0,40(sp)
    c0601c8e:	1800                	addi	s0,sp,48
    c0601c90:	fca43c23          	sd	a0,-40(s0)
    c0601c94:	a005                	j	c0601cb4 <putstring+0x2a>
    c0601c96:	fd843783          	ld	a5,-40(s0)
    c0601c9a:	00178713          	addi	a4,a5,1
    c0601c9e:	fce43c23          	sd	a4,-40(s0)
    c0601ca2:	0007c783          	lbu	a5,0(a5)
    c0601ca6:	fef42623          	sw	a5,-20(s0)
    c0601caa:	fec42503          	lw	a0,-20(s0)
    c0601cae:	4885                	li	a7,1
    c0601cb0:	00000073          	ecall
    c0601cb4:	fd843783          	ld	a5,-40(s0)
    c0601cb8:	0007c783          	lbu	a5,0(a5)
    c0601cbc:	ffe9                	bnez	a5,c0601c96 <putstring+0xc>
    c0601cbe:	0001                	nop
    c0601cc0:	0001                	nop
    c0601cc2:	7422                	ld	s0,40(sp)
    c0601cc4:	6145                	addi	sp,sp,48
    c0601cc6:	8082                	ret

00000000c0601cc8 <vprintd>:
    c0601cc8:	712d                	addi	sp,sp,-288
    c0601cca:	ee06                	sd	ra,280(sp)
    c0601ccc:	ea22                	sd	s0,272(sp)
    c0601cce:	1200                	addi	s0,sp,288
    c0601cd0:	eea43423          	sd	a0,-280(s0)
    c0601cd4:	eeb43023          	sd	a1,-288(s0)
    c0601cd8:	ef040793          	addi	a5,s0,-272
    c0601cdc:	ee043683          	ld	a3,-288(s0)
    c0601ce0:	ee843603          	ld	a2,-280(s0)
    c0601ce4:	10000593          	li	a1,256
    c0601ce8:	853e                	mv	a0,a5
    c0601cea:	b3dff0ef          	jal	ra,c0601826 <vsnprintf>
    c0601cee:	ef040793          	addi	a5,s0,-272
    c0601cf2:	853e                	mv	a0,a5
    c0601cf4:	f97ff0ef          	jal	ra,c0601c8a <putstring>
    c0601cf8:	0001                	nop
    c0601cfa:	60f2                	ld	ra,280(sp)
    c0601cfc:	6452                	ld	s0,272(sp)
    c0601cfe:	6115                	addi	sp,sp,288
    c0601d00:	8082                	ret

00000000c0601d02 <printd>:
    c0601d02:	7159                	addi	sp,sp,-112
    c0601d04:	f406                	sd	ra,40(sp)
    c0601d06:	f022                	sd	s0,32(sp)
    c0601d08:	1800                	addi	s0,sp,48
    c0601d0a:	fca43c23          	sd	a0,-40(s0)
    c0601d0e:	e40c                	sd	a1,8(s0)
    c0601d10:	e810                	sd	a2,16(s0)
    c0601d12:	ec14                	sd	a3,24(s0)
    c0601d14:	f018                	sd	a4,32(s0)
    c0601d16:	f41c                	sd	a5,40(s0)
    c0601d18:	03043823          	sd	a6,48(s0)
    c0601d1c:	03143c23          	sd	a7,56(s0)
    c0601d20:	04040793          	addi	a5,s0,64
    c0601d24:	fcf43823          	sd	a5,-48(s0)
    c0601d28:	fd043783          	ld	a5,-48(s0)
    c0601d2c:	fc878793          	addi	a5,a5,-56
    c0601d30:	fef43423          	sd	a5,-24(s0)
    c0601d34:	fe843783          	ld	a5,-24(s0)
    c0601d38:	85be                	mv	a1,a5
    c0601d3a:	fd843503          	ld	a0,-40(s0)
    c0601d3e:	f8bff0ef          	jal	ra,c0601cc8 <vprintd>
    c0601d42:	0001                	nop
    c0601d44:	70a2                	ld	ra,40(sp)
    c0601d46:	7402                	ld	s0,32(sp)
    c0601d48:	6165                	addi	sp,sp,112
    c0601d4a:	8082                	ret

00000000c0601d4c <my_memset>:
    c0601d4c:	7179                	addi	sp,sp,-48
    c0601d4e:	f422                	sd	s0,40(sp)
    c0601d50:	1800                	addi	s0,sp,48
    c0601d52:	fca43c23          	sd	a0,-40(s0)
    c0601d56:	87ae                	mv	a5,a1
    c0601d58:	8732                	mv	a4,a2
    c0601d5a:	fcf42a23          	sw	a5,-44(s0)
    c0601d5e:	87ba                	mv	a5,a4
    c0601d60:	fcf42823          	sw	a5,-48(s0)
    c0601d64:	fd843783          	ld	a5,-40(s0)
    c0601d68:	fef43423          	sd	a5,-24(s0)
    c0601d6c:	a829                	j	c0601d86 <my_memset+0x3a>
    c0601d6e:	fe843783          	ld	a5,-24(s0)
    c0601d72:	00178713          	addi	a4,a5,1
    c0601d76:	fee43423          	sd	a4,-24(s0)
    c0601d7a:	fd442703          	lw	a4,-44(s0)
    c0601d7e:	0ff77713          	andi	a4,a4,255
    c0601d82:	00e78023          	sb	a4,0(a5)
    c0601d86:	fd042783          	lw	a5,-48(s0)
    c0601d8a:	fff7871b          	addiw	a4,a5,-1
    c0601d8e:	fce42823          	sw	a4,-48(s0)
    c0601d92:	fff1                	bnez	a5,c0601d6e <my_memset+0x22>
    c0601d94:	fd843783          	ld	a5,-40(s0)
    c0601d98:	853e                	mv	a0,a5
    c0601d9a:	7422                	ld	s0,40(sp)
    c0601d9c:	6145                	addi	sp,sp,48
    c0601d9e:	8082                	ret

00000000c0601da0 <print_color>:
    c0601da0:	1101                	addi	sp,sp,-32
    c0601da2:	ec06                	sd	ra,24(sp)
    c0601da4:	e822                	sd	s0,16(sp)
    c0601da6:	1000                	addi	s0,sp,32
    c0601da8:	fea43423          	sd	a0,-24(s0)
    c0601dac:	fe843583          	ld	a1,-24(s0)
    c0601db0:	00003517          	auipc	a0,0x3
    c0601db4:	c8850513          	addi	a0,a0,-888 # c0604a38 <_init_data_end+0xa38>
    c0601db8:	f4bff0ef          	jal	ra,c0601d02 <printd>
    c0601dbc:	0001                	nop
    c0601dbe:	60e2                	ld	ra,24(sp)
    c0601dc0:	6442                	ld	s0,16(sp)
    c0601dc2:	6105                	addi	sp,sp,32
    c0601dc4:	8082                	ret

00000000c0601dc6 <show_reg>:
    c0601dc6:	715d                	addi	sp,sp,-80
    c0601dc8:	e486                	sd	ra,72(sp)
    c0601dca:	e0a2                	sd	s0,64(sp)
    c0601dcc:	0880                	addi	s0,sp,80
    c0601dce:	00003517          	auipc	a0,0x3
    c0601dd2:	c7a50513          	addi	a0,a0,-902 # c0604a48 <_init_data_end+0xa48>
    c0601dd6:	f2dff0ef          	jal	ra,c0601d02 <printd>
    c0601dda:	100027f3          	csrr	a5,sstatus
    c0601dde:	fef43423          	sd	a5,-24(s0)
    c0601de2:	fe843783          	ld	a5,-24(s0)
    c0601de6:	fef43023          	sd	a5,-32(s0)
    c0601dea:	141027f3          	csrr	a5,sepc
    c0601dee:	fcf43c23          	sd	a5,-40(s0)
    c0601df2:	fd843783          	ld	a5,-40(s0)
    c0601df6:	fcf43823          	sd	a5,-48(s0)
    c0601dfa:	105027f3          	csrr	a5,stvec
    c0601dfe:	fcf43423          	sd	a5,-56(s0)
    c0601e02:	fc843783          	ld	a5,-56(s0)
    c0601e06:	fcf43023          	sd	a5,-64(s0)
    c0601e0a:	180027f3          	csrr	a5,satp
    c0601e0e:	faf43c23          	sd	a5,-72(s0)
    c0601e12:	fb843783          	ld	a5,-72(s0)
    c0601e16:	faf43823          	sd	a5,-80(s0)
    c0601e1a:	fe043583          	ld	a1,-32(s0)
    c0601e1e:	00003517          	auipc	a0,0x3
    c0601e22:	c5a50513          	addi	a0,a0,-934 # c0604a78 <_init_data_end+0xa78>
    c0601e26:	eddff0ef          	jal	ra,c0601d02 <printd>
    c0601e2a:	fd043583          	ld	a1,-48(s0)
    c0601e2e:	00003517          	auipc	a0,0x3
    c0601e32:	c5a50513          	addi	a0,a0,-934 # c0604a88 <_init_data_end+0xa88>
    c0601e36:	ecdff0ef          	jal	ra,c0601d02 <printd>
    c0601e3a:	fc043583          	ld	a1,-64(s0)
    c0601e3e:	00003517          	auipc	a0,0x3
    c0601e42:	c5a50513          	addi	a0,a0,-934 # c0604a98 <_init_data_end+0xa98>
    c0601e46:	ebdff0ef          	jal	ra,c0601d02 <printd>
    c0601e4a:	fb043583          	ld	a1,-80(s0)
    c0601e4e:	00003517          	auipc	a0,0x3
    c0601e52:	c5a50513          	addi	a0,a0,-934 # c0604aa8 <_init_data_end+0xaa8>
    c0601e56:	eadff0ef          	jal	ra,c0601d02 <printd>
    c0601e5a:	00003517          	auipc	a0,0x3
    c0601e5e:	c5e50513          	addi	a0,a0,-930 # c0604ab8 <_init_data_end+0xab8>
    c0601e62:	ea1ff0ef          	jal	ra,c0601d02 <printd>
    c0601e66:	0001                	nop
    c0601e68:	60a6                	ld	ra,72(sp)
    c0601e6a:	6406                	ld	s0,64(sp)
    c0601e6c:	6161                	addi	sp,sp,80
    c0601e6e:	8082                	ret

00000000c0601e70 <trap_handler>:
    c0601e70:	14011173          	csrrw	sp,sscratch,sp
    c0601e74:	00011463          	bnez	sp,c0601e7c <trap_handler+0xc>
    c0601e78:	14002173          	csrr	sp,sscratch
    c0601e7c:	7111                	addi	sp,sp,-256
    c0601e7e:	e406                	sd	ra,8(sp)
    c0601e80:	ec0e                	sd	gp,24(sp)
    c0601e82:	f012                	sd	tp,32(sp)
    c0601e84:	f416                	sd	t0,40(sp)
    c0601e86:	f81a                	sd	t1,48(sp)
    c0601e88:	fc1e                	sd	t2,56(sp)
    c0601e8a:	e0a2                	sd	s0,64(sp)
    c0601e8c:	e4a6                	sd	s1,72(sp)
    c0601e8e:	e8aa                	sd	a0,80(sp)
    c0601e90:	ecae                	sd	a1,88(sp)
    c0601e92:	f0b2                	sd	a2,96(sp)
    c0601e94:	f4b6                	sd	a3,104(sp)
    c0601e96:	f8ba                	sd	a4,112(sp)
    c0601e98:	fcbe                	sd	a5,120(sp)
    c0601e9a:	e142                	sd	a6,128(sp)
    c0601e9c:	e546                	sd	a7,136(sp)
    c0601e9e:	e94a                	sd	s2,144(sp)
    c0601ea0:	ed4e                	sd	s3,152(sp)
    c0601ea2:	f152                	sd	s4,160(sp)
    c0601ea4:	f556                	sd	s5,168(sp)
    c0601ea6:	f95a                	sd	s6,176(sp)
    c0601ea8:	fd5e                	sd	s7,184(sp)
    c0601eaa:	e1e2                	sd	s8,192(sp)
    c0601eac:	e5e6                	sd	s9,200(sp)
    c0601eae:	e9ea                	sd	s10,208(sp)
    c0601eb0:	edee                	sd	s11,216(sp)
    c0601eb2:	f1f2                	sd	t3,224(sp)
    c0601eb4:	f5f6                	sd	t4,232(sp)
    c0601eb6:	f9fa                	sd	t5,240(sp)
    c0601eb8:	fdfe                	sd	t6,248(sp)
    c0601eba:	14001973          	csrrw	s2,sscratch,zero
    c0601ebe:	e84a                	sd	s2,16(sp)
    c0601ec0:	142025f3          	csrr	a1,scause
    c0601ec4:	850a                	mv	a0,sp
    c0601ec6:	14102673          	csrr	a2,sepc
    c0601eca:	143026f3          	csrr	a3,stval
    c0601ece:	0005d763          	bgez	a1,c0601edc <trap_handler+0x6c>
    c0601ed2:	0586                	slli	a1,a1,0x1
    c0601ed4:	8185                	srli	a1,a1,0x1
    c0601ed6:	849fe0ef          	jal	ra,c060071e <handle_interrupt>
    c0601eda:	a021                	j	c0601ee2 <ret_to_usr>
    c0601edc:	941fe0ef          	jal	ra,c060081c <handle_syscall>
    c0601ee0:	a009                	j	c0601ee2 <ret_to_usr>

00000000c0601ee2 <ret_to_usr>:
    c0601ee2:	6942                	ld	s2,16(sp)
    c0601ee4:	14091073          	csrw	sscratch,s2
    c0601ee8:	60a2                	ld	ra,8(sp)
    c0601eea:	61e2                	ld	gp,24(sp)
    c0601eec:	7202                	ld	tp,32(sp)
    c0601eee:	72a2                	ld	t0,40(sp)
    c0601ef0:	7342                	ld	t1,48(sp)
    c0601ef2:	73e2                	ld	t2,56(sp)
    c0601ef4:	6406                	ld	s0,64(sp)
    c0601ef6:	64a6                	ld	s1,72(sp)
    c0601ef8:	6546                	ld	a0,80(sp)
    c0601efa:	65e6                	ld	a1,88(sp)
    c0601efc:	7606                	ld	a2,96(sp)
    c0601efe:	76a6                	ld	a3,104(sp)
    c0601f00:	7746                	ld	a4,112(sp)
    c0601f02:	77e6                	ld	a5,120(sp)
    c0601f04:	680a                	ld	a6,128(sp)
    c0601f06:	68aa                	ld	a7,136(sp)
    c0601f08:	694a                	ld	s2,144(sp)
    c0601f0a:	69ea                	ld	s3,152(sp)
    c0601f0c:	7a0a                	ld	s4,160(sp)
    c0601f0e:	7aaa                	ld	s5,168(sp)
    c0601f10:	7b4a                	ld	s6,176(sp)
    c0601f12:	7bea                	ld	s7,184(sp)
    c0601f14:	6c0e                	ld	s8,192(sp)
    c0601f16:	6cae                	ld	s9,200(sp)
    c0601f18:	6d4e                	ld	s10,208(sp)
    c0601f1a:	6dee                	ld	s11,216(sp)
    c0601f1c:	7e0e                	ld	t3,224(sp)
    c0601f1e:	7eae                	ld	t4,232(sp)
    c0601f20:	7f4e                	ld	t5,240(sp)
    c0601f22:	7fee                	ld	t6,248(sp)
    c0601f24:	6111                	addi	sp,sp,256
    c0601f26:	14011173          	csrrw	sp,sscratch,sp
    c0601f2a:	926fe0ef          	jal	ra,c0600050 <log>
    c0601f2e:	10200073          	sret
    c0601f32:	0001                	nop
    c0601f34:	00000013          	nop
    c0601f38:	00000013          	nop
    c0601f3c:	00000013          	nop
	...

00000000c0601f42 <dump_mem_pool>:
    c0601f42:	7139                	addi	sp,sp,-64
    c0601f44:	fc06                	sd	ra,56(sp)
    c0601f46:	f822                	sd	s0,48(sp)
    c0601f48:	0080                	addi	s0,sp,64
    c0601f4a:	fca43423          	sd	a0,-56(s0)
    c0601f4e:	00003517          	auipc	a0,0x3
    c0601f52:	b9a50513          	addi	a0,a0,-1126 # c0604ae8 <_init_data_end+0xae8>
    c0601f56:	e4bff0ef          	jal	ra,c0601da0 <print_color>
    c0601f5a:	fc843583          	ld	a1,-56(s0)
    c0601f5e:	00003517          	auipc	a0,0x3
    c0601f62:	bc250513          	addi	a0,a0,-1086 # c0604b20 <_init_data_end+0xb20>
    c0601f66:	d9dff0ef          	jal	ra,c0601d02 <printd>
    c0601f6a:	fc843783          	ld	a5,-56(s0)
    c0601f6e:	639c                	ld	a5,0(a5)
    c0601f70:	fef43423          	sd	a5,-24(s0)
    c0601f74:	4785                	li	a5,1
    c0601f76:	fef42223          	sw	a5,-28(s0)
    c0601f7a:	a095                	j	c0601fde <dump_mem_pool+0x9c>
    c0601f7c:	fe843583          	ld	a1,-24(s0)
    c0601f80:	00003517          	auipc	a0,0x3
    c0601f84:	bb050513          	addi	a0,a0,-1104 # c0604b30 <_init_data_end+0xb30>
    c0601f88:	d7bff0ef          	jal	ra,c0601d02 <printd>
    c0601f8c:	180027f3          	csrr	a5,satp
    c0601f90:	fcf43c23          	sd	a5,-40(s0)
    c0601f94:	fd843783          	ld	a5,-40(s0)
    c0601f98:	ef81                	bnez	a5,c0601fb0 <dump_mem_pool+0x6e>
    c0601f9a:	0006b797          	auipc	a5,0x6b
    c0601f9e:	4d678793          	addi	a5,a5,1238 # c066d470 <EDRV_VA_PA_OFFSET>
    c0601fa2:	639c                	ld	a5,0(a5)
    c0601fa4:	fe843703          	ld	a4,-24(s0)
    c0601fa8:	40f707b3          	sub	a5,a4,a5
    c0601fac:	fef43423          	sd	a5,-24(s0)
    c0601fb0:	fe843783          	ld	a5,-24(s0)
    c0601fb4:	639c                	ld	a5,0(a5)
    c0601fb6:	fef43423          	sd	a5,-24(s0)
    c0601fba:	fe442783          	lw	a5,-28(s0)
    c0601fbe:	0017871b          	addiw	a4,a5,1
    c0601fc2:	fee42223          	sw	a4,-28(s0)
    c0601fc6:	873e                	mv	a4,a5
    c0601fc8:	47c9                	li	a5,18
    c0601fca:	02f767bb          	remw	a5,a4,a5
    c0601fce:	2781                	sext.w	a5,a5
    c0601fd0:	e799                	bnez	a5,c0601fde <dump_mem_pool+0x9c>
    c0601fd2:	00003517          	auipc	a0,0x3
    c0601fd6:	b6650513          	addi	a0,a0,-1178 # c0604b38 <_init_data_end+0xb38>
    c0601fda:	d29ff0ef          	jal	ra,c0601d02 <printd>
    c0601fde:	fe843783          	ld	a5,-24(s0)
    c0601fe2:	cb89                	beqz	a5,c0601ff4 <dump_mem_pool+0xb2>
    c0601fe4:	fe442783          	lw	a5,-28(s0)
    c0601fe8:	0007871b          	sext.w	a4,a5
    c0601fec:	02400793          	li	a5,36
    c0601ff0:	f8e7d6e3          	bge	a5,a4,c0601f7c <dump_mem_pool+0x3a>
    c0601ff4:	00003517          	auipc	a0,0x3
    c0601ff8:	b4450513          	addi	a0,a0,-1212 # c0604b38 <_init_data_end+0xb38>
    c0601ffc:	d07ff0ef          	jal	ra,c0601d02 <printd>
    c0602000:	00003517          	auipc	a0,0x3
    c0602004:	b4050513          	addi	a0,a0,-1216 # c0604b40 <_init_data_end+0xb40>
    c0602008:	d99ff0ef          	jal	ra,c0601da0 <print_color>
    c060200c:	0001                	nop
    c060200e:	70e2                	ld	ra,56(sp)
    c0602010:	7442                	ld	s0,48(sp)
    c0602012:	6121                	addi	sp,sp,64
    c0602014:	8082                	ret

00000000c0602016 <va_pa_offset>:
    c0602016:	1101                	addi	sp,sp,-32
    c0602018:	ec22                	sd	s0,24(sp)
    c060201a:	1000                	addi	s0,sp,32
    c060201c:	180027f3          	csrr	a5,satp
    c0602020:	fef43423          	sd	a5,-24(s0)
    c0602024:	fe843783          	ld	a5,-24(s0)
    c0602028:	fef43023          	sd	a5,-32(s0)
    c060202c:	fe043783          	ld	a5,-32(s0)
    c0602030:	0007d863          	bgez	a5,c0602040 <va_pa_offset+0x2a>
    c0602034:	0006b797          	auipc	a5,0x6b
    c0602038:	43c78793          	addi	a5,a5,1084 # c066d470 <EDRV_VA_PA_OFFSET>
    c060203c:	639c                	ld	a5,0(a5)
    c060203e:	a011                	j	c0602042 <va_pa_offset+0x2c>
    c0602040:	4781                	li	a5,0
    c0602042:	853e                	mv	a0,a5
    c0602044:	6462                	ld	s0,24(sp)
    c0602046:	6105                	addi	sp,sp,32
    c0602048:	8082                	ret

00000000c060204a <va_pa_offset_no_mmu>:
    c060204a:	1101                	addi	sp,sp,-32
    c060204c:	ec06                	sd	ra,24(sp)
    c060204e:	e822                	sd	s0,16(sp)
    c0602050:	e426                	sd	s1,8(sp)
    c0602052:	1000                	addi	s0,sp,32
    c0602054:	0006b797          	auipc	a5,0x6b
    c0602058:	41c78793          	addi	a5,a5,1052 # c066d470 <EDRV_VA_PA_OFFSET>
    c060205c:	6384                	ld	s1,0(a5)
    c060205e:	fb9ff0ef          	jal	ra,c0602016 <va_pa_offset>
    c0602062:	87aa                	mv	a5,a0
    c0602064:	40f487b3          	sub	a5,s1,a5
    c0602068:	853e                	mv	a0,a5
    c060206a:	60e2                	ld	ra,24(sp)
    c060206c:	6442                	ld	s0,16(sp)
    c060206e:	64a2                	ld	s1,8(sp)
    c0602070:	6105                	addi	sp,sp,32
    c0602072:	8082                	ret

00000000c0602074 <get_phys_addr>:
    c0602074:	7179                	addi	sp,sp,-48
    c0602076:	f406                	sd	ra,40(sp)
    c0602078:	f022                	sd	s0,32(sp)
    c060207a:	1800                	addi	s0,sp,48
    c060207c:	fca43c23          	sd	a0,-40(s0)
    c0602080:	fd843503          	ld	a0,-40(s0)
    c0602084:	3ad000ef          	jal	ra,c0602c30 <get_pa>
    c0602088:	872a                	mv	a4,a0
    c060208a:	088677b7          	lui	a5,0x8867
    c060208e:	0792                	slli	a5,a5,0x4
    c0602090:	02f71063          	bne	a4,a5,c06020b0 <get_phys_addr+0x3c>
    c0602094:	fd843503          	ld	a0,-40(s0)
    c0602098:	399000ef          	jal	ra,c0602c30 <get_pa>
    c060209c:	87aa                	mv	a5,a0
    c060209e:	863e                	mv	a2,a5
    c06020a0:	fd843583          	ld	a1,-40(s0)
    c06020a4:	00003517          	auipc	a0,0x3
    c06020a8:	ad450513          	addi	a0,a0,-1324 # c0604b78 <_init_data_end+0xb78>
    c06020ac:	c57ff0ef          	jal	ra,c0601d02 <printd>
    c06020b0:	180027f3          	csrr	a5,satp
    c06020b4:	fef43423          	sd	a5,-24(s0)
    c06020b8:	fe843783          	ld	a5,-24(s0)
    c06020bc:	c799                	beqz	a5,c06020ca <get_phys_addr+0x56>
    c06020be:	fd843503          	ld	a0,-40(s0)
    c06020c2:	36f000ef          	jal	ra,c0602c30 <get_pa>
    c06020c6:	87aa                	mv	a5,a0
    c06020c8:	a811                	j	c06020dc <get_phys_addr+0x68>
    c06020ca:	0006b797          	auipc	a5,0x6b
    c06020ce:	3a678793          	addi	a5,a5,934 # c066d470 <EDRV_VA_PA_OFFSET>
    c06020d2:	639c                	ld	a5,0(a5)
    c06020d4:	fd843703          	ld	a4,-40(s0)
    c06020d8:	40f707b3          	sub	a5,a4,a5
    c06020dc:	853e                	mv	a0,a5
    c06020de:	70a2                	ld	ra,40(sp)
    c06020e0:	7402                	ld	s0,32(sp)
    c06020e2:	6145                	addi	sp,sp,48
    c06020e4:	8082                	ret

00000000c06020e6 <__spa_put>:
    c06020e6:	715d                	addi	sp,sp,-80
    c06020e8:	e486                	sd	ra,72(sp)
    c06020ea:	e0a2                	sd	s0,64(sp)
    c06020ec:	fc26                	sd	s1,56(sp)
    c06020ee:	0880                	addi	s0,sp,80
    c06020f0:	faa43c23          	sd	a0,-72(s0)
    c06020f4:	fab43823          	sd	a1,-80(s0)
    c06020f8:	fb843703          	ld	a4,-72(s0)
    c06020fc:	008007b7          	lui	a5,0x800
    c0602100:	17fd                	addi	a5,a5,-1
    c0602102:	8ff9                	and	a5,a5,a4
    c0602104:	fcf43c23          	sd	a5,-40(s0)
    c0602108:	0006b797          	auipc	a5,0x6b
    c060210c:	35878793          	addi	a5,a5,856 # c066d460 <va_top>
    c0602110:	639c                	ld	a5,0(a5)
    c0602112:	fd843703          	ld	a4,-40(s0)
    c0602116:	97ba                	add	a5,a5,a4
    c0602118:	fcf43823          	sd	a5,-48(s0)
    c060211c:	f2fff0ef          	jal	ra,c060204a <va_pa_offset_no_mmu>
    c0602120:	872a                	mv	a4,a0
    c0602122:	fd043783          	ld	a5,-48(s0)
    c0602126:	8f99                	sub	a5,a5,a4
    c0602128:	fcf43423          	sd	a5,-56(s0)
    c060212c:	fb043783          	ld	a5,-80(s0)
    c0602130:	4b9c                	lw	a5,16(a5)
    c0602132:	c78d                	beqz	a5,c060215c <__spa_put+0x76>
    c0602134:	fb043783          	ld	a5,-80(s0)
    c0602138:	639c                	ld	a5,0(a5)
    c060213a:	c38d                	beqz	a5,c060215c <__spa_put+0x76>
    c060213c:	fb043783          	ld	a5,-80(s0)
    c0602140:	6784                	ld	s1,8(a5)
    c0602142:	f09ff0ef          	jal	ra,c060204a <va_pa_offset_no_mmu>
    c0602146:	87aa                	mv	a5,a0
    c0602148:	40f487b3          	sub	a5,s1,a5
    c060214c:	fcf43023          	sd	a5,-64(s0)
    c0602150:	fc043783          	ld	a5,-64(s0)
    c0602154:	fd043703          	ld	a4,-48(s0)
    c0602158:	e398                	sd	a4,0(a5)
    c060215a:	a025                	j	c0602182 <__spa_put+0x9c>
    c060215c:	0006b797          	auipc	a5,0x6b
    c0602160:	30478793          	addi	a5,a5,772 # c066d460 <va_top>
    c0602164:	639c                	ld	a5,0(a5)
    c0602166:	863e                	mv	a2,a5
    c0602168:	fd043583          	ld	a1,-48(s0)
    c060216c:	00003517          	auipc	a0,0x3
    c0602170:	a3c50513          	addi	a0,a0,-1476 # c0604ba8 <_init_data_end+0xba8>
    c0602174:	b8fff0ef          	jal	ra,c0601d02 <printd>
    c0602178:	fb043783          	ld	a5,-80(s0)
    c060217c:	fd043703          	ld	a4,-48(s0)
    c0602180:	e398                	sd	a4,0(a5)
    c0602182:	fc843783          	ld	a5,-56(s0)
    c0602186:	0007b023          	sd	zero,0(a5)
    c060218a:	fb043783          	ld	a5,-80(s0)
    c060218e:	fd043703          	ld	a4,-48(s0)
    c0602192:	e798                	sd	a4,8(a5)
    c0602194:	fb043783          	ld	a5,-80(s0)
    c0602198:	4b9c                	lw	a5,16(a5)
    c060219a:	2785                	addiw	a5,a5,1
    c060219c:	0007871b          	sext.w	a4,a5
    c06021a0:	fb043783          	ld	a5,-80(s0)
    c06021a4:	cb98                	sw	a4,16(a5)
    c06021a6:	0001                	nop
    c06021a8:	60a6                	ld	ra,72(sp)
    c06021aa:	6406                	ld	s0,64(sp)
    c06021ac:	74e2                	ld	s1,56(sp)
    c06021ae:	6161                	addi	sp,sp,80
    c06021b0:	8082                	ret

00000000c06021b2 <__spa_get>:
    c06021b2:	715d                	addi	sp,sp,-80
    c06021b4:	e486                	sd	ra,72(sp)
    c06021b6:	e0a2                	sd	s0,64(sp)
    c06021b8:	fc26                	sd	s1,56(sp)
    c06021ba:	0880                	addi	s0,sp,80
    c06021bc:	faa43c23          	sd	a0,-72(s0)
    c06021c0:	fb843783          	ld	a5,-72(s0)
    c06021c4:	4b9c                	lw	a5,16(a5)
    c06021c6:	873e                	mv	a4,a5
    c06021c8:	5dc00793          	li	a5,1500
    c06021cc:	00e7fc63          	bgeu	a5,a4,c06021e4 <__spa_get+0x32>
    c06021d0:	fb843783          	ld	a5,-72(s0)
    c06021d4:	4b9c                	lw	a5,16(a5)
    c06021d6:	873e                	mv	a4,a5
    c06021d8:	41900793          	li	a5,1049
    c06021dc:	00e7e463          	bltu	a5,a4,c06021e4 <__spa_get+0x32>
    c06021e0:	4785                	li	a5,1
    c06021e2:	a011                	j	c06021e6 <__spa_get+0x34>
    c06021e4:	4781                	li	a5,0
    c06021e6:	fcf42e23          	sw	a5,-36(s0)
    c06021ea:	fb843783          	ld	a5,-72(s0)
    c06021ee:	4b9c                	lw	a5,16(a5)
    c06021f0:	c789                	beqz	a5,c06021fa <__spa_get+0x48>
    c06021f2:	fb843783          	ld	a5,-72(s0)
    c06021f6:	639c                	ld	a5,0(a5)
    c06021f8:	ef85                	bnez	a5,c0602230 <__spa_get+0x7e>
    c06021fa:	fb843783          	ld	a5,-72(s0)
    c06021fe:	679c                	ld	a5,8(a5)
    c0602200:	85be                	mv	a1,a5
    c0602202:	00003517          	auipc	a0,0x3
    c0602206:	9ee50513          	addi	a0,a0,-1554 # c0604bf0 <_init_data_end+0xbf0>
    c060220a:	af9ff0ef          	jal	ra,c0601d02 <printd>
    c060220e:	fb843503          	ld	a0,-72(s0)
    c0602212:	2fa000ef          	jal	ra,c060250c <alloc_mem_from_m>
    c0602216:	fca43823          	sd	a0,-48(s0)
    c060221a:	fd043783          	ld	a5,-48(s0)
    c060221e:	eb89                	bnez	a5,c0602230 <__spa_get+0x7e>
    c0602220:	00003517          	auipc	a0,0x3
    c0602224:	9f850513          	addi	a0,a0,-1544 # c0604c18 <_init_data_end+0xc18>
    c0602228:	adbff0ef          	jal	ra,c0601d02 <printd>
    c060222c:	57fd                	li	a5,-1
    c060222e:	a059                	j	c06022b4 <__spa_get+0x102>
    c0602230:	fdc42783          	lw	a5,-36(s0)
    c0602234:	2781                	sext.w	a5,a5
    c0602236:	cb99                	beqz	a5,c060224c <__spa_get+0x9a>
    c0602238:	fb843783          	ld	a5,-72(s0)
    c060223c:	4b9c                	lw	a5,16(a5)
    c060223e:	85be                	mv	a1,a5
    c0602240:	00003517          	auipc	a0,0x3
    c0602244:	9f850513          	addi	a0,a0,-1544 # c0604c38 <_init_data_end+0xc38>
    c0602248:	abbff0ef          	jal	ra,c0601d02 <printd>
    c060224c:	fb843783          	ld	a5,-72(s0)
    c0602250:	6384                	ld	s1,0(a5)
    c0602252:	df9ff0ef          	jal	ra,c060204a <va_pa_offset_no_mmu>
    c0602256:	87aa                	mv	a5,a0
    c0602258:	40f487b3          	sub	a5,s1,a5
    c060225c:	fcf43423          	sd	a5,-56(s0)
    c0602260:	fb843783          	ld	a5,-72(s0)
    c0602264:	639c                	ld	a5,0(a5)
    c0602266:	fcf43823          	sd	a5,-48(s0)
    c060226a:	fc843783          	ld	a5,-56(s0)
    c060226e:	639c                	ld	a5,0(a5)
    c0602270:	fcf43023          	sd	a5,-64(s0)
    c0602274:	fdc42783          	lw	a5,-36(s0)
    c0602278:	2781                	sext.w	a5,a5
    c060227a:	cf89                	beqz	a5,c0602294 <__spa_get+0xe2>
    c060227c:	fc043683          	ld	a3,-64(s0)
    c0602280:	fd043603          	ld	a2,-48(s0)
    c0602284:	fc843583          	ld	a1,-56(s0)
    c0602288:	00003517          	auipc	a0,0x3
    c060228c:	9d850513          	addi	a0,a0,-1576 # c0604c60 <_init_data_end+0xc60>
    c0602290:	a73ff0ef          	jal	ra,c0601d02 <printd>
    c0602294:	fb843783          	ld	a5,-72(s0)
    c0602298:	fc043703          	ld	a4,-64(s0)
    c060229c:	e398                	sd	a4,0(a5)
    c060229e:	fb843783          	ld	a5,-72(s0)
    c06022a2:	4b9c                	lw	a5,16(a5)
    c06022a4:	37fd                	addiw	a5,a5,-1
    c06022a6:	0007871b          	sext.w	a4,a5
    c06022aa:	fb843783          	ld	a5,-72(s0)
    c06022ae:	cb98                	sw	a4,16(a5)
    c06022b0:	fd043783          	ld	a5,-48(s0)
    c06022b4:	853e                	mv	a0,a5
    c06022b6:	60a6                	ld	ra,72(sp)
    c06022b8:	6406                	ld	s0,64(sp)
    c06022ba:	74e2                	ld	s1,56(sp)
    c06022bc:	6161                	addi	sp,sp,80
    c06022be:	8082                	ret

00000000c06022c0 <spa_init>:
    c06022c0:	7139                	addi	sp,sp,-64
    c06022c2:	fc06                	sd	ra,56(sp)
    c06022c4:	f822                	sd	s0,48(sp)
    c06022c6:	0080                	addi	s0,sp,64
    c06022c8:	fca43c23          	sd	a0,-40(s0)
    c06022cc:	fcb43823          	sd	a1,-48(s0)
    c06022d0:	87b2                	mv	a5,a2
    c06022d2:	fcf407a3          	sb	a5,-49(s0)
    c06022d6:	fcf44783          	lbu	a5,-49(s0)
    c06022da:	2781                	sext.w	a5,a5
    c06022dc:	85be                	mv	a1,a5
    c06022de:	00003517          	auipc	a0,0x3
    c06022e2:	9c250513          	addi	a0,a0,-1598 # c0604ca0 <_init_data_end+0xca0>
    c06022e6:	a1dff0ef          	jal	ra,c0601d02 <printd>
    c06022ea:	fcf44703          	lbu	a4,-49(s0)
    c06022ee:	87ba                	mv	a5,a4
    c06022f0:	0786                	slli	a5,a5,0x1
    c06022f2:	97ba                	add	a5,a5,a4
    c06022f4:	078e                	slli	a5,a5,0x3
    c06022f6:	873e                	mv	a4,a5
    c06022f8:	00065797          	auipc	a5,0x65
    c06022fc:	10878793          	addi	a5,a5,264 # c0667400 <page_pools>
    c0602300:	97ba                	add	a5,a5,a4
    c0602302:	fef43023          	sd	a5,-32(s0)
    c0602306:	fe043783          	ld	a5,-32(s0)
    c060230a:	0007a823          	sw	zero,16(a5)
    c060230e:	fe043783          	ld	a5,-32(s0)
    c0602312:	0007b023          	sd	zero,0(a5)
    c0602316:	fe043783          	ld	a5,-32(s0)
    c060231a:	0007b423          	sd	zero,8(a5)
    c060231e:	fd843783          	ld	a5,-40(s0)
    c0602322:	fef43423          	sd	a5,-24(s0)
    c0602326:	a829                	j	c0602340 <spa_init+0x80>
    c0602328:	fe043583          	ld	a1,-32(s0)
    c060232c:	fe843503          	ld	a0,-24(s0)
    c0602330:	db7ff0ef          	jal	ra,c06020e6 <__spa_put>
    c0602334:	fe843703          	ld	a4,-24(s0)
    c0602338:	6785                	lui	a5,0x1
    c060233a:	97ba                	add	a5,a5,a4
    c060233c:	fef43423          	sd	a5,-24(s0)
    c0602340:	fd843703          	ld	a4,-40(s0)
    c0602344:	fd043783          	ld	a5,-48(s0)
    c0602348:	97ba                	add	a5,a5,a4
    c060234a:	fe843703          	ld	a4,-24(s0)
    c060234e:	fcf76de3          	bltu	a4,a5,c0602328 <spa_init+0x68>
    c0602352:	fe043503          	ld	a0,-32(s0)
    c0602356:	bedff0ef          	jal	ra,c0601f42 <dump_mem_pool>
    c060235a:	0001                	nop
    c060235c:	70e2                	ld	ra,56(sp)
    c060235e:	7442                	ld	s0,48(sp)
    c0602360:	6121                	addi	sp,sp,64
    c0602362:	8082                	ret

00000000c0602364 <spa_put>:
    c0602364:	1101                	addi	sp,sp,-32
    c0602366:	ec06                	sd	ra,24(sp)
    c0602368:	e822                	sd	s0,16(sp)
    c060236a:	1000                	addi	s0,sp,32
    c060236c:	fea43423          	sd	a0,-24(s0)
    c0602370:	87ae                	mv	a5,a1
    c0602372:	fef403a3          	sb	a5,-25(s0)
    c0602376:	fe744703          	lbu	a4,-25(s0)
    c060237a:	87ba                	mv	a5,a4
    c060237c:	0786                	slli	a5,a5,0x1
    c060237e:	97ba                	add	a5,a5,a4
    c0602380:	078e                	slli	a5,a5,0x3
    c0602382:	873e                	mv	a4,a5
    c0602384:	00065797          	auipc	a5,0x65
    c0602388:	07c78793          	addi	a5,a5,124 # c0667400 <page_pools>
    c060238c:	97ba                	add	a5,a5,a4
    c060238e:	85be                	mv	a1,a5
    c0602390:	fe843503          	ld	a0,-24(s0)
    c0602394:	d53ff0ef          	jal	ra,c06020e6 <__spa_put>
    c0602398:	0001                	nop
    c060239a:	60e2                	ld	ra,24(sp)
    c060239c:	6442                	ld	s0,16(sp)
    c060239e:	6105                	addi	sp,sp,32
    c06023a0:	8082                	ret

00000000c06023a2 <spa_get_pa>:
    c06023a2:	7179                	addi	sp,sp,-48
    c06023a4:	f406                	sd	ra,40(sp)
    c06023a6:	f022                	sd	s0,32(sp)
    c06023a8:	1800                	addi	s0,sp,48
    c06023aa:	87aa                	mv	a5,a0
    c06023ac:	fcf40fa3          	sb	a5,-33(s0)
    c06023b0:	fdf44703          	lbu	a4,-33(s0)
    c06023b4:	87ba                	mv	a5,a4
    c06023b6:	0786                	slli	a5,a5,0x1
    c06023b8:	97ba                	add	a5,a5,a4
    c06023ba:	078e                	slli	a5,a5,0x3
    c06023bc:	873e                	mv	a4,a5
    c06023be:	00065797          	auipc	a5,0x65
    c06023c2:	04278793          	addi	a5,a5,66 # c0667400 <page_pools>
    c06023c6:	97ba                	add	a5,a5,a4
    c06023c8:	853e                	mv	a0,a5
    c06023ca:	de9ff0ef          	jal	ra,c06021b2 <__spa_get>
    c06023ce:	fea43423          	sd	a0,-24(s0)
    c06023d2:	fe843703          	ld	a4,-24(s0)
    c06023d6:	57fd                	li	a5,-1
    c06023d8:	00f71463          	bne	a4,a5,c06023e0 <spa_get_pa+0x3e>
    c06023dc:	57fd                	li	a5,-1
    c06023de:	a031                	j	c06023ea <spa_get_pa+0x48>
    c06023e0:	fe843503          	ld	a0,-24(s0)
    c06023e4:	c91ff0ef          	jal	ra,c0602074 <get_phys_addr>
    c06023e8:	87aa                	mv	a5,a0
    c06023ea:	853e                	mv	a0,a5
    c06023ec:	70a2                	ld	ra,40(sp)
    c06023ee:	7402                	ld	s0,32(sp)
    c06023f0:	6145                	addi	sp,sp,48
    c06023f2:	8082                	ret

00000000c06023f4 <spa_get_pa_zero>:
    c06023f4:	7139                	addi	sp,sp,-64
    c06023f6:	fc06                	sd	ra,56(sp)
    c06023f8:	f822                	sd	s0,48(sp)
    c06023fa:	0080                	addi	s0,sp,64
    c06023fc:	87aa                	mv	a5,a0
    c06023fe:	fcf407a3          	sb	a5,-49(s0)
    c0602402:	fcf44703          	lbu	a4,-49(s0)
    c0602406:	87ba                	mv	a5,a4
    c0602408:	0786                	slli	a5,a5,0x1
    c060240a:	97ba                	add	a5,a5,a4
    c060240c:	078e                	slli	a5,a5,0x3
    c060240e:	873e                	mv	a4,a5
    c0602410:	00065797          	auipc	a5,0x65
    c0602414:	ff078793          	addi	a5,a5,-16 # c0667400 <page_pools>
    c0602418:	97ba                	add	a5,a5,a4
    c060241a:	853e                	mv	a0,a5
    c060241c:	d97ff0ef          	jal	ra,c06021b2 <__spa_get>
    c0602420:	fea43423          	sd	a0,-24(s0)
    c0602424:	c27ff0ef          	jal	ra,c060204a <va_pa_offset_no_mmu>
    c0602428:	872a                	mv	a4,a0
    c060242a:	fe843783          	ld	a5,-24(s0)
    c060242e:	8f99                	sub	a5,a5,a4
    c0602430:	fef43023          	sd	a5,-32(s0)
    c0602434:	fe843703          	ld	a4,-24(s0)
    c0602438:	57fd                	li	a5,-1
    c060243a:	00f71463          	bne	a4,a5,c0602442 <spa_get_pa_zero+0x4e>
    c060243e:	57fd                	li	a5,-1
    c0602440:	a841                	j	c06024d0 <spa_get_pa_zero+0xdc>
    c0602442:	fe043783          	ld	a5,-32(s0)
    c0602446:	6605                	lui	a2,0x1
    c0602448:	4581                	li	a1,0
    c060244a:	853e                	mv	a0,a5
    c060244c:	901ff0ef          	jal	ra,c0601d4c <my_memset>
    c0602450:	fe843503          	ld	a0,-24(s0)
    c0602454:	c21ff0ef          	jal	ra,c0602074 <get_phys_addr>
    c0602458:	fca43c23          	sd	a0,-40(s0)
    c060245c:	fd843703          	ld	a4,-40(s0)
    c0602460:	088677b7          	lui	a5,0x8867
    c0602464:	0792                	slli	a5,a5,0x4
    c0602466:	06f71363          	bne	a4,a5,c06024cc <spa_get_pa_zero+0xd8>
    c060246a:	fcf44703          	lbu	a4,-49(s0)
    c060246e:	87ba                	mv	a5,a4
    c0602470:	0786                	slli	a5,a5,0x1
    c0602472:	97ba                	add	a5,a5,a4
    c0602474:	078e                	slli	a5,a5,0x3
    c0602476:	873e                	mv	a4,a5
    c0602478:	00065797          	auipc	a5,0x65
    c060247c:	f8878793          	addi	a5,a5,-120 # c0667400 <page_pools>
    c0602480:	97ba                	add	a5,a5,a4
    c0602482:	853e                	mv	a0,a5
    c0602484:	abfff0ef          	jal	ra,c0601f42 <dump_mem_pool>
    c0602488:	fcf44783          	lbu	a5,-49(s0)
    c060248c:	2781                	sext.w	a5,a5
    c060248e:	85be                	mv	a1,a5
    c0602490:	00003517          	auipc	a0,0x3
    c0602494:	84050513          	addi	a0,a0,-1984 # c0604cd0 <_init_data_end+0xcd0>
    c0602498:	86bff0ef          	jal	ra,c0601d02 <printd>
    c060249c:	fcf44703          	lbu	a4,-49(s0)
    c06024a0:	87ba                	mv	a5,a4
    c06024a2:	0786                	slli	a5,a5,0x1
    c06024a4:	97ba                	add	a5,a5,a4
    c06024a6:	078e                	slli	a5,a5,0x3
    c06024a8:	873e                	mv	a4,a5
    c06024aa:	00065797          	auipc	a5,0x65
    c06024ae:	f5678793          	addi	a5,a5,-170 # c0667400 <page_pools>
    c06024b2:	97ba                	add	a5,a5,a4
    c06024b4:	fcf43823          	sd	a5,-48(s0)
    c06024b8:	fd043783          	ld	a5,-48(s0)
    c06024bc:	4b9c                	lw	a5,16(a5)
    c06024be:	85be                	mv	a1,a5
    c06024c0:	00003517          	auipc	a0,0x3
    c06024c4:	84850513          	addi	a0,a0,-1976 # c0604d08 <_init_data_end+0xd08>
    c06024c8:	83bff0ef          	jal	ra,c0601d02 <printd>
    c06024cc:	fd843783          	ld	a5,-40(s0)
    c06024d0:	853e                	mv	a0,a5
    c06024d2:	70e2                	ld	ra,56(sp)
    c06024d4:	7442                	ld	s0,48(sp)
    c06024d6:	6121                	addi	sp,sp,64
    c06024d8:	8082                	ret

00000000c06024da <spa_avail>:
    c06024da:	1101                	addi	sp,sp,-32
    c06024dc:	ec22                	sd	s0,24(sp)
    c06024de:	1000                	addi	s0,sp,32
    c06024e0:	87aa                	mv	a5,a0
    c06024e2:	fef407a3          	sb	a5,-17(s0)
    c06024e6:	fef44703          	lbu	a4,-17(s0)
    c06024ea:	87ba                	mv	a5,a4
    c06024ec:	0786                	slli	a5,a5,0x1
    c06024ee:	97ba                	add	a5,a5,a4
    c06024f0:	078e                	slli	a5,a5,0x3
    c06024f2:	873e                	mv	a4,a5
    c06024f4:	00065797          	auipc	a5,0x65
    c06024f8:	f0c78793          	addi	a5,a5,-244 # c0667400 <page_pools>
    c06024fc:	97ba                	add	a5,a5,a4
    c06024fe:	4b9c                	lw	a5,16(a5)
    c0602500:	1782                	slli	a5,a5,0x20
    c0602502:	9381                	srli	a5,a5,0x20
    c0602504:	853e                	mv	a0,a5
    c0602506:	6462                	ld	s0,24(sp)
    c0602508:	6105                	addi	sp,sp,32
    c060250a:	8082                	ret

00000000c060250c <alloc_mem_from_m>:
    c060250c:	7139                	addi	sp,sp,-64
    c060250e:	fc06                	sd	ra,56(sp)
    c0602510:	f822                	sd	s0,48(sp)
    c0602512:	0080                	addi	s0,sp,64
    c0602514:	fca43423          	sd	a0,-56(s0)
    c0602518:	0006b797          	auipc	a5,0x6b
    c060251c:	f4878793          	addi	a5,a5,-184 # c066d460 <va_top>
    c0602520:	639c                	ld	a5,0(a5)
    c0602522:	853e                	mv	a0,a5
    c0602524:	4581                	li	a1,0
    c0602526:	4601                	li	a2,0
    c0602528:	19500813          	li	a6,405
    c060252c:	192617b7          	lui	a5,0x19261
    c0602530:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c0602534:	00000073          	ecall
    c0602538:	87ae                	mv	a5,a1
    c060253a:	fef43023          	sd	a5,-32(s0)
    c060253e:	87b2                	mv	a5,a2
    c0602540:	fcf43c23          	sd	a5,-40(s0)
    c0602544:	fd843603          	ld	a2,-40(s0)
    c0602548:	fe043583          	ld	a1,-32(s0)
    c060254c:	00002517          	auipc	a0,0x2
    c0602550:	7ec50513          	addi	a0,a0,2028 # c0604d38 <_init_data_end+0xd38>
    c0602554:	faeff0ef          	jal	ra,c0601d02 <printd>
    c0602558:	fe043783          	ld	a5,-32(s0)
    c060255c:	eb89                	bnez	a5,c060256e <alloc_mem_from_m+0x62>
    c060255e:	00003517          	auipc	a0,0x3
    c0602562:	83250513          	addi	a0,a0,-1998 # c0604d90 <_init_data_end+0xd90>
    c0602566:	f9cff0ef          	jal	ra,c0601d02 <printd>
    c060256a:	4781                	li	a5,0
    c060256c:	a0c9                	j	c060262e <alloc_mem_from_m+0x122>
    c060256e:	0006b797          	auipc	a5,0x6b
    c0602572:	ef278793          	addi	a5,a5,-270 # c066d460 <va_top>
    c0602576:	639c                	ld	a5,0(a5)
    c0602578:	85be                	mv	a1,a5
    c060257a:	00003517          	auipc	a0,0x3
    c060257e:	83e50513          	addi	a0,a0,-1986 # c0604db8 <_init_data_end+0xdb8>
    c0602582:	f80ff0ef          	jal	ra,c0601d02 <printd>
    c0602586:	0006b797          	auipc	a5,0x6b
    c060258a:	eda78793          	addi	a5,a5,-294 # c066d460 <va_top>
    c060258e:	638c                	ld	a1,0(a5)
    c0602590:	fd843783          	ld	a5,-40(s0)
    c0602594:	83b1                	srli	a5,a5,0xc
    c0602596:	471d                	li	a4,7
    c0602598:	86be                	mv	a3,a5
    c060259a:	fe043603          	ld	a2,-32(s0)
    c060259e:	4501                	li	a0,0
    c06025a0:	053000ef          	jal	ra,c0602df2 <map_page>
    c06025a4:	fe043783          	ld	a5,-32(s0)
    c06025a8:	fef43423          	sd	a5,-24(s0)
    c06025ac:	a829                	j	c06025c6 <alloc_mem_from_m+0xba>
    c06025ae:	fc843583          	ld	a1,-56(s0)
    c06025b2:	fe843503          	ld	a0,-24(s0)
    c06025b6:	b31ff0ef          	jal	ra,c06020e6 <__spa_put>
    c06025ba:	fe843703          	ld	a4,-24(s0)
    c06025be:	6785                	lui	a5,0x1
    c06025c0:	97ba                	add	a5,a5,a4
    c06025c2:	fef43423          	sd	a5,-24(s0)
    c06025c6:	fe043703          	ld	a4,-32(s0)
    c06025ca:	fd843783          	ld	a5,-40(s0)
    c06025ce:	97ba                	add	a5,a5,a4
    c06025d0:	fe843703          	ld	a4,-24(s0)
    c06025d4:	fcf76de3          	bltu	a4,a5,c06025ae <alloc_mem_from_m+0xa2>
    c06025d8:	fc843783          	ld	a5,-56(s0)
    c06025dc:	4b9c                	lw	a5,16(a5)
    c06025de:	c789                	beqz	a5,c06025e8 <alloc_mem_from_m+0xdc>
    c06025e0:	fc843783          	ld	a5,-56(s0)
    c06025e4:	639c                	ld	a5,0(a5)
    c06025e6:	e799                	bnez	a5,c06025f4 <alloc_mem_from_m+0xe8>
    c06025e8:	00003517          	auipc	a0,0x3
    c06025ec:	80050513          	addi	a0,a0,-2048 # c0604de8 <_init_data_end+0xde8>
    c06025f0:	f12ff0ef          	jal	ra,c0601d02 <printd>
    c06025f4:	fc843783          	ld	a5,-56(s0)
    c06025f8:	4b9c                	lw	a5,16(a5)
    c06025fa:	fcf42a23          	sw	a5,-44(s0)
    c06025fe:	fd442783          	lw	a5,-44(s0)
    c0602602:	85be                	mv	a1,a5
    c0602604:	00003517          	auipc	a0,0x3
    c0602608:	81450513          	addi	a0,a0,-2028 # c0604e18 <_init_data_end+0xe18>
    c060260c:	ef6ff0ef          	jal	ra,c0601d02 <printd>
    c0602610:	0006b797          	auipc	a5,0x6b
    c0602614:	e5078793          	addi	a5,a5,-432 # c066d460 <va_top>
    c0602618:	6398                	ld	a4,0(a5)
    c060261a:	008007b7          	lui	a5,0x800
    c060261e:	973e                	add	a4,a4,a5
    c0602620:	0006b797          	auipc	a5,0x6b
    c0602624:	e4078793          	addi	a5,a5,-448 # c066d460 <va_top>
    c0602628:	e398                	sd	a4,0(a5)
    c060262a:	fe043783          	ld	a5,-32(s0)
    c060262e:	853e                	mv	a0,a5
    c0602630:	70e2                	ld	ra,56(sp)
    c0602632:	7442                	ld	s0,48(sp)
    c0602634:	6121                	addi	sp,sp,64
    c0602636:	8082                	ret

00000000c0602638 <flush_tlb>:
    c0602638:	1141                	addi	sp,sp,-16
    c060263a:	e422                	sd	s0,8(sp)
    c060263c:	0800                	addi	s0,sp,16
    c060263e:	12000073          	sfence.vma
    c0602642:	0001                	nop
    c0602644:	6422                	ld	s0,8(sp)
    c0602646:	0141                	addi	sp,sp,16
    c0602648:	8082                	ret

00000000c060264a <acce_to_phys>:
    c060264a:	7179                	addi	sp,sp,-48
    c060264c:	f406                	sd	ra,40(sp)
    c060264e:	f022                	sd	s0,32(sp)
    c0602650:	1800                	addi	s0,sp,48
    c0602652:	fca43c23          	sd	a0,-40(s0)
    c0602656:	180027f3          	csrr	a5,satp
    c060265a:	fef43423          	sd	a5,-24(s0)
    c060265e:	fe843783          	ld	a5,-24(s0)
    c0602662:	c799                	beqz	a5,c0602670 <acce_to_phys+0x26>
    c0602664:	fd843503          	ld	a0,-40(s0)
    c0602668:	5c8000ef          	jal	ra,c0602c30 <get_pa>
    c060266c:	87aa                	mv	a5,a0
    c060266e:	a019                	j	c0602674 <acce_to_phys+0x2a>
    c0602670:	fd843783          	ld	a5,-40(s0)
    c0602674:	853e                	mv	a0,a5
    c0602676:	70a2                	ld	ra,40(sp)
    c0602678:	7402                	ld	s0,32(sp)
    c060267a:	6145                	addi	sp,sp,48
    c060267c:	8082                	ret

00000000c060267e <trie_get_or_insert>:
    c060267e:	711d                	addi	sp,sp,-96
    c0602680:	ec86                	sd	ra,88(sp)
    c0602682:	e8a2                	sd	s0,80(sp)
    c0602684:	1080                	addi	s0,sp,96
    c0602686:	faa43c23          	sd	a0,-72(s0)
    c060268a:	fab43823          	sd	a1,-80(s0)
    c060268e:	fac43423          	sd	a2,-88(s0)
    c0602692:	87b6                	mv	a5,a3
    c0602694:	faf42223          	sw	a5,-92(s0)
    c0602698:	87ba                	mv	a5,a4
    c060269a:	faf42023          	sw	a5,-96(s0)
    c060269e:	fe042623          	sw	zero,-20(s0)
    c06026a2:	fe042423          	sw	zero,-24(s0)
    c06026a6:	fb043783          	ld	a5,-80(s0)
    c06026aa:	83f9                	srli	a5,a5,0x1e
    c06026ac:	1ff7f793          	andi	a5,a5,511
    c06026b0:	fcf43023          	sd	a5,-64(s0)
    c06026b4:	fb043783          	ld	a5,-80(s0)
    c06026b8:	83d5                	srli	a5,a5,0x15
    c06026ba:	1ff7f793          	andi	a5,a5,511
    c06026be:	fcf43423          	sd	a5,-56(s0)
    c06026c2:	fb043783          	ld	a5,-80(s0)
    c06026c6:	83b1                	srli	a5,a5,0xc
    c06026c8:	1ff7f793          	andi	a5,a5,511
    c06026cc:	fcf43823          	sd	a5,-48(s0)
    c06026d0:	a281                	j	c0602810 <trie_get_or_insert+0x192>
    c06026d2:	fe846783          	lwu	a5,-24(s0)
    c06026d6:	078e                	slli	a5,a5,0x3
    c06026d8:	ff040713          	addi	a4,s0,-16
    c06026dc:	97ba                	add	a5,a5,a4
    c06026de:	fd07b783          	ld	a5,-48(a5)
    c06026e2:	fb843703          	ld	a4,-72(s0)
    c06026e6:	fec46683          	lwu	a3,-20(s0)
    c06026ea:	06a6                	slli	a3,a3,0x9
    c06026ec:	97b6                	add	a5,a5,a3
    c06026ee:	078a                	slli	a5,a5,0x2
    c06026f0:	97ba                	add	a5,a5,a4
    c06026f2:	439c                	lw	a5,0(a5)
    c06026f4:	e7f5                	bnez	a5,c06027e0 <trie_get_or_insert+0x162>
    c06026f6:	fb843703          	ld	a4,-72(s0)
    c06026fa:	000207b7          	lui	a5,0x20
    c06026fe:	97ba                	add	a5,a5,a4
    c0602700:	439c                	lw	a5,0(a5)
    c0602702:	2785                	addiw	a5,a5,1
    c0602704:	0007871b          	sext.w	a4,a5
    c0602708:	fb843683          	ld	a3,-72(s0)
    c060270c:	000207b7          	lui	a5,0x20
    c0602710:	97b6                	add	a5,a5,a3
    c0602712:	c398                	sw	a4,0(a5)
    c0602714:	fe846783          	lwu	a5,-24(s0)
    c0602718:	078e                	slli	a5,a5,0x3
    c060271a:	ff040713          	addi	a4,s0,-16
    c060271e:	97ba                	add	a5,a5,a4
    c0602720:	fd07b783          	ld	a5,-48(a5) # 1ffd0 <_start-0xc05e0030>
    c0602724:	fb843683          	ld	a3,-72(s0)
    c0602728:	00020737          	lui	a4,0x20
    c060272c:	9736                	add	a4,a4,a3
    c060272e:	4318                	lw	a4,0(a4)
    c0602730:	fb843683          	ld	a3,-72(s0)
    c0602734:	fec46603          	lwu	a2,-20(s0)
    c0602738:	0626                	slli	a2,a2,0x9
    c060273a:	97b2                	add	a5,a5,a2
    c060273c:	078a                	slli	a5,a5,0x2
    c060273e:	97b6                	add	a5,a5,a3
    c0602740:	c398                	sw	a4,0(a5)
    c0602742:	fb843703          	ld	a4,-72(s0)
    c0602746:	000207b7          	lui	a5,0x20
    c060274a:	97ba                	add	a5,a5,a4
    c060274c:	439c                	lw	a5,0(a5)
    c060274e:	85be                	mv	a1,a5
    c0602750:	00002517          	auipc	a0,0x2
    c0602754:	70050513          	addi	a0,a0,1792 # c0604e50 <_init_data_end+0xe50>
    c0602758:	daaff0ef          	jal	ra,c0601d02 <printd>
    c060275c:	fe846783          	lwu	a5,-24(s0)
    c0602760:	078e                	slli	a5,a5,0x3
    c0602762:	ff040713          	addi	a4,s0,-16
    c0602766:	97ba                	add	a5,a5,a4
    c0602768:	fd07b783          	ld	a5,-48(a5) # 1ffd0 <_start-0xc05e0030>
    c060276c:	fec46703          	lwu	a4,-20(s0)
    c0602770:	0726                	slli	a4,a4,0x9
    c0602772:	97ba                	add	a5,a5,a4
    c0602774:	00379713          	slli	a4,a5,0x3
    c0602778:	00004797          	auipc	a5,0x4
    c060277c:	88878793          	addi	a5,a5,-1912 # c0606000 <page_directory_pool>
    c0602780:	97ba                	add	a5,a5,a4
    c0602782:	fef43023          	sd	a5,-32(s0)
    c0602786:	fb843703          	ld	a4,-72(s0)
    c060278a:	000207b7          	lui	a5,0x20
    c060278e:	97ba                	add	a5,a5,a4
    c0602790:	439c                	lw	a5,0(a5)
    c0602792:	1782                	slli	a5,a5,0x20
    c0602794:	9381                	srli	a5,a5,0x20
    c0602796:	00c79713          	slli	a4,a5,0xc
    c060279a:	00004797          	auipc	a5,0x4
    c060279e:	86678793          	addi	a5,a5,-1946 # c0606000 <page_directory_pool>
    c06027a2:	97ba                	add	a5,a5,a4
    c06027a4:	853e                	mv	a0,a5
    c06027a6:	ea5ff0ef          	jal	ra,c060264a <acce_to_phys>
    c06027aa:	87aa                	mv	a5,a0
    c06027ac:	00c7d713          	srli	a4,a5,0xc
    c06027b0:	57fd                	li	a5,-1
    c06027b2:	83d1                	srli	a5,a5,0x14
    c06027b4:	00f776b3          	and	a3,a4,a5
    c06027b8:	fe043783          	ld	a5,-32(s0)
    c06027bc:	577d                	li	a4,-1
    c06027be:	8351                	srli	a4,a4,0x14
    c06027c0:	8f75                	and	a4,a4,a3
    c06027c2:	072a                	slli	a4,a4,0xa
    c06027c4:	6390                	ld	a2,0(a5)
    c06027c6:	56fd                	li	a3,-1
    c06027c8:	16da                	slli	a3,a3,0x36
    c06027ca:	3ff68693          	addi	a3,a3,1023
    c06027ce:	8ef1                	and	a3,a3,a2
    c06027d0:	8f55                	or	a4,a4,a3
    c06027d2:	e398                	sd	a4,0(a5)
    c06027d4:	fe043783          	ld	a5,-32(s0)
    c06027d8:	6398                	ld	a4,0(a5)
    c06027da:	00176713          	ori	a4,a4,1
    c06027de:	e398                	sd	a4,0(a5)
    c06027e0:	fe846783          	lwu	a5,-24(s0)
    c06027e4:	078e                	slli	a5,a5,0x3
    c06027e6:	ff040713          	addi	a4,s0,-16
    c06027ea:	97ba                	add	a5,a5,a4
    c06027ec:	fd07b783          	ld	a5,-48(a5)
    c06027f0:	fb843703          	ld	a4,-72(s0)
    c06027f4:	fec46683          	lwu	a3,-20(s0)
    c06027f8:	06a6                	slli	a3,a3,0x9
    c06027fa:	97b6                	add	a5,a5,a3
    c06027fc:	078a                	slli	a5,a5,0x2
    c06027fe:	97ba                	add	a5,a5,a4
    c0602800:	439c                	lw	a5,0(a5)
    c0602802:	fef42623          	sw	a5,-20(s0)
    c0602806:	fe842783          	lw	a5,-24(s0)
    c060280a:	2785                	addiw	a5,a5,1
    c060280c:	fef42423          	sw	a5,-24(s0)
    c0602810:	fa442783          	lw	a5,-92(s0)
    c0602814:	37fd                	addiw	a5,a5,-1
    c0602816:	2781                	sext.w	a5,a5
    c0602818:	0007871b          	sext.w	a4,a5
    c060281c:	fe842783          	lw	a5,-24(s0)
    c0602820:	2781                	sext.w	a5,a5
    c0602822:	eae7e8e3          	bltu	a5,a4,c06026d2 <trie_get_or_insert+0x54>
    c0602826:	fa442783          	lw	a5,-92(s0)
    c060282a:	37fd                	addiw	a5,a5,-1
    c060282c:	2781                	sext.w	a5,a5
    c060282e:	078e                	slli	a5,a5,0x3
    c0602830:	ff040713          	addi	a4,s0,-16
    c0602834:	97ba                	add	a5,a5,a4
    c0602836:	fd07b783          	ld	a5,-48(a5)
    c060283a:	fec46703          	lwu	a4,-20(s0)
    c060283e:	0726                	slli	a4,a4,0x9
    c0602840:	97ba                	add	a5,a5,a4
    c0602842:	00379713          	slli	a4,a5,0x3
    c0602846:	00003797          	auipc	a5,0x3
    c060284a:	7ba78793          	addi	a5,a5,1978 # c0606000 <page_directory_pool>
    c060284e:	97ba                	add	a5,a5,a4
    c0602850:	fef43023          	sd	a5,-32(s0)
    c0602854:	fa843783          	ld	a5,-88(s0)
    c0602858:	00c7d713          	srli	a4,a5,0xc
    c060285c:	57fd                	li	a5,-1
    c060285e:	83d1                	srli	a5,a5,0x14
    c0602860:	00f776b3          	and	a3,a4,a5
    c0602864:	fe043783          	ld	a5,-32(s0)
    c0602868:	577d                	li	a4,-1
    c060286a:	8351                	srli	a4,a4,0x14
    c060286c:	8f75                	and	a4,a4,a3
    c060286e:	072a                	slli	a4,a4,0xa
    c0602870:	6390                	ld	a2,0(a5)
    c0602872:	56fd                	li	a3,-1
    c0602874:	16da                	slli	a3,a3,0x36
    c0602876:	3ff68693          	addi	a3,a3,1023
    c060287a:	8ef1                	and	a3,a3,a2
    c060287c:	8f55                	or	a4,a4,a3
    c060287e:	e398                	sd	a4,0(a5)
    c0602880:	fa442783          	lw	a5,-92(s0)
    c0602884:	0007871b          	sext.w	a4,a5
    c0602888:	4789                	li	a5,2
    c060288a:	02f71c63          	bne	a4,a5,c06028c2 <trie_get_or_insert+0x244>
    c060288e:	fe043783          	ld	a5,-32(s0)
    c0602892:	639c                	ld	a5,0(a5)
    c0602894:	83a9                	srli	a5,a5,0xa
    c0602896:	577d                	li	a4,-1
    c0602898:	8351                	srli	a4,a4,0x14
    c060289a:	8ff9                	and	a5,a5,a4
    c060289c:	577d                	li	a4,-1
    c060289e:	1702                	slli	a4,a4,0x20
    c06028a0:	8351                	srli	a4,a4,0x14
    c06028a2:	00e7f6b3          	and	a3,a5,a4
    c06028a6:	fe043783          	ld	a5,-32(s0)
    c06028aa:	577d                	li	a4,-1
    c06028ac:	8351                	srli	a4,a4,0x14
    c06028ae:	8f75                	and	a4,a4,a3
    c06028b0:	072a                	slli	a4,a4,0xa
    c06028b2:	6390                	ld	a2,0(a5)
    c06028b4:	56fd                	li	a3,-1
    c06028b6:	16da                	slli	a3,a3,0x36
    c06028b8:	3ff68693          	addi	a3,a3,1023
    c06028bc:	8ef1                	and	a3,a3,a2
    c06028be:	8f55                	or	a4,a4,a3
    c06028c0:	e398                	sd	a4,0(a5)
    c06028c2:	fe043783          	ld	a5,-32(s0)
    c06028c6:	6398                	ld	a4,0(a5)
    c06028c8:	02076713          	ori	a4,a4,32
    c06028cc:	e398                	sd	a4,0(a5)
    c06028ce:	fe043783          	ld	a5,-32(s0)
    c06028d2:	639c                	ld	a5,0(a5)
    c06028d4:	8395                	srli	a5,a5,0x5
    c06028d6:	8b85                	andi	a5,a5,1
    c06028d8:	0ff7f713          	andi	a4,a5,255
    c06028dc:	fe043783          	ld	a5,-32(s0)
    c06028e0:	8b05                	andi	a4,a4,1
    c06028e2:	6394                	ld	a3,0(a5)
    c06028e4:	9af9                	andi	a3,a3,-2
    c06028e6:	8f55                	or	a4,a4,a3
    c06028e8:	e398                	sd	a4,0(a5)
    c06028ea:	fa042783          	lw	a5,-96(s0)
    c06028ee:	8bc1                	andi	a5,a5,16
    c06028f0:	2781                	sext.w	a5,a5
    c06028f2:	c799                	beqz	a5,c0602900 <trie_get_or_insert+0x282>
    c06028f4:	fe043783          	ld	a5,-32(s0)
    c06028f8:	6398                	ld	a4,0(a5)
    c06028fa:	01076713          	ori	a4,a4,16
    c06028fe:	e398                	sd	a4,0(a5)
    c0602900:	fa042783          	lw	a5,-96(s0)
    c0602904:	8b91                	andi	a5,a5,4
    c0602906:	2781                	sext.w	a5,a5
    c0602908:	e799                	bnez	a5,c0602916 <trie_get_or_insert+0x298>
    c060290a:	fa042783          	lw	a5,-96(s0)
    c060290e:	0807f793          	andi	a5,a5,128
    c0602912:	2781                	sext.w	a5,a5
    c0602914:	c79d                	beqz	a5,c0602942 <trie_get_or_insert+0x2c4>
    c0602916:	fe043783          	ld	a5,-32(s0)
    c060291a:	6398                	ld	a4,0(a5)
    c060291c:	00476713          	ori	a4,a4,4
    c0602920:	e398                	sd	a4,0(a5)
    c0602922:	fe043783          	ld	a5,-32(s0)
    c0602926:	639c                	ld	a5,0(a5)
    c0602928:	8389                	srli	a5,a5,0x2
    c060292a:	8b85                	andi	a5,a5,1
    c060292c:	0ff7f713          	andi	a4,a5,255
    c0602930:	fe043783          	ld	a5,-32(s0)
    c0602934:	8b05                	andi	a4,a4,1
    c0602936:	071e                	slli	a4,a4,0x7
    c0602938:	6394                	ld	a3,0(a5)
    c060293a:	f7f6f693          	andi	a3,a3,-129
    c060293e:	8f55                	or	a4,a4,a3
    c0602940:	e398                	sd	a4,0(a5)
    c0602942:	fa042783          	lw	a5,-96(s0)
    c0602946:	8b89                	andi	a5,a5,2
    c0602948:	2781                	sext.w	a5,a5
    c060294a:	e799                	bnez	a5,c0602958 <trie_get_or_insert+0x2da>
    c060294c:	fa042783          	lw	a5,-96(s0)
    c0602950:	0407f793          	andi	a5,a5,64
    c0602954:	2781                	sext.w	a5,a5
    c0602956:	c79d                	beqz	a5,c0602984 <trie_get_or_insert+0x306>
    c0602958:	fe043783          	ld	a5,-32(s0)
    c060295c:	6398                	ld	a4,0(a5)
    c060295e:	00276713          	ori	a4,a4,2
    c0602962:	e398                	sd	a4,0(a5)
    c0602964:	fe043783          	ld	a5,-32(s0)
    c0602968:	639c                	ld	a5,0(a5)
    c060296a:	8385                	srli	a5,a5,0x1
    c060296c:	8b85                	andi	a5,a5,1
    c060296e:	0ff7f713          	andi	a4,a5,255
    c0602972:	fe043783          	ld	a5,-32(s0)
    c0602976:	8b05                	andi	a4,a4,1
    c0602978:	071a                	slli	a4,a4,0x6
    c060297a:	6394                	ld	a3,0(a5)
    c060297c:	fbf6f693          	andi	a3,a3,-65
    c0602980:	8f55                	or	a4,a4,a3
    c0602982:	e398                	sd	a4,0(a5)
    c0602984:	fa042783          	lw	a5,-96(s0)
    c0602988:	8ba1                	andi	a5,a5,8
    c060298a:	2781                	sext.w	a5,a5
    c060298c:	c799                	beqz	a5,c060299a <trie_get_or_insert+0x31c>
    c060298e:	fe043783          	ld	a5,-32(s0)
    c0602992:	6398                	ld	a4,0(a5)
    c0602994:	00876713          	ori	a4,a4,8
    c0602998:	e398                	sd	a4,0(a5)
    c060299a:	180027f3          	csrr	a5,satp
    c060299e:	fcf43c23          	sd	a5,-40(s0)
    c06029a2:	fd843783          	ld	a5,-40(s0)
    c06029a6:	c399                	beqz	a5,c06029ac <trie_get_or_insert+0x32e>
    c06029a8:	c91ff0ef          	jal	ra,c0602638 <flush_tlb>
    c06029ac:	fe043783          	ld	a5,-32(s0)
    c06029b0:	639c                	ld	a5,0(a5)
    c06029b2:	853e                	mv	a0,a5
    c06029b4:	60e6                	ld	ra,88(sp)
    c06029b6:	6446                	ld	s0,80(sp)
    c06029b8:	6125                	addi	sp,sp,96
    c06029ba:	8082                	ret

00000000c06029bc <page_directory_insert>:
    c06029bc:	7139                	addi	sp,sp,-64
    c06029be:	fc06                	sd	ra,56(sp)
    c06029c0:	f822                	sd	s0,48(sp)
    c06029c2:	0080                	addi	s0,sp,64
    c06029c4:	fca43c23          	sd	a0,-40(s0)
    c06029c8:	fcb43823          	sd	a1,-48(s0)
    c06029cc:	87b2                	mv	a5,a2
    c06029ce:	8736                	mv	a4,a3
    c06029d0:	fcf42623          	sw	a5,-52(s0)
    c06029d4:	87ba                	mv	a5,a4
    c06029d6:	fcf42423          	sw	a5,-56(s0)
    c06029da:	fc842703          	lw	a4,-56(s0)
    c06029de:	fcc42783          	lw	a5,-52(s0)
    c06029e2:	86be                	mv	a3,a5
    c06029e4:	fd043603          	ld	a2,-48(s0)
    c06029e8:	fd843583          	ld	a1,-40(s0)
    c06029ec:	00043517          	auipc	a0,0x43
    c06029f0:	61450513          	addi	a0,a0,1556 # c0646000 <address_trie>
    c06029f4:	c8bff0ef          	jal	ra,c060267e <trie_get_or_insert>
    c06029f8:	fea43423          	sd	a0,-24(s0)
    c06029fc:	fe843783          	ld	a5,-24(s0)
    c0602a00:	853e                	mv	a0,a5
    c0602a02:	70e2                	ld	ra,56(sp)
    c0602a04:	7442                	ld	s0,48(sp)
    c0602a06:	6121                	addi	sp,sp,64
    c0602a08:	8082                	ret

00000000c0602a0a <get_page_table_root>:
    c0602a0a:	1141                	addi	sp,sp,-16
    c0602a0c:	e422                	sd	s0,8(sp)
    c0602a0e:	0800                	addi	s0,sp,16
    c0602a10:	00003797          	auipc	a5,0x3
    c0602a14:	5f078793          	addi	a5,a5,1520 # c0606000 <page_directory_pool>
    c0602a18:	853e                	mv	a0,a5
    c0602a1a:	6422                	ld	s0,8(sp)
    c0602a1c:	0141                	addi	sp,sp,16
    c0602a1e:	8082                	ret

00000000c0602a20 <print_pte>:
    c0602a20:	711d                	addi	sp,sp,-96
    c0602a22:	ec86                	sd	ra,88(sp)
    c0602a24:	e8a2                	sd	s0,80(sp)
    c0602a26:	1080                	addi	s0,sp,96
    c0602a28:	faa43423          	sd	a0,-88(s0)
    c0602a2c:	fa843783          	ld	a5,-88(s0)
    c0602a30:	83f9                	srli	a5,a5,0x1e
    c0602a32:	1ff7f793          	andi	a5,a5,511
    c0602a36:	fcf43023          	sd	a5,-64(s0)
    c0602a3a:	fa843783          	ld	a5,-88(s0)
    c0602a3e:	83d5                	srli	a5,a5,0x15
    c0602a40:	1ff7f793          	andi	a5,a5,511
    c0602a44:	fcf43423          	sd	a5,-56(s0)
    c0602a48:	fa843783          	ld	a5,-88(s0)
    c0602a4c:	83b1                	srli	a5,a5,0xc
    c0602a4e:	1ff7f793          	andi	a5,a5,511
    c0602a52:	fcf43823          	sd	a5,-48(s0)
    c0602a56:	fb5ff0ef          	jal	ra,c0602a0a <get_page_table_root>
    c0602a5a:	87aa                	mv	a5,a0
    c0602a5c:	fef43423          	sd	a5,-24(s0)
    c0602a60:	fe042223          	sw	zero,-28(s0)
    c0602a64:	fe442783          	lw	a5,-28(s0)
    c0602a68:	078e                	slli	a5,a5,0x3
    c0602a6a:	ff040713          	addi	a4,s0,-16
    c0602a6e:	97ba                	add	a5,a5,a4
    c0602a70:	fd07b783          	ld	a5,-48(a5)
    c0602a74:	078e                	slli	a5,a5,0x3
    c0602a76:	fe843703          	ld	a4,-24(s0)
    c0602a7a:	97ba                	add	a5,a5,a4
    c0602a7c:	639c                	ld	a5,0(a5)
    c0602a7e:	faf43823          	sd	a5,-80(s0)
    c0602a82:	fb043783          	ld	a5,-80(s0)
    c0602a86:	8b85                	andi	a5,a5,1
    c0602a88:	eb91                	bnez	a5,c0602a9c <print_pte+0x7c>
    c0602a8a:	fa843583          	ld	a1,-88(s0)
    c0602a8e:	00002517          	auipc	a0,0x2
    c0602a92:	3fa50513          	addi	a0,a0,1018 # c0604e88 <_init_data_end+0xe88>
    c0602a96:	a6cff0ef          	jal	ra,c0601d02 <printd>
    c0602a9a:	a279                	j	c0602c28 <print_pte+0x208>
    c0602a9c:	fb043783          	ld	a5,-80(s0)
    c0602aa0:	8385                	srli	a5,a5,0x1
    c0602aa2:	8b85                	andi	a5,a5,1
    c0602aa4:	0ff7f713          	andi	a4,a5,255
    c0602aa8:	fb043783          	ld	a5,-80(s0)
    c0602aac:	8389                	srli	a5,a5,0x2
    c0602aae:	8b85                	andi	a5,a5,1
    c0602ab0:	0ff7f793          	andi	a5,a5,255
    c0602ab4:	8fd9                	or	a5,a5,a4
    c0602ab6:	0ff7f713          	andi	a4,a5,255
    c0602aba:	fb043783          	ld	a5,-80(s0)
    c0602abe:	838d                	srli	a5,a5,0x3
    c0602ac0:	8b85                	andi	a5,a5,1
    c0602ac2:	0ff7f793          	andi	a5,a5,255
    c0602ac6:	8fd9                	or	a5,a5,a4
    c0602ac8:	0ff7f793          	andi	a5,a5,255
    c0602acc:	eb9d                	bnez	a5,c0602b02 <print_pte+0xe2>
    c0602ace:	fb043783          	ld	a5,-80(s0)
    c0602ad2:	83a9                	srli	a5,a5,0xa
    c0602ad4:	577d                	li	a4,-1
    c0602ad6:	8351                	srli	a4,a4,0x14
    c0602ad8:	8ff9                	and	a5,a5,a4
    c0602ada:	07b2                	slli	a5,a5,0xc
    c0602adc:	577d                	li	a4,-1
    c0602ade:	8351                	srli	a4,a4,0x14
    c0602ae0:	8ff9                	and	a5,a5,a4
    c0602ae2:	fcf43c23          	sd	a5,-40(s0)
    c0602ae6:	d30ff0ef          	jal	ra,c0602016 <va_pa_offset>
    c0602aea:	872a                	mv	a4,a0
    c0602aec:	fd843783          	ld	a5,-40(s0)
    c0602af0:	97ba                	add	a5,a5,a4
    c0602af2:	fef43423          	sd	a5,-24(s0)
    c0602af6:	fe442783          	lw	a5,-28(s0)
    c0602afa:	2785                	addiw	a5,a5,1
    c0602afc:	fef42223          	sw	a5,-28(s0)
    c0602b00:	b795                	j	c0602a64 <print_pte+0x44>
    c0602b02:	0001                	nop
    c0602b04:	fa843583          	ld	a1,-88(s0)
    c0602b08:	00002517          	auipc	a0,0x2
    c0602b0c:	3a850513          	addi	a0,a0,936 # c0604eb0 <_init_data_end+0xeb0>
    c0602b10:	9f2ff0ef          	jal	ra,c0601d02 <printd>
    c0602b14:	fe843583          	ld	a1,-24(s0)
    c0602b18:	00002517          	auipc	a0,0x2
    c0602b1c:	3c050513          	addi	a0,a0,960 # c0604ed8 <_init_data_end+0xed8>
    c0602b20:	9e2ff0ef          	jal	ra,c0601d02 <printd>
    c0602b24:	fb043783          	ld	a5,-80(s0)
    c0602b28:	83a9                	srli	a5,a5,0xa
    c0602b2a:	577d                	li	a4,-1
    c0602b2c:	8351                	srli	a4,a4,0x14
    c0602b2e:	8ff9                	and	a5,a5,a4
    c0602b30:	85be                	mv	a1,a5
    c0602b32:	00002517          	auipc	a0,0x2
    c0602b36:	3be50513          	addi	a0,a0,958 # c0604ef0 <_init_data_end+0xef0>
    c0602b3a:	9c8ff0ef          	jal	ra,c0601d02 <printd>
    c0602b3e:	fb043783          	ld	a5,-80(s0)
    c0602b42:	8b85                	andi	a5,a5,1
    c0602b44:	0ff7f793          	andi	a5,a5,255
    c0602b48:	2781                	sext.w	a5,a5
    c0602b4a:	85be                	mv	a1,a5
    c0602b4c:	00002517          	auipc	a0,0x2
    c0602b50:	3b450513          	addi	a0,a0,948 # c0604f00 <_init_data_end+0xf00>
    c0602b54:	9aeff0ef          	jal	ra,c0601d02 <printd>
    c0602b58:	fb043783          	ld	a5,-80(s0)
    c0602b5c:	8385                	srli	a5,a5,0x1
    c0602b5e:	8b85                	andi	a5,a5,1
    c0602b60:	0ff7f793          	andi	a5,a5,255
    c0602b64:	2781                	sext.w	a5,a5
    c0602b66:	85be                	mv	a1,a5
    c0602b68:	00002517          	auipc	a0,0x2
    c0602b6c:	3a850513          	addi	a0,a0,936 # c0604f10 <_init_data_end+0xf10>
    c0602b70:	992ff0ef          	jal	ra,c0601d02 <printd>
    c0602b74:	fb043783          	ld	a5,-80(s0)
    c0602b78:	8389                	srli	a5,a5,0x2
    c0602b7a:	8b85                	andi	a5,a5,1
    c0602b7c:	0ff7f793          	andi	a5,a5,255
    c0602b80:	2781                	sext.w	a5,a5
    c0602b82:	85be                	mv	a1,a5
    c0602b84:	00002517          	auipc	a0,0x2
    c0602b88:	39c50513          	addi	a0,a0,924 # c0604f20 <_init_data_end+0xf20>
    c0602b8c:	976ff0ef          	jal	ra,c0601d02 <printd>
    c0602b90:	fb043783          	ld	a5,-80(s0)
    c0602b94:	838d                	srli	a5,a5,0x3
    c0602b96:	8b85                	andi	a5,a5,1
    c0602b98:	0ff7f793          	andi	a5,a5,255
    c0602b9c:	2781                	sext.w	a5,a5
    c0602b9e:	85be                	mv	a1,a5
    c0602ba0:	00002517          	auipc	a0,0x2
    c0602ba4:	39050513          	addi	a0,a0,912 # c0604f30 <_init_data_end+0xf30>
    c0602ba8:	95aff0ef          	jal	ra,c0601d02 <printd>
    c0602bac:	fb043783          	ld	a5,-80(s0)
    c0602bb0:	8391                	srli	a5,a5,0x4
    c0602bb2:	8b85                	andi	a5,a5,1
    c0602bb4:	0ff7f793          	andi	a5,a5,255
    c0602bb8:	2781                	sext.w	a5,a5
    c0602bba:	85be                	mv	a1,a5
    c0602bbc:	00002517          	auipc	a0,0x2
    c0602bc0:	38450513          	addi	a0,a0,900 # c0604f40 <_init_data_end+0xf40>
    c0602bc4:	93eff0ef          	jal	ra,c0601d02 <printd>
    c0602bc8:	fb043783          	ld	a5,-80(s0)
    c0602bcc:	8395                	srli	a5,a5,0x5
    c0602bce:	8b85                	andi	a5,a5,1
    c0602bd0:	0ff7f793          	andi	a5,a5,255
    c0602bd4:	2781                	sext.w	a5,a5
    c0602bd6:	85be                	mv	a1,a5
    c0602bd8:	00002517          	auipc	a0,0x2
    c0602bdc:	37850513          	addi	a0,a0,888 # c0604f50 <_init_data_end+0xf50>
    c0602be0:	922ff0ef          	jal	ra,c0601d02 <printd>
    c0602be4:	fb043783          	ld	a5,-80(s0)
    c0602be8:	8399                	srli	a5,a5,0x6
    c0602bea:	8b85                	andi	a5,a5,1
    c0602bec:	0ff7f793          	andi	a5,a5,255
    c0602bf0:	2781                	sext.w	a5,a5
    c0602bf2:	85be                	mv	a1,a5
    c0602bf4:	00002517          	auipc	a0,0x2
    c0602bf8:	36c50513          	addi	a0,a0,876 # c0604f60 <_init_data_end+0xf60>
    c0602bfc:	906ff0ef          	jal	ra,c0601d02 <printd>
    c0602c00:	fb043783          	ld	a5,-80(s0)
    c0602c04:	839d                	srli	a5,a5,0x7
    c0602c06:	8b85                	andi	a5,a5,1
    c0602c08:	0ff7f793          	andi	a5,a5,255
    c0602c0c:	2781                	sext.w	a5,a5
    c0602c0e:	85be                	mv	a1,a5
    c0602c10:	00002517          	auipc	a0,0x2
    c0602c14:	36050513          	addi	a0,a0,864 # c0604f70 <_init_data_end+0xf70>
    c0602c18:	8eaff0ef          	jal	ra,c0601d02 <printd>
    c0602c1c:	00002517          	auipc	a0,0x2
    c0602c20:	36450513          	addi	a0,a0,868 # c0604f80 <_init_data_end+0xf80>
    c0602c24:	8deff0ef          	jal	ra,c0601d02 <printd>
    c0602c28:	60e6                	ld	ra,88(sp)
    c0602c2a:	6446                	ld	s0,80(sp)
    c0602c2c:	6125                	addi	sp,sp,96
    c0602c2e:	8082                	ret

00000000c0602c30 <get_pa>:
    c0602c30:	711d                	addi	sp,sp,-96
    c0602c32:	ec86                	sd	ra,88(sp)
    c0602c34:	e8a2                	sd	s0,80(sp)
    c0602c36:	1080                	addi	s0,sp,96
    c0602c38:	faa43423          	sd	a0,-88(s0)
    c0602c3c:	fa843783          	ld	a5,-88(s0)
    c0602c40:	83f9                	srli	a5,a5,0x1e
    c0602c42:	1ff7f793          	andi	a5,a5,511
    c0602c46:	fcf43023          	sd	a5,-64(s0)
    c0602c4a:	fa843783          	ld	a5,-88(s0)
    c0602c4e:	83d5                	srli	a5,a5,0x15
    c0602c50:	1ff7f793          	andi	a5,a5,511
    c0602c54:	fcf43423          	sd	a5,-56(s0)
    c0602c58:	fa843783          	ld	a5,-88(s0)
    c0602c5c:	83b1                	srli	a5,a5,0xc
    c0602c5e:	1ff7f793          	andi	a5,a5,511
    c0602c62:	fcf43823          	sd	a5,-48(s0)
    c0602c66:	da5ff0ef          	jal	ra,c0602a0a <get_page_table_root>
    c0602c6a:	87aa                	mv	a5,a0
    c0602c6c:	fef43423          	sd	a5,-24(s0)
    c0602c70:	fe042223          	sw	zero,-28(s0)
    c0602c74:	fe442783          	lw	a5,-28(s0)
    c0602c78:	078e                	slli	a5,a5,0x3
    c0602c7a:	ff040713          	addi	a4,s0,-16
    c0602c7e:	97ba                	add	a5,a5,a4
    c0602c80:	fd07b783          	ld	a5,-48(a5)
    c0602c84:	078e                	slli	a5,a5,0x3
    c0602c86:	fe843703          	ld	a4,-24(s0)
    c0602c8a:	97ba                	add	a5,a5,a4
    c0602c8c:	639c                	ld	a5,0(a5)
    c0602c8e:	faf43823          	sd	a5,-80(s0)
    c0602c92:	fb043783          	ld	a5,-80(s0)
    c0602c96:	8b85                	andi	a5,a5,1
    c0602c98:	eb99                	bnez	a5,c0602cae <get_pa+0x7e>
    c0602c9a:	fa843583          	ld	a1,-88(s0)
    c0602c9e:	00002517          	auipc	a0,0x2
    c0602ca2:	1ea50513          	addi	a0,a0,490 # c0604e88 <_init_data_end+0xe88>
    c0602ca6:	85cff0ef          	jal	ra,c0601d02 <printd>
    c0602caa:	4781                	li	a5,0
    c0602cac:	a8d1                	j	c0602d80 <get_pa+0x150>
    c0602cae:	fb043783          	ld	a5,-80(s0)
    c0602cb2:	8385                	srli	a5,a5,0x1
    c0602cb4:	8b85                	andi	a5,a5,1
    c0602cb6:	0ff7f713          	andi	a4,a5,255
    c0602cba:	fb043783          	ld	a5,-80(s0)
    c0602cbe:	8389                	srli	a5,a5,0x2
    c0602cc0:	8b85                	andi	a5,a5,1
    c0602cc2:	0ff7f793          	andi	a5,a5,255
    c0602cc6:	8fd9                	or	a5,a5,a4
    c0602cc8:	0ff7f713          	andi	a4,a5,255
    c0602ccc:	fb043783          	ld	a5,-80(s0)
    c0602cd0:	838d                	srli	a5,a5,0x3
    c0602cd2:	8b85                	andi	a5,a5,1
    c0602cd4:	0ff7f793          	andi	a5,a5,255
    c0602cd8:	8fd9                	or	a5,a5,a4
    c0602cda:	0ff7f793          	andi	a5,a5,255
    c0602cde:	eb9d                	bnez	a5,c0602d14 <get_pa+0xe4>
    c0602ce0:	fb043783          	ld	a5,-80(s0)
    c0602ce4:	83a9                	srli	a5,a5,0xa
    c0602ce6:	577d                	li	a4,-1
    c0602ce8:	8351                	srli	a4,a4,0x14
    c0602cea:	8ff9                	and	a5,a5,a4
    c0602cec:	07b2                	slli	a5,a5,0xc
    c0602cee:	577d                	li	a4,-1
    c0602cf0:	8351                	srli	a4,a4,0x14
    c0602cf2:	8ff9                	and	a5,a5,a4
    c0602cf4:	fcf43c23          	sd	a5,-40(s0)
    c0602cf8:	b1eff0ef          	jal	ra,c0602016 <va_pa_offset>
    c0602cfc:	872a                	mv	a4,a0
    c0602cfe:	fd843783          	ld	a5,-40(s0)
    c0602d02:	97ba                	add	a5,a5,a4
    c0602d04:	fef43423          	sd	a5,-24(s0)
    c0602d08:	fe442783          	lw	a5,-28(s0)
    c0602d0c:	2785                	addiw	a5,a5,1
    c0602d0e:	fef42223          	sw	a5,-28(s0)
    c0602d12:	b78d                	j	c0602c74 <get_pa+0x44>
    c0602d14:	0001                	nop
    c0602d16:	fe442783          	lw	a5,-28(s0)
    c0602d1a:	0007871b          	sext.w	a4,a5
    c0602d1e:	4789                	li	a5,2
    c0602d20:	02f71463          	bne	a4,a5,c0602d48 <get_pa+0x118>
    c0602d24:	fb043783          	ld	a5,-80(s0)
    c0602d28:	83a9                	srli	a5,a5,0xa
    c0602d2a:	577d                	li	a4,-1
    c0602d2c:	8351                	srli	a4,a4,0x14
    c0602d2e:	8ff9                	and	a5,a5,a4
    c0602d30:	07b2                	slli	a5,a5,0xc
    c0602d32:	577d                	li	a4,-1
    c0602d34:	8351                	srli	a4,a4,0x14
    c0602d36:	8ff9                	and	a5,a5,a4
    c0602d38:	86be                	mv	a3,a5
    c0602d3a:	fa843703          	ld	a4,-88(s0)
    c0602d3e:	6785                	lui	a5,0x1
    c0602d40:	17fd                	addi	a5,a5,-1
    c0602d42:	8ff9                	and	a5,a5,a4
    c0602d44:	8fd5                	or	a5,a5,a3
    c0602d46:	a82d                	j	c0602d80 <get_pa+0x150>
    c0602d48:	fe442783          	lw	a5,-28(s0)
    c0602d4c:	0007871b          	sext.w	a4,a5
    c0602d50:	4785                	li	a5,1
    c0602d52:	02f71663          	bne	a4,a5,c0602d7e <get_pa+0x14e>
    c0602d56:	fb043783          	ld	a5,-80(s0)
    c0602d5a:	83a9                	srli	a5,a5,0xa
    c0602d5c:	577d                	li	a4,-1
    c0602d5e:	8351                	srli	a4,a4,0x14
    c0602d60:	8ff9                	and	a5,a5,a4
    c0602d62:	83a5                	srli	a5,a5,0x9
    c0602d64:	07d6                	slli	a5,a5,0x15
    c0602d66:	577d                	li	a4,-1
    c0602d68:	8351                	srli	a4,a4,0x14
    c0602d6a:	8ff9                	and	a5,a5,a4
    c0602d6c:	86be                	mv	a3,a5
    c0602d6e:	fa843703          	ld	a4,-88(s0)
    c0602d72:	002007b7          	lui	a5,0x200
    c0602d76:	17fd                	addi	a5,a5,-1
    c0602d78:	8ff9                	and	a5,a5,a4
    c0602d7a:	8fd5                	or	a5,a5,a3
    c0602d7c:	a011                	j	c0602d80 <get_pa+0x150>
    c0602d7e:	4781                	li	a5,0
    c0602d80:	853e                	mv	a0,a5
    c0602d82:	60e6                	ld	ra,88(sp)
    c0602d84:	6446                	ld	s0,80(sp)
    c0602d86:	6125                	addi	sp,sp,96
    c0602d88:	8082                	ret

00000000c0602d8a <test_va>:
    c0602d8a:	7139                	addi	sp,sp,-64
    c0602d8c:	fc06                	sd	ra,56(sp)
    c0602d8e:	f822                	sd	s0,48(sp)
    c0602d90:	0080                	addi	s0,sp,64
    c0602d92:	fca43423          	sd	a0,-56(s0)
    c0602d96:	fc843783          	ld	a5,-56(s0)
    c0602d9a:	fef43423          	sd	a5,-24(s0)
    c0602d9e:	fc843503          	ld	a0,-56(s0)
    c0602da2:	e8fff0ef          	jal	ra,c0602c30 <get_pa>
    c0602da6:	fea43023          	sd	a0,-32(s0)
    c0602daa:	fe043603          	ld	a2,-32(s0)
    c0602dae:	fc843583          	ld	a1,-56(s0)
    c0602db2:	00002517          	auipc	a0,0x2
    c0602db6:	1fe50513          	addi	a0,a0,510 # c0604fb0 <_init_data_end+0xfb0>
    c0602dba:	f49fe0ef          	jal	ra,c0601d02 <printd>
    c0602dbe:	fc843503          	ld	a0,-56(s0)
    c0602dc2:	c5fff0ef          	jal	ra,c0602a20 <print_pte>
    c0602dc6:	180027f3          	csrr	a5,satp
    c0602dca:	fcf43c23          	sd	a5,-40(s0)
    c0602dce:	fd843783          	ld	a5,-40(s0)
    c0602dd2:	cb99                	beqz	a5,c0602de8 <test_va+0x5e>
    c0602dd4:	fe843783          	ld	a5,-24(s0)
    c0602dd8:	639c                	ld	a5,0(a5)
    c0602dda:	85be                	mv	a1,a5
    c0602ddc:	00002517          	auipc	a0,0x2
    c0602de0:	1fc50513          	addi	a0,a0,508 # c0604fd8 <_init_data_end+0xfd8>
    c0602de4:	f1ffe0ef          	jal	ra,c0601d02 <printd>
    c0602de8:	0001                	nop
    c0602dea:	70e2                	ld	ra,56(sp)
    c0602dec:	7442                	ld	s0,48(sp)
    c0602dee:	6121                	addi	sp,sp,64
    c0602df0:	8082                	ret

00000000c0602df2 <map_page>:
    c0602df2:	715d                	addi	sp,sp,-80
    c0602df4:	e486                	sd	ra,72(sp)
    c0602df6:	e0a2                	sd	s0,64(sp)
    c0602df8:	0880                	addi	s0,sp,80
    c0602dfa:	fca43c23          	sd	a0,-40(s0)
    c0602dfe:	fcb43823          	sd	a1,-48(s0)
    c0602e02:	fcc43423          	sd	a2,-56(s0)
    c0602e06:	fcd43023          	sd	a3,-64(s0)
    c0602e0a:	fae43c23          	sd	a4,-72(s0)
    c0602e0e:	fe0407a3          	sb	zero,-17(s0)
    c0602e12:	fc043683          	ld	a3,-64(s0)
    c0602e16:	fc843603          	ld	a2,-56(s0)
    c0602e1a:	fd043583          	ld	a1,-48(s0)
    c0602e1e:	00002517          	auipc	a0,0x2
    c0602e22:	1da50513          	addi	a0,a0,474 # c0604ff8 <_init_data_end+0xff8>
    c0602e26:	eddfe0ef          	jal	ra,c0601d02 <printd>
    c0602e2a:	fd043703          	ld	a4,-48(s0)
    c0602e2e:	001007b7          	lui	a5,0x100
    c0602e32:	00e7e563          	bltu	a5,a4,c0602e3c <map_page+0x4a>
    c0602e36:	4785                	li	a5,1
    c0602e38:	fef407a3          	sb	a5,-17(s0)
    c0602e3c:	fef44783          	lbu	a5,-17(s0)
    c0602e40:	0ff7f793          	andi	a5,a5,255
    c0602e44:	cba1                	beqz	a5,c0602e94 <map_page+0xa2>
    c0602e46:	fc043783          	ld	a5,-64(s0)
    c0602e4a:	2781                	sext.w	a5,a5
    c0602e4c:	863e                	mv	a2,a5
    c0602e4e:	fd043583          	ld	a1,-48(s0)
    c0602e52:	fc843503          	ld	a0,-56(s0)
    c0602e56:	238000ef          	jal	ra,c060308e <insert_inverse_map>
    c0602e5a:	a82d                	j	c0602e94 <map_page+0xa2>
    c0602e5c:	fb843783          	ld	a5,-72(s0)
    c0602e60:	2781                	sext.w	a5,a5
    c0602e62:	86be                	mv	a3,a5
    c0602e64:	460d                	li	a2,3
    c0602e66:	fc843583          	ld	a1,-56(s0)
    c0602e6a:	fd043503          	ld	a0,-48(s0)
    c0602e6e:	b4fff0ef          	jal	ra,c06029bc <page_directory_insert>
    c0602e72:	fd043703          	ld	a4,-48(s0)
    c0602e76:	6785                	lui	a5,0x1
    c0602e78:	97ba                	add	a5,a5,a4
    c0602e7a:	fcf43823          	sd	a5,-48(s0)
    c0602e7e:	fc843703          	ld	a4,-56(s0)
    c0602e82:	6785                	lui	a5,0x1
    c0602e84:	97ba                	add	a5,a5,a4
    c0602e86:	fcf43423          	sd	a5,-56(s0)
    c0602e8a:	fc043783          	ld	a5,-64(s0)
    c0602e8e:	17fd                	addi	a5,a5,-1
    c0602e90:	fcf43023          	sd	a5,-64(s0)
    c0602e94:	fc043783          	ld	a5,-64(s0)
    c0602e98:	f3f1                	bnez	a5,c0602e5c <map_page+0x6a>
    c0602e9a:	0001                	nop
    c0602e9c:	0001                	nop
    c0602e9e:	60a6                	ld	ra,72(sp)
    c0602ea0:	6406                	ld	s0,64(sp)
    c0602ea2:	6161                	addi	sp,sp,80
    c0602ea4:	8082                	ret

00000000c0602ea6 <ioremap>:
    c0602ea6:	7139                	addi	sp,sp,-64
    c0602ea8:	fc06                	sd	ra,56(sp)
    c0602eaa:	f822                	sd	s0,48(sp)
    c0602eac:	0080                	addi	s0,sp,64
    c0602eae:	fca43c23          	sd	a0,-40(s0)
    c0602eb2:	fcb43823          	sd	a1,-48(s0)
    c0602eb6:	fcc43423          	sd	a2,-56(s0)
    c0602eba:	b51ff0ef          	jal	ra,c0602a0a <get_page_table_root>
    c0602ebe:	87aa                	mv	a5,a0
    c0602ec0:	85be                	mv	a1,a5
    c0602ec2:	00002517          	auipc	a0,0x2
    c0602ec6:	16650513          	addi	a0,a0,358 # c0605028 <_init_data_end+0x1028>
    c0602eca:	e39fe0ef          	jal	ra,c0601d02 <printd>
    c0602ece:	fc843703          	ld	a4,-56(s0)
    c0602ed2:	6785                	lui	a5,0x1
    c0602ed4:	17fd                	addi	a5,a5,-1
    c0602ed6:	97ba                	add	a5,a5,a4
    c0602ed8:	83b1                	srli	a5,a5,0xc
    c0602eda:	fef43423          	sd	a5,-24(s0)
    c0602ede:	0006a797          	auipc	a5,0x6a
    c0602ee2:	55278793          	addi	a5,a5,1362 # c066d430 <drv_addr_alloc.0>
    c0602ee6:	6398                	ld	a4,0(a5)
    c0602ee8:	47b5                	li	a5,13
    c0602eea:	07f2                	slli	a5,a5,0x1c
    c0602eec:	97ba                	add	a5,a5,a4
    c0602eee:	08f00713          	li	a4,143
    c0602ef2:	fe843683          	ld	a3,-24(s0)
    c0602ef6:	fd043603          	ld	a2,-48(s0)
    c0602efa:	85be                	mv	a1,a5
    c0602efc:	fd843503          	ld	a0,-40(s0)
    c0602f00:	ef3ff0ef          	jal	ra,c0602df2 <map_page>
    c0602f04:	47b5                	li	a5,13
    c0602f06:	07f2                	slli	a5,a5,0x1c
    c0602f08:	fef43023          	sd	a5,-32(s0)
    c0602f0c:	fe843783          	ld	a5,-24(s0)
    c0602f10:	00c79713          	slli	a4,a5,0xc
    c0602f14:	0006a797          	auipc	a5,0x6a
    c0602f18:	51c78793          	addi	a5,a5,1308 # c066d430 <drv_addr_alloc.0>
    c0602f1c:	639c                	ld	a5,0(a5)
    c0602f1e:	973e                	add	a4,a4,a5
    c0602f20:	0006a797          	auipc	a5,0x6a
    c0602f24:	51078793          	addi	a5,a5,1296 # c066d430 <drv_addr_alloc.0>
    c0602f28:	e398                	sd	a4,0(a5)
    c0602f2a:	fe043783          	ld	a5,-32(s0)
    c0602f2e:	853e                	mv	a0,a5
    c0602f30:	70e2                	ld	ra,56(sp)
    c0602f32:	7442                	ld	s0,48(sp)
    c0602f34:	6121                	addi	sp,sp,64
    c0602f36:	8082                	ret

00000000c0602f38 <alloc_page>:
    c0602f38:	711d                	addi	sp,sp,-96
    c0602f3a:	ec86                	sd	ra,88(sp)
    c0602f3c:	e8a2                	sd	s0,80(sp)
    c0602f3e:	1080                	addi	s0,sp,96
    c0602f40:	fca43423          	sd	a0,-56(s0)
    c0602f44:	fcb43023          	sd	a1,-64(s0)
    c0602f48:	fac43c23          	sd	a2,-72(s0)
    c0602f4c:	fad43823          	sd	a3,-80(s0)
    c0602f50:	87ba                	mv	a5,a4
    c0602f52:	faf407a3          	sb	a5,-81(s0)
    c0602f56:	fe043023          	sd	zero,-32(s0)
    c0602f5a:	fc043c23          	sd	zero,-40(s0)
    c0602f5e:	a059                	j	c0602fe4 <alloc_page+0xac>
    c0602f60:	faf44783          	lbu	a5,-81(s0)
    c0602f64:	853e                	mv	a0,a5
    c0602f66:	c8eff0ef          	jal	ra,c06023f4 <spa_get_pa_zero>
    c0602f6a:	fea43423          	sd	a0,-24(s0)
    c0602f6e:	fe043703          	ld	a4,-32(s0)
    c0602f72:	6785                	lui	a5,0x1
    c0602f74:	97ba                	add	a5,a5,a4
    c0602f76:	fe843703          	ld	a4,-24(s0)
    c0602f7a:	02f71063          	bne	a4,a5,c0602f9a <alloc_page+0x62>
    c0602f7e:	fe843703          	ld	a4,-24(s0)
    c0602f82:	fe043783          	ld	a5,-32(s0)
    c0602f86:	8f3d                	xor	a4,a4,a5
    c0602f88:	ff8007b7          	lui	a5,0xff800
    c0602f8c:	8ff9                	and	a5,a5,a4
    c0602f8e:	e791                	bnez	a5,c0602f9a <alloc_page+0x62>
    c0602f90:	fd843503          	ld	a0,-40(s0)
    c0602f94:	286000ef          	jal	ra,c060321a <inverse_map_add_count>
    c0602f98:	a821                	j	c0602fb0 <alloc_page+0x78>
    c0602f9a:	4605                	li	a2,1
    c0602f9c:	fc043583          	ld	a1,-64(s0)
    c0602fa0:	fe843503          	ld	a0,-24(s0)
    c0602fa4:	0ea000ef          	jal	ra,c060308e <insert_inverse_map>
    c0602fa8:	fe843783          	ld	a5,-24(s0)
    c0602fac:	fcf43c23          	sd	a5,-40(s0)
    c0602fb0:	fb043783          	ld	a5,-80(s0)
    c0602fb4:	2781                	sext.w	a5,a5
    c0602fb6:	86be                	mv	a3,a5
    c0602fb8:	460d                	li	a2,3
    c0602fba:	fe843583          	ld	a1,-24(s0)
    c0602fbe:	fc043503          	ld	a0,-64(s0)
    c0602fc2:	9fbff0ef          	jal	ra,c06029bc <page_directory_insert>
    c0602fc6:	fe843783          	ld	a5,-24(s0)
    c0602fca:	fef43023          	sd	a5,-32(s0)
    c0602fce:	fc043703          	ld	a4,-64(s0)
    c0602fd2:	6785                	lui	a5,0x1
    c0602fd4:	97ba                	add	a5,a5,a4
    c0602fd6:	fcf43023          	sd	a5,-64(s0)
    c0602fda:	fb843783          	ld	a5,-72(s0)
    c0602fde:	17fd                	addi	a5,a5,-1
    c0602fe0:	faf43c23          	sd	a5,-72(s0)
    c0602fe4:	fb843783          	ld	a5,-72(s0)
    c0602fe8:	ffa5                	bnez	a5,c0602f60 <alloc_page+0x28>
    c0602fea:	32e000ef          	jal	ra,c0603318 <dump_inverse_map>
    c0602fee:	fe843783          	ld	a5,-24(s0)
    c0602ff2:	853e                	mv	a0,a5
    c0602ff4:	60e6                	ld	ra,88(sp)
    c0602ff6:	6446                	ld	s0,80(sp)
    c0602ff8:	6125                	addi	sp,sp,96
    c0602ffa:	8082                	ret

00000000c0602ffc <all_zero>:
    c0602ffc:	1101                	addi	sp,sp,-32
    c0602ffe:	ec06                	sd	ra,24(sp)
    c0603000:	e822                	sd	s0,16(sp)
    c0603002:	1000                	addi	s0,sp,32
    c0603004:	fe042623          	sw	zero,-20(s0)
    c0603008:	a0ad                	j	c0603072 <all_zero+0x76>
    c060300a:	fe042423          	sw	zero,-24(s0)
    c060300e:	a0a9                	j	c0603058 <all_zero+0x5c>
    c0603010:	fe842703          	lw	a4,-24(s0)
    c0603014:	fec42783          	lw	a5,-20(s0)
    c0603018:	07a6                	slli	a5,a5,0x9
    c060301a:	97ba                	add	a5,a5,a4
    c060301c:	00379713          	slli	a4,a5,0x3
    c0603020:	00003797          	auipc	a5,0x3
    c0603024:	fe078793          	addi	a5,a5,-32 # c0606000 <page_directory_pool>
    c0603028:	97ba                	add	a5,a5,a4
    c060302a:	fef43023          	sd	a5,-32(s0)
    c060302e:	fe043783          	ld	a5,-32(s0)
    c0603032:	639c                	ld	a5,0(a5)
    c0603034:	cf89                	beqz	a5,c060304e <all_zero+0x52>
    c0603036:	fe842703          	lw	a4,-24(s0)
    c060303a:	fec42783          	lw	a5,-20(s0)
    c060303e:	863a                	mv	a2,a4
    c0603040:	85be                	mv	a1,a5
    c0603042:	00002517          	auipc	a0,0x2
    c0603046:	00650513          	addi	a0,a0,6 # c0605048 <_init_data_end+0x1048>
    c060304a:	cb9fe0ef          	jal	ra,c0601d02 <printd>
    c060304e:	fe842783          	lw	a5,-24(s0)
    c0603052:	2785                	addiw	a5,a5,1
    c0603054:	fef42423          	sw	a5,-24(s0)
    c0603058:	fe842783          	lw	a5,-24(s0)
    c060305c:	0007871b          	sext.w	a4,a5
    c0603060:	1ff00793          	li	a5,511
    c0603064:	fae7d6e3          	bge	a5,a4,c0603010 <all_zero+0x14>
    c0603068:	fec42783          	lw	a5,-20(s0)
    c060306c:	2785                	addiw	a5,a5,1
    c060306e:	fef42623          	sw	a5,-20(s0)
    c0603072:	fec42783          	lw	a5,-20(s0)
    c0603076:	0007871b          	sext.w	a4,a5
    c060307a:	03f00793          	li	a5,63
    c060307e:	f8e7d6e3          	bge	a5,a4,c060300a <all_zero+0xe>
    c0603082:	0001                	nop
    c0603084:	0001                	nop
    c0603086:	60e2                	ld	ra,24(sp)
    c0603088:	6442                	ld	s0,16(sp)
    c060308a:	6105                	addi	sp,sp,32
    c060308c:	8082                	ret

00000000c060308e <insert_inverse_map>:
    c060308e:	7139                	addi	sp,sp,-64
    c0603090:	fc06                	sd	ra,56(sp)
    c0603092:	f822                	sd	s0,48(sp)
    c0603094:	0080                	addi	s0,sp,64
    c0603096:	fca43c23          	sd	a0,-40(s0)
    c060309a:	fcb43823          	sd	a1,-48(s0)
    c060309e:	87b2                	mv	a5,a2
    c06030a0:	fcf42623          	sw	a5,-52(s0)
    c06030a4:	fe042623          	sw	zero,-20(s0)
    c06030a8:	fcc42783          	lw	a5,-52(s0)
    c06030ac:	86be                	mv	a3,a5
    c06030ae:	fd043603          	ld	a2,-48(s0)
    c06030b2:	fd843583          	ld	a1,-40(s0)
    c06030b6:	00002517          	auipc	a0,0x2
    c06030ba:	faa50513          	addi	a0,a0,-86 # c0605060 <_init_data_end+0x1060>
    c06030be:	c45fe0ef          	jal	ra,c0601d02 <printd>
    c06030c2:	a065                	j	c060316a <insert_inverse_map+0xdc>
    c06030c4:	00064697          	auipc	a3,0x64
    c06030c8:	36c68693          	addi	a3,a3,876 # c0667430 <inv_map>
    c06030cc:	fec42703          	lw	a4,-20(s0)
    c06030d0:	87ba                	mv	a5,a4
    c06030d2:	0786                	slli	a5,a5,0x1
    c06030d4:	97ba                	add	a5,a5,a4
    c06030d6:	078e                	slli	a5,a5,0x3
    c06030d8:	97b6                	add	a5,a5,a3
    c06030da:	639c                	ld	a5,0(a5)
    c06030dc:	fd843703          	ld	a4,-40(s0)
    c06030e0:	08f71063          	bne	a4,a5,c0603160 <insert_inverse_map+0xd2>
    c06030e4:	fcc42783          	lw	a5,-52(s0)
    c06030e8:	863e                	mv	a2,a5
    c06030ea:	fd043583          	ld	a1,-48(s0)
    c06030ee:	00002517          	auipc	a0,0x2
    c06030f2:	faa50513          	addi	a0,a0,-86 # c0605098 <_init_data_end+0x1098>
    c06030f6:	c0dfe0ef          	jal	ra,c0601d02 <printd>
    c06030fa:	00064697          	auipc	a3,0x64
    c06030fe:	33668693          	addi	a3,a3,822 # c0667430 <inv_map>
    c0603102:	fec42703          	lw	a4,-20(s0)
    c0603106:	87ba                	mv	a5,a4
    c0603108:	0786                	slli	a5,a5,0x1
    c060310a:	97ba                	add	a5,a5,a4
    c060310c:	078e                	slli	a5,a5,0x3
    c060310e:	97b6                	add	a5,a5,a3
    c0603110:	4b98                	lw	a4,16(a5)
    c0603112:	fcc42783          	lw	a5,-52(s0)
    c0603116:	2781                	sext.w	a5,a5
    c0603118:	02e78663          	beq	a5,a4,c0603144 <insert_inverse_map+0xb6>
    c060311c:	00064697          	auipc	a3,0x64
    c0603120:	31468693          	addi	a3,a3,788 # c0667430 <inv_map>
    c0603124:	fec42703          	lw	a4,-20(s0)
    c0603128:	87ba                	mv	a5,a4
    c060312a:	0786                	slli	a5,a5,0x1
    c060312c:	97ba                	add	a5,a5,a4
    c060312e:	078e                	slli	a5,a5,0x3
    c0603130:	97b6                	add	a5,a5,a3
    c0603132:	4b9c                	lw	a5,16(a5)
    c0603134:	85be                	mv	a1,a5
    c0603136:	00002517          	auipc	a0,0x2
    c060313a:	fb250513          	addi	a0,a0,-78 # c06050e8 <_init_data_end+0x10e8>
    c060313e:	bc5fe0ef          	jal	ra,c0601d02 <printd>
    c0603142:	a001                	j	c0603142 <insert_inverse_map+0xb4>
    c0603144:	00064697          	auipc	a3,0x64
    c0603148:	2ec68693          	addi	a3,a3,748 # c0667430 <inv_map>
    c060314c:	fec42703          	lw	a4,-20(s0)
    c0603150:	87ba                	mv	a5,a4
    c0603152:	0786                	slli	a5,a5,0x1
    c0603154:	97ba                	add	a5,a5,a4
    c0603156:	078e                	slli	a5,a5,0x3
    c0603158:	97b6                	add	a5,a5,a3
    c060315a:	fd043703          	ld	a4,-48(s0)
    c060315e:	e798                	sd	a4,8(a5)
    c0603160:	fec42783          	lw	a5,-20(s0)
    c0603164:	2785                	addiw	a5,a5,1
    c0603166:	fef42623          	sw	a5,-20(s0)
    c060316a:	00064697          	auipc	a3,0x64
    c060316e:	2c668693          	addi	a3,a3,710 # c0667430 <inv_map>
    c0603172:	fec42703          	lw	a4,-20(s0)
    c0603176:	87ba                	mv	a5,a4
    c0603178:	0786                	slli	a5,a5,0x1
    c060317a:	97ba                	add	a5,a5,a4
    c060317c:	078e                	slli	a5,a5,0x3
    c060317e:	97b6                	add	a5,a5,a3
    c0603180:	639c                	ld	a5,0(a5)
    c0603182:	cb89                	beqz	a5,c0603194 <insert_inverse_map+0x106>
    c0603184:	fec42783          	lw	a5,-20(s0)
    c0603188:	0007871b          	sext.w	a4,a5
    c060318c:	3ff00793          	li	a5,1023
    c0603190:	f2e7dae3          	bge	a5,a4,c06030c4 <insert_inverse_map+0x36>
    c0603194:	fec42783          	lw	a5,-20(s0)
    c0603198:	0007871b          	sext.w	a4,a5
    c060319c:	40000793          	li	a5,1024
    c06031a0:	00f71963          	bne	a4,a5,c06031b2 <insert_inverse_map+0x124>
    c06031a4:	00002517          	auipc	a0,0x2
    c06031a8:	f9450513          	addi	a0,a0,-108 # c0605138 <_init_data_end+0x1138>
    c06031ac:	b57fe0ef          	jal	ra,c0601d02 <printd>
    c06031b0:	a08d                	j	c0603212 <insert_inverse_map+0x184>
    c06031b2:	00064697          	auipc	a3,0x64
    c06031b6:	27e68693          	addi	a3,a3,638 # c0667430 <inv_map>
    c06031ba:	fec42703          	lw	a4,-20(s0)
    c06031be:	87ba                	mv	a5,a4
    c06031c0:	0786                	slli	a5,a5,0x1
    c06031c2:	97ba                	add	a5,a5,a4
    c06031c4:	078e                	slli	a5,a5,0x3
    c06031c6:	97b6                	add	a5,a5,a3
    c06031c8:	fd843703          	ld	a4,-40(s0)
    c06031cc:	e398                	sd	a4,0(a5)
    c06031ce:	00064697          	auipc	a3,0x64
    c06031d2:	26268693          	addi	a3,a3,610 # c0667430 <inv_map>
    c06031d6:	fec42703          	lw	a4,-20(s0)
    c06031da:	87ba                	mv	a5,a4
    c06031dc:	0786                	slli	a5,a5,0x1
    c06031de:	97ba                	add	a5,a5,a4
    c06031e0:	078e                	slli	a5,a5,0x3
    c06031e2:	97b6                	add	a5,a5,a3
    c06031e4:	fd043703          	ld	a4,-48(s0)
    c06031e8:	e798                	sd	a4,8(a5)
    c06031ea:	00064697          	auipc	a3,0x64
    c06031ee:	24668693          	addi	a3,a3,582 # c0667430 <inv_map>
    c06031f2:	fec42703          	lw	a4,-20(s0)
    c06031f6:	87ba                	mv	a5,a4
    c06031f8:	0786                	slli	a5,a5,0x1
    c06031fa:	97ba                	add	a5,a5,a4
    c06031fc:	078e                	slli	a5,a5,0x3
    c06031fe:	97b6                	add	a5,a5,a3
    c0603200:	fcc42703          	lw	a4,-52(s0)
    c0603204:	cb98                	sw	a4,16(a5)
    c0603206:	00002517          	auipc	a0,0x2
    c060320a:	f6250513          	addi	a0,a0,-158 # c0605168 <_init_data_end+0x1168>
    c060320e:	af5fe0ef          	jal	ra,c0601d02 <printd>
    c0603212:	70e2                	ld	ra,56(sp)
    c0603214:	7442                	ld	s0,48(sp)
    c0603216:	6121                	addi	sp,sp,64
    c0603218:	8082                	ret

00000000c060321a <inverse_map_add_count>:
    c060321a:	7179                	addi	sp,sp,-48
    c060321c:	f406                	sd	ra,40(sp)
    c060321e:	f022                	sd	s0,32(sp)
    c0603220:	1800                	addi	s0,sp,48
    c0603222:	fca43c23          	sd	a0,-40(s0)
    c0603226:	fd843783          	ld	a5,-40(s0)
    c060322a:	e799                	bnez	a5,c0603238 <inverse_map_add_count+0x1e>
    c060322c:	00002517          	auipc	a0,0x2
    c0603230:	f6450513          	addi	a0,a0,-156 # c0605190 <_init_data_end+0x1190>
    c0603234:	acffe0ef          	jal	ra,c0601d02 <printd>
    c0603238:	fe042623          	sw	zero,-20(s0)
    c060323c:	a855                	j	c06032f0 <inverse_map_add_count+0xd6>
    c060323e:	00064697          	auipc	a3,0x64
    c0603242:	1f268693          	addi	a3,a3,498 # c0667430 <inv_map>
    c0603246:	fec42703          	lw	a4,-20(s0)
    c060324a:	87ba                	mv	a5,a4
    c060324c:	0786                	slli	a5,a5,0x1
    c060324e:	97ba                	add	a5,a5,a4
    c0603250:	078e                	slli	a5,a5,0x3
    c0603252:	97b6                	add	a5,a5,a3
    c0603254:	639c                	ld	a5,0(a5)
    c0603256:	fd843703          	ld	a4,-40(s0)
    c060325a:	08f71663          	bne	a4,a5,c06032e6 <inverse_map_add_count+0xcc>
    c060325e:	00064697          	auipc	a3,0x64
    c0603262:	1d268693          	addi	a3,a3,466 # c0667430 <inv_map>
    c0603266:	fec42703          	lw	a4,-20(s0)
    c060326a:	87ba                	mv	a5,a4
    c060326c:	0786                	slli	a5,a5,0x1
    c060326e:	97ba                	add	a5,a5,a4
    c0603270:	078e                	slli	a5,a5,0x3
    c0603272:	97b6                	add	a5,a5,a3
    c0603274:	4b9c                	lw	a5,16(a5)
    c0603276:	2785                	addiw	a5,a5,1
    c0603278:	0007869b          	sext.w	a3,a5
    c060327c:	00064617          	auipc	a2,0x64
    c0603280:	1b460613          	addi	a2,a2,436 # c0667430 <inv_map>
    c0603284:	fec42703          	lw	a4,-20(s0)
    c0603288:	87ba                	mv	a5,a4
    c060328a:	0786                	slli	a5,a5,0x1
    c060328c:	97ba                	add	a5,a5,a4
    c060328e:	078e                	slli	a5,a5,0x3
    c0603290:	97b2                	add	a5,a5,a2
    c0603292:	cb94                	sw	a3,16(a5)
    c0603294:	00064697          	auipc	a3,0x64
    c0603298:	19c68693          	addi	a3,a3,412 # c0667430 <inv_map>
    c060329c:	fec42703          	lw	a4,-20(s0)
    c06032a0:	87ba                	mv	a5,a4
    c06032a2:	0786                	slli	a5,a5,0x1
    c06032a4:	97ba                	add	a5,a5,a4
    c06032a6:	078e                	slli	a5,a5,0x3
    c06032a8:	97b6                	add	a5,a5,a3
    c06032aa:	4b9c                	lw	a5,16(a5)
    c06032ac:	873e                	mv	a4,a5
    c06032ae:	06400793          	li	a5,100
    c06032b2:	02f777bb          	remuw	a5,a4,a5
    c06032b6:	2781                	sext.w	a5,a5
    c06032b8:	ebb9                	bnez	a5,c060330e <inverse_map_add_count+0xf4>
    c06032ba:	00064697          	auipc	a3,0x64
    c06032be:	17668693          	addi	a3,a3,374 # c0667430 <inv_map>
    c06032c2:	fec42703          	lw	a4,-20(s0)
    c06032c6:	87ba                	mv	a5,a4
    c06032c8:	0786                	slli	a5,a5,0x1
    c06032ca:	97ba                	add	a5,a5,a4
    c06032cc:	078e                	slli	a5,a5,0x3
    c06032ce:	97b6                	add	a5,a5,a3
    c06032d0:	4b9c                	lw	a5,16(a5)
    c06032d2:	863e                	mv	a2,a5
    c06032d4:	fd843583          	ld	a1,-40(s0)
    c06032d8:	00002517          	auipc	a0,0x2
    c06032dc:	ee850513          	addi	a0,a0,-280 # c06051c0 <_init_data_end+0x11c0>
    c06032e0:	a23fe0ef          	jal	ra,c0601d02 <printd>
    c06032e4:	a02d                	j	c060330e <inverse_map_add_count+0xf4>
    c06032e6:	fec42783          	lw	a5,-20(s0)
    c06032ea:	2785                	addiw	a5,a5,1
    c06032ec:	fef42623          	sw	a5,-20(s0)
    c06032f0:	fec42783          	lw	a5,-20(s0)
    c06032f4:	0007871b          	sext.w	a4,a5
    c06032f8:	3ff00793          	li	a5,1023
    c06032fc:	f4e7d1e3          	bge	a5,a4,c060323e <inverse_map_add_count+0x24>
    c0603300:	00002517          	auipc	a0,0x2
    c0603304:	f0050513          	addi	a0,a0,-256 # c0605200 <_init_data_end+0x1200>
    c0603308:	9fbfe0ef          	jal	ra,c0601d02 <printd>
    c060330c:	a011                	j	c0603310 <inverse_map_add_count+0xf6>
    c060330e:	0001                	nop
    c0603310:	70a2                	ld	ra,40(sp)
    c0603312:	7402                	ld	s0,32(sp)
    c0603314:	6145                	addi	sp,sp,48
    c0603316:	8082                	ret

00000000c0603318 <dump_inverse_map>:
    c0603318:	1101                	addi	sp,sp,-32
    c060331a:	ec06                	sd	ra,24(sp)
    c060331c:	e822                	sd	s0,16(sp)
    c060331e:	1000                	addi	s0,sp,32
    c0603320:	00002517          	auipc	a0,0x2
    c0603324:	f1050513          	addi	a0,a0,-240 # c0605230 <_init_data_end+0x1230>
    c0603328:	9dbfe0ef          	jal	ra,c0601d02 <printd>
    c060332c:	fe042623          	sw	zero,-20(s0)
    c0603330:	a0a5                	j	c0603398 <dump_inverse_map+0x80>
    c0603332:	00064697          	auipc	a3,0x64
    c0603336:	0fe68693          	addi	a3,a3,254 # c0667430 <inv_map>
    c060333a:	fec42703          	lw	a4,-20(s0)
    c060333e:	87ba                	mv	a5,a4
    c0603340:	0786                	slli	a5,a5,0x1
    c0603342:	97ba                	add	a5,a5,a4
    c0603344:	078e                	slli	a5,a5,0x3
    c0603346:	97b6                	add	a5,a5,a3
    c0603348:	6390                	ld	a2,0(a5)
    c060334a:	00064697          	auipc	a3,0x64
    c060334e:	0e668693          	addi	a3,a3,230 # c0667430 <inv_map>
    c0603352:	fec42703          	lw	a4,-20(s0)
    c0603356:	87ba                	mv	a5,a4
    c0603358:	0786                	slli	a5,a5,0x1
    c060335a:	97ba                	add	a5,a5,a4
    c060335c:	078e                	slli	a5,a5,0x3
    c060335e:	97b6                	add	a5,a5,a3
    c0603360:	678c                	ld	a1,8(a5)
    c0603362:	00064697          	auipc	a3,0x64
    c0603366:	0ce68693          	addi	a3,a3,206 # c0667430 <inv_map>
    c060336a:	fec42703          	lw	a4,-20(s0)
    c060336e:	87ba                	mv	a5,a4
    c0603370:	0786                	slli	a5,a5,0x1
    c0603372:	97ba                	add	a5,a5,a4
    c0603374:	078e                	slli	a5,a5,0x3
    c0603376:	97b6                	add	a5,a5,a3
    c0603378:	4b98                	lw	a4,16(a5)
    c060337a:	fec42783          	lw	a5,-20(s0)
    c060337e:	86ae                	mv	a3,a1
    c0603380:	85be                	mv	a1,a5
    c0603382:	00002517          	auipc	a0,0x2
    c0603386:	ee650513          	addi	a0,a0,-282 # c0605268 <_init_data_end+0x1268>
    c060338a:	979fe0ef          	jal	ra,c0601d02 <printd>
    c060338e:	fec42783          	lw	a5,-20(s0)
    c0603392:	2785                	addiw	a5,a5,1
    c0603394:	fef42623          	sw	a5,-20(s0)
    c0603398:	fec42783          	lw	a5,-20(s0)
    c060339c:	0007871b          	sext.w	a4,a5
    c06033a0:	3ff00793          	li	a5,1023
    c06033a4:	00e7cf63          	blt	a5,a4,c06033c2 <dump_inverse_map+0xaa>
    c06033a8:	00064697          	auipc	a3,0x64
    c06033ac:	08868693          	addi	a3,a3,136 # c0667430 <inv_map>
    c06033b0:	fec42703          	lw	a4,-20(s0)
    c06033b4:	87ba                	mv	a5,a4
    c06033b6:	0786                	slli	a5,a5,0x1
    c06033b8:	97ba                	add	a5,a5,a4
    c06033ba:	078e                	slli	a5,a5,0x3
    c06033bc:	97b6                	add	a5,a5,a3
    c06033be:	639c                	ld	a5,0(a5)
    c06033c0:	fbad                	bnez	a5,c0603332 <dump_inverse_map+0x1a>
    c06033c2:	00002517          	auipc	a0,0x2
    c06033c6:	ece50513          	addi	a0,a0,-306 # c0605290 <_init_data_end+0x1290>
    c06033ca:	939fe0ef          	jal	ra,c0601d02 <printd>
    c06033ce:	0001                	nop
    c06033d0:	60e2                	ld	ra,24(sp)
    c06033d2:	6442                	ld	s0,16(sp)
    c06033d4:	6105                	addi	sp,sp,32
    c06033d6:	8082                	ret
