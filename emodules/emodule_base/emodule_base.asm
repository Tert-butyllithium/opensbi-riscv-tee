
emodule_base.bin:     file format elf64-littleriscv


Disassembly of section .text:

00000000c0600000 <_start>:
    c0600000:	00000a17          	auipc	s4,0x0
    c0600004:	030a0a13          	addi	s4,s4,48 # c0600030 <_start+0x30>
    c0600008:	40ca0a33          	sub	s4,s4,a2
    c060000c:	00300b1b          	addiw	s6,zero,3
    c0600010:	0b7a                	slli	s6,s6,0x1e
    c0600012:	9a5a                	add	s4,s4,s6
    c0600014:	105a1073          	csrw	stvec,s4
    c0600018:	0000e117          	auipc	sp,0xe
    c060001c:	fe810113          	addi	sp,sp,-24 # c060e000 <_temp_stack_end>
    c0600020:	317000ef          	jal	ra,c0600b36 <init_mem>
    c0600024:	812e                	mv	sp,a1
    c0600026:	12000073          	sfence.vma
    c060002a:	18051073          	csrw	satp,a0
    c060002e:	0001                	nop
    c0600030:	12000073          	sfence.vma
    c0600034:	00002b97          	auipc	s7,0x2
    c0600038:	d8cb8b93          	addi	s7,s7,-628 # c0601dc0 <trap_handler>
    c060003c:	105b9073          	csrw	stvec,s7
    c0600040:	8532                	mv	a0,a2
    c0600042:	85b6                	mv	a1,a3
    c0600044:	1b2000ef          	jal	ra,c06001f6 <prepare_boot>
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
    c060008e:	43f010ef          	jal	ra,c0601ccc <show_reg>
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
    c06000d4:	7179                	addi	sp,sp,-48
    c06000d6:	f422                	sd	s0,40(sp)
    c06000d8:	1800                	addi	s0,sp,48
    c06000da:	fca43c23          	sd	a0,-40(s0)
    c06000de:	fe042623          	sw	zero,-20(s0)
    c06000e2:	a819                	j	c06000f8 <init_usr_stack+0x24>
    c06000e4:	fd843783          	ld	a5,-40(s0)
    c06000e8:	17e1                	addi	a5,a5,-8
    c06000ea:	fcf43c23          	sd	a5,-40(s0)
    c06000ee:	fec42783          	lw	a5,-20(s0)
    c06000f2:	2785                	addiw	a5,a5,1
    c06000f4:	fef42623          	sw	a5,-20(s0)
    c06000f8:	fec42783          	lw	a5,-20(s0)
    c06000fc:	0007871b          	sext.w	a4,a5
    c0600100:	06300793          	li	a5,99
    c0600104:	fee7d0e3          	bge	a5,a4,c06000e4 <init_usr_stack+0x10>
    c0600108:	fd843783          	ld	a5,-40(s0)
    c060010c:	0007b023          	sd	zero,0(a5)
    c0600110:	fd843783          	ld	a5,-40(s0)
    c0600114:	853e                	mv	a0,a5
    c0600116:	7422                	ld	s0,40(sp)
    c0600118:	6145                	addi	sp,sp,48
    c060011a:	8082                	ret

00000000c060011c <memset>:
    c060011c:	7179                	addi	sp,sp,-48
    c060011e:	f422                	sd	s0,40(sp)
    c0600120:	1800                	addi	s0,sp,48
    c0600122:	fea43423          	sd	a0,-24(s0)
    c0600126:	87ae                	mv	a5,a1
    c0600128:	fcc43c23          	sd	a2,-40(s0)
    c060012c:	fef42223          	sw	a5,-28(s0)
    c0600130:	fe843783          	ld	a5,-24(s0)
    c0600134:	853e                	mv	a0,a5
    c0600136:	7422                	ld	s0,40(sp)
    c0600138:	6145                	addi	sp,sp,48
    c060013a:	8082                	ret

00000000c060013c <init_other_driver>:
    c060013c:	de010113          	addi	sp,sp,-544
    c0600140:	20113c23          	sd	ra,536(sp)
    c0600144:	20813823          	sd	s0,528(sp)
    c0600148:	1400                	addi	s0,sp,544
    c060014a:	de840793          	addi	a5,s0,-536
    c060014e:	20000713          	li	a4,512
    c0600152:	863a                	mv	a2,a4
    c0600154:	4581                	li	a1,0
    c0600156:	853e                	mv	a0,a5
    c0600158:	fc5ff0ef          	jal	ra,c060011c <memset>
    c060015c:	00001797          	auipc	a5,0x1
    c0600160:	84678793          	addi	a5,a5,-1978 # c06009a2 <init_console_driver>
    c0600164:	def43423          	sd	a5,-536(s0)
    c0600168:	fe042623          	sw	zero,-20(s0)
    c060016c:	a0a5                	j	c06001d4 <init_other_driver+0x98>
    c060016e:	fec42783          	lw	a5,-20(s0)
    c0600172:	078e                	slli	a5,a5,0x3
    c0600174:	ff040713          	addi	a4,s0,-16
    c0600178:	97ba                	add	a5,a5,a4
    c060017a:	df87b783          	ld	a5,-520(a5)
    c060017e:	c7b1                	beqz	a5,c06001ca <init_other_driver+0x8e>
    c0600180:	fec42783          	lw	a5,-20(s0)
    c0600184:	078e                	slli	a5,a5,0x3
    c0600186:	ff040713          	addi	a4,s0,-16
    c060018a:	97ba                	add	a5,a5,a4
    c060018c:	df87b703          	ld	a4,-520(a5)
    c0600190:	00006697          	auipc	a3,0x6
    c0600194:	07068693          	addi	a3,a3,112 # c0606200 <drv_init_list>
    c0600198:	fec42783          	lw	a5,-20(s0)
    c060019c:	078e                	slli	a5,a5,0x3
    c060019e:	97b6                	add	a5,a5,a3
    c06001a0:	e398                	sd	a4,0(a5)
    c06001a2:	00006717          	auipc	a4,0x6
    c06001a6:	05e70713          	addi	a4,a4,94 # c0606200 <drv_init_list>
    c06001aa:	fec42783          	lw	a5,-20(s0)
    c06001ae:	078e                	slli	a5,a5,0x3
    c06001b0:	97ba                	add	a5,a5,a4
    c06001b2:	639c                	ld	a5,0(a5)
    c06001b4:	9782                	jalr	a5
    c06001b6:	86aa                	mv	a3,a0
    c06001b8:	00006717          	auipc	a4,0x6
    c06001bc:	e4870713          	addi	a4,a4,-440 # c0606000 <peri_reg_list>
    c06001c0:	fec42783          	lw	a5,-20(s0)
    c06001c4:	078e                	slli	a5,a5,0x3
    c06001c6:	97ba                	add	a5,a5,a4
    c06001c8:	e394                	sd	a3,0(a5)
    c06001ca:	fec42783          	lw	a5,-20(s0)
    c06001ce:	2785                	addiw	a5,a5,1
    c06001d0:	fef42623          	sw	a5,-20(s0)
    c06001d4:	fec42783          	lw	a5,-20(s0)
    c06001d8:	0007871b          	sext.w	a4,a5
    c06001dc:	03f00793          	li	a5,63
    c06001e0:	f8e7d7e3          	bge	a5,a4,c060016e <init_other_driver+0x32>
    c06001e4:	0001                	nop
    c06001e6:	0001                	nop
    c06001e8:	21813083          	ld	ra,536(sp)
    c06001ec:	21013403          	ld	s0,528(sp)
    c06001f0:	22010113          	addi	sp,sp,544
    c06001f4:	8082                	ret

00000000c06001f6 <prepare_boot>:
    c06001f6:	7139                	addi	sp,sp,-64
    c06001f8:	fc06                	sd	ra,56(sp)
    c06001fa:	f822                	sd	s0,48(sp)
    c06001fc:	0080                	addi	s0,sp,64
    c06001fe:	fca43423          	sd	a0,-56(s0)
    c0600202:	fcb43023          	sd	a1,-64(s0)
    c0600206:	00006617          	auipc	a2,0x6
    c060020a:	dfa60613          	addi	a2,a2,-518 # c0606000 <peri_reg_list>
    c060020e:	00006597          	auipc	a1,0x6
    c0600212:	df258593          	addi	a1,a1,-526 # c0606000 <peri_reg_list>
    c0600216:	00004517          	auipc	a0,0x4
    c060021a:	dea50513          	addi	a0,a0,-534 # c0604000 <_init_data_end>
    c060021e:	1eb010ef          	jal	ra,c0601c08 <printd>
    c0600222:	0000c797          	auipc	a5,0xc
    c0600226:	21e78793          	addi	a5,a5,542 # c060c440 <enclave_id>
    c060022a:	639c                	ld	a5,0(a5)
    c060022c:	0000c617          	auipc	a2,0xc
    c0600230:	21460613          	addi	a2,a2,532 # c060c440 <enclave_id>
    c0600234:	85be                	mv	a1,a5
    c0600236:	00004517          	auipc	a0,0x4
    c060023a:	df250513          	addi	a0,a0,-526 # c0604028 <_init_data_end+0x28>
    c060023e:	1cb010ef          	jal	ra,c0601c08 <printd>
    c0600242:	0000c797          	auipc	a5,0xc
    c0600246:	20678793          	addi	a5,a5,518 # c060c448 <drv_addr_list>
    c060024a:	639c                	ld	a5,0(a5)
    c060024c:	0000c617          	auipc	a2,0xc
    c0600250:	1fc60613          	addi	a2,a2,508 # c060c448 <drv_addr_list>
    c0600254:	85be                	mv	a1,a5
    c0600256:	00004517          	auipc	a0,0x4
    c060025a:	e0a50513          	addi	a0,a0,-502 # c0604060 <_init_data_end+0x60>
    c060025e:	1ab010ef          	jal	ra,c0601c08 <printd>
    c0600262:	02d000ef          	jal	ra,c0600a8e <loop_test>
    c0600266:	ed7ff0ef          	jal	ra,c060013c <init_other_driver>
    c060026a:	100027f3          	csrr	a5,sstatus
    c060026e:	fef43423          	sd	a5,-24(s0)
    c0600272:	fe843783          	ld	a5,-24(s0)
    c0600276:	fef43023          	sd	a5,-32(s0)
    c060027a:	fe043703          	ld	a4,-32(s0)
    c060027e:	000407b7          	lui	a5,0x40
    c0600282:	8fd9                	or	a5,a5,a4
    c0600284:	fef43023          	sd	a5,-32(s0)
    c0600288:	fe043783          	ld	a5,-32(s0)
    c060028c:	10079073          	csrw	sstatus,a5
    c0600290:	fc043503          	ld	a0,-64(s0)
    c0600294:	e41ff0ef          	jal	ra,c06000d4 <init_usr_stack>
    c0600298:	fca43023          	sd	a0,-64(s0)
    c060029c:	20200793          	li	a5,514
    c06002a0:	fcf43c23          	sd	a5,-40(s0)
    c06002a4:	fd843783          	ld	a5,-40(s0)
    c06002a8:	10479073          	csrw	sie,a5
    c06002ac:	00004517          	auipc	a0,0x4
    c06002b0:	dec50513          	addi	a0,a0,-532 # c0604098 <_init_data_end+0x98>
    c06002b4:	155010ef          	jal	ra,c0601c08 <printd>
    c06002b8:	fe043703          	ld	a4,-32(s0)
    c06002bc:	fffc07b7          	lui	a5,0xfffc0
    c06002c0:	eee78793          	addi	a5,a5,-274 # fffffffffffbfeee <_temp_stack_end+0xffffffff3f9b1eee>
    c06002c4:	8ff9                	and	a5,a5,a4
    c06002c6:	fef43023          	sd	a5,-32(s0)
    c06002ca:	fe043783          	ld	a5,-32(s0)
    c06002ce:	0227e793          	ori	a5,a5,34
    c06002d2:	fef43023          	sd	a5,-32(s0)
    c06002d6:	fe043783          	ld	a5,-32(s0)
    c06002da:	10079073          	csrw	sstatus,a5
    c06002de:	fc843583          	ld	a1,-56(s0)
    c06002e2:	00004517          	auipc	a0,0x4
    c06002e6:	dce50513          	addi	a0,a0,-562 # c06040b0 <_init_data_end+0xb0>
    c06002ea:	11f010ef          	jal	ra,c0601c08 <printd>
    c06002ee:	fc843783          	ld	a5,-56(s0)
    c06002f2:	14179073          	csrw	sepc,a5
    c06002f6:	fc043783          	ld	a5,-64(s0)
    c06002fa:	14079073          	csrw	sscratch,a5
    c06002fe:	0001                	nop
    c0600300:	70e2                	ld	ra,56(sp)
    c0600302:	7442                	ld	s0,48(sp)
    c0600304:	6121                	addi	sp,sp,64
    c0600306:	8082                	ret

00000000c0600308 <__pt2pte>:
    c0600308:	1101                	addi	sp,sp,-32
    c060030a:	ec22                	sd	s0,24(sp)
    c060030c:	1000                	addi	s0,sp,32
    c060030e:	87aa                	mv	a5,a0
    c0600310:	fef41723          	sh	a5,-18(s0)
    c0600314:	47bd                	li	a5,15
    c0600316:	853e                	mv	a0,a5
    c0600318:	6462                	ld	s0,24(sp)
    c060031a:	6105                	addi	sp,sp,32
    c060031c:	8082                	ret

00000000c060031e <elf_load>:
    c060031e:	7135                	addi	sp,sp,-160
    c0600320:	ed06                	sd	ra,152(sp)
    c0600322:	e922                	sd	s0,144(sp)
    c0600324:	e526                	sd	s1,136(sp)
    c0600326:	e14a                	sd	s2,128(sp)
    c0600328:	1100                	addi	s0,sp,160
    c060032a:	f6a43c23          	sd	a0,-136(s0)
    c060032e:	f6b43823          	sd	a1,-144(s0)
    c0600332:	87b2                	mv	a5,a2
    c0600334:	f6d43023          	sd	a3,-160(s0)
    c0600338:	f6f407a3          	sb	a5,-145(s0)
    c060033c:	f7043503          	ld	a0,-144(s0)
    c0600340:	16a000ef          	jal	ra,c06004aa <elf_check>
    c0600344:	87aa                	mv	a5,a0
    c0600346:	c399                	beqz	a5,c060034c <elf_load+0x2e>
    c0600348:	57fd                	li	a5,-1
    c060034a:	aa89                	j	c060049c <elf_load+0x17e>
    c060034c:	f7043783          	ld	a5,-144(s0)
    c0600350:	fcf43823          	sd	a5,-48(s0)
    c0600354:	fd043783          	ld	a5,-48(s0)
    c0600358:	7398                	ld	a4,32(a5)
    c060035a:	f7043783          	ld	a5,-144(s0)
    c060035e:	97ba                	add	a5,a5,a4
    c0600360:	fcf43423          	sd	a5,-56(s0)
    c0600364:	fc042e23          	sw	zero,-36(s0)
    c0600368:	a239                	j	c0600476 <elf_load+0x158>
    c060036a:	fdc42703          	lw	a4,-36(s0)
    c060036e:	87ba                	mv	a5,a4
    c0600370:	078e                	slli	a5,a5,0x3
    c0600372:	8f99                	sub	a5,a5,a4
    c0600374:	078e                	slli	a5,a5,0x3
    c0600376:	873e                	mv	a4,a5
    c0600378:	fc843783          	ld	a5,-56(s0)
    c060037c:	97ba                	add	a5,a5,a4
    c060037e:	0007b803          	ld	a6,0(a5)
    c0600382:	6788                	ld	a0,8(a5)
    c0600384:	6b8c                	ld	a1,16(a5)
    c0600386:	6f90                	ld	a2,24(a5)
    c0600388:	7394                	ld	a3,32(a5)
    c060038a:	7798                	ld	a4,40(a5)
    c060038c:	7b9c                	ld	a5,48(a5)
    c060038e:	f9043423          	sd	a6,-120(s0)
    c0600392:	f8a43823          	sd	a0,-112(s0)
    c0600396:	f8b43c23          	sd	a1,-104(s0)
    c060039a:	fac43023          	sd	a2,-96(s0)
    c060039e:	fad43423          	sd	a3,-88(s0)
    c06003a2:	fae43823          	sd	a4,-80(s0)
    c06003a6:	faf43c23          	sd	a5,-72(s0)
    c06003aa:	f8842783          	lw	a5,-120(s0)
    c06003ae:	873e                	mv	a4,a5
    c06003b0:	4785                	li	a5,1
    c06003b2:	0af71d63          	bne	a4,a5,c060046c <elf_load+0x14e>
    c06003b6:	fa843703          	ld	a4,-88(s0)
    c06003ba:	6785                	lui	a5,0x1
    c06003bc:	17fd                	addi	a5,a5,-1
    c06003be:	97ba                	add	a5,a5,a4
    c06003c0:	83b1                	srli	a5,a5,0xc
    c06003c2:	0785                	addi	a5,a5,1
    c06003c4:	fcf43023          	sd	a5,-64(s0)
    c06003c8:	f9843703          	ld	a4,-104(s0)
    c06003cc:	77fd                	lui	a5,0xfffff
    c06003ce:	00f774b3          	and	s1,a4,a5
    c06003d2:	f9043703          	ld	a4,-112(s0)
    c06003d6:	f7043783          	ld	a5,-144(s0)
    c06003da:	973e                	add	a4,a4,a5
    c06003dc:	77fd                	lui	a5,0xfffff
    c06003de:	00f77933          	and	s2,a4,a5
    c06003e2:	f8c42783          	lw	a5,-116(s0)
    c06003e6:	17c2                	slli	a5,a5,0x30
    c06003e8:	93c1                	srli	a5,a5,0x30
    c06003ea:	853e                	mv	a0,a5
    c06003ec:	f1dff0ef          	jal	ra,c0600308 <__pt2pte>
    c06003f0:	872a                	mv	a4,a0
    c06003f2:	4785                	li	a5,1
    c06003f4:	17fa                	slli	a5,a5,0x3e
    c06003f6:	07c1                	addi	a5,a5,16
    c06003f8:	8fd9                	or	a5,a5,a4
    c06003fa:	873e                	mv	a4,a5
    c06003fc:	fc043683          	ld	a3,-64(s0)
    c0600400:	864a                	mv	a2,s2
    c0600402:	85a6                	mv	a1,s1
    c0600404:	4501                	li	a0,0
    c0600406:	109020ef          	jal	ra,c0602d0e <map_page>
    c060040a:	fc043783          	ld	a5,-64(s0)
    c060040e:	00c79713          	slli	a4,a5,0xc
    c0600412:	fb043783          	ld	a5,-80(s0)
    c0600416:	04f77a63          	bgeu	a4,a5,c060046a <elf_load+0x14c>
    c060041a:	fb043703          	ld	a4,-80(s0)
    c060041e:	fa843783          	ld	a5,-88(s0)
    c0600422:	8f1d                	sub	a4,a4,a5
    c0600424:	6785                	lui	a5,0x1
    c0600426:	17fd                	addi	a5,a5,-1
    c0600428:	97ba                	add	a5,a5,a4
    c060042a:	83b1                	srli	a5,a5,0xc
    c060042c:	fcf43023          	sd	a5,-64(s0)
    c0600430:	f9843703          	ld	a4,-104(s0)
    c0600434:	fa843783          	ld	a5,-88(s0)
    c0600438:	973e                	add	a4,a4,a5
    c060043a:	77fd                	lui	a5,0xfffff
    c060043c:	00f774b3          	and	s1,a4,a5
    c0600440:	f8c42783          	lw	a5,-116(s0)
    c0600444:	17c2                	slli	a5,a5,0x30
    c0600446:	93c1                	srli	a5,a5,0x30
    c0600448:	853e                	mv	a0,a5
    c060044a:	ebfff0ef          	jal	ra,c0600308 <__pt2pte>
    c060044e:	872a                	mv	a4,a0
    c0600450:	4785                	li	a5,1
    c0600452:	17fa                	slli	a5,a5,0x3e
    c0600454:	07c1                	addi	a5,a5,16
    c0600456:	8fd9                	or	a5,a5,a4
    c0600458:	f6f44703          	lbu	a4,-145(s0)
    c060045c:	86be                	mv	a3,a5
    c060045e:	fc043603          	ld	a2,-64(s0)
    c0600462:	85a6                	mv	a1,s1
    c0600464:	4501                	li	a0,0
    c0600466:	1e1020ef          	jal	ra,c0602e46 <alloc_page>
    c060046a:	0001                	nop
    c060046c:	fdc42783          	lw	a5,-36(s0)
    c0600470:	2785                	addiw	a5,a5,1
    c0600472:	fcf42e23          	sw	a5,-36(s0)
    c0600476:	fd043783          	ld	a5,-48(s0)
    c060047a:	0387d783          	lhu	a5,56(a5) # fffffffffffff038 <_temp_stack_end+0xffffffff3f9f1038>
    c060047e:	0007871b          	sext.w	a4,a5
    c0600482:	fdc42783          	lw	a5,-36(s0)
    c0600486:	2781                	sext.w	a5,a5
    c0600488:	eee7c1e3          	blt	a5,a4,c060036a <elf_load+0x4c>
    c060048c:	f6043783          	ld	a5,-160(s0)
    c0600490:	10000737          	lui	a4,0x10000
    c0600494:	e398                	sd	a4,0(a5)
    c0600496:	fd043783          	ld	a5,-48(s0)
    c060049a:	6f9c                	ld	a5,24(a5)
    c060049c:	853e                	mv	a0,a5
    c060049e:	60ea                	ld	ra,152(sp)
    c06004a0:	644a                	ld	s0,144(sp)
    c06004a2:	64aa                	ld	s1,136(sp)
    c06004a4:	690a                	ld	s2,128(sp)
    c06004a6:	610d                	addi	sp,sp,160
    c06004a8:	8082                	ret

00000000c06004aa <elf_check>:
    c06004aa:	7139                	addi	sp,sp,-64
    c06004ac:	fc06                	sd	ra,56(sp)
    c06004ae:	f822                	sd	s0,48(sp)
    c06004b0:	0080                	addi	s0,sp,64
    c06004b2:	fca43423          	sd	a0,-56(s0)
    c06004b6:	fc843783          	ld	a5,-56(s0)
    c06004ba:	fef43423          	sd	a5,-24(s0)
    c06004be:	fe843783          	ld	a5,-24(s0)
    c06004c2:	0007c783          	lbu	a5,0(a5)
    c06004c6:	873e                	mv	a4,a5
    c06004c8:	07f00793          	li	a5,127
    c06004cc:	04f71063          	bne	a4,a5,c060050c <elf_check+0x62>
    c06004d0:	fe843783          	ld	a5,-24(s0)
    c06004d4:	0785                	addi	a5,a5,1
    c06004d6:	0007c783          	lbu	a5,0(a5)
    c06004da:	873e                	mv	a4,a5
    c06004dc:	04500793          	li	a5,69
    c06004e0:	02f71663          	bne	a4,a5,c060050c <elf_check+0x62>
    c06004e4:	fe843783          	ld	a5,-24(s0)
    c06004e8:	0789                	addi	a5,a5,2
    c06004ea:	0007c783          	lbu	a5,0(a5)
    c06004ee:	873e                	mv	a4,a5
    c06004f0:	04c00793          	li	a5,76
    c06004f4:	00f71c63          	bne	a4,a5,c060050c <elf_check+0x62>
    c06004f8:	fe843783          	ld	a5,-24(s0)
    c06004fc:	078d                	addi	a5,a5,3
    c06004fe:	0007c783          	lbu	a5,0(a5)
    c0600502:	873e                	mv	a4,a5
    c0600504:	04600793          	li	a5,70
    c0600508:	00f70a63          	beq	a4,a5,c060051c <elf_check+0x72>
    c060050c:	00004517          	auipc	a0,0x4
    c0600510:	bc450513          	addi	a0,a0,-1084 # c06040d0 <_init_data_end+0xd0>
    c0600514:	6f4010ef          	jal	ra,c0601c08 <printd>
    c0600518:	57fd                	li	a5,-1
    c060051a:	a849                	j	c06005ac <elf_check+0x102>
    c060051c:	fe843783          	ld	a5,-24(s0)
    c0600520:	0791                	addi	a5,a5,4
    c0600522:	0007c783          	lbu	a5,0(a5)
    c0600526:	873e                	mv	a4,a5
    c0600528:	4789                	li	a5,2
    c060052a:	00f71563          	bne	a4,a5,c0600534 <elf_check+0x8a>
    c060052e:	04000793          	li	a5,64
    c0600532:	a019                	j	c0600538 <elf_check+0x8e>
    c0600534:	02000793          	li	a5,32
    c0600538:	fef403a3          	sb	a5,-25(s0)
    c060053c:	fe744783          	lbu	a5,-25(s0)
    c0600540:	0ff7f713          	andi	a4,a5,255
    c0600544:	04000793          	li	a5,64
    c0600548:	00f70a63          	beq	a4,a5,c060055c <elf_check+0xb2>
    c060054c:	00004517          	auipc	a0,0x4
    c0600550:	b9450513          	addi	a0,a0,-1132 # c06040e0 <_init_data_end+0xe0>
    c0600554:	6b4010ef          	jal	ra,c0601c08 <printd>
    c0600558:	57fd                	li	a5,-1
    c060055a:	a889                	j	c06005ac <elf_check+0x102>
    c060055c:	fc843783          	ld	a5,-56(s0)
    c0600560:	fcf43c23          	sd	a5,-40(s0)
    c0600564:	fd843783          	ld	a5,-40(s0)
    c0600568:	0107d783          	lhu	a5,16(a5)
    c060056c:	0007871b          	sext.w	a4,a5
    c0600570:	4789                	li	a5,2
    c0600572:	00f70a63          	beq	a4,a5,c0600586 <elf_check+0xdc>
    c0600576:	00004517          	auipc	a0,0x4
    c060057a:	b8250513          	addi	a0,a0,-1150 # c06040f8 <_init_data_end+0xf8>
    c060057e:	68a010ef          	jal	ra,c0601c08 <printd>
    c0600582:	57fd                	li	a5,-1
    c0600584:	a025                	j	c06005ac <elf_check+0x102>
    c0600586:	fd843783          	ld	a5,-40(s0)
    c060058a:	0127d783          	lhu	a5,18(a5)
    c060058e:	0007871b          	sext.w	a4,a5
    c0600592:	0f300793          	li	a5,243
    c0600596:	00f70a63          	beq	a4,a5,c06005aa <elf_check+0x100>
    c060059a:	00004517          	auipc	a0,0x4
    c060059e:	b7650513          	addi	a0,a0,-1162 # c0604110 <_init_data_end+0x110>
    c06005a2:	666010ef          	jal	ra,c0601c08 <printd>
    c06005a6:	57fd                	li	a5,-1
    c06005a8:	a011                	j	c06005ac <elf_check+0x102>
    c06005aa:	4781                	li	a5,0
    c06005ac:	853e                	mv	a0,a5
    c06005ae:	70e2                	ld	ra,56(sp)
    c06005b0:	7442                	ld	s0,48(sp)
    c06005b2:	6121                	addi	sp,sp,64
    c06005b4:	8082                	ret

00000000c06005b6 <handle_interrupt>:
    c06005b6:	715d                	addi	sp,sp,-80
    c06005b8:	e486                	sd	ra,72(sp)
    c06005ba:	e0a2                	sd	s0,64(sp)
    c06005bc:	0880                	addi	s0,sp,80
    c06005be:	fca43423          	sd	a0,-56(s0)
    c06005c2:	fcb43023          	sd	a1,-64(s0)
    c06005c6:	fac43c23          	sd	a2,-72(s0)
    c06005ca:	fad43823          	sd	a3,-80(s0)
    c06005ce:	fc043583          	ld	a1,-64(s0)
    c06005d2:	00004517          	auipc	a0,0x4
    c06005d6:	b5e50513          	addi	a0,a0,-1186 # c0604130 <_init_data_end+0x130>
    c06005da:	62e010ef          	jal	ra,c0601c08 <printd>
    c06005de:	fc043703          	ld	a4,-64(s0)
    c06005e2:	47a5                	li	a5,9
    c06005e4:	06f70563          	beq	a4,a5,c060064e <handle_interrupt+0x98>
    c06005e8:	fc043703          	ld	a4,-64(s0)
    c06005ec:	47a5                	li	a5,9
    c06005ee:	08e7e963          	bltu	a5,a4,c0600680 <handle_interrupt+0xca>
    c06005f2:	fc043703          	ld	a4,-64(s0)
    c06005f6:	4785                	li	a5,1
    c06005f8:	02f70a63          	beq	a4,a5,c060062c <handle_interrupt+0x76>
    c06005fc:	fc043703          	ld	a4,-64(s0)
    c0600600:	4795                	li	a5,5
    c0600602:	06f71f63          	bne	a4,a5,c0600680 <handle_interrupt+0xca>
    c0600606:	fb043683          	ld	a3,-80(s0)
    c060060a:	fb843603          	ld	a2,-72(s0)
    c060060e:	fc043583          	ld	a1,-64(s0)
    c0600612:	00004517          	auipc	a0,0x4
    c0600616:	b5650513          	addi	a0,a0,-1194 # c0604168 <_init_data_end+0x168>
    c060061a:	5ee010ef          	jal	ra,c0601c08 <printd>
    c060061e:	02000793          	li	a5,32
    c0600622:	1447b7f3          	csrrc	a5,sip,a5
    c0600626:	fcf43c23          	sd	a5,-40(s0)
    c060062a:	a8a1                	j	c0600682 <handle_interrupt+0xcc>
    c060062c:	fb043683          	ld	a3,-80(s0)
    c0600630:	fb843603          	ld	a2,-72(s0)
    c0600634:	fc043583          	ld	a1,-64(s0)
    c0600638:	00004517          	auipc	a0,0x4
    c060063c:	b3050513          	addi	a0,a0,-1232 # c0604168 <_init_data_end+0x168>
    c0600640:	5c8010ef          	jal	ra,c0601c08 <printd>
    c0600644:	144177f3          	csrrci	a5,sip,2
    c0600648:	fcf43823          	sd	a5,-48(s0)
    c060064c:	a81d                	j	c0600682 <handle_interrupt+0xcc>
    c060064e:	fb043683          	ld	a3,-80(s0)
    c0600652:	fb843603          	ld	a2,-72(s0)
    c0600656:	fc043583          	ld	a1,-64(s0)
    c060065a:	00004517          	auipc	a0,0x4
    c060065e:	b3e50513          	addi	a0,a0,-1218 # c0604198 <_init_data_end+0x198>
    c0600662:	5a6010ef          	jal	ra,c0601c08 <printd>
    c0600666:	20000793          	li	a5,512
    c060066a:	1447b7f3          	csrrc	a5,sip,a5
    c060066e:	fef43423          	sd	a5,-24(s0)
    c0600672:	20000793          	li	a5,512
    c0600676:	1047b7f3          	csrrc	a5,sie,a5
    c060067a:	fef43023          	sd	a5,-32(s0)
    c060067e:	a011                	j	c0600682 <handle_interrupt+0xcc>
    c0600680:	0001                	nop
    c0600682:	0001                	nop
    c0600684:	60a6                	ld	ra,72(sp)
    c0600686:	6406                	ld	s0,64(sp)
    c0600688:	6161                	addi	sp,sp,80
    c060068a:	8082                	ret

00000000c060068c <handle_exception>:
    c060068c:	7179                	addi	sp,sp,-48
    c060068e:	f406                	sd	ra,40(sp)
    c0600690:	f022                	sd	s0,32(sp)
    c0600692:	1800                	addi	s0,sp,48
    c0600694:	fea43423          	sd	a0,-24(s0)
    c0600698:	feb43023          	sd	a1,-32(s0)
    c060069c:	fcc43c23          	sd	a2,-40(s0)
    c06006a0:	fcd43823          	sd	a3,-48(s0)
    c06006a4:	fd043683          	ld	a3,-48(s0)
    c06006a8:	fd843603          	ld	a2,-40(s0)
    c06006ac:	fe043583          	ld	a1,-32(s0)
    c06006b0:	00004517          	auipc	a0,0x4
    c06006b4:	b1050513          	addi	a0,a0,-1264 # c06041c0 <_init_data_end+0x1c0>
    c06006b8:	550010ef          	jal	ra,c0601c08 <printd>
    c06006bc:	4501                	li	a0,0
    c06006be:	4581                	li	a1,0
    c06006c0:	4601                	li	a2,0
    c06006c2:	19100813          	li	a6,401
    c06006c6:	192617b7          	lui	a5,0x19261
    c06006ca:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c06006ce:	00000073          	ecall
    c06006d2:	0001                	nop
    c06006d4:	70a2                	ld	ra,40(sp)
    c06006d6:	7402                	ld	s0,32(sp)
    c06006d8:	6145                	addi	sp,sp,48
    c06006da:	8082                	ret

00000000c06006dc <handle_syscall>:
    c06006dc:	7159                	addi	sp,sp,-112
    c06006de:	f486                	sd	ra,104(sp)
    c06006e0:	f0a2                	sd	s0,96(sp)
    c06006e2:	1880                	addi	s0,sp,112
    c06006e4:	faa43423          	sd	a0,-88(s0)
    c06006e8:	fab43023          	sd	a1,-96(s0)
    c06006ec:	f8c43c23          	sd	a2,-104(s0)
    c06006f0:	f8d43823          	sd	a3,-112(s0)
    c06006f4:	00004517          	auipc	a0,0x4
    c06006f8:	af450513          	addi	a0,a0,-1292 # c06041e8 <_init_data_end+0x1e8>
    c06006fc:	50c010ef          	jal	ra,c0601c08 <printd>
    c0600700:	f9843583          	ld	a1,-104(s0)
    c0600704:	00004517          	auipc	a0,0x4
    c0600708:	afc50513          	addi	a0,a0,-1284 # c0604200 <_init_data_end+0x200>
    c060070c:	4fc010ef          	jal	ra,c0601c08 <printd>
    c0600710:	100027f3          	csrr	a5,sstatus
    c0600714:	fef43023          	sd	a5,-32(s0)
    c0600718:	fe043783          	ld	a5,-32(s0)
    c060071c:	fcf43c23          	sd	a5,-40(s0)
    c0600720:	fa043703          	ld	a4,-96(s0)
    c0600724:	47a1                	li	a5,8
    c0600726:	00f70c63          	beq	a4,a5,c060073e <handle_syscall+0x62>
    c060072a:	f9043683          	ld	a3,-112(s0)
    c060072e:	f9843603          	ld	a2,-104(s0)
    c0600732:	fa043583          	ld	a1,-96(s0)
    c0600736:	fa843503          	ld	a0,-88(s0)
    c060073a:	f53ff0ef          	jal	ra,c060068c <handle_exception>
    c060073e:	fa843783          	ld	a5,-88(s0)
    c0600742:	67dc                	ld	a5,136(a5)
    c0600744:	fcf43823          	sd	a5,-48(s0)
    c0600748:	fa843783          	ld	a5,-88(s0)
    c060074c:	6bbc                	ld	a5,80(a5)
    c060074e:	fcf43423          	sd	a5,-56(s0)
    c0600752:	fa843783          	ld	a5,-88(s0)
    c0600756:	6fbc                	ld	a5,88(a5)
    c0600758:	fcf43023          	sd	a5,-64(s0)
    c060075c:	fe043423          	sd	zero,-24(s0)
    c0600760:	fd043583          	ld	a1,-48(s0)
    c0600764:	00004517          	auipc	a0,0x4
    c0600768:	abc50513          	addi	a0,a0,-1348 # c0604220 <_init_data_end+0x220>
    c060076c:	49c010ef          	jal	ra,c0601c08 <printd>
    c0600770:	fd043703          	ld	a4,-48(s0)
    c0600774:	19200793          	li	a5,402
    c0600778:	12f70b63          	beq	a4,a5,c06008ae <handle_syscall+0x1d2>
    c060077c:	fd043703          	ld	a4,-48(s0)
    c0600780:	19200793          	li	a5,402
    c0600784:	14e7e363          	bltu	a5,a4,c06008ca <handle_syscall+0x1ee>
    c0600788:	fd043703          	ld	a4,-48(s0)
    c060078c:	0d600793          	li	a5,214
    c0600790:	0af70b63          	beq	a4,a5,c0600846 <handle_syscall+0x16a>
    c0600794:	fd043703          	ld	a4,-48(s0)
    c0600798:	0d600793          	li	a5,214
    c060079c:	12e7e763          	bltu	a5,a4,c06008ca <handle_syscall+0x1ee>
    c06007a0:	fd043703          	ld	a4,-48(s0)
    c06007a4:	0a900793          	li	a5,169
    c06007a8:	0af70f63          	beq	a4,a5,c0600866 <handle_syscall+0x18a>
    c06007ac:	fd043703          	ld	a4,-48(s0)
    c06007b0:	0a900793          	li	a5,169
    c06007b4:	10e7eb63          	bltu	a5,a4,c06008ca <handle_syscall+0x1ee>
    c06007b8:	fd043703          	ld	a4,-48(s0)
    c06007bc:	05d00793          	li	a5,93
    c06007c0:	0af70f63          	beq	a4,a5,c060087e <handle_syscall+0x1a2>
    c06007c4:	fd043703          	ld	a4,-48(s0)
    c06007c8:	05d00793          	li	a5,93
    c06007cc:	0ee7ef63          	bltu	a5,a4,c06008ca <handle_syscall+0x1ee>
    c06007d0:	fd043703          	ld	a4,-48(s0)
    c06007d4:	05000793          	li	a5,80
    c06007d8:	02f70563          	beq	a4,a5,c0600802 <handle_syscall+0x126>
    c06007dc:	fd043703          	ld	a4,-48(s0)
    c06007e0:	05000793          	li	a5,80
    c06007e4:	0ee7e363          	bltu	a5,a4,c06008ca <handle_syscall+0x1ee>
    c06007e8:	fd043703          	ld	a4,-48(s0)
    c06007ec:	03900793          	li	a5,57
    c06007f0:	04f70363          	beq	a4,a5,c0600836 <handle_syscall+0x15a>
    c06007f4:	fd043703          	ld	a4,-48(s0)
    c06007f8:	04000793          	li	a5,64
    c06007fc:	00f70d63          	beq	a4,a5,c0600816 <handle_syscall+0x13a>
    c0600800:	a0e9                	j	c06008ca <handle_syscall+0x1ee>
    c0600802:	fc043583          	ld	a1,-64(s0)
    c0600806:	fc843503          	ld	a0,-56(s0)
    c060080a:	509000ef          	jal	ra,c0601512 <ebi_fstat>
    c060080e:	87aa                	mv	a5,a0
    c0600810:	fef43423          	sd	a5,-24(s0)
    c0600814:	a0e5                	j	c06008fc <handle_syscall+0x220>
    c0600816:	00004517          	auipc	a0,0x4
    c060081a:	a2a50513          	addi	a0,a0,-1494 # c0604240 <_init_data_end+0x240>
    c060081e:	3ea010ef          	jal	ra,c0601c08 <printd>
    c0600822:	fc043583          	ld	a1,-64(s0)
    c0600826:	fc843503          	ld	a0,-56(s0)
    c060082a:	66d000ef          	jal	ra,c0601696 <ebi_write>
    c060082e:	87aa                	mv	a5,a0
    c0600830:	fef43423          	sd	a5,-24(s0)
    c0600834:	a0e1                	j	c06008fc <handle_syscall+0x220>
    c0600836:	fc843503          	ld	a0,-56(s0)
    c060083a:	6c7000ef          	jal	ra,c0601700 <ebi_close>
    c060083e:	87aa                	mv	a5,a0
    c0600840:	fef43423          	sd	a5,-24(s0)
    c0600844:	a865                	j	c06008fc <handle_syscall+0x220>
    c0600846:	fc843583          	ld	a1,-56(s0)
    c060084a:	00004517          	auipc	a0,0x4
    c060084e:	a1650513          	addi	a0,a0,-1514 # c0604260 <_init_data_end+0x260>
    c0600852:	3b6010ef          	jal	ra,c0601c08 <printd>
    c0600856:	fc843503          	ld	a0,-56(s0)
    c060085a:	541000ef          	jal	ra,c060159a <ebi_brk>
    c060085e:	87aa                	mv	a5,a0
    c0600860:	fef43423          	sd	a5,-24(s0)
    c0600864:	a861                	j	c06008fc <handle_syscall+0x220>
    c0600866:	fc843783          	ld	a5,-56(s0)
    c060086a:	fc043703          	ld	a4,-64(s0)
    c060086e:	85ba                	mv	a1,a4
    c0600870:	853e                	mv	a0,a5
    c0600872:	6a3000ef          	jal	ra,c0601714 <ebi_gettimeofday>
    c0600876:	87aa                	mv	a5,a0
    c0600878:	fef43423          	sd	a5,-24(s0)
    c060087c:	a041                	j	c06008fc <handle_syscall+0x220>
    c060087e:	00004517          	auipc	a0,0x4
    c0600882:	a0a50513          	addi	a0,a0,-1526 # c0604288 <_init_data_end+0x288>
    c0600886:	382010ef          	jal	ra,c0601c08 <printd>
    c060088a:	0000c797          	auipc	a5,0xc
    c060088e:	bb678793          	addi	a5,a5,-1098 # c060c440 <enclave_id>
    c0600892:	639c                	ld	a5,0(a5)
    c0600894:	853e                	mv	a0,a5
    c0600896:	fc843583          	ld	a1,-56(s0)
    c060089a:	4601                	li	a2,0
    c060089c:	19100813          	li	a6,401
    c06008a0:	192617b7          	lui	a5,0x19261
    c06008a4:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c06008a8:	00000073          	ecall
    c06008ac:	a881                	j	c06008fc <handle_syscall+0x220>
    c06008ae:	0000c797          	auipc	a5,0xc
    c06008b2:	b9278793          	addi	a5,a5,-1134 # c060c440 <enclave_id>
    c06008b6:	639c                	ld	a5,0(a5)
    c06008b8:	853e                	mv	a0,a5
    c06008ba:	fc843583          	ld	a1,-56(s0)
    c06008be:	4601                	li	a2,0
    c06008c0:	19200893          	li	a7,402
    c06008c4:	00000073          	ecall
    c06008c8:	a815                	j	c06008fc <handle_syscall+0x220>
    c06008ca:	fd043583          	ld	a1,-48(s0)
    c06008ce:	00004517          	auipc	a0,0x4
    c06008d2:	9da50513          	addi	a0,a0,-1574 # c06042a8 <_init_data_end+0x2a8>
    c06008d6:	332010ef          	jal	ra,c0601c08 <printd>
    c06008da:	0000c797          	auipc	a5,0xc
    c06008de:	b6678793          	addi	a5,a5,-1178 # c060c440 <enclave_id>
    c06008e2:	639c                	ld	a5,0(a5)
    c06008e4:	853e                	mv	a0,a5
    c06008e6:	4581                	li	a1,0
    c06008e8:	4601                	li	a2,0
    c06008ea:	19100813          	li	a6,401
    c06008ee:	192617b7          	lui	a5,0x19261
    c06008f2:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c06008f6:	00000073          	ecall
    c06008fa:	0001                	nop
    c06008fc:	f9843583          	ld	a1,-104(s0)
    c0600900:	00004517          	auipc	a0,0x4
    c0600904:	9c850513          	addi	a0,a0,-1592 # c06042c8 <_init_data_end+0x2c8>
    c0600908:	300010ef          	jal	ra,c0601c08 <printd>
    c060090c:	f9843783          	ld	a5,-104(s0)
    c0600910:	0791                	addi	a5,a5,4
    c0600912:	14179073          	csrw	sepc,a5
    c0600916:	141027f3          	csrr	a5,sepc
    c060091a:	faf43c23          	sd	a5,-72(s0)
    c060091e:	fb843783          	ld	a5,-72(s0)
    c0600922:	85be                	mv	a1,a5
    c0600924:	00004517          	auipc	a0,0x4
    c0600928:	9dc50513          	addi	a0,a0,-1572 # c0604300 <_init_data_end+0x300>
    c060092c:	2dc010ef          	jal	ra,c0601c08 <printd>
    c0600930:	fd843783          	ld	a5,-40(s0)
    c0600934:	eee7f793          	andi	a5,a5,-274
    c0600938:	fcf43c23          	sd	a5,-40(s0)
    c060093c:	fd843783          	ld	a5,-40(s0)
    c0600940:	10079073          	csrw	sstatus,a5
    c0600944:	00004517          	auipc	a0,0x4
    c0600948:	9f450513          	addi	a0,a0,-1548 # c0604338 <_init_data_end+0x338>
    c060094c:	2bc010ef          	jal	ra,c0601c08 <printd>
    c0600950:	00004517          	auipc	a0,0x4
    c0600954:	a1850513          	addi	a0,a0,-1512 # c0604368 <_init_data_end+0x368>
    c0600958:	2b0010ef          	jal	ra,c0601c08 <printd>
    c060095c:	fa843783          	ld	a5,-88(s0)
    c0600960:	05078793          	addi	a5,a5,80
    c0600964:	fe843703          	ld	a4,-24(s0)
    c0600968:	e398                	sd	a4,0(a5)
    c060096a:	0001                	nop
    c060096c:	70a6                	ld	ra,104(sp)
    c060096e:	7406                	ld	s0,96(sp)
    c0600970:	6165                	addi	sp,sp,112
    c0600972:	8082                	ret

00000000c0600974 <unimplemented_exception>:
    c0600974:	7179                	addi	sp,sp,-48
    c0600976:	f406                	sd	ra,40(sp)
    c0600978:	f022                	sd	s0,32(sp)
    c060097a:	1800                	addi	s0,sp,48
    c060097c:	fea43423          	sd	a0,-24(s0)
    c0600980:	feb43023          	sd	a1,-32(s0)
    c0600984:	fcc43c23          	sd	a2,-40(s0)
    c0600988:	fcd43823          	sd	a3,-48(s0)
    c060098c:	00004517          	auipc	a0,0x4
    c0600990:	9f450513          	addi	a0,a0,-1548 # c0604380 <_init_data_end+0x380>
    c0600994:	274010ef          	jal	ra,c0601c08 <printd>
    c0600998:	0001                	nop
    c060099a:	70a2                	ld	ra,40(sp)
    c060099c:	7402                	ld	s0,32(sp)
    c060099e:	6145                	addi	sp,sp,48
    c06009a0:	8082                	ret

00000000c06009a2 <init_console_driver>:
    c06009a2:	7179                	addi	sp,sp,-48
    c06009a4:	f406                	sd	ra,40(sp)
    c06009a6:	f022                	sd	s0,32(sp)
    c06009a8:	1800                	addi	s0,sp,48
    c06009aa:	00004517          	auipc	a0,0x4
    c06009ae:	9ee50513          	addi	a0,a0,-1554 # c0604398 <_init_data_end+0x398>
    c06009b2:	256010ef          	jal	ra,c0601c08 <printd>
    c06009b6:	0000c797          	auipc	a5,0xc
    c06009ba:	a9278793          	addi	a5,a5,-1390 # c060c448 <drv_addr_list>
    c06009be:	639c                	ld	a5,0(a5)
    c06009c0:	639c                	ld	a5,0(a5)
    c06009c2:	fef43423          	sd	a5,-24(s0)
    c06009c6:	fe843783          	ld	a5,-24(s0)
    c06009ca:	fef43023          	sd	a5,-32(s0)
    c06009ce:	fe043783          	ld	a5,-32(s0)
    c06009d2:	4681                	li	a3,0
    c06009d4:	4601                	li	a2,0
    c06009d6:	4581                	li	a1,0
    c06009d8:	557d                	li	a0,-1
    c06009da:	9782                	jalr	a5
    c06009dc:	87aa                	mv	a5,a0
    c06009de:	fcf43c23          	sd	a5,-40(s0)
    c06009e2:	fd843783          	ld	a5,-40(s0)
    c06009e6:	639c                	ld	a5,0(a5)
    c06009e8:	40000613          	li	a2,1024
    c06009ec:	85be                	mv	a1,a5
    c06009ee:	4501                	li	a0,0
    c06009f0:	3c6020ef          	jal	ra,c0602db6 <ioremap>
    c06009f4:	fca43823          	sd	a0,-48(s0)
    c06009f8:	fd843783          	ld	a5,-40(s0)
    c06009fc:	639c                	ld	a5,0(a5)
    c06009fe:	853e                	mv	a0,a5
    c0600a00:	fd043583          	ld	a1,-48(s0)
    c0600a04:	fd843783          	ld	a5,-40(s0)
    c0600a08:	6798                	ld	a4,8(a5)
    c0600a0a:	6785                	lui	a5,0x1
    c0600a0c:	17fd                	addi	a5,a5,-1
    c0600a0e:	973e                	add	a4,a4,a5
    c0600a10:	77fd                	lui	a5,0xfffff
    c0600a12:	8ff9                	and	a5,a5,a4
    c0600a14:	863e                	mv	a2,a5
    c0600a16:	1a400813          	li	a6,420
    c0600a1a:	192617b7          	lui	a5,0x19261
    c0600a1e:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c0600a22:	00000073          	ecall
    c0600a26:	fe043783          	ld	a5,-32(s0)
    c0600a2a:	4681                	li	a3,0
    c0600a2c:	4601                	li	a2,0
    c0600a2e:	fd043583          	ld	a1,-48(s0)
    c0600a32:	4501                	li	a0,0
    c0600a34:	9782                	jalr	a5
    c0600a36:	00004517          	auipc	a0,0x4
    c0600a3a:	97a50513          	addi	a0,a0,-1670 # c06043b0 <_init_data_end+0x3b0>
    c0600a3e:	1ca010ef          	jal	ra,c0601c08 <printd>
    c0600a42:	fd843783          	ld	a5,-40(s0)
    c0600a46:	853e                	mv	a0,a5
    c0600a48:	70a2                	ld	ra,40(sp)
    c0600a4a:	7402                	ld	s0,32(sp)
    c0600a4c:	6145                	addi	sp,sp,48
    c0600a4e:	8082                	ret

00000000c0600a50 <page_map_register>:
    c0600a50:	1141                	addi	sp,sp,-16
    c0600a52:	e406                	sd	ra,8(sp)
    c0600a54:	e022                	sd	s0,0(sp)
    c0600a56:	0800                	addi	s0,sp,16
    c0600a58:	673010ef          	jal	ra,c06028ca <get_page_table_root_pointer_addr>
    c0600a5c:	87aa                	mv	a5,a0
    c0600a5e:	853e                	mv	a0,a5
    c0600a60:	00006797          	auipc	a5,0x6
    c0600a64:	9d078793          	addi	a5,a5,-1584 # c0606430 <inv_map>
    c0600a68:	85be                	mv	a1,a5
    c0600a6a:	0000c797          	auipc	a5,0xc
    c0600a6e:	a0678793          	addi	a5,a5,-1530 # c060c470 <ENC_VA_PA_OFFSET>
    c0600a72:	863e                	mv	a2,a5
    c0600a74:	19600813          	li	a6,406
    c0600a78:	192617b7          	lui	a5,0x19261
    c0600a7c:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c0600a80:	00000073          	ecall
    c0600a84:	0001                	nop
    c0600a86:	60a2                	ld	ra,8(sp)
    c0600a88:	6402                	ld	s0,0(sp)
    c0600a8a:	0141                	addi	sp,sp,16
    c0600a8c:	8082                	ret

00000000c0600a8e <loop_test>:
    c0600a8e:	7139                	addi	sp,sp,-64
    c0600a90:	fc06                	sd	ra,56(sp)
    c0600a92:	f822                	sd	s0,48(sp)
    c0600a94:	0080                	addi	s0,sp,64
    c0600a96:	00004517          	auipc	a0,0x4
    c0600a9a:	94250513          	addi	a0,a0,-1726 # c06043d8 <_init_data_end+0x3d8>
    c0600a9e:	208010ef          	jal	ra,c0601ca6 <print_color>
    c0600aa2:	fe042623          	sw	zero,-20(s0)
    c0600aa6:	a0b5                	j	c0600b12 <loop_test+0x84>
    c0600aa8:	c00027f3          	rdcycle	a5
    c0600aac:	fef43023          	sd	a5,-32(s0)
    c0600ab0:	fe043783          	ld	a5,-32(s0)
    c0600ab4:	fcf43c23          	sd	a5,-40(s0)
    c0600ab8:	fe042423          	sw	zero,-24(s0)
    c0600abc:	a039                	j	c0600aca <loop_test+0x3c>
    c0600abe:	0e85                	addi	t4,t4,1
    c0600ac0:	fe842783          	lw	a5,-24(s0)
    c0600ac4:	2785                	addiw	a5,a5,1
    c0600ac6:	fef42423          	sw	a5,-24(s0)
    c0600aca:	fe842783          	lw	a5,-24(s0)
    c0600ace:	0007871b          	sext.w	a4,a5
    c0600ad2:	000f47b7          	lui	a5,0xf4
    c0600ad6:	23f78793          	addi	a5,a5,575 # f423f <_start-0xc050bdc1>
    c0600ada:	fee7d2e3          	bge	a5,a4,c0600abe <loop_test+0x30>
    c0600ade:	c00027f3          	rdcycle	a5
    c0600ae2:	fcf43823          	sd	a5,-48(s0)
    c0600ae6:	fd043783          	ld	a5,-48(s0)
    c0600aea:	fcf43423          	sd	a5,-56(s0)
    c0600aee:	fc843703          	ld	a4,-56(s0)
    c0600af2:	fd843783          	ld	a5,-40(s0)
    c0600af6:	40f707b3          	sub	a5,a4,a5
    c0600afa:	85be                	mv	a1,a5
    c0600afc:	00004517          	auipc	a0,0x4
    c0600b00:	8fc50513          	addi	a0,a0,-1796 # c06043f8 <_init_data_end+0x3f8>
    c0600b04:	104010ef          	jal	ra,c0601c08 <printd>
    c0600b08:	fec42783          	lw	a5,-20(s0)
    c0600b0c:	2785                	addiw	a5,a5,1
    c0600b0e:	fef42623          	sw	a5,-20(s0)
    c0600b12:	fec42783          	lw	a5,-20(s0)
    c0600b16:	0007871b          	sext.w	a4,a5
    c0600b1a:	47a5                	li	a5,9
    c0600b1c:	f8e7d6e3          	bge	a5,a4,c0600aa8 <loop_test+0x1a>
    c0600b20:	00004517          	auipc	a0,0x4
    c0600b24:	8f850513          	addi	a0,a0,-1800 # c0604418 <_init_data_end+0x418>
    c0600b28:	17e010ef          	jal	ra,c0601ca6 <print_color>
    c0600b2c:	0001                	nop
    c0600b2e:	70e2                	ld	ra,56(sp)
    c0600b30:	7442                	ld	s0,48(sp)
    c0600b32:	6121                	addi	sp,sp,64
    c0600b34:	8082                	ret

00000000c0600b36 <init_mem>:
    c0600b36:	7101                	addi	sp,sp,-512
    c0600b38:	ff86                	sd	ra,504(sp)
    c0600b3a:	fba2                	sd	s0,496(sp)
    c0600b3c:	f7a6                	sd	s1,488(sp)
    c0600b3e:	0400                	addi	s0,sp,512
    c0600b40:	e2a43c23          	sd	a0,-456(s0)
    c0600b44:	e2b43823          	sd	a1,-464(s0)
    c0600b48:	e2c43423          	sd	a2,-472(s0)
    c0600b4c:	e2d43023          	sd	a3,-480(s0)
    c0600b50:	e0e43c23          	sd	a4,-488(s0)
    c0600b54:	e0f43823          	sd	a5,-496(s0)
    c0600b58:	e1043423          	sd	a6,-504(s0)
    c0600b5c:	0000c797          	auipc	a5,0xc
    c0600b60:	90c78793          	addi	a5,a5,-1780 # c060c468 <ENC_PA_START>
    c0600b64:	e2843703          	ld	a4,-472(s0)
    c0600b68:	e398                	sd	a4,0(a5)
    c0600b6a:	0000c797          	auipc	a5,0xc
    c0600b6e:	8fe78793          	addi	a5,a5,-1794 # c060c468 <ENC_PA_START>
    c0600b72:	639c                	ld	a5,0(a5)
    c0600b74:	470d                	li	a4,3
    c0600b76:	077a                	slli	a4,a4,0x1e
    c0600b78:	8f1d                	sub	a4,a4,a5
    c0600b7a:	0000c797          	auipc	a5,0xc
    c0600b7e:	8f678793          	addi	a5,a5,-1802 # c060c470 <ENC_VA_PA_OFFSET>
    c0600b82:	e398                	sd	a4,0(a5)
    c0600b84:	0000c797          	auipc	a5,0xc
    c0600b88:	8dc78793          	addi	a5,a5,-1828 # c060c460 <va_top>
    c0600b8c:	470d                	li	a4,3
    c0600b8e:	077a                	slli	a4,a4,0x1e
    c0600b90:	e398                	sd	a4,0(a5)
    c0600b92:	e3043583          	ld	a1,-464(s0)
    c0600b96:	00004517          	auipc	a0,0x4
    c0600b9a:	8a250513          	addi	a0,a0,-1886 # c0604438 <_init_data_end+0x438>
    c0600b9e:	06a010ef          	jal	ra,c0601c08 <printd>
    c0600ba2:	e2843583          	ld	a1,-472(s0)
    c0600ba6:	00004517          	auipc	a0,0x4
    c0600baa:	8b250513          	addi	a0,a0,-1870 # c0604458 <_init_data_end+0x458>
    c0600bae:	05a010ef          	jal	ra,c0601c08 <printd>
    c0600bb2:	0000c797          	auipc	a5,0xc
    c0600bb6:	8be78793          	addi	a5,a5,-1858 # c060c470 <ENC_VA_PA_OFFSET>
    c0600bba:	639c                	ld	a5,0(a5)
    c0600bbc:	85be                	mv	a1,a5
    c0600bbe:	00004517          	auipc	a0,0x4
    c0600bc2:	8c250513          	addi	a0,a0,-1854 # c0604480 <_init_data_end+0x480>
    c0600bc6:	042010ef          	jal	ra,c0601c08 <printd>
    c0600bca:	0000c797          	auipc	a5,0xc
    c0600bce:	89678793          	addi	a5,a5,-1898 # c060c460 <va_top>
    c0600bd2:	639c                	ld	a5,0(a5)
    c0600bd4:	85be                	mv	a1,a5
    c0600bd6:	00004517          	auipc	a0,0x4
    c0600bda:	8d250513          	addi	a0,a0,-1838 # c06044a8 <_init_data_end+0x4a8>
    c0600bde:	02a010ef          	jal	ra,c0601c08 <printd>
    c0600be2:	0000c797          	auipc	a5,0xc
    c0600be6:	85e78793          	addi	a5,a5,-1954 # c060c440 <enclave_id>
    c0600bea:	e3043703          	ld	a4,-464(s0)
    c0600bee:	e398                	sd	a4,0(a5)
    c0600bf0:	105027f3          	csrr	a5,stvec
    c0600bf4:	fcf43823          	sd	a5,-48(s0)
    c0600bf8:	fd043783          	ld	a5,-48(s0)
    c0600bfc:	fcf43423          	sd	a5,-56(s0)
    c0600c00:	fc843583          	ld	a1,-56(s0)
    c0600c04:	00004517          	auipc	a0,0x4
    c0600c08:	8cc50513          	addi	a0,a0,-1844 # c06044d0 <_init_data_end+0x4d0>
    c0600c0c:	7fd000ef          	jal	ra,c0601c08 <printd>
    c0600c10:	fffff797          	auipc	a5,0xfffff
    c0600c14:	3f078793          	addi	a5,a5,1008 # c0600000 <_start>
    c0600c18:	fcf43023          	sd	a5,-64(s0)
    c0600c1c:	0000c797          	auipc	a5,0xc
    c0600c20:	3e478793          	addi	a5,a5,996 # c060d000 <_drv_console_end>
    c0600c24:	faf43c23          	sd	a5,-72(s0)
    c0600c28:	fb843703          	ld	a4,-72(s0)
    c0600c2c:	fc043783          	ld	a5,-64(s0)
    c0600c30:	40f707b3          	sub	a5,a4,a5
    c0600c34:	faf43823          	sd	a5,-80(s0)
    c0600c38:	fffff597          	auipc	a1,0xfffff
    c0600c3c:	3c858593          	addi	a1,a1,968 # c0600000 <_start>
    c0600c40:	00004517          	auipc	a0,0x4
    c0600c44:	8b850513          	addi	a0,a0,-1864 # c06044f8 <_init_data_end+0x4f8>
    c0600c48:	7c1000ef          	jal	ra,c0601c08 <printd>
    c0600c4c:	0000c597          	auipc	a1,0xc
    c0600c50:	3b458593          	addi	a1,a1,948 # c060d000 <_drv_console_end>
    c0600c54:	00004517          	auipc	a0,0x4
    c0600c58:	8d450513          	addi	a0,a0,-1836 # c0604528 <_init_data_end+0x528>
    c0600c5c:	7ad000ef          	jal	ra,c0601c08 <printd>
    c0600c60:	fb043583          	ld	a1,-80(s0)
    c0600c64:	00004517          	auipc	a0,0x4
    c0600c68:	8ec50513          	addi	a0,a0,-1812 # c0604550 <_init_data_end+0x550>
    c0600c6c:	79d000ef          	jal	ra,c0601c08 <printd>
    c0600c70:	fc042e23          	sw	zero,-36(s0)
    c0600c74:	e1843783          	ld	a5,-488(s0)
    c0600c78:	639c                	ld	a5,0(a5)
    c0600c7a:	85be                	mv	a1,a5
    c0600c7c:	00004517          	auipc	a0,0x4
    c0600c80:	8fc50513          	addi	a0,a0,-1796 # c0604578 <_init_data_end+0x578>
    c0600c84:	785000ef          	jal	ra,c0601c08 <printd>
    c0600c88:	a0c1                	j	c0600d48 <init_mem+0x212>
    c0600c8a:	fdc42703          	lw	a4,-36(s0)
    c0600c8e:	87ba                	mv	a5,a4
    c0600c90:	0786                	slli	a5,a5,0x1
    c0600c92:	97ba                	add	a5,a5,a4
    c0600c94:	078e                	slli	a5,a5,0x3
    c0600c96:	873e                	mv	a4,a5
    c0600c98:	e1843783          	ld	a5,-488(s0)
    c0600c9c:	97ba                	add	a5,a5,a4
    c0600c9e:	6390                	ld	a2,0(a5)
    c0600ca0:	0000b797          	auipc	a5,0xb
    c0600ca4:	7d078793          	addi	a5,a5,2000 # c060c470 <ENC_VA_PA_OFFSET>
    c0600ca8:	6394                	ld	a3,0(a5)
    c0600caa:	fdc42703          	lw	a4,-36(s0)
    c0600cae:	87ba                	mv	a5,a4
    c0600cb0:	0786                	slli	a5,a5,0x1
    c0600cb2:	97ba                	add	a5,a5,a4
    c0600cb4:	078e                	slli	a5,a5,0x3
    c0600cb6:	873e                	mv	a4,a5
    c0600cb8:	e1843783          	ld	a5,-488(s0)
    c0600cbc:	97ba                	add	a5,a5,a4
    c0600cbe:	00d60733          	add	a4,a2,a3
    c0600cc2:	e398                	sd	a4,0(a5)
    c0600cc4:	fdc42703          	lw	a4,-36(s0)
    c0600cc8:	87ba                	mv	a5,a4
    c0600cca:	0786                	slli	a5,a5,0x1
    c0600ccc:	97ba                	add	a5,a5,a4
    c0600cce:	078e                	slli	a5,a5,0x3
    c0600cd0:	873e                	mv	a4,a5
    c0600cd2:	e1843783          	ld	a5,-488(s0)
    c0600cd6:	97ba                	add	a5,a5,a4
    c0600cd8:	6790                	ld	a2,8(a5)
    c0600cda:	0000b797          	auipc	a5,0xb
    c0600cde:	79678793          	addi	a5,a5,1942 # c060c470 <ENC_VA_PA_OFFSET>
    c0600ce2:	6394                	ld	a3,0(a5)
    c0600ce4:	fdc42703          	lw	a4,-36(s0)
    c0600ce8:	87ba                	mv	a5,a4
    c0600cea:	0786                	slli	a5,a5,0x1
    c0600cec:	97ba                	add	a5,a5,a4
    c0600cee:	078e                	slli	a5,a5,0x3
    c0600cf0:	873e                	mv	a4,a5
    c0600cf2:	e1843783          	ld	a5,-488(s0)
    c0600cf6:	97ba                	add	a5,a5,a4
    c0600cf8:	00d60733          	add	a4,a2,a3
    c0600cfc:	e798                	sd	a4,8(a5)
    c0600cfe:	fdc42703          	lw	a4,-36(s0)
    c0600d02:	87ba                	mv	a5,a4
    c0600d04:	0786                	slli	a5,a5,0x1
    c0600d06:	97ba                	add	a5,a5,a4
    c0600d08:	078e                	slli	a5,a5,0x3
    c0600d0a:	873e                	mv	a4,a5
    c0600d0c:	e1843783          	ld	a5,-488(s0)
    c0600d10:	97ba                	add	a5,a5,a4
    c0600d12:	6390                	ld	a2,0(a5)
    c0600d14:	fdc42703          	lw	a4,-36(s0)
    c0600d18:	87ba                	mv	a5,a4
    c0600d1a:	0786                	slli	a5,a5,0x1
    c0600d1c:	97ba                	add	a5,a5,a4
    c0600d1e:	078e                	slli	a5,a5,0x3
    c0600d20:	873e                	mv	a4,a5
    c0600d22:	e1843783          	ld	a5,-488(s0)
    c0600d26:	97ba                	add	a5,a5,a4
    c0600d28:	6798                	ld	a4,8(a5)
    c0600d2a:	fdc42783          	lw	a5,-36(s0)
    c0600d2e:	86ba                	mv	a3,a4
    c0600d30:	85be                	mv	a1,a5
    c0600d32:	00004517          	auipc	a0,0x4
    c0600d36:	87650513          	addi	a0,a0,-1930 # c06045a8 <_init_data_end+0x5a8>
    c0600d3a:	6cf000ef          	jal	ra,c0601c08 <printd>
    c0600d3e:	fdc42783          	lw	a5,-36(s0)
    c0600d42:	2785                	addiw	a5,a5,1
    c0600d44:	fcf42e23          	sw	a5,-36(s0)
    c0600d48:	fdc42703          	lw	a4,-36(s0)
    c0600d4c:	87ba                	mv	a5,a4
    c0600d4e:	0786                	slli	a5,a5,0x1
    c0600d50:	97ba                	add	a5,a5,a4
    c0600d52:	078e                	slli	a5,a5,0x3
    c0600d54:	873e                	mv	a4,a5
    c0600d56:	e1843783          	ld	a5,-488(s0)
    c0600d5a:	97ba                	add	a5,a5,a4
    c0600d5c:	639c                	ld	a5,0(a5)
    c0600d5e:	f795                	bnez	a5,c0600c8a <init_mem+0x154>
    c0600d60:	0000b797          	auipc	a5,0xb
    c0600d64:	6e878793          	addi	a5,a5,1768 # c060c448 <drv_addr_list>
    c0600d68:	e1843703          	ld	a4,-488(s0)
    c0600d6c:	e398                	sd	a4,0(a5)
    c0600d6e:	0000b797          	auipc	a5,0xb
    c0600d72:	6da78793          	addi	a5,a5,1754 # c060c448 <drv_addr_list>
    c0600d76:	6398                	ld	a4,0(a5)
    c0600d78:	0000b797          	auipc	a5,0xb
    c0600d7c:	6f878793          	addi	a5,a5,1784 # c060c470 <ENC_VA_PA_OFFSET>
    c0600d80:	639c                	ld	a5,0(a5)
    c0600d82:	973e                	add	a4,a4,a5
    c0600d84:	0000b797          	auipc	a5,0xb
    c0600d88:	6c478793          	addi	a5,a5,1732 # c060c448 <drv_addr_list>
    c0600d8c:	e398                	sd	a4,0(a5)
    c0600d8e:	0000b797          	auipc	a5,0xb
    c0600d92:	6ba78793          	addi	a5,a5,1722 # c060c448 <drv_addr_list>
    c0600d96:	639c                	ld	a5,0(a5)
    c0600d98:	e1843683          	ld	a3,-488(s0)
    c0600d9c:	0000b617          	auipc	a2,0xb
    c0600da0:	6ac60613          	addi	a2,a2,1708 # c060c448 <drv_addr_list>
    c0600da4:	85be                	mv	a1,a5
    c0600da6:	00004517          	auipc	a0,0x4
    c0600daa:	84250513          	addi	a0,a0,-1982 # c06045e8 <_init_data_end+0x5e8>
    c0600dae:	65b000ef          	jal	ra,c0601c08 <printd>
    c0600db2:	e1843703          	ld	a4,-488(s0)
    c0600db6:	6785                	lui	a5,0x1
    c0600db8:	5ff78793          	addi	a5,a5,1535 # 15ff <_start-0xc05fea01>
    c0600dbc:	973e                	add	a4,a4,a5
    c0600dbe:	77fd                	lui	a5,0xfffff
    c0600dc0:	8ff9                	and	a5,a5,a4
    c0600dc2:	faf43423          	sd	a5,-88(s0)
    c0600dc6:	001007b7          	lui	a5,0x100
    c0600dca:	faf43023          	sd	a5,-96(s0)
    c0600dce:	fa843703          	ld	a4,-88(s0)
    c0600dd2:	fa043783          	ld	a5,-96(s0)
    c0600dd6:	97ba                	add	a5,a5,a4
    c0600dd8:	f8f43c23          	sd	a5,-104(s0)
    c0600ddc:	fa843503          	ld	a0,-88(s0)
    c0600de0:	289010ef          	jal	ra,c0602868 <set_page_table_root>
    c0600de4:	f9843783          	ld	a5,-104(s0)
    c0600de8:	f8f43823          	sd	a5,-112(s0)
    c0600dec:	000817b7          	lui	a5,0x81
    c0600df0:	f8f43423          	sd	a5,-120(s0)
    c0600df4:	f9043703          	ld	a4,-112(s0)
    c0600df8:	f8843783          	ld	a5,-120(s0)
    c0600dfc:	97ba                	add	a5,a5,a4
    c0600dfe:	f8f43023          	sd	a5,-128(s0)
    c0600e02:	f8043783          	ld	a5,-128(s0)
    c0600e06:	f6f43c23          	sd	a5,-136(s0)
    c0600e0a:	e2843703          	ld	a4,-472(s0)
    c0600e0e:	008007b7          	lui	a5,0x800
    c0600e12:	97ba                	add	a5,a5,a4
    c0600e14:	f6f43823          	sd	a5,-144(s0)
    c0600e18:	f7043703          	ld	a4,-144(s0)
    c0600e1c:	f7843783          	ld	a5,-136(s0)
    c0600e20:	8f1d                	sub	a4,a4,a5
    c0600e22:	77fd                	lui	a5,0xfffff
    c0600e24:	8ff9                	and	a5,a5,a4
    c0600e26:	f6f43423          	sd	a5,-152(s0)
    c0600e2a:	f7043603          	ld	a2,-144(s0)
    c0600e2e:	f7843583          	ld	a1,-136(s0)
    c0600e32:	00003517          	auipc	a0,0x3
    c0600e36:	7fe50513          	addi	a0,a0,2046 # c0604630 <_init_data_end+0x630>
    c0600e3a:	5cf000ef          	jal	ra,c0601c08 <printd>
    c0600e3e:	f6843583          	ld	a1,-152(s0)
    c0600e42:	00004517          	auipc	a0,0x4
    c0600e46:	83650513          	addi	a0,a0,-1994 # c0604678 <_init_data_end+0x678>
    c0600e4a:	5bf000ef          	jal	ra,c0601c08 <printd>
    c0600e4e:	4605                	li	a2,1
    c0600e50:	f6843583          	ld	a1,-152(s0)
    c0600e54:	f7843503          	ld	a0,-136(s0)
    c0600e58:	316010ef          	jal	ra,c060216e <spa_init>
    c0600e5c:	00004517          	auipc	a0,0x4
    c0600e60:	84450513          	addi	a0,a0,-1980 # c06046a0 <_init_data_end+0x6a0>
    c0600e64:	5a5000ef          	jal	ra,c0601c08 <printd>
    c0600e68:	f7843583          	ld	a1,-136(s0)
    c0600e6c:	00004517          	auipc	a0,0x4
    c0600e70:	85450513          	addi	a0,a0,-1964 # c06046c0 <_init_data_end+0x6c0>
    c0600e74:	595000ef          	jal	ra,c0601c08 <printd>
    c0600e78:	e2843703          	ld	a4,-472(s0)
    c0600e7c:	e2043783          	ld	a5,-480(s0)
    c0600e80:	973e                	add	a4,a4,a5
    c0600e82:	6785                	lui	a5,0x1
    c0600e84:	17fd                	addi	a5,a5,-1
    c0600e86:	973e                	add	a4,a4,a5
    c0600e88:	77fd                	lui	a5,0xfffff
    c0600e8a:	8ff9                	and	a5,a5,a4
    c0600e8c:	f6f43023          	sd	a5,-160(s0)
    c0600e90:	00600737          	lui	a4,0x600
    c0600e94:	e2043783          	ld	a5,-480(s0)
    c0600e98:	40f707b3          	sub	a5,a4,a5
    c0600e9c:	f4f43c23          	sd	a5,-168(s0)
    c0600ea0:	f5843703          	ld	a4,-168(s0)
    c0600ea4:	77fd                	lui	a5,0xfffff
    c0600ea6:	8ff9                	and	a5,a5,a4
    c0600ea8:	4601                	li	a2,0
    c0600eaa:	85be                	mv	a1,a5
    c0600eac:	f6043503          	ld	a0,-160(s0)
    c0600eb0:	2be010ef          	jal	ra,c060216e <spa_init>
    c0600eb4:	f5843603          	ld	a2,-168(s0)
    c0600eb8:	f6043583          	ld	a1,-160(s0)
    c0600ebc:	00004517          	auipc	a0,0x4
    c0600ec0:	81c50513          	addi	a0,a0,-2020 # c06046d8 <_init_data_end+0x6d8>
    c0600ec4:	545000ef          	jal	ra,c0601c08 <printd>
    c0600ec8:	00004517          	auipc	a0,0x4
    c0600ecc:	85050513          	addi	a0,a0,-1968 # c0604718 <_init_data_end+0x718>
    c0600ed0:	539000ef          	jal	ra,c0601c08 <printd>
    c0600ed4:	07c020ef          	jal	ra,c0602f50 <all_zero>
    c0600ed8:	1b1010ef          	jal	ra,c0602888 <get_page_table_root>
    c0600edc:	87aa                	mv	a5,a0
    c0600ede:	85be                	mv	a1,a5
    c0600ee0:	00004517          	auipc	a0,0x4
    c0600ee4:	86850513          	addi	a0,a0,-1944 # c0604748 <_init_data_end+0x748>
    c0600ee8:	521000ef          	jal	ra,c0601c08 <printd>
    c0600eec:	0000b697          	auipc	a3,0xb
    c0600ef0:	56468693          	addi	a3,a3,1380 # c060c450 <prog_brk>
    c0600ef4:	4601                	li	a2,0
    c0600ef6:	e2843583          	ld	a1,-472(s0)
    c0600efa:	4501                	li	a0,0
    c0600efc:	c22ff0ef          	jal	ra,c060031e <elf_load>
    c0600f00:	f4a43823          	sd	a0,-176(s0)
    c0600f04:	e1843583          	ld	a1,-488(s0)
    c0600f08:	00004517          	auipc	a0,0x4
    c0600f0c:	87050513          	addi	a0,a0,-1936 # c0604778 <_init_data_end+0x778>
    c0600f10:	4f9000ef          	jal	ra,c0601c08 <printd>
    c0600f14:	e1843783          	ld	a5,-488(s0)
    c0600f18:	cbc5                	beqz	a5,c0600fc8 <init_mem+0x492>
    c0600f1a:	e1843783          	ld	a5,-488(s0)
    c0600f1e:	6398                	ld	a4,0(a5)
    c0600f20:	0000b797          	auipc	a5,0xb
    c0600f24:	55078793          	addi	a5,a5,1360 # c060c470 <ENC_VA_PA_OFFSET>
    c0600f28:	639c                	ld	a5,0(a5)
    c0600f2a:	8f1d                	sub	a4,a4,a5
    c0600f2c:	77fd                	lui	a5,0xfffff
    c0600f2e:	8ff9                	and	a5,a5,a4
    c0600f30:	f4f43423          	sd	a5,-184(s0)
    c0600f34:	e1843703          	ld	a4,-488(s0)
    c0600f38:	6785                	lui	a5,0x1
    c0600f3a:	5ff78793          	addi	a5,a5,1535 # 15ff <_start-0xc05fea01>
    c0600f3e:	973e                	add	a4,a4,a5
    c0600f40:	77fd                	lui	a5,0xfffff
    c0600f42:	8ff9                	and	a5,a5,a4
    c0600f44:	f4f43023          	sd	a5,-192(s0)
    c0600f48:	f4043703          	ld	a4,-192(s0)
    c0600f4c:	f4843783          	ld	a5,-184(s0)
    c0600f50:	40f707b3          	sub	a5,a4,a5
    c0600f54:	83b1                	srli	a5,a5,0xc
    c0600f56:	f2f43c23          	sd	a5,-200(s0)
    c0600f5a:	f4843603          	ld	a2,-184(s0)
    c0600f5e:	f4043583          	ld	a1,-192(s0)
    c0600f62:	00004517          	auipc	a0,0x4
    c0600f66:	83e50513          	addi	a0,a0,-1986 # c06047a0 <_init_data_end+0x7a0>
    c0600f6a:	49f000ef          	jal	ra,c0601c08 <printd>
    c0600f6e:	f3843583          	ld	a1,-200(s0)
    c0600f72:	00004517          	auipc	a0,0x4
    c0600f76:	86e50513          	addi	a0,a0,-1938 # c06047e0 <_init_data_end+0x7e0>
    c0600f7a:	48f000ef          	jal	ra,c0601c08 <printd>
    c0600f7e:	e1843783          	ld	a5,-488(s0)
    c0600f82:	6398                	ld	a4,0(a5)
    c0600f84:	77fd                	lui	a5,0xfffff
    c0600f86:	8ff9                	and	a5,a5,a4
    c0600f88:	473d                	li	a4,15
    c0600f8a:	f3843683          	ld	a3,-200(s0)
    c0600f8e:	f4843603          	ld	a2,-184(s0)
    c0600f92:	85be                	mv	a1,a5
    c0600f94:	4501                	li	a0,0
    c0600f96:	579010ef          	jal	ra,c0602d0e <map_page>
    c0600f9a:	0000b797          	auipc	a5,0xb
    c0600f9e:	4d678793          	addi	a5,a5,1238 # c060c470 <ENC_VA_PA_OFFSET>
    c0600fa2:	6398                	ld	a4,0(a5)
    c0600fa4:	f4843783          	ld	a5,-184(s0)
    c0600fa8:	97ba                	add	a5,a5,a4
    c0600faa:	853e                	mv	a0,a5
    c0600fac:	38b010ef          	jal	ra,c0602b36 <get_pa>
    c0600fb0:	87aa                	mv	a5,a0
    c0600fb2:	86be                	mv	a3,a5
    c0600fb4:	f4043603          	ld	a2,-192(s0)
    c0600fb8:	f4843583          	ld	a1,-184(s0)
    c0600fbc:	00004517          	auipc	a0,0x4
    c0600fc0:	84c50513          	addi	a0,a0,-1972 # c0604808 <_init_data_end+0x808>
    c0600fc4:	445000ef          	jal	ra,c0601c08 <printd>
    c0600fc8:	0000b797          	auipc	a5,0xb
    c0600fcc:	4a878793          	addi	a5,a5,1192 # c060c470 <ENC_VA_PA_OFFSET>
    c0600fd0:	6398                	ld	a4,0(a5)
    c0600fd2:	f6043783          	ld	a5,-160(s0)
    c0600fd6:	00f705b3          	add	a1,a4,a5
    c0600fda:	f5843783          	ld	a5,-168(s0)
    c0600fde:	83b1                	srli	a5,a5,0xc
    c0600fe0:	471d                	li	a4,7
    c0600fe2:	86be                	mv	a3,a5
    c0600fe4:	f6043603          	ld	a2,-160(s0)
    c0600fe8:	4501                	li	a0,0
    c0600fea:	525010ef          	jal	ra,c0602d0e <map_page>
    c0600fee:	f5843703          	ld	a4,-168(s0)
    c0600ff2:	77fd                	lui	a5,0xfffff
    c0600ff4:	8f7d                	and	a4,a4,a5
    c0600ff6:	f6043783          	ld	a5,-160(s0)
    c0600ffa:	00f704b3          	add	s1,a4,a5
    c0600ffe:	0000b797          	auipc	a5,0xb
    c0601002:	47278793          	addi	a5,a5,1138 # c060c470 <ENC_VA_PA_OFFSET>
    c0601006:	6398                	ld	a4,0(a5)
    c0601008:	f6043783          	ld	a5,-160(s0)
    c060100c:	97ba                	add	a5,a5,a4
    c060100e:	853e                	mv	a0,a5
    c0601010:	327010ef          	jal	ra,c0602b36 <get_pa>
    c0601014:	87aa                	mv	a5,a0
    c0601016:	86be                	mv	a3,a5
    c0601018:	8626                	mv	a2,s1
    c060101a:	f6043583          	ld	a1,-160(s0)
    c060101e:	00004517          	auipc	a0,0x4
    c0601022:	82250513          	addi	a0,a0,-2014 # c0604840 <_init_data_end+0x840>
    c0601026:	3e3000ef          	jal	ra,c0601c08 <printd>
    c060102a:	47c5                	li	a5,17
    c060102c:	f2f43823          	sd	a5,-208(s0)
    c0601030:	f3043583          	ld	a1,-208(s0)
    c0601034:	00004517          	auipc	a0,0x4
    c0601038:	84450513          	addi	a0,a0,-1980 # c0604878 <_init_data_end+0x878>
    c060103c:	3cd000ef          	jal	ra,c0601c08 <printd>
    c0601040:	002007b7          	lui	a5,0x200
    c0601044:	17fd                	addi	a5,a5,-1
    c0601046:	07c6                	slli	a5,a5,0x11
    c0601048:	f2f43423          	sd	a5,-216(s0)
    c060104c:	004007b7          	lui	a5,0x400
    c0601050:	17fd                	addi	a5,a5,-1
    c0601052:	07c2                	slli	a5,a5,0x10
    c0601054:	f2f43023          	sd	a5,-224(s0)
    c0601058:	f2043603          	ld	a2,-224(s0)
    c060105c:	f2843583          	ld	a1,-216(s0)
    c0601060:	00004517          	auipc	a0,0x4
    c0601064:	84850513          	addi	a0,a0,-1976 # c06048a8 <_init_data_end+0x8a8>
    c0601068:	3a1000ef          	jal	ra,c0601c08 <printd>
    c060106c:	4701                	li	a4,0
    c060106e:	46dd                	li	a3,23
    c0601070:	f3043603          	ld	a2,-208(s0)
    c0601074:	f2843583          	ld	a1,-216(s0)
    c0601078:	4501                	li	a0,0
    c060107a:	5cd010ef          	jal	ra,c0602e46 <alloc_page>
    c060107e:	f2043783          	ld	a5,-224(s0)
    c0601082:	f0f43c23          	sd	a5,-232(s0)
    c0601086:	fffff797          	auipc	a5,0xfffff
    c060108a:	f7a78793          	addi	a5,a5,-134 # c0600000 <_start>
    c060108e:	f0f43823          	sd	a5,-240(s0)
    c0601092:	00002797          	auipc	a5,0x2
    c0601096:	2b878793          	addi	a5,a5,696 # c060334a <_text_end>
    c060109a:	f0f43423          	sd	a5,-248(s0)
    c060109e:	f0843703          	ld	a4,-248(s0)
    c06010a2:	f1043783          	ld	a5,-240(s0)
    c06010a6:	40f707b3          	sub	a5,a4,a5
    c06010aa:	f0f43023          	sd	a5,-256(s0)
    c06010ae:	f0043703          	ld	a4,-256(s0)
    c06010b2:	6785                	lui	a5,0x1
    c06010b4:	17fd                	addi	a5,a5,-1
    c06010b6:	97ba                	add	a5,a5,a4
    c06010b8:	83b1                	srli	a5,a5,0xc
    c06010ba:	eef43c23          	sd	a5,-264(s0)
    c06010be:	0000b797          	auipc	a5,0xb
    c06010c2:	3b278793          	addi	a5,a5,946 # c060c470 <ENC_VA_PA_OFFSET>
    c06010c6:	6398                	ld	a4,0(a5)
    c06010c8:	f1043783          	ld	a5,-240(s0)
    c06010cc:	97ba                	add	a5,a5,a4
    c06010ce:	472d                	li	a4,11
    c06010d0:	ef843683          	ld	a3,-264(s0)
    c06010d4:	f1043603          	ld	a2,-240(s0)
    c06010d8:	85be                	mv	a1,a5
    c06010da:	4501                	li	a0,0
    c06010dc:	433010ef          	jal	ra,c0602d0e <map_page>
    c06010e0:	0000b797          	auipc	a5,0xb
    c06010e4:	39078793          	addi	a5,a5,912 # c060c470 <ENC_VA_PA_OFFSET>
    c06010e8:	6398                	ld	a4,0(a5)
    c06010ea:	f1043783          	ld	a5,-240(s0)
    c06010ee:	97ba                	add	a5,a5,a4
    c06010f0:	853e                	mv	a0,a5
    c06010f2:	245010ef          	jal	ra,c0602b36 <get_pa>
    c06010f6:	87aa                	mv	a5,a0
    c06010f8:	86be                	mv	a3,a5
    c06010fa:	f0843603          	ld	a2,-248(s0)
    c06010fe:	f1043583          	ld	a1,-240(s0)
    c0601102:	00003517          	auipc	a0,0x3
    c0601106:	7d650513          	addi	a0,a0,2006 # c06048d8 <_init_data_end+0x8d8>
    c060110a:	2ff000ef          	jal	ra,c0601c08 <printd>
    c060110e:	0000b797          	auipc	a5,0xb
    c0601112:	36278793          	addi	a5,a5,866 # c060c470 <ENC_VA_PA_OFFSET>
    c0601116:	6398                	ld	a4,0(a5)
    c0601118:	fa843783          	ld	a5,-88(s0)
    c060111c:	00f705b3          	add	a1,a4,a5
    c0601120:	fa043703          	ld	a4,-96(s0)
    c0601124:	f8843783          	ld	a5,-120(s0)
    c0601128:	97ba                	add	a5,a5,a4
    c060112a:	83b1                	srli	a5,a5,0xc
    c060112c:	471d                	li	a4,7
    c060112e:	86be                	mv	a3,a5
    c0601130:	fa843603          	ld	a2,-88(s0)
    c0601134:	4501                	li	a0,0
    c0601136:	3d9010ef          	jal	ra,c0602d0e <map_page>
    c060113a:	0000b797          	auipc	a5,0xb
    c060113e:	33678793          	addi	a5,a5,822 # c060c470 <ENC_VA_PA_OFFSET>
    c0601142:	6398                	ld	a4,0(a5)
    c0601144:	fa843783          	ld	a5,-88(s0)
    c0601148:	97ba                	add	a5,a5,a4
    c060114a:	853e                	mv	a0,a5
    c060114c:	1eb010ef          	jal	ra,c0602b36 <get_pa>
    c0601150:	87aa                	mv	a5,a0
    c0601152:	86be                	mv	a3,a5
    c0601154:	f8043603          	ld	a2,-128(s0)
    c0601158:	fa843583          	ld	a1,-88(s0)
    c060115c:	00003517          	auipc	a0,0x3
    c0601160:	7ac50513          	addi	a0,a0,1964 # c0604908 <_init_data_end+0x908>
    c0601164:	2a5000ef          	jal	ra,c0601c08 <printd>
    c0601168:	00003797          	auipc	a5,0x3
    c060116c:	e9878793          	addi	a5,a5,-360 # c0604000 <_init_data_end>
    c0601170:	eef43823          	sd	a5,-272(s0)
    c0601174:	00004797          	auipc	a5,0x4
    c0601178:	23078793          	addi	a5,a5,560 # c06053a4 <_rodata_end>
    c060117c:	eef43423          	sd	a5,-280(s0)
    c0601180:	ee843703          	ld	a4,-280(s0)
    c0601184:	ef043783          	ld	a5,-272(s0)
    c0601188:	40f707b3          	sub	a5,a4,a5
    c060118c:	eef43023          	sd	a5,-288(s0)
    c0601190:	ee043703          	ld	a4,-288(s0)
    c0601194:	6785                	lui	a5,0x1
    c0601196:	17fd                	addi	a5,a5,-1
    c0601198:	97ba                	add	a5,a5,a4
    c060119a:	83b1                	srli	a5,a5,0xc
    c060119c:	ecf43c23          	sd	a5,-296(s0)
    c06011a0:	0000b797          	auipc	a5,0xb
    c06011a4:	2d078793          	addi	a5,a5,720 # c060c470 <ENC_VA_PA_OFFSET>
    c06011a8:	6398                	ld	a4,0(a5)
    c06011aa:	ef043783          	ld	a5,-272(s0)
    c06011ae:	97ba                	add	a5,a5,a4
    c06011b0:	470d                	li	a4,3
    c06011b2:	ed843683          	ld	a3,-296(s0)
    c06011b6:	ef043603          	ld	a2,-272(s0)
    c06011ba:	85be                	mv	a1,a5
    c06011bc:	4501                	li	a0,0
    c06011be:	351010ef          	jal	ra,c0602d0e <map_page>
    c06011c2:	0000b797          	auipc	a5,0xb
    c06011c6:	2ae78793          	addi	a5,a5,686 # c060c470 <ENC_VA_PA_OFFSET>
    c06011ca:	6398                	ld	a4,0(a5)
    c06011cc:	ef043783          	ld	a5,-272(s0)
    c06011d0:	97ba                	add	a5,a5,a4
    c06011d2:	853e                	mv	a0,a5
    c06011d4:	163010ef          	jal	ra,c0602b36 <get_pa>
    c06011d8:	87aa                	mv	a5,a0
    c06011da:	86be                	mv	a3,a5
    c06011dc:	ee843603          	ld	a2,-280(s0)
    c06011e0:	ef043583          	ld	a1,-272(s0)
    c06011e4:	00003517          	auipc	a0,0x3
    c06011e8:	76450513          	addi	a0,a0,1892 # c0604948 <_init_data_end+0x948>
    c06011ec:	21d000ef          	jal	ra,c0601c08 <printd>
    c06011f0:	00005797          	auipc	a5,0x5
    c06011f4:	e1078793          	addi	a5,a5,-496 # c0606000 <peri_reg_list>
    c06011f8:	ecf43823          	sd	a5,-304(s0)
    c06011fc:	0000b797          	auipc	a5,0xb
    c0601200:	27c78793          	addi	a5,a5,636 # c060c478 <_bss_end>
    c0601204:	ecf43423          	sd	a5,-312(s0)
    c0601208:	ec843703          	ld	a4,-312(s0)
    c060120c:	ed043783          	ld	a5,-304(s0)
    c0601210:	40f707b3          	sub	a5,a4,a5
    c0601214:	ecf43023          	sd	a5,-320(s0)
    c0601218:	ec043703          	ld	a4,-320(s0)
    c060121c:	6785                	lui	a5,0x1
    c060121e:	17fd                	addi	a5,a5,-1
    c0601220:	97ba                	add	a5,a5,a4
    c0601222:	83b1                	srli	a5,a5,0xc
    c0601224:	eaf43c23          	sd	a5,-328(s0)
    c0601228:	0000b797          	auipc	a5,0xb
    c060122c:	24878793          	addi	a5,a5,584 # c060c470 <ENC_VA_PA_OFFSET>
    c0601230:	6398                	ld	a4,0(a5)
    c0601232:	ed043783          	ld	a5,-304(s0)
    c0601236:	97ba                	add	a5,a5,a4
    c0601238:	471d                	li	a4,7
    c060123a:	eb843683          	ld	a3,-328(s0)
    c060123e:	ed043603          	ld	a2,-304(s0)
    c0601242:	85be                	mv	a1,a5
    c0601244:	4501                	li	a0,0
    c0601246:	2c9010ef          	jal	ra,c0602d0e <map_page>
    c060124a:	0000b797          	auipc	a5,0xb
    c060124e:	22678793          	addi	a5,a5,550 # c060c470 <ENC_VA_PA_OFFSET>
    c0601252:	6398                	ld	a4,0(a5)
    c0601254:	ed043783          	ld	a5,-304(s0)
    c0601258:	97ba                	add	a5,a5,a4
    c060125a:	853e                	mv	a0,a5
    c060125c:	0db010ef          	jal	ra,c0602b36 <get_pa>
    c0601260:	87aa                	mv	a5,a0
    c0601262:	86be                	mv	a3,a5
    c0601264:	ec843603          	ld	a2,-312(s0)
    c0601268:	ed043583          	ld	a1,-304(s0)
    c060126c:	00003517          	auipc	a0,0x3
    c0601270:	70c50513          	addi	a0,a0,1804 # c0604978 <_init_data_end+0x978>
    c0601274:	195000ef          	jal	ra,c0601c08 <printd>
    c0601278:	00003797          	auipc	a5,0x3
    c060127c:	d8878793          	addi	a5,a5,-632 # c0604000 <_init_data_end>
    c0601280:	eaf43823          	sd	a5,-336(s0)
    c0601284:	00003797          	auipc	a5,0x3
    c0601288:	d7c78793          	addi	a5,a5,-644 # c0604000 <_init_data_end>
    c060128c:	eaf43423          	sd	a5,-344(s0)
    c0601290:	ea843703          	ld	a4,-344(s0)
    c0601294:	eb043783          	ld	a5,-336(s0)
    c0601298:	40f707b3          	sub	a5,a4,a5
    c060129c:	eaf43023          	sd	a5,-352(s0)
    c06012a0:	ea043703          	ld	a4,-352(s0)
    c06012a4:	6785                	lui	a5,0x1
    c06012a6:	17fd                	addi	a5,a5,-1
    c06012a8:	97ba                	add	a5,a5,a4
    c06012aa:	83b1                	srli	a5,a5,0xc
    c06012ac:	e8f43c23          	sd	a5,-360(s0)
    c06012b0:	0000b797          	auipc	a5,0xb
    c06012b4:	1c078793          	addi	a5,a5,448 # c060c470 <ENC_VA_PA_OFFSET>
    c06012b8:	6398                	ld	a4,0(a5)
    c06012ba:	eb043783          	ld	a5,-336(s0)
    c06012be:	97ba                	add	a5,a5,a4
    c06012c0:	471d                	li	a4,7
    c06012c2:	e9843683          	ld	a3,-360(s0)
    c06012c6:	eb043603          	ld	a2,-336(s0)
    c06012ca:	85be                	mv	a1,a5
    c06012cc:	4501                	li	a0,0
    c06012ce:	241010ef          	jal	ra,c0602d0e <map_page>
    c06012d2:	0000b797          	auipc	a5,0xb
    c06012d6:	19e78793          	addi	a5,a5,414 # c060c470 <ENC_VA_PA_OFFSET>
    c06012da:	6398                	ld	a4,0(a5)
    c06012dc:	eb043783          	ld	a5,-336(s0)
    c06012e0:	97ba                	add	a5,a5,a4
    c06012e2:	853e                	mv	a0,a5
    c06012e4:	053010ef          	jal	ra,c0602b36 <get_pa>
    c06012e8:	87aa                	mv	a5,a0
    c06012ea:	86be                	mv	a3,a5
    c06012ec:	ea843603          	ld	a2,-344(s0)
    c06012f0:	eb043583          	ld	a1,-336(s0)
    c06012f4:	00003517          	auipc	a0,0x3
    c06012f8:	6b450513          	addi	a0,a0,1716 # c06049a8 <_init_data_end+0x9a8>
    c06012fc:	10d000ef          	jal	ra,c0601c08 <printd>
    c0601300:	00005797          	auipc	a5,0x5
    c0601304:	d0078793          	addi	a5,a5,-768 # c0606000 <peri_reg_list>
    c0601308:	e8f43823          	sd	a5,-368(s0)
    c060130c:	00005797          	auipc	a5,0x5
    c0601310:	cf478793          	addi	a5,a5,-780 # c0606000 <peri_reg_list>
    c0601314:	e8f43423          	sd	a5,-376(s0)
    c0601318:	e8843703          	ld	a4,-376(s0)
    c060131c:	e9043783          	ld	a5,-368(s0)
    c0601320:	40f707b3          	sub	a5,a4,a5
    c0601324:	e8f43023          	sd	a5,-384(s0)
    c0601328:	e8043703          	ld	a4,-384(s0)
    c060132c:	6785                	lui	a5,0x1
    c060132e:	17fd                	addi	a5,a5,-1
    c0601330:	97ba                	add	a5,a5,a4
    c0601332:	83b1                	srli	a5,a5,0xc
    c0601334:	e6f43c23          	sd	a5,-392(s0)
    c0601338:	0000b797          	auipc	a5,0xb
    c060133c:	13878793          	addi	a5,a5,312 # c060c470 <ENC_VA_PA_OFFSET>
    c0601340:	6398                	ld	a4,0(a5)
    c0601342:	e9043783          	ld	a5,-368(s0)
    c0601346:	97ba                	add	a5,a5,a4
    c0601348:	471d                	li	a4,7
    c060134a:	e7843683          	ld	a3,-392(s0)
    c060134e:	e9043603          	ld	a2,-368(s0)
    c0601352:	85be                	mv	a1,a5
    c0601354:	4501                	li	a0,0
    c0601356:	1b9010ef          	jal	ra,c0602d0e <map_page>
    c060135a:	0000b797          	auipc	a5,0xb
    c060135e:	11678793          	addi	a5,a5,278 # c060c470 <ENC_VA_PA_OFFSET>
    c0601362:	6398                	ld	a4,0(a5)
    c0601364:	e9043783          	ld	a5,-368(s0)
    c0601368:	97ba                	add	a5,a5,a4
    c060136a:	853e                	mv	a0,a5
    c060136c:	7ca010ef          	jal	ra,c0602b36 <get_pa>
    c0601370:	87aa                	mv	a5,a0
    c0601372:	86be                	mv	a3,a5
    c0601374:	e8843603          	ld	a2,-376(s0)
    c0601378:	e9043583          	ld	a1,-368(s0)
    c060137c:	00003517          	auipc	a0,0x3
    c0601380:	66450513          	addi	a0,a0,1636 # c06049e0 <_init_data_end+0x9e0>
    c0601384:	085000ef          	jal	ra,c0601c08 <printd>
    c0601388:	e4843783          	ld	a5,-440(s0)
    c060138c:	87c6                	mv	a5,a7
    c060138e:	e4843783          	ld	a5,-440(s0)
    c0601392:	85be                	mv	a1,a5
    c0601394:	00003517          	auipc	a0,0x3
    c0601398:	67c50513          	addi	a0,a0,1660 # c0604a10 <_init_data_end+0xa10>
    c060139c:	06d000ef          	jal	ra,c0601c08 <printd>
    c06013a0:	0000b797          	auipc	a5,0xb
    c06013a4:	0d078793          	addi	a5,a5,208 # c060c470 <ENC_VA_PA_OFFSET>
    c06013a8:	6398                	ld	a4,0(a5)
    c06013aa:	f7843783          	ld	a5,-136(s0)
    c06013ae:	00f705b3          	add	a1,a4,a5
    c06013b2:	f6843783          	ld	a5,-152(s0)
    c06013b6:	83b1                	srli	a5,a5,0xc
    c06013b8:	471d                	li	a4,7
    c06013ba:	86be                	mv	a3,a5
    c06013bc:	f7843603          	ld	a2,-136(s0)
    c06013c0:	4501                	li	a0,0
    c06013c2:	14d010ef          	jal	ra,c0602d0e <map_page>
    c06013c6:	f6843703          	ld	a4,-152(s0)
    c06013ca:	77fd                	lui	a5,0xfffff
    c06013cc:	8f7d                	and	a4,a4,a5
    c06013ce:	f7843783          	ld	a5,-136(s0)
    c06013d2:	00f704b3          	add	s1,a4,a5
    c06013d6:	0000b797          	auipc	a5,0xb
    c06013da:	09a78793          	addi	a5,a5,154 # c060c470 <ENC_VA_PA_OFFSET>
    c06013de:	6398                	ld	a4,0(a5)
    c06013e0:	f7843783          	ld	a5,-136(s0)
    c06013e4:	97ba                	add	a5,a5,a4
    c06013e6:	853e                	mv	a0,a5
    c06013e8:	74e010ef          	jal	ra,c0602b36 <get_pa>
    c06013ec:	87aa                	mv	a5,a0
    c06013ee:	86be                	mv	a3,a5
    c06013f0:	8626                	mv	a2,s1
    c06013f2:	f7843583          	ld	a1,-136(s0)
    c06013f6:	00003517          	auipc	a0,0x3
    c06013fa:	63a50513          	addi	a0,a0,1594 # c0604a30 <_init_data_end+0xa30>
    c06013fe:	00b000ef          	jal	ra,c0601c08 <printd>
    c0601402:	47a1                	li	a5,8
    c0601404:	e6f43823          	sd	a5,-400(s0)
    c0601408:	e7043583          	ld	a1,-400(s0)
    c060140c:	00003517          	auipc	a0,0x3
    c0601410:	65c50513          	addi	a0,a0,1628 # c0604a68 <_init_data_end+0xa68>
    c0601414:	7f4000ef          	jal	ra,c0601c08 <printd>
    c0601418:	15fff7b7          	lui	a5,0x15fff
    c060141c:	078e                	slli	a5,a5,0x3
    c060141e:	e6f43423          	sd	a5,-408(s0)
    c0601422:	4705                	li	a4,1
    c0601424:	469d                	li	a3,7
    c0601426:	e7043603          	ld	a2,-400(s0)
    c060142a:	e6843583          	ld	a1,-408(s0)
    c060142e:	4501                	li	a0,0
    c0601430:	217010ef          	jal	ra,c0602e46 <alloc_page>
    c0601434:	e6843703          	ld	a4,-408(s0)
    c0601438:	67a1                	lui	a5,0x8
    c060143a:	97ba                	add	a5,a5,a4
    c060143c:	e6f43423          	sd	a5,-408(s0)
    c0601440:	448010ef          	jal	ra,c0602888 <get_page_table_root>
    c0601444:	87aa                	mv	a5,a0
    c0601446:	863e                	mv	a2,a5
    c0601448:	e6843583          	ld	a1,-408(s0)
    c060144c:	00003517          	auipc	a0,0x3
    c0601450:	64c50513          	addi	a0,a0,1612 # c0604a98 <_init_data_end+0xa98>
    c0601454:	7b4000ef          	jal	ra,c0601c08 <printd>
    c0601458:	f1843583          	ld	a1,-232(s0)
    c060145c:	00003517          	auipc	a0,0x3
    c0601460:	67450513          	addi	a0,a0,1652 # c0604ad0 <_init_data_end+0xad0>
    c0601464:	7a4000ef          	jal	ra,c0601c08 <printd>
    c0601468:	420010ef          	jal	ra,c0602888 <get_page_table_root>
    c060146c:	87aa                	mv	a5,a0
    c060146e:	83b1                	srli	a5,a5,0xc
    c0601470:	e6f43023          	sd	a5,-416(s0)
    c0601474:	e6043703          	ld	a4,-416(s0)
    c0601478:	57fd                	li	a5,-1
    c060147a:	17fe                	slli	a5,a5,0x3f
    c060147c:	8fd9                	or	a5,a5,a4
    c060147e:	e6f43023          	sd	a5,-416(s0)
    c0601482:	100027f3          	csrr	a5,sstatus
    c0601486:	e4f43c23          	sd	a5,-424(s0)
    c060148a:	e5843783          	ld	a5,-424(s0)
    c060148e:	e4f43823          	sd	a5,-432(s0)
    c0601492:	e5043703          	ld	a4,-432(s0)
    c0601496:	000407b7          	lui	a5,0x40
    c060149a:	8fd9                	or	a5,a5,a4
    c060149c:	e4f43823          	sd	a5,-432(s0)
    c06014a0:	e5043783          	ld	a5,-432(s0)
    c06014a4:	10079073          	csrw	sstatus,a5
    c06014a8:	de6ff0ef          	jal	ra,c0600a8e <loop_test>
    c06014ac:	da4ff0ef          	jal	ra,c0600a50 <page_map_register>
    c06014b0:	0000b797          	auipc	a5,0xb
    c06014b4:	fb078793          	addi	a5,a5,-80 # c060c460 <va_top>
    c06014b8:	6398                	ld	a4,0(a5)
    c06014ba:	008007b7          	lui	a5,0x800
    c06014be:	973e                	add	a4,a4,a5
    c06014c0:	0000b797          	auipc	a5,0xb
    c06014c4:	fa078793          	addi	a5,a5,-96 # c060c460 <va_top>
    c06014c8:	e398                	sd	a4,0(a5)
    c06014ca:	0000b797          	auipc	a5,0xb
    c06014ce:	f9e78793          	addi	a5,a5,-98 # c060c468 <ENC_PA_START>
    c06014d2:	6394                	ld	a3,0(a5)
    c06014d4:	0000b797          	auipc	a5,0xb
    c06014d8:	f9478793          	addi	a5,a5,-108 # c060c468 <ENC_PA_START>
    c06014dc:	6398                	ld	a4,0(a5)
    c06014de:	008007b7          	lui	a5,0x800
    c06014e2:	97ba                	add	a5,a5,a4
    c06014e4:	85be                	mv	a1,a5
    c06014e6:	8536                	mv	a0,a3
    c06014e8:	08f000ef          	jal	ra,c0601d76 <flush_dcache_range>
    c06014ec:	e6043783          	ld	a5,-416(s0)
    c06014f0:	853e                	mv	a0,a5
    c06014f2:	e6843783          	ld	a5,-408(s0)
    c06014f6:	85be                	mv	a1,a5
    c06014f8:	f5043783          	ld	a5,-176(s0)
    c06014fc:	863e                	mv	a2,a5
    c06014fe:	f1843783          	ld	a5,-232(s0)
    c0601502:	86be                	mv	a3,a5
    c0601504:	0001                	nop
    c0601506:	70fe                	ld	ra,504(sp)
    c0601508:	745e                	ld	s0,496(sp)
    c060150a:	74be                	ld	s1,488(sp)
    c060150c:	20010113          	addi	sp,sp,512
    c0601510:	8082                	ret

00000000c0601512 <ebi_fstat>:
    c0601512:	7179                	addi	sp,sp,-48
    c0601514:	f422                	sd	s0,40(sp)
    c0601516:	1800                	addi	s0,sp,48
    c0601518:	fca43c23          	sd	a0,-40(s0)
    c060151c:	fcb43823          	sd	a1,-48(s0)
    c0601520:	fd043783          	ld	a5,-48(s0)
    c0601524:	fef43423          	sd	a5,-24(s0)
    c0601528:	fd843703          	ld	a4,-40(s0)
    c060152c:	4791                	li	a5,4
    c060152e:	00e7f463          	bgeu	a5,a4,c0601536 <ebi_fstat+0x24>
    c0601532:	57fd                	li	a5,-1
    c0601534:	a8b9                	j	c0601592 <ebi_fstat+0x80>
    c0601536:	fe843783          	ld	a5,-24(s0)
    c060153a:	4769                	li	a4,26
    c060153c:	e398                	sd	a4,0(a5)
    c060153e:	fe843783          	ld	a5,-24(s0)
    c0601542:	4719                	li	a4,6
    c0601544:	e798                	sd	a4,8(a5)
    c0601546:	fe843783          	ld	a5,-24(s0)
    c060154a:	4705                	li	a4,1
    c060154c:	cbd8                	sw	a4,20(a5)
    c060154e:	fe843783          	ld	a5,-24(s0)
    c0601552:	1a000713          	li	a4,416
    c0601556:	cb98                	sw	a4,16(a5)
    c0601558:	fe843783          	ld	a5,-24(s0)
    c060155c:	3e800713          	li	a4,1000
    c0601560:	cf98                	sw	a4,24(a5)
    c0601562:	fe843783          	ld	a5,-24(s0)
    c0601566:	4715                	li	a4,5
    c0601568:	cfd8                	sw	a4,28(a5)
    c060156a:	fe843783          	ld	a5,-24(s0)
    c060156e:	6725                	lui	a4,0x9
    c0601570:	80370713          	addi	a4,a4,-2045 # 8803 <_start-0xc05f77fd>
    c0601574:	f398                	sd	a4,32(a5)
    c0601576:	fe843783          	ld	a5,-24(s0)
    c060157a:	0207b823          	sd	zero,48(a5) # 800030 <_start-0xbfdfffd0>
    c060157e:	fe843783          	ld	a5,-24(s0)
    c0601582:	40000713          	li	a4,1024
    c0601586:	df98                	sw	a4,56(a5)
    c0601588:	fe843783          	ld	a5,-24(s0)
    c060158c:	0407b023          	sd	zero,64(a5)
    c0601590:	4781                	li	a5,0
    c0601592:	853e                	mv	a0,a5
    c0601594:	7422                	ld	s0,40(sp)
    c0601596:	6145                	addi	sp,sp,48
    c0601598:	8082                	ret

00000000c060159a <ebi_brk>:
    c060159a:	7179                	addi	sp,sp,-48
    c060159c:	f406                	sd	ra,40(sp)
    c060159e:	f022                	sd	s0,32(sp)
    c06015a0:	1800                	addi	s0,sp,48
    c06015a2:	fca43c23          	sd	a0,-40(s0)
    c06015a6:	fd843783          	ld	a5,-40(s0)
    c06015aa:	eb81                	bnez	a5,c06015ba <ebi_brk+0x20>
    c06015ac:	0000b797          	auipc	a5,0xb
    c06015b0:	ea478793          	addi	a5,a5,-348 # c060c450 <prog_brk>
    c06015b4:	639c                	ld	a5,0(a5)
    c06015b6:	2781                	sext.w	a5,a5
    c06015b8:	a8d1                	j	c060168c <ebi_brk+0xf2>
    c06015ba:	0000b797          	auipc	a5,0xb
    c06015be:	e9678793          	addi	a5,a5,-362 # c060c450 <prog_brk>
    c06015c2:	639c                	ld	a5,0(a5)
    c06015c4:	85be                	mv	a1,a5
    c06015c6:	00003517          	auipc	a0,0x3
    c06015ca:	53250513          	addi	a0,a0,1330 # c0604af8 <_init_data_end+0xaf8>
    c06015ce:	63a000ef          	jal	ra,c0601c08 <printd>
    c06015d2:	fd843583          	ld	a1,-40(s0)
    c06015d6:	00003517          	auipc	a0,0x3
    c06015da:	55250513          	addi	a0,a0,1362 # c0604b28 <_init_data_end+0xb28>
    c06015de:	62a000ef          	jal	ra,c0601c08 <printd>
    c06015e2:	0000b797          	auipc	a5,0xb
    c06015e6:	e6e78793          	addi	a5,a5,-402 # c060c450 <prog_brk>
    c06015ea:	6398                	ld	a4,0(a5)
    c06015ec:	6785                	lui	a5,0x1
    c06015ee:	17fd                	addi	a5,a5,-1
    c06015f0:	973e                	add	a4,a4,a5
    c06015f2:	77fd                	lui	a5,0xfffff
    c06015f4:	8ff9                	and	a5,a5,a4
    c06015f6:	fd843703          	ld	a4,-40(s0)
    c06015fa:	06e7f963          	bgeu	a5,a4,c060166c <ebi_brk+0xd2>
    c06015fe:	00003517          	auipc	a0,0x3
    c0601602:	53a50513          	addi	a0,a0,1338 # c0604b38 <_init_data_end+0xb38>
    c0601606:	602000ef          	jal	ra,c0601c08 <printd>
    c060160a:	0000b797          	auipc	a5,0xb
    c060160e:	e4678793          	addi	a5,a5,-442 # c060c450 <prog_brk>
    c0601612:	639c                	ld	a5,0(a5)
    c0601614:	fd843703          	ld	a4,-40(s0)
    c0601618:	8f1d                	sub	a4,a4,a5
    c060161a:	6785                	lui	a5,0x1
    c060161c:	17fd                	addi	a5,a5,-1
    c060161e:	97ba                	add	a5,a5,a4
    c0601620:	83b1                	srli	a5,a5,0xc
    c0601622:	fef43423          	sd	a5,-24(s0)
    c0601626:	fe843583          	ld	a1,-24(s0)
    c060162a:	00003517          	auipc	a0,0x3
    c060162e:	51e50513          	addi	a0,a0,1310 # c0604b48 <_init_data_end+0xb48>
    c0601632:	5d6000ef          	jal	ra,c0601c08 <printd>
    c0601636:	0000b797          	auipc	a5,0xb
    c060163a:	e1a78793          	addi	a5,a5,-486 # c060c450 <prog_brk>
    c060163e:	6398                	ld	a4,0(a5)
    c0601640:	6785                	lui	a5,0x1
    c0601642:	17fd                	addi	a5,a5,-1
    c0601644:	973e                	add	a4,a4,a5
    c0601646:	77fd                	lui	a5,0xfffff
    c0601648:	00f775b3          	and	a1,a4,a5
    c060164c:	4701                	li	a4,0
    c060164e:	4785                	li	a5,1
    c0601650:	17fa                	slli	a5,a5,0x3e
    c0601652:	01678693          	addi	a3,a5,22 # fffffffffffff016 <_temp_stack_end+0xffffffff3f9f1016>
    c0601656:	fe843603          	ld	a2,-24(s0)
    c060165a:	4501                	li	a0,0
    c060165c:	7ea010ef          	jal	ra,c0602e46 <alloc_page>
    c0601660:	00003517          	auipc	a0,0x3
    c0601664:	50850513          	addi	a0,a0,1288 # c0604b68 <_init_data_end+0xb68>
    c0601668:	5a0000ef          	jal	ra,c0601c08 <printd>
    c060166c:	0000b797          	auipc	a5,0xb
    c0601670:	de478793          	addi	a5,a5,-540 # c060c450 <prog_brk>
    c0601674:	fd843703          	ld	a4,-40(s0)
    c0601678:	e398                	sd	a4,0(a5)
    c060167a:	00003517          	auipc	a0,0x3
    c060167e:	4fe50513          	addi	a0,a0,1278 # c0604b78 <_init_data_end+0xb78>
    c0601682:	586000ef          	jal	ra,c0601c08 <printd>
    c0601686:	fd843783          	ld	a5,-40(s0)
    c060168a:	2781                	sext.w	a5,a5
    c060168c:	853e                	mv	a0,a5
    c060168e:	70a2                	ld	ra,40(sp)
    c0601690:	7402                	ld	s0,32(sp)
    c0601692:	6145                	addi	sp,sp,48
    c0601694:	8082                	ret

00000000c0601696 <ebi_write>:
    c0601696:	7179                	addi	sp,sp,-48
    c0601698:	f406                	sd	ra,40(sp)
    c060169a:	f022                	sd	s0,32(sp)
    c060169c:	1800                	addi	s0,sp,48
    c060169e:	fca43c23          	sd	a0,-40(s0)
    c06016a2:	fcb43823          	sd	a1,-48(s0)
    c06016a6:	0000b797          	auipc	a5,0xb
    c06016aa:	da278793          	addi	a5,a5,-606 # c060c448 <drv_addr_list>
    c06016ae:	639c                	ld	a5,0(a5)
    c06016b0:	639c                	ld	a5,0(a5)
    c06016b2:	fef43023          	sd	a5,-32(s0)
    c06016b6:	fd843703          	ld	a4,-40(s0)
    c06016ba:	4785                	li	a5,1
    c06016bc:	02f71c63          	bne	a4,a5,c06016f4 <ebi_write+0x5e>
    c06016c0:	fd043783          	ld	a5,-48(s0)
    c06016c4:	fef43423          	sd	a5,-24(s0)
    c06016c8:	a00d                	j	c06016ea <ebi_write+0x54>
    c06016ca:	fe843783          	ld	a5,-24(s0)
    c06016ce:	0007c783          	lbu	a5,0(a5)
    c06016d2:	fe043703          	ld	a4,-32(s0)
    c06016d6:	4681                	li	a3,0
    c06016d8:	4601                	li	a2,0
    c06016da:	85be                	mv	a1,a5
    c06016dc:	4505                	li	a0,1
    c06016de:	9702                	jalr	a4
    c06016e0:	fe843783          	ld	a5,-24(s0)
    c06016e4:	0785                	addi	a5,a5,1
    c06016e6:	fef43423          	sd	a5,-24(s0)
    c06016ea:	fe843783          	ld	a5,-24(s0)
    c06016ee:	0007c783          	lbu	a5,0(a5)
    c06016f2:	ffe1                	bnez	a5,c06016ca <ebi_write+0x34>
    c06016f4:	4781                	li	a5,0
    c06016f6:	853e                	mv	a0,a5
    c06016f8:	70a2                	ld	ra,40(sp)
    c06016fa:	7402                	ld	s0,32(sp)
    c06016fc:	6145                	addi	sp,sp,48
    c06016fe:	8082                	ret

00000000c0601700 <ebi_close>:
    c0601700:	1101                	addi	sp,sp,-32
    c0601702:	ec22                	sd	s0,24(sp)
    c0601704:	1000                	addi	s0,sp,32
    c0601706:	fea43423          	sd	a0,-24(s0)
    c060170a:	4781                	li	a5,0
    c060170c:	853e                	mv	a0,a5
    c060170e:	6462                	ld	s0,24(sp)
    c0601710:	6105                	addi	sp,sp,32
    c0601712:	8082                	ret

00000000c0601714 <ebi_gettimeofday>:
    c0601714:	1101                	addi	sp,sp,-32
    c0601716:	ec22                	sd	s0,24(sp)
    c0601718:	1000                	addi	s0,sp,32
    c060171a:	fea43423          	sd	a0,-24(s0)
    c060171e:	feb43023          	sd	a1,-32(s0)
    c0601722:	4781                	li	a5,0
    c0601724:	853e                	mv	a0,a5
    c0601726:	6462                	ld	s0,24(sp)
    c0601728:	6105                	addi	sp,sp,32
    c060172a:	8082                	ret

00000000c060172c <vsnprintf>:
    c060172c:	7119                	addi	sp,sp,-128
    c060172e:	fca2                	sd	s0,120(sp)
    c0601730:	0100                	addi	s0,sp,128
    c0601732:	f8a43c23          	sd	a0,-104(s0)
    c0601736:	f8b43823          	sd	a1,-112(s0)
    c060173a:	f8c43423          	sd	a2,-120(s0)
    c060173e:	f8d43023          	sd	a3,-128(s0)
    c0601742:	fe0407a3          	sb	zero,-17(s0)
    c0601746:	fe040723          	sb	zero,-18(s0)
    c060174a:	fe043023          	sd	zero,-32(s0)
    c060174e:	ae59                	j	c0601ae4 <vsnprintf+0x3b8>
    c0601750:	fef44783          	lbu	a5,-17(s0)
    c0601754:	0ff7f793          	andi	a5,a5,255
    c0601758:	32078b63          	beqz	a5,c0601a8e <vsnprintf+0x362>
    c060175c:	f8843783          	ld	a5,-120(s0)
    c0601760:	0007c783          	lbu	a5,0(a5)
    c0601764:	2781                	sext.w	a5,a5
    c0601766:	f9d7869b          	addiw	a3,a5,-99
    c060176a:	0006871b          	sext.w	a4,a3
    c060176e:	47d5                	li	a5,21
    c0601770:	36e7e463          	bltu	a5,a4,c0601ad8 <vsnprintf+0x3ac>
    c0601774:	02069793          	slli	a5,a3,0x20
    c0601778:	9381                	srli	a5,a5,0x20
    c060177a:	00279713          	slli	a4,a5,0x2
    c060177e:	00003797          	auipc	a5,0x3
    c0601782:	41a78793          	addi	a5,a5,1050 # c0604b98 <_init_data_end+0xb98>
    c0601786:	97ba                	add	a5,a5,a4
    c0601788:	439c                	lw	a5,0(a5)
    c060178a:	0007871b          	sext.w	a4,a5
    c060178e:	00003797          	auipc	a5,0x3
    c0601792:	40a78793          	addi	a5,a5,1034 # c0604b98 <_init_data_end+0xb98>
    c0601796:	97ba                	add	a5,a5,a4
    c0601798:	8782                	jr	a5
    c060179a:	4785                	li	a5,1
    c060179c:	fef40723          	sb	a5,-18(s0)
    c06017a0:	ae2d                	j	c0601ada <vsnprintf+0x3ae>
    c06017a2:	4785                	li	a5,1
    c06017a4:	fef40723          	sb	a5,-18(s0)
    c06017a8:	fe043783          	ld	a5,-32(s0)
    c06017ac:	0785                	addi	a5,a5,1
    c06017ae:	fef43023          	sd	a5,-32(s0)
    c06017b2:	fe043703          	ld	a4,-32(s0)
    c06017b6:	f9043783          	ld	a5,-112(s0)
    c06017ba:	00f77c63          	bgeu	a4,a5,c06017d2 <vsnprintf+0xa6>
    c06017be:	fe043783          	ld	a5,-32(s0)
    c06017c2:	17fd                	addi	a5,a5,-1
    c06017c4:	f9843703          	ld	a4,-104(s0)
    c06017c8:	97ba                	add	a5,a5,a4
    c06017ca:	03000713          	li	a4,48
    c06017ce:	00e78023          	sb	a4,0(a5)
    c06017d2:	fe043783          	ld	a5,-32(s0)
    c06017d6:	0785                	addi	a5,a5,1
    c06017d8:	fef43023          	sd	a5,-32(s0)
    c06017dc:	fe043703          	ld	a4,-32(s0)
    c06017e0:	f9043783          	ld	a5,-112(s0)
    c06017e4:	00f77c63          	bgeu	a4,a5,c06017fc <vsnprintf+0xd0>
    c06017e8:	fe043783          	ld	a5,-32(s0)
    c06017ec:	17fd                	addi	a5,a5,-1
    c06017ee:	f9843703          	ld	a4,-104(s0)
    c06017f2:	97ba                	add	a5,a5,a4
    c06017f4:	07800713          	li	a4,120
    c06017f8:	00e78023          	sb	a4,0(a5)
    c06017fc:	fee44783          	lbu	a5,-18(s0)
    c0601800:	0ff7f793          	andi	a5,a5,255
    c0601804:	cb89                	beqz	a5,c0601816 <vsnprintf+0xea>
    c0601806:	f8043783          	ld	a5,-128(s0)
    c060180a:	00878713          	addi	a4,a5,8
    c060180e:	f8e43023          	sd	a4,-128(s0)
    c0601812:	639c                	ld	a5,0(a5)
    c0601814:	a801                	j	c0601824 <vsnprintf+0xf8>
    c0601816:	f8043783          	ld	a5,-128(s0)
    c060181a:	00878713          	addi	a4,a5,8
    c060181e:	f8e43023          	sd	a4,-128(s0)
    c0601822:	439c                	lw	a5,0(a5)
    c0601824:	faf43423          	sd	a5,-88(s0)
    c0601828:	fee44783          	lbu	a5,-18(s0)
    c060182c:	0ff7f793          	andi	a5,a5,255
    c0601830:	c399                	beqz	a5,c0601836 <vsnprintf+0x10a>
    c0601832:	47bd                	li	a5,15
    c0601834:	a011                	j	c0601838 <vsnprintf+0x10c>
    c0601836:	479d                	li	a5,7
    c0601838:	fcf42e23          	sw	a5,-36(s0)
    c060183c:	a8b5                	j	c06018b8 <vsnprintf+0x18c>
    c060183e:	fdc42783          	lw	a5,-36(s0)
    c0601842:	0027979b          	slliw	a5,a5,0x2
    c0601846:	2781                	sext.w	a5,a5
    c0601848:	fa843703          	ld	a4,-88(s0)
    c060184c:	40f757b3          	sra	a5,a4,a5
    c0601850:	2781                	sext.w	a5,a5
    c0601852:	8bbd                	andi	a5,a5,15
    c0601854:	faf42223          	sw	a5,-92(s0)
    c0601858:	fe043783          	ld	a5,-32(s0)
    c060185c:	0785                	addi	a5,a5,1
    c060185e:	fef43023          	sd	a5,-32(s0)
    c0601862:	fe043703          	ld	a4,-32(s0)
    c0601866:	f9043783          	ld	a5,-112(s0)
    c060186a:	04f77263          	bgeu	a4,a5,c06018ae <vsnprintf+0x182>
    c060186e:	fa442783          	lw	a5,-92(s0)
    c0601872:	0007871b          	sext.w	a4,a5
    c0601876:	47a5                	li	a5,9
    c0601878:	00e7cb63          	blt	a5,a4,c060188e <vsnprintf+0x162>
    c060187c:	fa442783          	lw	a5,-92(s0)
    c0601880:	0ff7f793          	andi	a5,a5,255
    c0601884:	0307879b          	addiw	a5,a5,48
    c0601888:	0ff7f793          	andi	a5,a5,255
    c060188c:	a809                	j	c060189e <vsnprintf+0x172>
    c060188e:	fa442783          	lw	a5,-92(s0)
    c0601892:	0ff7f793          	andi	a5,a5,255
    c0601896:	0577879b          	addiw	a5,a5,87
    c060189a:	0ff7f793          	andi	a5,a5,255
    c060189e:	fe043703          	ld	a4,-32(s0)
    c06018a2:	177d                	addi	a4,a4,-1
    c06018a4:	f9843683          	ld	a3,-104(s0)
    c06018a8:	9736                	add	a4,a4,a3
    c06018aa:	00f70023          	sb	a5,0(a4)
    c06018ae:	fdc42783          	lw	a5,-36(s0)
    c06018b2:	37fd                	addiw	a5,a5,-1
    c06018b4:	fcf42e23          	sw	a5,-36(s0)
    c06018b8:	fdc42783          	lw	a5,-36(s0)
    c06018bc:	2781                	sext.w	a5,a5
    c06018be:	f807d0e3          	bgez	a5,c060183e <vsnprintf+0x112>
    c06018c2:	fe040723          	sb	zero,-18(s0)
    c06018c6:	fe0407a3          	sb	zero,-17(s0)
    c06018ca:	ac01                	j	c0601ada <vsnprintf+0x3ae>
    c06018cc:	fee44783          	lbu	a5,-18(s0)
    c06018d0:	0ff7f793          	andi	a5,a5,255
    c06018d4:	cb89                	beqz	a5,c06018e6 <vsnprintf+0x1ba>
    c06018d6:	f8043783          	ld	a5,-128(s0)
    c06018da:	00878713          	addi	a4,a5,8
    c06018de:	f8e43023          	sd	a4,-128(s0)
    c06018e2:	639c                	ld	a5,0(a5)
    c06018e4:	a801                	j	c06018f4 <vsnprintf+0x1c8>
    c06018e6:	f8043783          	ld	a5,-128(s0)
    c06018ea:	00878713          	addi	a4,a5,8
    c06018ee:	f8e43023          	sd	a4,-128(s0)
    c06018f2:	439c                	lw	a5,0(a5)
    c06018f4:	fcf43823          	sd	a5,-48(s0)
    c06018f8:	fd043783          	ld	a5,-48(s0)
    c06018fc:	0207dd63          	bgez	a5,c0601936 <vsnprintf+0x20a>
    c0601900:	fd043783          	ld	a5,-48(s0)
    c0601904:	40f007b3          	neg	a5,a5
    c0601908:	fcf43823          	sd	a5,-48(s0)
    c060190c:	fe043783          	ld	a5,-32(s0)
    c0601910:	0785                	addi	a5,a5,1
    c0601912:	fef43023          	sd	a5,-32(s0)
    c0601916:	fe043703          	ld	a4,-32(s0)
    c060191a:	f9043783          	ld	a5,-112(s0)
    c060191e:	00f77c63          	bgeu	a4,a5,c0601936 <vsnprintf+0x20a>
    c0601922:	fe043783          	ld	a5,-32(s0)
    c0601926:	17fd                	addi	a5,a5,-1
    c0601928:	f9843703          	ld	a4,-104(s0)
    c060192c:	97ba                	add	a5,a5,a4
    c060192e:	02d00713          	li	a4,45
    c0601932:	00e78023          	sb	a4,0(a5)
    c0601936:	4785                	li	a5,1
    c0601938:	fcf43423          	sd	a5,-56(s0)
    c060193c:	fd043783          	ld	a5,-48(s0)
    c0601940:	fcf43023          	sd	a5,-64(s0)
    c0601944:	a031                	j	c0601950 <vsnprintf+0x224>
    c0601946:	fc843783          	ld	a5,-56(s0)
    c060194a:	0785                	addi	a5,a5,1
    c060194c:	fcf43423          	sd	a5,-56(s0)
    c0601950:	fc043703          	ld	a4,-64(s0)
    c0601954:	47a9                	li	a5,10
    c0601956:	02f747b3          	div	a5,a4,a5
    c060195a:	fcf43023          	sd	a5,-64(s0)
    c060195e:	fc043783          	ld	a5,-64(s0)
    c0601962:	f3f5                	bnez	a5,c0601946 <vsnprintf+0x21a>
    c0601964:	fc843783          	ld	a5,-56(s0)
    c0601968:	2781                	sext.w	a5,a5
    c060196a:	37fd                	addiw	a5,a5,-1
    c060196c:	2781                	sext.w	a5,a5
    c060196e:	faf42e23          	sw	a5,-68(s0)
    c0601972:	a8a1                	j	c06019ca <vsnprintf+0x29e>
    c0601974:	fbc42703          	lw	a4,-68(s0)
    c0601978:	fe043783          	ld	a5,-32(s0)
    c060197c:	97ba                	add	a5,a5,a4
    c060197e:	0785                	addi	a5,a5,1
    c0601980:	f9043703          	ld	a4,-112(s0)
    c0601984:	02e7f763          	bgeu	a5,a4,c06019b2 <vsnprintf+0x286>
    c0601988:	fd043703          	ld	a4,-48(s0)
    c060198c:	47a9                	li	a5,10
    c060198e:	02f767b3          	rem	a5,a4,a5
    c0601992:	0ff7f713          	andi	a4,a5,255
    c0601996:	fbc42683          	lw	a3,-68(s0)
    c060199a:	fe043783          	ld	a5,-32(s0)
    c060199e:	97b6                	add	a5,a5,a3
    c06019a0:	f9843683          	ld	a3,-104(s0)
    c06019a4:	97b6                	add	a5,a5,a3
    c06019a6:	0307071b          	addiw	a4,a4,48
    c06019aa:	0ff77713          	andi	a4,a4,255
    c06019ae:	00e78023          	sb	a4,0(a5)
    c06019b2:	fd043703          	ld	a4,-48(s0)
    c06019b6:	47a9                	li	a5,10
    c06019b8:	02f747b3          	div	a5,a4,a5
    c06019bc:	fcf43823          	sd	a5,-48(s0)
    c06019c0:	fbc42783          	lw	a5,-68(s0)
    c06019c4:	37fd                	addiw	a5,a5,-1
    c06019c6:	faf42e23          	sw	a5,-68(s0)
    c06019ca:	fbc42783          	lw	a5,-68(s0)
    c06019ce:	2781                	sext.w	a5,a5
    c06019d0:	fa07d2e3          	bgez	a5,c0601974 <vsnprintf+0x248>
    c06019d4:	fc843783          	ld	a5,-56(s0)
    c06019d8:	fe043703          	ld	a4,-32(s0)
    c06019dc:	97ba                	add	a5,a5,a4
    c06019de:	fef43023          	sd	a5,-32(s0)
    c06019e2:	fe040723          	sb	zero,-18(s0)
    c06019e6:	fe0407a3          	sb	zero,-17(s0)
    c06019ea:	a8c5                	j	c0601ada <vsnprintf+0x3ae>
    c06019ec:	f8043783          	ld	a5,-128(s0)
    c06019f0:	00878713          	addi	a4,a5,8
    c06019f4:	f8e43023          	sd	a4,-128(s0)
    c06019f8:	639c                	ld	a5,0(a5)
    c06019fa:	faf43823          	sd	a5,-80(s0)
    c06019fe:	a82d                	j	c0601a38 <vsnprintf+0x30c>
    c0601a00:	fe043783          	ld	a5,-32(s0)
    c0601a04:	0785                	addi	a5,a5,1
    c0601a06:	fef43023          	sd	a5,-32(s0)
    c0601a0a:	fe043703          	ld	a4,-32(s0)
    c0601a0e:	f9043783          	ld	a5,-112(s0)
    c0601a12:	00f77e63          	bgeu	a4,a5,c0601a2e <vsnprintf+0x302>
    c0601a16:	fe043783          	ld	a5,-32(s0)
    c0601a1a:	17fd                	addi	a5,a5,-1
    c0601a1c:	f9843703          	ld	a4,-104(s0)
    c0601a20:	97ba                	add	a5,a5,a4
    c0601a22:	fb043703          	ld	a4,-80(s0)
    c0601a26:	00074703          	lbu	a4,0(a4)
    c0601a2a:	00e78023          	sb	a4,0(a5)
    c0601a2e:	fb043783          	ld	a5,-80(s0)
    c0601a32:	0785                	addi	a5,a5,1
    c0601a34:	faf43823          	sd	a5,-80(s0)
    c0601a38:	fb043783          	ld	a5,-80(s0)
    c0601a3c:	0007c783          	lbu	a5,0(a5)
    c0601a40:	f3e1                	bnez	a5,c0601a00 <vsnprintf+0x2d4>
    c0601a42:	fe040723          	sb	zero,-18(s0)
    c0601a46:	fe0407a3          	sb	zero,-17(s0)
    c0601a4a:	a841                	j	c0601ada <vsnprintf+0x3ae>
    c0601a4c:	fe043783          	ld	a5,-32(s0)
    c0601a50:	0785                	addi	a5,a5,1
    c0601a52:	fef43023          	sd	a5,-32(s0)
    c0601a56:	fe043703          	ld	a4,-32(s0)
    c0601a5a:	f9043783          	ld	a5,-112(s0)
    c0601a5e:	02f77363          	bgeu	a4,a5,c0601a84 <vsnprintf+0x358>
    c0601a62:	f8043783          	ld	a5,-128(s0)
    c0601a66:	00878713          	addi	a4,a5,8
    c0601a6a:	f8e43023          	sd	a4,-128(s0)
    c0601a6e:	4394                	lw	a3,0(a5)
    c0601a70:	fe043783          	ld	a5,-32(s0)
    c0601a74:	17fd                	addi	a5,a5,-1
    c0601a76:	f9843703          	ld	a4,-104(s0)
    c0601a7a:	97ba                	add	a5,a5,a4
    c0601a7c:	0ff6f713          	andi	a4,a3,255
    c0601a80:	00e78023          	sb	a4,0(a5)
    c0601a84:	fe040723          	sb	zero,-18(s0)
    c0601a88:	fe0407a3          	sb	zero,-17(s0)
    c0601a8c:	a0b9                	j	c0601ada <vsnprintf+0x3ae>
    c0601a8e:	f8843783          	ld	a5,-120(s0)
    c0601a92:	0007c783          	lbu	a5,0(a5)
    c0601a96:	873e                	mv	a4,a5
    c0601a98:	02500793          	li	a5,37
    c0601a9c:	00f71663          	bne	a4,a5,c0601aa8 <vsnprintf+0x37c>
    c0601aa0:	4785                	li	a5,1
    c0601aa2:	fef407a3          	sb	a5,-17(s0)
    c0601aa6:	a815                	j	c0601ada <vsnprintf+0x3ae>
    c0601aa8:	fe043783          	ld	a5,-32(s0)
    c0601aac:	0785                	addi	a5,a5,1
    c0601aae:	fef43023          	sd	a5,-32(s0)
    c0601ab2:	fe043703          	ld	a4,-32(s0)
    c0601ab6:	f9043783          	ld	a5,-112(s0)
    c0601aba:	02f77063          	bgeu	a4,a5,c0601ada <vsnprintf+0x3ae>
    c0601abe:	fe043783          	ld	a5,-32(s0)
    c0601ac2:	17fd                	addi	a5,a5,-1
    c0601ac4:	f9843703          	ld	a4,-104(s0)
    c0601ac8:	97ba                	add	a5,a5,a4
    c0601aca:	f8843703          	ld	a4,-120(s0)
    c0601ace:	00074703          	lbu	a4,0(a4)
    c0601ad2:	00e78023          	sb	a4,0(a5)
    c0601ad6:	a011                	j	c0601ada <vsnprintf+0x3ae>
    c0601ad8:	0001                	nop
    c0601ada:	f8843783          	ld	a5,-120(s0)
    c0601ade:	0785                	addi	a5,a5,1
    c0601ae0:	f8f43423          	sd	a5,-120(s0)
    c0601ae4:	f8843783          	ld	a5,-120(s0)
    c0601ae8:	0007c783          	lbu	a5,0(a5)
    c0601aec:	c60792e3          	bnez	a5,c0601750 <vsnprintf+0x24>
    c0601af0:	fe043703          	ld	a4,-32(s0)
    c0601af4:	f9043783          	ld	a5,-112(s0)
    c0601af8:	00f77a63          	bgeu	a4,a5,c0601b0c <vsnprintf+0x3e0>
    c0601afc:	f9843703          	ld	a4,-104(s0)
    c0601b00:	fe043783          	ld	a5,-32(s0)
    c0601b04:	97ba                	add	a5,a5,a4
    c0601b06:	00078023          	sb	zero,0(a5)
    c0601b0a:	a821                	j	c0601b22 <vsnprintf+0x3f6>
    c0601b0c:	f9043783          	ld	a5,-112(s0)
    c0601b10:	cb89                	beqz	a5,c0601b22 <vsnprintf+0x3f6>
    c0601b12:	f9043783          	ld	a5,-112(s0)
    c0601b16:	17fd                	addi	a5,a5,-1
    c0601b18:	f9843703          	ld	a4,-104(s0)
    c0601b1c:	97ba                	add	a5,a5,a4
    c0601b1e:	00078023          	sb	zero,0(a5)
    c0601b22:	fe043783          	ld	a5,-32(s0)
    c0601b26:	2781                	sext.w	a5,a5
    c0601b28:	853e                	mv	a0,a5
    c0601b2a:	7466                	ld	s0,120(sp)
    c0601b2c:	6109                	addi	sp,sp,128
    c0601b2e:	8082                	ret

00000000c0601b30 <snprintf>:
    c0601b30:	7159                	addi	sp,sp,-112
    c0601b32:	fc06                	sd	ra,56(sp)
    c0601b34:	f822                	sd	s0,48(sp)
    c0601b36:	0080                	addi	s0,sp,64
    c0601b38:	fca43c23          	sd	a0,-40(s0)
    c0601b3c:	fcb43823          	sd	a1,-48(s0)
    c0601b40:	fcc43423          	sd	a2,-56(s0)
    c0601b44:	e414                	sd	a3,8(s0)
    c0601b46:	e818                	sd	a4,16(s0)
    c0601b48:	ec1c                	sd	a5,24(s0)
    c0601b4a:	03043023          	sd	a6,32(s0)
    c0601b4e:	03143423          	sd	a7,40(s0)
    c0601b52:	03040793          	addi	a5,s0,48
    c0601b56:	fcf43023          	sd	a5,-64(s0)
    c0601b5a:	fc043783          	ld	a5,-64(s0)
    c0601b5e:	fd878793          	addi	a5,a5,-40
    c0601b62:	fef43023          	sd	a5,-32(s0)
    c0601b66:	fe043783          	ld	a5,-32(s0)
    c0601b6a:	86be                	mv	a3,a5
    c0601b6c:	fc843603          	ld	a2,-56(s0)
    c0601b70:	fd043583          	ld	a1,-48(s0)
    c0601b74:	fd843503          	ld	a0,-40(s0)
    c0601b78:	bb5ff0ef          	jal	ra,c060172c <vsnprintf>
    c0601b7c:	87aa                	mv	a5,a0
    c0601b7e:	fef42623          	sw	a5,-20(s0)
    c0601b82:	fec42783          	lw	a5,-20(s0)
    c0601b86:	853e                	mv	a0,a5
    c0601b88:	70e2                	ld	ra,56(sp)
    c0601b8a:	7442                	ld	s0,48(sp)
    c0601b8c:	6165                	addi	sp,sp,112
    c0601b8e:	8082                	ret

00000000c0601b90 <putstring>:
    c0601b90:	7179                	addi	sp,sp,-48
    c0601b92:	f422                	sd	s0,40(sp)
    c0601b94:	1800                	addi	s0,sp,48
    c0601b96:	fca43c23          	sd	a0,-40(s0)
    c0601b9a:	a005                	j	c0601bba <putstring+0x2a>
    c0601b9c:	fd843783          	ld	a5,-40(s0)
    c0601ba0:	00178713          	addi	a4,a5,1
    c0601ba4:	fce43c23          	sd	a4,-40(s0)
    c0601ba8:	0007c783          	lbu	a5,0(a5)
    c0601bac:	fef42623          	sw	a5,-20(s0)
    c0601bb0:	fec42503          	lw	a0,-20(s0)
    c0601bb4:	4885                	li	a7,1
    c0601bb6:	00000073          	ecall
    c0601bba:	fd843783          	ld	a5,-40(s0)
    c0601bbe:	0007c783          	lbu	a5,0(a5)
    c0601bc2:	ffe9                	bnez	a5,c0601b9c <putstring+0xc>
    c0601bc4:	0001                	nop
    c0601bc6:	0001                	nop
    c0601bc8:	7422                	ld	s0,40(sp)
    c0601bca:	6145                	addi	sp,sp,48
    c0601bcc:	8082                	ret

00000000c0601bce <vprintd>:
    c0601bce:	712d                	addi	sp,sp,-288
    c0601bd0:	ee06                	sd	ra,280(sp)
    c0601bd2:	ea22                	sd	s0,272(sp)
    c0601bd4:	1200                	addi	s0,sp,288
    c0601bd6:	eea43423          	sd	a0,-280(s0)
    c0601bda:	eeb43023          	sd	a1,-288(s0)
    c0601bde:	ef040793          	addi	a5,s0,-272
    c0601be2:	ee043683          	ld	a3,-288(s0)
    c0601be6:	ee843603          	ld	a2,-280(s0)
    c0601bea:	10000593          	li	a1,256
    c0601bee:	853e                	mv	a0,a5
    c0601bf0:	b3dff0ef          	jal	ra,c060172c <vsnprintf>
    c0601bf4:	ef040793          	addi	a5,s0,-272
    c0601bf8:	853e                	mv	a0,a5
    c0601bfa:	f97ff0ef          	jal	ra,c0601b90 <putstring>
    c0601bfe:	0001                	nop
    c0601c00:	60f2                	ld	ra,280(sp)
    c0601c02:	6452                	ld	s0,272(sp)
    c0601c04:	6115                	addi	sp,sp,288
    c0601c06:	8082                	ret

00000000c0601c08 <printd>:
    c0601c08:	7159                	addi	sp,sp,-112
    c0601c0a:	f406                	sd	ra,40(sp)
    c0601c0c:	f022                	sd	s0,32(sp)
    c0601c0e:	1800                	addi	s0,sp,48
    c0601c10:	fca43c23          	sd	a0,-40(s0)
    c0601c14:	e40c                	sd	a1,8(s0)
    c0601c16:	e810                	sd	a2,16(s0)
    c0601c18:	ec14                	sd	a3,24(s0)
    c0601c1a:	f018                	sd	a4,32(s0)
    c0601c1c:	f41c                	sd	a5,40(s0)
    c0601c1e:	03043823          	sd	a6,48(s0)
    c0601c22:	03143c23          	sd	a7,56(s0)
    c0601c26:	04040793          	addi	a5,s0,64
    c0601c2a:	fcf43823          	sd	a5,-48(s0)
    c0601c2e:	fd043783          	ld	a5,-48(s0)
    c0601c32:	fc878793          	addi	a5,a5,-56
    c0601c36:	fef43423          	sd	a5,-24(s0)
    c0601c3a:	fe843783          	ld	a5,-24(s0)
    c0601c3e:	85be                	mv	a1,a5
    c0601c40:	fd843503          	ld	a0,-40(s0)
    c0601c44:	f8bff0ef          	jal	ra,c0601bce <vprintd>
    c0601c48:	0001                	nop
    c0601c4a:	70a2                	ld	ra,40(sp)
    c0601c4c:	7402                	ld	s0,32(sp)
    c0601c4e:	6165                	addi	sp,sp,112
    c0601c50:	8082                	ret

00000000c0601c52 <my_memset>:
    c0601c52:	7179                	addi	sp,sp,-48
    c0601c54:	f422                	sd	s0,40(sp)
    c0601c56:	1800                	addi	s0,sp,48
    c0601c58:	fca43c23          	sd	a0,-40(s0)
    c0601c5c:	87ae                	mv	a5,a1
    c0601c5e:	8732                	mv	a4,a2
    c0601c60:	fcf42a23          	sw	a5,-44(s0)
    c0601c64:	87ba                	mv	a5,a4
    c0601c66:	fcf42823          	sw	a5,-48(s0)
    c0601c6a:	fd843783          	ld	a5,-40(s0)
    c0601c6e:	fef43423          	sd	a5,-24(s0)
    c0601c72:	a829                	j	c0601c8c <my_memset+0x3a>
    c0601c74:	fe843783          	ld	a5,-24(s0)
    c0601c78:	00178713          	addi	a4,a5,1
    c0601c7c:	fee43423          	sd	a4,-24(s0)
    c0601c80:	fd442703          	lw	a4,-44(s0)
    c0601c84:	0ff77713          	andi	a4,a4,255
    c0601c88:	00e78023          	sb	a4,0(a5)
    c0601c8c:	fd042783          	lw	a5,-48(s0)
    c0601c90:	fff7871b          	addiw	a4,a5,-1
    c0601c94:	fce42823          	sw	a4,-48(s0)
    c0601c98:	fff1                	bnez	a5,c0601c74 <my_memset+0x22>
    c0601c9a:	fd843783          	ld	a5,-40(s0)
    c0601c9e:	853e                	mv	a0,a5
    c0601ca0:	7422                	ld	s0,40(sp)
    c0601ca2:	6145                	addi	sp,sp,48
    c0601ca4:	8082                	ret

00000000c0601ca6 <print_color>:
    c0601ca6:	1101                	addi	sp,sp,-32
    c0601ca8:	ec06                	sd	ra,24(sp)
    c0601caa:	e822                	sd	s0,16(sp)
    c0601cac:	1000                	addi	s0,sp,32
    c0601cae:	fea43423          	sd	a0,-24(s0)
    c0601cb2:	fe843583          	ld	a1,-24(s0)
    c0601cb6:	00003517          	auipc	a0,0x3
    c0601cba:	f3a50513          	addi	a0,a0,-198 # c0604bf0 <_init_data_end+0xbf0>
    c0601cbe:	f4bff0ef          	jal	ra,c0601c08 <printd>
    c0601cc2:	0001                	nop
    c0601cc4:	60e2                	ld	ra,24(sp)
    c0601cc6:	6442                	ld	s0,16(sp)
    c0601cc8:	6105                	addi	sp,sp,32
    c0601cca:	8082                	ret

00000000c0601ccc <show_reg>:
    c0601ccc:	715d                	addi	sp,sp,-80
    c0601cce:	e486                	sd	ra,72(sp)
    c0601cd0:	e0a2                	sd	s0,64(sp)
    c0601cd2:	0880                	addi	s0,sp,80
    c0601cd4:	00003517          	auipc	a0,0x3
    c0601cd8:	f2c50513          	addi	a0,a0,-212 # c0604c00 <_init_data_end+0xc00>
    c0601cdc:	f2dff0ef          	jal	ra,c0601c08 <printd>
    c0601ce0:	100027f3          	csrr	a5,sstatus
    c0601ce4:	fef43423          	sd	a5,-24(s0)
    c0601ce8:	fe843783          	ld	a5,-24(s0)
    c0601cec:	fef43023          	sd	a5,-32(s0)
    c0601cf0:	141027f3          	csrr	a5,sepc
    c0601cf4:	fcf43c23          	sd	a5,-40(s0)
    c0601cf8:	fd843783          	ld	a5,-40(s0)
    c0601cfc:	fcf43823          	sd	a5,-48(s0)
    c0601d00:	105027f3          	csrr	a5,stvec
    c0601d04:	fcf43423          	sd	a5,-56(s0)
    c0601d08:	fc843783          	ld	a5,-56(s0)
    c0601d0c:	fcf43023          	sd	a5,-64(s0)
    c0601d10:	180027f3          	csrr	a5,satp
    c0601d14:	faf43c23          	sd	a5,-72(s0)
    c0601d18:	fb843783          	ld	a5,-72(s0)
    c0601d1c:	faf43823          	sd	a5,-80(s0)
    c0601d20:	fe043583          	ld	a1,-32(s0)
    c0601d24:	00003517          	auipc	a0,0x3
    c0601d28:	f0c50513          	addi	a0,a0,-244 # c0604c30 <_init_data_end+0xc30>
    c0601d2c:	eddff0ef          	jal	ra,c0601c08 <printd>
    c0601d30:	fd043583          	ld	a1,-48(s0)
    c0601d34:	00003517          	auipc	a0,0x3
    c0601d38:	f0c50513          	addi	a0,a0,-244 # c0604c40 <_init_data_end+0xc40>
    c0601d3c:	ecdff0ef          	jal	ra,c0601c08 <printd>
    c0601d40:	fc043583          	ld	a1,-64(s0)
    c0601d44:	00003517          	auipc	a0,0x3
    c0601d48:	f0c50513          	addi	a0,a0,-244 # c0604c50 <_init_data_end+0xc50>
    c0601d4c:	ebdff0ef          	jal	ra,c0601c08 <printd>
    c0601d50:	fb043583          	ld	a1,-80(s0)
    c0601d54:	00003517          	auipc	a0,0x3
    c0601d58:	f0c50513          	addi	a0,a0,-244 # c0604c60 <_init_data_end+0xc60>
    c0601d5c:	eadff0ef          	jal	ra,c0601c08 <printd>
    c0601d60:	00003517          	auipc	a0,0x3
    c0601d64:	f1050513          	addi	a0,a0,-240 # c0604c70 <_init_data_end+0xc70>
    c0601d68:	ea1ff0ef          	jal	ra,c0601c08 <printd>
    c0601d6c:	0001                	nop
    c0601d6e:	60a6                	ld	ra,72(sp)
    c0601d70:	6406                	ld	s0,64(sp)
    c0601d72:	6161                	addi	sp,sp,80
    c0601d74:	8082                	ret

00000000c0601d76 <flush_dcache_range>:
    c0601d76:	1101                	addi	sp,sp,-32
    c0601d78:	ec22                	sd	s0,24(sp)
    c0601d7a:	1000                	addi	s0,sp,32
    c0601d7c:	fea43423          	sd	a0,-24(s0)
    c0601d80:	feb43023          	sd	a1,-32(s0)
    c0601d84:	0001                	nop
    c0601d86:	6462                	ld	s0,24(sp)
    c0601d88:	6105                	addi	sp,sp,32
    c0601d8a:	8082                	ret

00000000c0601d8c <invalidate_dcache_range>:
    c0601d8c:	1101                	addi	sp,sp,-32
    c0601d8e:	ec22                	sd	s0,24(sp)
    c0601d90:	1000                	addi	s0,sp,32
    c0601d92:	fea43423          	sd	a0,-24(s0)
    c0601d96:	feb43023          	sd	a1,-32(s0)
    c0601d9a:	0001                	nop
    c0601d9c:	6462                	ld	s0,24(sp)
    c0601d9e:	6105                	addi	sp,sp,32
    c0601da0:	8082                	ret

00000000c0601da2 <flush_tlb_range>:
    c0601da2:	1101                	addi	sp,sp,-32
    c0601da4:	ec22                	sd	s0,24(sp)
    c0601da6:	1000                	addi	s0,sp,32
    c0601da8:	fea43423          	sd	a0,-24(s0)
    c0601dac:	feb43023          	sd	a1,-32(s0)
    c0601db0:	12000073          	sfence.vma
    c0601db4:	0001                	nop
    c0601db6:	6462                	ld	s0,24(sp)
    c0601db8:	6105                	addi	sp,sp,32
    c0601dba:	8082                	ret
    c0601dbc:	0000                	unimp
	...

00000000c0601dc0 <trap_handler>:
    c0601dc0:	14011173          	csrrw	sp,sscratch,sp
    c0601dc4:	00011463          	bnez	sp,c0601dcc <trap_handler+0xc>
    c0601dc8:	14002173          	csrr	sp,sscratch
    c0601dcc:	7111                	addi	sp,sp,-256
    c0601dce:	e406                	sd	ra,8(sp)
    c0601dd0:	ec0e                	sd	gp,24(sp)
    c0601dd2:	f012                	sd	tp,32(sp)
    c0601dd4:	f416                	sd	t0,40(sp)
    c0601dd6:	f81a                	sd	t1,48(sp)
    c0601dd8:	fc1e                	sd	t2,56(sp)
    c0601dda:	e0a2                	sd	s0,64(sp)
    c0601ddc:	e4a6                	sd	s1,72(sp)
    c0601dde:	e8aa                	sd	a0,80(sp)
    c0601de0:	ecae                	sd	a1,88(sp)
    c0601de2:	f0b2                	sd	a2,96(sp)
    c0601de4:	f4b6                	sd	a3,104(sp)
    c0601de6:	f8ba                	sd	a4,112(sp)
    c0601de8:	fcbe                	sd	a5,120(sp)
    c0601dea:	e142                	sd	a6,128(sp)
    c0601dec:	e546                	sd	a7,136(sp)
    c0601dee:	e94a                	sd	s2,144(sp)
    c0601df0:	ed4e                	sd	s3,152(sp)
    c0601df2:	f152                	sd	s4,160(sp)
    c0601df4:	f556                	sd	s5,168(sp)
    c0601df6:	f95a                	sd	s6,176(sp)
    c0601df8:	fd5e                	sd	s7,184(sp)
    c0601dfa:	e1e2                	sd	s8,192(sp)
    c0601dfc:	e5e6                	sd	s9,200(sp)
    c0601dfe:	e9ea                	sd	s10,208(sp)
    c0601e00:	edee                	sd	s11,216(sp)
    c0601e02:	f1f2                	sd	t3,224(sp)
    c0601e04:	f5f6                	sd	t4,232(sp)
    c0601e06:	f9fa                	sd	t5,240(sp)
    c0601e08:	fdfe                	sd	t6,248(sp)
    c0601e0a:	14001973          	csrrw	s2,sscratch,zero
    c0601e0e:	e84a                	sd	s2,16(sp)
    c0601e10:	142025f3          	csrr	a1,scause
    c0601e14:	850a                	mv	a0,sp
    c0601e16:	14102673          	csrr	a2,sepc
    c0601e1a:	143026f3          	csrr	a3,stval
    c0601e1e:	0005d763          	bgez	a1,c0601e2c <trap_handler+0x6c>
    c0601e22:	0586                	slli	a1,a1,0x1
    c0601e24:	8185                	srli	a1,a1,0x1
    c0601e26:	f90fe0ef          	jal	ra,c06005b6 <handle_interrupt>
    c0601e2a:	a021                	j	c0601e32 <ret_to_usr>
    c0601e2c:	8b1fe0ef          	jal	ra,c06006dc <handle_syscall>
    c0601e30:	a009                	j	c0601e32 <ret_to_usr>

00000000c0601e32 <ret_to_usr>:
    c0601e32:	6942                	ld	s2,16(sp)
    c0601e34:	14091073          	csrw	sscratch,s2
    c0601e38:	60a2                	ld	ra,8(sp)
    c0601e3a:	61e2                	ld	gp,24(sp)
    c0601e3c:	7202                	ld	tp,32(sp)
    c0601e3e:	72a2                	ld	t0,40(sp)
    c0601e40:	7342                	ld	t1,48(sp)
    c0601e42:	73e2                	ld	t2,56(sp)
    c0601e44:	6406                	ld	s0,64(sp)
    c0601e46:	64a6                	ld	s1,72(sp)
    c0601e48:	6546                	ld	a0,80(sp)
    c0601e4a:	65e6                	ld	a1,88(sp)
    c0601e4c:	7606                	ld	a2,96(sp)
    c0601e4e:	76a6                	ld	a3,104(sp)
    c0601e50:	7746                	ld	a4,112(sp)
    c0601e52:	77e6                	ld	a5,120(sp)
    c0601e54:	680a                	ld	a6,128(sp)
    c0601e56:	68aa                	ld	a7,136(sp)
    c0601e58:	694a                	ld	s2,144(sp)
    c0601e5a:	69ea                	ld	s3,152(sp)
    c0601e5c:	7a0a                	ld	s4,160(sp)
    c0601e5e:	7aaa                	ld	s5,168(sp)
    c0601e60:	7b4a                	ld	s6,176(sp)
    c0601e62:	7bea                	ld	s7,184(sp)
    c0601e64:	6c0e                	ld	s8,192(sp)
    c0601e66:	6cae                	ld	s9,200(sp)
    c0601e68:	6d4e                	ld	s10,208(sp)
    c0601e6a:	6dee                	ld	s11,216(sp)
    c0601e6c:	7e0e                	ld	t3,224(sp)
    c0601e6e:	7eae                	ld	t4,232(sp)
    c0601e70:	7f4e                	ld	t5,240(sp)
    c0601e72:	7fee                	ld	t6,248(sp)
    c0601e74:	6111                	addi	sp,sp,256
    c0601e76:	14011173          	csrrw	sp,sscratch,sp
    c0601e7a:	10200073          	sret
    c0601e7e:	0001                	nop
    c0601e80:	0000                	unimp
    c0601e82:	0000                	unimp
	...

00000000c0601e86 <dump_mem_pool>:
    c0601e86:	7139                	addi	sp,sp,-64
    c0601e88:	fc06                	sd	ra,56(sp)
    c0601e8a:	f822                	sd	s0,48(sp)
    c0601e8c:	0080                	addi	s0,sp,64
    c0601e8e:	fca43423          	sd	a0,-56(s0)
    c0601e92:	00003517          	auipc	a0,0x3
    c0601e96:	e0e50513          	addi	a0,a0,-498 # c0604ca0 <_init_data_end+0xca0>
    c0601e9a:	e0dff0ef          	jal	ra,c0601ca6 <print_color>
    c0601e9e:	fc843583          	ld	a1,-56(s0)
    c0601ea2:	00003517          	auipc	a0,0x3
    c0601ea6:	e3650513          	addi	a0,a0,-458 # c0604cd8 <_init_data_end+0xcd8>
    c0601eaa:	d5fff0ef          	jal	ra,c0601c08 <printd>
    c0601eae:	fc843783          	ld	a5,-56(s0)
    c0601eb2:	639c                	ld	a5,0(a5)
    c0601eb4:	fef43423          	sd	a5,-24(s0)
    c0601eb8:	4785                	li	a5,1
    c0601eba:	fef42223          	sw	a5,-28(s0)
    c0601ebe:	a095                	j	c0601f22 <dump_mem_pool+0x9c>
    c0601ec0:	fe843583          	ld	a1,-24(s0)
    c0601ec4:	00003517          	auipc	a0,0x3
    c0601ec8:	e2450513          	addi	a0,a0,-476 # c0604ce8 <_init_data_end+0xce8>
    c0601ecc:	d3dff0ef          	jal	ra,c0601c08 <printd>
    c0601ed0:	180027f3          	csrr	a5,satp
    c0601ed4:	fcf43c23          	sd	a5,-40(s0)
    c0601ed8:	fd843783          	ld	a5,-40(s0)
    c0601edc:	ef81                	bnez	a5,c0601ef4 <dump_mem_pool+0x6e>
    c0601ede:	0000a797          	auipc	a5,0xa
    c0601ee2:	59278793          	addi	a5,a5,1426 # c060c470 <ENC_VA_PA_OFFSET>
    c0601ee6:	639c                	ld	a5,0(a5)
    c0601ee8:	fe843703          	ld	a4,-24(s0)
    c0601eec:	40f707b3          	sub	a5,a4,a5
    c0601ef0:	fef43423          	sd	a5,-24(s0)
    c0601ef4:	fe843783          	ld	a5,-24(s0)
    c0601ef8:	639c                	ld	a5,0(a5)
    c0601efa:	fef43423          	sd	a5,-24(s0)
    c0601efe:	fe442783          	lw	a5,-28(s0)
    c0601f02:	0017871b          	addiw	a4,a5,1
    c0601f06:	fee42223          	sw	a4,-28(s0)
    c0601f0a:	873e                	mv	a4,a5
    c0601f0c:	47c9                	li	a5,18
    c0601f0e:	02f767bb          	remw	a5,a4,a5
    c0601f12:	2781                	sext.w	a5,a5
    c0601f14:	e799                	bnez	a5,c0601f22 <dump_mem_pool+0x9c>
    c0601f16:	00003517          	auipc	a0,0x3
    c0601f1a:	dda50513          	addi	a0,a0,-550 # c0604cf0 <_init_data_end+0xcf0>
    c0601f1e:	cebff0ef          	jal	ra,c0601c08 <printd>
    c0601f22:	fe843783          	ld	a5,-24(s0)
    c0601f26:	cb89                	beqz	a5,c0601f38 <dump_mem_pool+0xb2>
    c0601f28:	fe442783          	lw	a5,-28(s0)
    c0601f2c:	0007871b          	sext.w	a4,a5
    c0601f30:	02400793          	li	a5,36
    c0601f34:	f8e7d6e3          	bge	a5,a4,c0601ec0 <dump_mem_pool+0x3a>
    c0601f38:	00003517          	auipc	a0,0x3
    c0601f3c:	db850513          	addi	a0,a0,-584 # c0604cf0 <_init_data_end+0xcf0>
    c0601f40:	cc9ff0ef          	jal	ra,c0601c08 <printd>
    c0601f44:	00003517          	auipc	a0,0x3
    c0601f48:	db450513          	addi	a0,a0,-588 # c0604cf8 <_init_data_end+0xcf8>
    c0601f4c:	d5bff0ef          	jal	ra,c0601ca6 <print_color>
    c0601f50:	0001                	nop
    c0601f52:	70e2                	ld	ra,56(sp)
    c0601f54:	7442                	ld	s0,48(sp)
    c0601f56:	6121                	addi	sp,sp,64
    c0601f58:	8082                	ret

00000000c0601f5a <va_pa_offset>:
    c0601f5a:	1101                	addi	sp,sp,-32
    c0601f5c:	ec22                	sd	s0,24(sp)
    c0601f5e:	1000                	addi	s0,sp,32
    c0601f60:	180027f3          	csrr	a5,satp
    c0601f64:	fef43423          	sd	a5,-24(s0)
    c0601f68:	fe843783          	ld	a5,-24(s0)
    c0601f6c:	fef43023          	sd	a5,-32(s0)
    c0601f70:	fe043783          	ld	a5,-32(s0)
    c0601f74:	0007d863          	bgez	a5,c0601f84 <va_pa_offset+0x2a>
    c0601f78:	0000a797          	auipc	a5,0xa
    c0601f7c:	4f878793          	addi	a5,a5,1272 # c060c470 <ENC_VA_PA_OFFSET>
    c0601f80:	639c                	ld	a5,0(a5)
    c0601f82:	a011                	j	c0601f86 <va_pa_offset+0x2c>
    c0601f84:	4781                	li	a5,0
    c0601f86:	853e                	mv	a0,a5
    c0601f88:	6462                	ld	s0,24(sp)
    c0601f8a:	6105                	addi	sp,sp,32
    c0601f8c:	8082                	ret

00000000c0601f8e <va_pa_offset_no_mmu>:
    c0601f8e:	1101                	addi	sp,sp,-32
    c0601f90:	ec06                	sd	ra,24(sp)
    c0601f92:	e822                	sd	s0,16(sp)
    c0601f94:	e426                	sd	s1,8(sp)
    c0601f96:	1000                	addi	s0,sp,32
    c0601f98:	0000a797          	auipc	a5,0xa
    c0601f9c:	4d878793          	addi	a5,a5,1240 # c060c470 <ENC_VA_PA_OFFSET>
    c0601fa0:	6384                	ld	s1,0(a5)
    c0601fa2:	fb9ff0ef          	jal	ra,c0601f5a <va_pa_offset>
    c0601fa6:	87aa                	mv	a5,a0
    c0601fa8:	40f487b3          	sub	a5,s1,a5
    c0601fac:	853e                	mv	a0,a5
    c0601fae:	60e2                	ld	ra,24(sp)
    c0601fb0:	6442                	ld	s0,16(sp)
    c0601fb2:	64a2                	ld	s1,8(sp)
    c0601fb4:	6105                	addi	sp,sp,32
    c0601fb6:	8082                	ret

00000000c0601fb8 <get_phys_addr>:
    c0601fb8:	7179                	addi	sp,sp,-48
    c0601fba:	f406                	sd	ra,40(sp)
    c0601fbc:	f022                	sd	s0,32(sp)
    c0601fbe:	1800                	addi	s0,sp,48
    c0601fc0:	fca43c23          	sd	a0,-40(s0)
    c0601fc4:	180027f3          	csrr	a5,satp
    c0601fc8:	fef43423          	sd	a5,-24(s0)
    c0601fcc:	fe843783          	ld	a5,-24(s0)
    c0601fd0:	c799                	beqz	a5,c0601fde <get_phys_addr+0x26>
    c0601fd2:	fd843503          	ld	a0,-40(s0)
    c0601fd6:	361000ef          	jal	ra,c0602b36 <get_pa>
    c0601fda:	87aa                	mv	a5,a0
    c0601fdc:	a811                	j	c0601ff0 <get_phys_addr+0x38>
    c0601fde:	0000a797          	auipc	a5,0xa
    c0601fe2:	49278793          	addi	a5,a5,1170 # c060c470 <ENC_VA_PA_OFFSET>
    c0601fe6:	639c                	ld	a5,0(a5)
    c0601fe8:	fd843703          	ld	a4,-40(s0)
    c0601fec:	40f707b3          	sub	a5,a4,a5
    c0601ff0:	853e                	mv	a0,a5
    c0601ff2:	70a2                	ld	ra,40(sp)
    c0601ff4:	7402                	ld	s0,32(sp)
    c0601ff6:	6145                	addi	sp,sp,48
    c0601ff8:	8082                	ret

00000000c0601ffa <__spa_put>:
    c0601ffa:	715d                	addi	sp,sp,-80
    c0601ffc:	e486                	sd	ra,72(sp)
    c0601ffe:	e0a2                	sd	s0,64(sp)
    c0602000:	fc26                	sd	s1,56(sp)
    c0602002:	0880                	addi	s0,sp,80
    c0602004:	faa43c23          	sd	a0,-72(s0)
    c0602008:	fab43823          	sd	a1,-80(s0)
    c060200c:	fb843703          	ld	a4,-72(s0)
    c0602010:	008007b7          	lui	a5,0x800
    c0602014:	17fd                	addi	a5,a5,-1
    c0602016:	8ff9                	and	a5,a5,a4
    c0602018:	fcf43c23          	sd	a5,-40(s0)
    c060201c:	0000a797          	auipc	a5,0xa
    c0602020:	44478793          	addi	a5,a5,1092 # c060c460 <va_top>
    c0602024:	639c                	ld	a5,0(a5)
    c0602026:	fd843703          	ld	a4,-40(s0)
    c060202a:	97ba                	add	a5,a5,a4
    c060202c:	fcf43823          	sd	a5,-48(s0)
    c0602030:	f5fff0ef          	jal	ra,c0601f8e <va_pa_offset_no_mmu>
    c0602034:	872a                	mv	a4,a0
    c0602036:	fd043783          	ld	a5,-48(s0)
    c060203a:	8f99                	sub	a5,a5,a4
    c060203c:	fcf43423          	sd	a5,-56(s0)
    c0602040:	fb043783          	ld	a5,-80(s0)
    c0602044:	4b9c                	lw	a5,16(a5)
    c0602046:	c78d                	beqz	a5,c0602070 <__spa_put+0x76>
    c0602048:	fb043783          	ld	a5,-80(s0)
    c060204c:	639c                	ld	a5,0(a5)
    c060204e:	c38d                	beqz	a5,c0602070 <__spa_put+0x76>
    c0602050:	fb043783          	ld	a5,-80(s0)
    c0602054:	6784                	ld	s1,8(a5)
    c0602056:	f39ff0ef          	jal	ra,c0601f8e <va_pa_offset_no_mmu>
    c060205a:	87aa                	mv	a5,a0
    c060205c:	40f487b3          	sub	a5,s1,a5
    c0602060:	fcf43023          	sd	a5,-64(s0)
    c0602064:	fc043783          	ld	a5,-64(s0)
    c0602068:	fd043703          	ld	a4,-48(s0)
    c060206c:	e398                	sd	a4,0(a5)
    c060206e:	a025                	j	c0602096 <__spa_put+0x9c>
    c0602070:	0000a797          	auipc	a5,0xa
    c0602074:	3f078793          	addi	a5,a5,1008 # c060c460 <va_top>
    c0602078:	639c                	ld	a5,0(a5)
    c060207a:	863e                	mv	a2,a5
    c060207c:	fd043583          	ld	a1,-48(s0)
    c0602080:	00003517          	auipc	a0,0x3
    c0602084:	cb050513          	addi	a0,a0,-848 # c0604d30 <_init_data_end+0xd30>
    c0602088:	b81ff0ef          	jal	ra,c0601c08 <printd>
    c060208c:	fb043783          	ld	a5,-80(s0)
    c0602090:	fd043703          	ld	a4,-48(s0)
    c0602094:	e398                	sd	a4,0(a5)
    c0602096:	fc843783          	ld	a5,-56(s0)
    c060209a:	0007b023          	sd	zero,0(a5)
    c060209e:	fb043783          	ld	a5,-80(s0)
    c06020a2:	fd043703          	ld	a4,-48(s0)
    c06020a6:	e798                	sd	a4,8(a5)
    c06020a8:	fb043783          	ld	a5,-80(s0)
    c06020ac:	4b9c                	lw	a5,16(a5)
    c06020ae:	2785                	addiw	a5,a5,1
    c06020b0:	0007871b          	sext.w	a4,a5
    c06020b4:	fb043783          	ld	a5,-80(s0)
    c06020b8:	cb98                	sw	a4,16(a5)
    c06020ba:	0001                	nop
    c06020bc:	60a6                	ld	ra,72(sp)
    c06020be:	6406                	ld	s0,64(sp)
    c06020c0:	74e2                	ld	s1,56(sp)
    c06020c2:	6161                	addi	sp,sp,80
    c06020c4:	8082                	ret

00000000c06020c6 <__spa_get>:
    c06020c6:	715d                	addi	sp,sp,-80
    c06020c8:	e486                	sd	ra,72(sp)
    c06020ca:	e0a2                	sd	s0,64(sp)
    c06020cc:	fc26                	sd	s1,56(sp)
    c06020ce:	0880                	addi	s0,sp,80
    c06020d0:	faa43c23          	sd	a0,-72(s0)
    c06020d4:	fb843783          	ld	a5,-72(s0)
    c06020d8:	4b9c                	lw	a5,16(a5)
    c06020da:	c789                	beqz	a5,c06020e4 <__spa_get+0x1e>
    c06020dc:	fb843783          	ld	a5,-72(s0)
    c06020e0:	639c                	ld	a5,0(a5)
    c06020e2:	ef85                	bnez	a5,c060211a <__spa_get+0x54>
    c06020e4:	fb843783          	ld	a5,-72(s0)
    c06020e8:	679c                	ld	a5,8(a5)
    c06020ea:	85be                	mv	a1,a5
    c06020ec:	00003517          	auipc	a0,0x3
    c06020f0:	c8c50513          	addi	a0,a0,-884 # c0604d78 <_init_data_end+0xd78>
    c06020f4:	b15ff0ef          	jal	ra,c0601c08 <printd>
    c06020f8:	fb843503          	ld	a0,-72(s0)
    c06020fc:	24e000ef          	jal	ra,c060234a <alloc_mem_from_m>
    c0602100:	fca43c23          	sd	a0,-40(s0)
    c0602104:	fd843783          	ld	a5,-40(s0)
    c0602108:	eb89                	bnez	a5,c060211a <__spa_get+0x54>
    c060210a:	00003517          	auipc	a0,0x3
    c060210e:	c9650513          	addi	a0,a0,-874 # c0604da0 <_init_data_end+0xda0>
    c0602112:	af7ff0ef          	jal	ra,c0601c08 <printd>
    c0602116:	57fd                	li	a5,-1
    c0602118:	a0a9                	j	c0602162 <__spa_get+0x9c>
    c060211a:	fb843783          	ld	a5,-72(s0)
    c060211e:	6384                	ld	s1,0(a5)
    c0602120:	e6fff0ef          	jal	ra,c0601f8e <va_pa_offset_no_mmu>
    c0602124:	87aa                	mv	a5,a0
    c0602126:	40f487b3          	sub	a5,s1,a5
    c060212a:	fcf43823          	sd	a5,-48(s0)
    c060212e:	fb843783          	ld	a5,-72(s0)
    c0602132:	639c                	ld	a5,0(a5)
    c0602134:	fcf43c23          	sd	a5,-40(s0)
    c0602138:	fd043783          	ld	a5,-48(s0)
    c060213c:	639c                	ld	a5,0(a5)
    c060213e:	fcf43423          	sd	a5,-56(s0)
    c0602142:	fb843783          	ld	a5,-72(s0)
    c0602146:	fc843703          	ld	a4,-56(s0)
    c060214a:	e398                	sd	a4,0(a5)
    c060214c:	fb843783          	ld	a5,-72(s0)
    c0602150:	4b9c                	lw	a5,16(a5)
    c0602152:	37fd                	addiw	a5,a5,-1
    c0602154:	0007871b          	sext.w	a4,a5
    c0602158:	fb843783          	ld	a5,-72(s0)
    c060215c:	cb98                	sw	a4,16(a5)
    c060215e:	fd843783          	ld	a5,-40(s0)
    c0602162:	853e                	mv	a0,a5
    c0602164:	60a6                	ld	ra,72(sp)
    c0602166:	6406                	ld	s0,64(sp)
    c0602168:	74e2                	ld	s1,56(sp)
    c060216a:	6161                	addi	sp,sp,80
    c060216c:	8082                	ret

00000000c060216e <spa_init>:
    c060216e:	7139                	addi	sp,sp,-64
    c0602170:	fc06                	sd	ra,56(sp)
    c0602172:	f822                	sd	s0,48(sp)
    c0602174:	0080                	addi	s0,sp,64
    c0602176:	fca43c23          	sd	a0,-40(s0)
    c060217a:	fcb43823          	sd	a1,-48(s0)
    c060217e:	87b2                	mv	a5,a2
    c0602180:	fcf407a3          	sb	a5,-49(s0)
    c0602184:	fcf44783          	lbu	a5,-49(s0)
    c0602188:	2781                	sext.w	a5,a5
    c060218a:	85be                	mv	a1,a5
    c060218c:	00003517          	auipc	a0,0x3
    c0602190:	c3450513          	addi	a0,a0,-972 # c0604dc0 <_init_data_end+0xdc0>
    c0602194:	a75ff0ef          	jal	ra,c0601c08 <printd>
    c0602198:	fcf44703          	lbu	a4,-49(s0)
    c060219c:	87ba                	mv	a5,a4
    c060219e:	0786                	slli	a5,a5,0x1
    c06021a0:	97ba                	add	a5,a5,a4
    c06021a2:	078e                	slli	a5,a5,0x3
    c06021a4:	873e                	mv	a4,a5
    c06021a6:	00004797          	auipc	a5,0x4
    c06021aa:	25a78793          	addi	a5,a5,602 # c0606400 <page_pools>
    c06021ae:	97ba                	add	a5,a5,a4
    c06021b0:	fef43023          	sd	a5,-32(s0)
    c06021b4:	fe043783          	ld	a5,-32(s0)
    c06021b8:	0007a823          	sw	zero,16(a5)
    c06021bc:	fe043783          	ld	a5,-32(s0)
    c06021c0:	0007b023          	sd	zero,0(a5)
    c06021c4:	fe043783          	ld	a5,-32(s0)
    c06021c8:	0007b423          	sd	zero,8(a5)
    c06021cc:	fd843783          	ld	a5,-40(s0)
    c06021d0:	fef43423          	sd	a5,-24(s0)
    c06021d4:	a829                	j	c06021ee <spa_init+0x80>
    c06021d6:	fe043583          	ld	a1,-32(s0)
    c06021da:	fe843503          	ld	a0,-24(s0)
    c06021de:	e1dff0ef          	jal	ra,c0601ffa <__spa_put>
    c06021e2:	fe843703          	ld	a4,-24(s0)
    c06021e6:	6785                	lui	a5,0x1
    c06021e8:	97ba                	add	a5,a5,a4
    c06021ea:	fef43423          	sd	a5,-24(s0)
    c06021ee:	fd843703          	ld	a4,-40(s0)
    c06021f2:	fd043783          	ld	a5,-48(s0)
    c06021f6:	97ba                	add	a5,a5,a4
    c06021f8:	fe843703          	ld	a4,-24(s0)
    c06021fc:	fcf76de3          	bltu	a4,a5,c06021d6 <spa_init+0x68>
    c0602200:	fe043503          	ld	a0,-32(s0)
    c0602204:	c83ff0ef          	jal	ra,c0601e86 <dump_mem_pool>
    c0602208:	0001                	nop
    c060220a:	70e2                	ld	ra,56(sp)
    c060220c:	7442                	ld	s0,48(sp)
    c060220e:	6121                	addi	sp,sp,64
    c0602210:	8082                	ret

00000000c0602212 <spa_put>:
    c0602212:	1101                	addi	sp,sp,-32
    c0602214:	ec06                	sd	ra,24(sp)
    c0602216:	e822                	sd	s0,16(sp)
    c0602218:	1000                	addi	s0,sp,32
    c060221a:	fea43423          	sd	a0,-24(s0)
    c060221e:	87ae                	mv	a5,a1
    c0602220:	fef403a3          	sb	a5,-25(s0)
    c0602224:	fe744703          	lbu	a4,-25(s0)
    c0602228:	87ba                	mv	a5,a4
    c060222a:	0786                	slli	a5,a5,0x1
    c060222c:	97ba                	add	a5,a5,a4
    c060222e:	078e                	slli	a5,a5,0x3
    c0602230:	873e                	mv	a4,a5
    c0602232:	00004797          	auipc	a5,0x4
    c0602236:	1ce78793          	addi	a5,a5,462 # c0606400 <page_pools>
    c060223a:	97ba                	add	a5,a5,a4
    c060223c:	85be                	mv	a1,a5
    c060223e:	fe843503          	ld	a0,-24(s0)
    c0602242:	db9ff0ef          	jal	ra,c0601ffa <__spa_put>
    c0602246:	0001                	nop
    c0602248:	60e2                	ld	ra,24(sp)
    c060224a:	6442                	ld	s0,16(sp)
    c060224c:	6105                	addi	sp,sp,32
    c060224e:	8082                	ret

00000000c0602250 <spa_get_pa>:
    c0602250:	7179                	addi	sp,sp,-48
    c0602252:	f406                	sd	ra,40(sp)
    c0602254:	f022                	sd	s0,32(sp)
    c0602256:	1800                	addi	s0,sp,48
    c0602258:	87aa                	mv	a5,a0
    c060225a:	fcf40fa3          	sb	a5,-33(s0)
    c060225e:	fdf44703          	lbu	a4,-33(s0)
    c0602262:	87ba                	mv	a5,a4
    c0602264:	0786                	slli	a5,a5,0x1
    c0602266:	97ba                	add	a5,a5,a4
    c0602268:	078e                	slli	a5,a5,0x3
    c060226a:	873e                	mv	a4,a5
    c060226c:	00004797          	auipc	a5,0x4
    c0602270:	19478793          	addi	a5,a5,404 # c0606400 <page_pools>
    c0602274:	97ba                	add	a5,a5,a4
    c0602276:	853e                	mv	a0,a5
    c0602278:	e4fff0ef          	jal	ra,c06020c6 <__spa_get>
    c060227c:	fea43423          	sd	a0,-24(s0)
    c0602280:	fe843703          	ld	a4,-24(s0)
    c0602284:	57fd                	li	a5,-1
    c0602286:	00f71463          	bne	a4,a5,c060228e <spa_get_pa+0x3e>
    c060228a:	57fd                	li	a5,-1
    c060228c:	a031                	j	c0602298 <spa_get_pa+0x48>
    c060228e:	fe843503          	ld	a0,-24(s0)
    c0602292:	d27ff0ef          	jal	ra,c0601fb8 <get_phys_addr>
    c0602296:	87aa                	mv	a5,a0
    c0602298:	853e                	mv	a0,a5
    c060229a:	70a2                	ld	ra,40(sp)
    c060229c:	7402                	ld	s0,32(sp)
    c060229e:	6145                	addi	sp,sp,48
    c06022a0:	8082                	ret

00000000c06022a2 <spa_get_pa_zero>:
    c06022a2:	7139                	addi	sp,sp,-64
    c06022a4:	fc06                	sd	ra,56(sp)
    c06022a6:	f822                	sd	s0,48(sp)
    c06022a8:	0080                	addi	s0,sp,64
    c06022aa:	87aa                	mv	a5,a0
    c06022ac:	fcf407a3          	sb	a5,-49(s0)
    c06022b0:	fcf44703          	lbu	a4,-49(s0)
    c06022b4:	87ba                	mv	a5,a4
    c06022b6:	0786                	slli	a5,a5,0x1
    c06022b8:	97ba                	add	a5,a5,a4
    c06022ba:	078e                	slli	a5,a5,0x3
    c06022bc:	873e                	mv	a4,a5
    c06022be:	00004797          	auipc	a5,0x4
    c06022c2:	14278793          	addi	a5,a5,322 # c0606400 <page_pools>
    c06022c6:	97ba                	add	a5,a5,a4
    c06022c8:	853e                	mv	a0,a5
    c06022ca:	dfdff0ef          	jal	ra,c06020c6 <__spa_get>
    c06022ce:	fea43423          	sd	a0,-24(s0)
    c06022d2:	cbdff0ef          	jal	ra,c0601f8e <va_pa_offset_no_mmu>
    c06022d6:	872a                	mv	a4,a0
    c06022d8:	fe843783          	ld	a5,-24(s0)
    c06022dc:	8f99                	sub	a5,a5,a4
    c06022de:	fef43023          	sd	a5,-32(s0)
    c06022e2:	fe843703          	ld	a4,-24(s0)
    c06022e6:	57fd                	li	a5,-1
    c06022e8:	00f71463          	bne	a4,a5,c06022f0 <spa_get_pa_zero+0x4e>
    c06022ec:	57fd                	li	a5,-1
    c06022ee:	a005                	j	c060230e <spa_get_pa_zero+0x6c>
    c06022f0:	fe043783          	ld	a5,-32(s0)
    c06022f4:	6605                	lui	a2,0x1
    c06022f6:	4581                	li	a1,0
    c06022f8:	853e                	mv	a0,a5
    c06022fa:	959ff0ef          	jal	ra,c0601c52 <my_memset>
    c06022fe:	fe843503          	ld	a0,-24(s0)
    c0602302:	cb7ff0ef          	jal	ra,c0601fb8 <get_phys_addr>
    c0602306:	fca43c23          	sd	a0,-40(s0)
    c060230a:	fd843783          	ld	a5,-40(s0)
    c060230e:	853e                	mv	a0,a5
    c0602310:	70e2                	ld	ra,56(sp)
    c0602312:	7442                	ld	s0,48(sp)
    c0602314:	6121                	addi	sp,sp,64
    c0602316:	8082                	ret

00000000c0602318 <spa_avail>:
    c0602318:	1101                	addi	sp,sp,-32
    c060231a:	ec22                	sd	s0,24(sp)
    c060231c:	1000                	addi	s0,sp,32
    c060231e:	87aa                	mv	a5,a0
    c0602320:	fef407a3          	sb	a5,-17(s0)
    c0602324:	fef44703          	lbu	a4,-17(s0)
    c0602328:	87ba                	mv	a5,a4
    c060232a:	0786                	slli	a5,a5,0x1
    c060232c:	97ba                	add	a5,a5,a4
    c060232e:	078e                	slli	a5,a5,0x3
    c0602330:	873e                	mv	a4,a5
    c0602332:	00004797          	auipc	a5,0x4
    c0602336:	0ce78793          	addi	a5,a5,206 # c0606400 <page_pools>
    c060233a:	97ba                	add	a5,a5,a4
    c060233c:	4b9c                	lw	a5,16(a5)
    c060233e:	1782                	slli	a5,a5,0x20
    c0602340:	9381                	srli	a5,a5,0x20
    c0602342:	853e                	mv	a0,a5
    c0602344:	6462                	ld	s0,24(sp)
    c0602346:	6105                	addi	sp,sp,32
    c0602348:	8082                	ret

00000000c060234a <alloc_mem_from_m>:
    c060234a:	7139                	addi	sp,sp,-64
    c060234c:	fc06                	sd	ra,56(sp)
    c060234e:	f822                	sd	s0,48(sp)
    c0602350:	0080                	addi	s0,sp,64
    c0602352:	fca43423          	sd	a0,-56(s0)
    c0602356:	0000a797          	auipc	a5,0xa
    c060235a:	10a78793          	addi	a5,a5,266 # c060c460 <va_top>
    c060235e:	639c                	ld	a5,0(a5)
    c0602360:	853e                	mv	a0,a5
    c0602362:	4581                	li	a1,0
    c0602364:	4601                	li	a2,0
    c0602366:	19500813          	li	a6,405
    c060236a:	192617b7          	lui	a5,0x19261
    c060236e:	81778893          	addi	a7,a5,-2025 # 19260817 <_start-0xa739f7e9>
    c0602372:	00000073          	ecall
    c0602376:	87ae                	mv	a5,a1
    c0602378:	fef43023          	sd	a5,-32(s0)
    c060237c:	87b2                	mv	a5,a2
    c060237e:	fcf43c23          	sd	a5,-40(s0)
    c0602382:	fd843603          	ld	a2,-40(s0)
    c0602386:	fe043583          	ld	a1,-32(s0)
    c060238a:	00003517          	auipc	a0,0x3
    c060238e:	a6650513          	addi	a0,a0,-1434 # c0604df0 <_init_data_end+0xdf0>
    c0602392:	877ff0ef          	jal	ra,c0601c08 <printd>
    c0602396:	fe043783          	ld	a5,-32(s0)
    c060239a:	eb89                	bnez	a5,c06023ac <alloc_mem_from_m+0x62>
    c060239c:	00003517          	auipc	a0,0x3
    c06023a0:	aac50513          	addi	a0,a0,-1364 # c0604e48 <_init_data_end+0xe48>
    c06023a4:	865ff0ef          	jal	ra,c0601c08 <printd>
    c06023a8:	4781                	li	a5,0
    c06023aa:	a0c9                	j	c060246c <alloc_mem_from_m+0x122>
    c06023ac:	0000a797          	auipc	a5,0xa
    c06023b0:	0b478793          	addi	a5,a5,180 # c060c460 <va_top>
    c06023b4:	639c                	ld	a5,0(a5)
    c06023b6:	85be                	mv	a1,a5
    c06023b8:	00003517          	auipc	a0,0x3
    c06023bc:	ab850513          	addi	a0,a0,-1352 # c0604e70 <_init_data_end+0xe70>
    c06023c0:	849ff0ef          	jal	ra,c0601c08 <printd>
    c06023c4:	0000a797          	auipc	a5,0xa
    c06023c8:	09c78793          	addi	a5,a5,156 # c060c460 <va_top>
    c06023cc:	638c                	ld	a1,0(a5)
    c06023ce:	fd843783          	ld	a5,-40(s0)
    c06023d2:	83b1                	srli	a5,a5,0xc
    c06023d4:	471d                	li	a4,7
    c06023d6:	86be                	mv	a3,a5
    c06023d8:	fe043603          	ld	a2,-32(s0)
    c06023dc:	4501                	li	a0,0
    c06023de:	131000ef          	jal	ra,c0602d0e <map_page>
    c06023e2:	fe043783          	ld	a5,-32(s0)
    c06023e6:	fef43423          	sd	a5,-24(s0)
    c06023ea:	a829                	j	c0602404 <alloc_mem_from_m+0xba>
    c06023ec:	fc843583          	ld	a1,-56(s0)
    c06023f0:	fe843503          	ld	a0,-24(s0)
    c06023f4:	c07ff0ef          	jal	ra,c0601ffa <__spa_put>
    c06023f8:	fe843703          	ld	a4,-24(s0)
    c06023fc:	6785                	lui	a5,0x1
    c06023fe:	97ba                	add	a5,a5,a4
    c0602400:	fef43423          	sd	a5,-24(s0)
    c0602404:	fe043703          	ld	a4,-32(s0)
    c0602408:	fd843783          	ld	a5,-40(s0)
    c060240c:	97ba                	add	a5,a5,a4
    c060240e:	fe843703          	ld	a4,-24(s0)
    c0602412:	fcf76de3          	bltu	a4,a5,c06023ec <alloc_mem_from_m+0xa2>
    c0602416:	fc843783          	ld	a5,-56(s0)
    c060241a:	4b9c                	lw	a5,16(a5)
    c060241c:	c789                	beqz	a5,c0602426 <alloc_mem_from_m+0xdc>
    c060241e:	fc843783          	ld	a5,-56(s0)
    c0602422:	639c                	ld	a5,0(a5)
    c0602424:	e799                	bnez	a5,c0602432 <alloc_mem_from_m+0xe8>
    c0602426:	00003517          	auipc	a0,0x3
    c060242a:	a7a50513          	addi	a0,a0,-1414 # c0604ea0 <_init_data_end+0xea0>
    c060242e:	fdaff0ef          	jal	ra,c0601c08 <printd>
    c0602432:	fc843783          	ld	a5,-56(s0)
    c0602436:	4b9c                	lw	a5,16(a5)
    c0602438:	fcf42a23          	sw	a5,-44(s0)
    c060243c:	fd442783          	lw	a5,-44(s0)
    c0602440:	85be                	mv	a1,a5
    c0602442:	00003517          	auipc	a0,0x3
    c0602446:	a8e50513          	addi	a0,a0,-1394 # c0604ed0 <_init_data_end+0xed0>
    c060244a:	fbeff0ef          	jal	ra,c0601c08 <printd>
    c060244e:	0000a797          	auipc	a5,0xa
    c0602452:	01278793          	addi	a5,a5,18 # c060c460 <va_top>
    c0602456:	6398                	ld	a4,0(a5)
    c0602458:	008007b7          	lui	a5,0x800
    c060245c:	973e                	add	a4,a4,a5
    c060245e:	0000a797          	auipc	a5,0xa
    c0602462:	00278793          	addi	a5,a5,2 # c060c460 <va_top>
    c0602466:	e398                	sd	a4,0(a5)
    c0602468:	fe043783          	ld	a5,-32(s0)
    c060246c:	853e                	mv	a0,a5
    c060246e:	70e2                	ld	ra,56(sp)
    c0602470:	7442                	ld	s0,48(sp)
    c0602472:	6121                	addi	sp,sp,64
    c0602474:	8082                	ret

00000000c0602476 <flush_tlb>:
    c0602476:	1141                	addi	sp,sp,-16
    c0602478:	e422                	sd	s0,8(sp)
    c060247a:	0800                	addi	s0,sp,16
    c060247c:	12000073          	sfence.vma
    c0602480:	0001                	nop
    c0602482:	6422                	ld	s0,8(sp)
    c0602484:	0141                	addi	sp,sp,16
    c0602486:	8082                	ret

00000000c0602488 <acce_to_phys>:
    c0602488:	7179                	addi	sp,sp,-48
    c060248a:	f422                	sd	s0,40(sp)
    c060248c:	1800                	addi	s0,sp,48
    c060248e:	fca43c23          	sd	a0,-40(s0)
    c0602492:	180027f3          	csrr	a5,satp
    c0602496:	fef43423          	sd	a5,-24(s0)
    c060249a:	fe843783          	ld	a5,-24(s0)
    c060249e:	cb99                	beqz	a5,c06024b4 <acce_to_phys+0x2c>
    c06024a0:	0000a797          	auipc	a5,0xa
    c06024a4:	fd078793          	addi	a5,a5,-48 # c060c470 <ENC_VA_PA_OFFSET>
    c06024a8:	639c                	ld	a5,0(a5)
    c06024aa:	fd843703          	ld	a4,-40(s0)
    c06024ae:	40f707b3          	sub	a5,a4,a5
    c06024b2:	a019                	j	c06024b8 <acce_to_phys+0x30>
    c06024b4:	fd843783          	ld	a5,-40(s0)
    c06024b8:	853e                	mv	a0,a5
    c06024ba:	7422                	ld	s0,40(sp)
    c06024bc:	6145                	addi	sp,sp,48
    c06024be:	8082                	ret

00000000c06024c0 <trie_get_or_insert>:
    c06024c0:	7159                	addi	sp,sp,-112
    c06024c2:	f486                	sd	ra,104(sp)
    c06024c4:	f0a2                	sd	s0,96(sp)
    c06024c6:	1880                	addi	s0,sp,112
    c06024c8:	faa43c23          	sd	a0,-72(s0)
    c06024cc:	fab43823          	sd	a1,-80(s0)
    c06024d0:	fac43423          	sd	a2,-88(s0)
    c06024d4:	87b6                	mv	a5,a3
    c06024d6:	f8e43c23          	sd	a4,-104(s0)
    c06024da:	faf42223          	sw	a5,-92(s0)
    c06024de:	fe042623          	sw	zero,-20(s0)
    c06024e2:	fe042423          	sw	zero,-24(s0)
    c06024e6:	3a2000ef          	jal	ra,c0602888 <get_page_table_root>
    c06024ea:	87aa                	mv	a5,a0
    c06024ec:	fef43023          	sd	a5,-32(s0)
    c06024f0:	fb043783          	ld	a5,-80(s0)
    c06024f4:	83f9                	srli	a5,a5,0x1e
    c06024f6:	1ff7f793          	andi	a5,a5,511
    c06024fa:	fcf43023          	sd	a5,-64(s0)
    c06024fe:	fb043783          	ld	a5,-80(s0)
    c0602502:	83d5                	srli	a5,a5,0x15
    c0602504:	1ff7f793          	andi	a5,a5,511
    c0602508:	fcf43423          	sd	a5,-56(s0)
    c060250c:	fb043783          	ld	a5,-80(s0)
    c0602510:	83b1                	srli	a5,a5,0xc
    c0602512:	1ff7f793          	andi	a5,a5,511
    c0602516:	fcf43823          	sd	a5,-48(s0)
    c060251a:	a281                	j	c060265a <trie_get_or_insert+0x19a>
    c060251c:	fe846783          	lwu	a5,-24(s0)
    c0602520:	078e                	slli	a5,a5,0x3
    c0602522:	ff040713          	addi	a4,s0,-16
    c0602526:	97ba                	add	a5,a5,a4
    c0602528:	fd07b783          	ld	a5,-48(a5)
    c060252c:	fb843703          	ld	a4,-72(s0)
    c0602530:	fec46683          	lwu	a3,-20(s0)
    c0602534:	06a6                	slli	a3,a3,0x9
    c0602536:	97b6                	add	a5,a5,a3
    c0602538:	078a                	slli	a5,a5,0x2
    c060253a:	97ba                	add	a5,a5,a4
    c060253c:	439c                	lw	a5,0(a5)
    c060253e:	e7f5                	bnez	a5,c060262a <trie_get_or_insert+0x16a>
    c0602540:	fb843703          	ld	a4,-72(s0)
    c0602544:	000807b7          	lui	a5,0x80
    c0602548:	97ba                	add	a5,a5,a4
    c060254a:	439c                	lw	a5,0(a5)
    c060254c:	2785                	addiw	a5,a5,1
    c060254e:	0007871b          	sext.w	a4,a5
    c0602552:	fb843683          	ld	a3,-72(s0)
    c0602556:	000807b7          	lui	a5,0x80
    c060255a:	97b6                	add	a5,a5,a3
    c060255c:	c398                	sw	a4,0(a5)
    c060255e:	fe846783          	lwu	a5,-24(s0)
    c0602562:	078e                	slli	a5,a5,0x3
    c0602564:	ff040713          	addi	a4,s0,-16
    c0602568:	97ba                	add	a5,a5,a4
    c060256a:	fd07b783          	ld	a5,-48(a5) # 7ffd0 <_start-0xc0580030>
    c060256e:	fb843683          	ld	a3,-72(s0)
    c0602572:	00080737          	lui	a4,0x80
    c0602576:	9736                	add	a4,a4,a3
    c0602578:	4318                	lw	a4,0(a4)
    c060257a:	fb843683          	ld	a3,-72(s0)
    c060257e:	fec46603          	lwu	a2,-20(s0)
    c0602582:	0626                	slli	a2,a2,0x9
    c0602584:	97b2                	add	a5,a5,a2
    c0602586:	078a                	slli	a5,a5,0x2
    c0602588:	97b6                	add	a5,a5,a3
    c060258a:	c398                	sw	a4,0(a5)
    c060258c:	fb843703          	ld	a4,-72(s0)
    c0602590:	000807b7          	lui	a5,0x80
    c0602594:	97ba                	add	a5,a5,a4
    c0602596:	439c                	lw	a5,0(a5)
    c0602598:	85be                	mv	a1,a5
    c060259a:	00003517          	auipc	a0,0x3
    c060259e:	96e50513          	addi	a0,a0,-1682 # c0604f08 <_init_data_end+0xf08>
    c06025a2:	e66ff0ef          	jal	ra,c0601c08 <printd>
    c06025a6:	fec46783          	lwu	a5,-20(s0)
    c06025aa:	07b2                	slli	a5,a5,0xc
    c06025ac:	fe043703          	ld	a4,-32(s0)
    c06025b0:	973e                	add	a4,a4,a5
    c06025b2:	fe846783          	lwu	a5,-24(s0)
    c06025b6:	078e                	slli	a5,a5,0x3
    c06025b8:	ff040693          	addi	a3,s0,-16
    c06025bc:	97b6                	add	a5,a5,a3
    c06025be:	fd07b783          	ld	a5,-48(a5) # 7ffd0 <_start-0xc0580030>
    c06025c2:	078e                	slli	a5,a5,0x3
    c06025c4:	97ba                	add	a5,a5,a4
    c06025c6:	fcf43c23          	sd	a5,-40(s0)
    c06025ca:	fb843703          	ld	a4,-72(s0)
    c06025ce:	000807b7          	lui	a5,0x80
    c06025d2:	97ba                	add	a5,a5,a4
    c06025d4:	439c                	lw	a5,0(a5)
    c06025d6:	1782                	slli	a5,a5,0x20
    c06025d8:	9381                	srli	a5,a5,0x20
    c06025da:	07b2                	slli	a5,a5,0xc
    c06025dc:	fe043703          	ld	a4,-32(s0)
    c06025e0:	97ba                	add	a5,a5,a4
    c06025e2:	853e                	mv	a0,a5
    c06025e4:	ea5ff0ef          	jal	ra,c0602488 <acce_to_phys>
    c06025e8:	87aa                	mv	a5,a0
    c06025ea:	83b1                	srli	a5,a5,0xc
    c06025ec:	873e                	mv	a4,a5
    c06025ee:	100007b7          	lui	a5,0x10000
    c06025f2:	17fd                	addi	a5,a5,-1
    c06025f4:	8ff9                	and	a5,a5,a4
    c06025f6:	0007871b          	sext.w	a4,a5
    c06025fa:	fd843783          	ld	a5,-40(s0)
    c06025fe:	02071693          	slli	a3,a4,0x20
    c0602602:	9281                	srli	a3,a3,0x20
    c0602604:	10000737          	lui	a4,0x10000
    c0602608:	177d                	addi	a4,a4,-1
    c060260a:	8f75                	and	a4,a4,a3
    c060260c:	072a                	slli	a4,a4,0xa
    c060260e:	6390                	ld	a2,0(a5)
    c0602610:	56fd                	li	a3,-1
    c0602612:	169a                	slli	a3,a3,0x26
    c0602614:	3ff68693          	addi	a3,a3,1023
    c0602618:	8ef1                	and	a3,a3,a2
    c060261a:	8f55                	or	a4,a4,a3
    c060261c:	e398                	sd	a4,0(a5)
    c060261e:	fd843783          	ld	a5,-40(s0)
    c0602622:	6398                	ld	a4,0(a5)
    c0602624:	00176713          	ori	a4,a4,1
    c0602628:	e398                	sd	a4,0(a5)
    c060262a:	fe846783          	lwu	a5,-24(s0)
    c060262e:	078e                	slli	a5,a5,0x3
    c0602630:	ff040713          	addi	a4,s0,-16
    c0602634:	97ba                	add	a5,a5,a4
    c0602636:	fd07b783          	ld	a5,-48(a5) # fffffd0 <_start-0xb0600030>
    c060263a:	fb843703          	ld	a4,-72(s0)
    c060263e:	fec46683          	lwu	a3,-20(s0)
    c0602642:	06a6                	slli	a3,a3,0x9
    c0602644:	97b6                	add	a5,a5,a3
    c0602646:	078a                	slli	a5,a5,0x2
    c0602648:	97ba                	add	a5,a5,a4
    c060264a:	439c                	lw	a5,0(a5)
    c060264c:	fef42623          	sw	a5,-20(s0)
    c0602650:	fe842783          	lw	a5,-24(s0)
    c0602654:	2785                	addiw	a5,a5,1
    c0602656:	fef42423          	sw	a5,-24(s0)
    c060265a:	fa442783          	lw	a5,-92(s0)
    c060265e:	37fd                	addiw	a5,a5,-1
    c0602660:	2781                	sext.w	a5,a5
    c0602662:	0007871b          	sext.w	a4,a5
    c0602666:	fe842783          	lw	a5,-24(s0)
    c060266a:	2781                	sext.w	a5,a5
    c060266c:	eae7e8e3          	bltu	a5,a4,c060251c <trie_get_or_insert+0x5c>
    c0602670:	fec46783          	lwu	a5,-20(s0)
    c0602674:	07b2                	slli	a5,a5,0xc
    c0602676:	fe043703          	ld	a4,-32(s0)
    c060267a:	973e                	add	a4,a4,a5
    c060267c:	fa442783          	lw	a5,-92(s0)
    c0602680:	37fd                	addiw	a5,a5,-1
    c0602682:	2781                	sext.w	a5,a5
    c0602684:	078e                	slli	a5,a5,0x3
    c0602686:	ff040693          	addi	a3,s0,-16
    c060268a:	97b6                	add	a5,a5,a3
    c060268c:	fd07b783          	ld	a5,-48(a5)
    c0602690:	078e                	slli	a5,a5,0x3
    c0602692:	97ba                	add	a5,a5,a4
    c0602694:	fcf43c23          	sd	a5,-40(s0)
    c0602698:	fa843783          	ld	a5,-88(s0)
    c060269c:	83b1                	srli	a5,a5,0xc
    c060269e:	873e                	mv	a4,a5
    c06026a0:	100007b7          	lui	a5,0x10000
    c06026a4:	17fd                	addi	a5,a5,-1
    c06026a6:	8ff9                	and	a5,a5,a4
    c06026a8:	0007871b          	sext.w	a4,a5
    c06026ac:	fd843783          	ld	a5,-40(s0)
    c06026b0:	02071693          	slli	a3,a4,0x20
    c06026b4:	9281                	srli	a3,a3,0x20
    c06026b6:	10000737          	lui	a4,0x10000
    c06026ba:	177d                	addi	a4,a4,-1
    c06026bc:	8f75                	and	a4,a4,a3
    c06026be:	072a                	slli	a4,a4,0xa
    c06026c0:	6390                	ld	a2,0(a5)
    c06026c2:	56fd                	li	a3,-1
    c06026c4:	169a                	slli	a3,a3,0x26
    c06026c6:	3ff68693          	addi	a3,a3,1023
    c06026ca:	8ef1                	and	a3,a3,a2
    c06026cc:	8f55                	or	a4,a4,a3
    c06026ce:	e398                	sd	a4,0(a5)
    c06026d0:	fa442783          	lw	a5,-92(s0)
    c06026d4:	0007871b          	sext.w	a4,a5
    c06026d8:	4789                	li	a5,2
    c06026da:	04f71463          	bne	a4,a5,c0602722 <trie_get_or_insert+0x262>
    c06026de:	fd843783          	ld	a5,-40(s0)
    c06026e2:	639c                	ld	a5,0(a5)
    c06026e4:	83a9                	srli	a5,a5,0xa
    c06026e6:	873e                	mv	a4,a5
    c06026e8:	100007b7          	lui	a5,0x10000
    c06026ec:	17fd                	addi	a5,a5,-1
    c06026ee:	8ff9                	and	a5,a5,a4
    c06026f0:	2781                	sext.w	a5,a5
    c06026f2:	873e                	mv	a4,a5
    c06026f4:	0ffff7b7          	lui	a5,0xffff
    c06026f8:	8ff9                	and	a5,a5,a4
    c06026fa:	0007871b          	sext.w	a4,a5
    c06026fe:	fd843783          	ld	a5,-40(s0)
    c0602702:	02071693          	slli	a3,a4,0x20
    c0602706:	9281                	srli	a3,a3,0x20
    c0602708:	10000737          	lui	a4,0x10000
    c060270c:	177d                	addi	a4,a4,-1
    c060270e:	8f75                	and	a4,a4,a3
    c0602710:	072a                	slli	a4,a4,0xa
    c0602712:	6390                	ld	a2,0(a5)
    c0602714:	56fd                	li	a3,-1
    c0602716:	169a                	slli	a3,a3,0x26
    c0602718:	3ff68693          	addi	a3,a3,1023
    c060271c:	8ef1                	and	a3,a3,a2
    c060271e:	8f55                	or	a4,a4,a3
    c0602720:	e398                	sd	a4,0(a5)
    c0602722:	fd843783          	ld	a5,-40(s0)
    c0602726:	6398                	ld	a4,0(a5)
    c0602728:	02076713          	ori	a4,a4,32
    c060272c:	e398                	sd	a4,0(a5)
    c060272e:	fd843783          	ld	a5,-40(s0)
    c0602732:	639c                	ld	a5,0(a5)
    c0602734:	8395                	srli	a5,a5,0x5
    c0602736:	8b85                	andi	a5,a5,1
    c0602738:	0ff7f713          	andi	a4,a5,255
    c060273c:	fd843783          	ld	a5,-40(s0)
    c0602740:	8b05                	andi	a4,a4,1
    c0602742:	6394                	ld	a3,0(a5)
    c0602744:	9af9                	andi	a3,a3,-2
    c0602746:	8f55                	or	a4,a4,a3
    c0602748:	e398                	sd	a4,0(a5)
    c060274a:	f9843703          	ld	a4,-104(s0)
    c060274e:	4785                	li	a5,1
    c0602750:	17fa                	slli	a5,a5,0x3e
    c0602752:	8ff9                	and	a5,a5,a4
    c0602754:	cb81                	beqz	a5,c0602764 <trie_get_or_insert+0x2a4>
    c0602756:	fd843783          	ld	a5,-40(s0)
    c060275a:	6394                	ld	a3,0(a5)
    c060275c:	4705                	li	a4,1
    c060275e:	177a                	slli	a4,a4,0x3e
    c0602760:	8f55                	or	a4,a4,a3
    c0602762:	e398                	sd	a4,0(a5)
    c0602764:	f9843783          	ld	a5,-104(s0)
    c0602768:	8bc1                	andi	a5,a5,16
    c060276a:	c799                	beqz	a5,c0602778 <trie_get_or_insert+0x2b8>
    c060276c:	fd843783          	ld	a5,-40(s0)
    c0602770:	6398                	ld	a4,0(a5)
    c0602772:	01076713          	ori	a4,a4,16
    c0602776:	e398                	sd	a4,0(a5)
    c0602778:	f9843783          	ld	a5,-104(s0)
    c060277c:	8b91                	andi	a5,a5,4
    c060277e:	e791                	bnez	a5,c060278a <trie_get_or_insert+0x2ca>
    c0602780:	f9843783          	ld	a5,-104(s0)
    c0602784:	0807f793          	andi	a5,a5,128
    c0602788:	c79d                	beqz	a5,c06027b6 <trie_get_or_insert+0x2f6>
    c060278a:	fd843783          	ld	a5,-40(s0)
    c060278e:	6398                	ld	a4,0(a5)
    c0602790:	00476713          	ori	a4,a4,4
    c0602794:	e398                	sd	a4,0(a5)
    c0602796:	fd843783          	ld	a5,-40(s0)
    c060279a:	639c                	ld	a5,0(a5)
    c060279c:	8389                	srli	a5,a5,0x2
    c060279e:	8b85                	andi	a5,a5,1
    c06027a0:	0ff7f713          	andi	a4,a5,255
    c06027a4:	fd843783          	ld	a5,-40(s0)
    c06027a8:	8b05                	andi	a4,a4,1
    c06027aa:	071e                	slli	a4,a4,0x7
    c06027ac:	6394                	ld	a3,0(a5)
    c06027ae:	f7f6f693          	andi	a3,a3,-129
    c06027b2:	8f55                	or	a4,a4,a3
    c06027b4:	e398                	sd	a4,0(a5)
    c06027b6:	f9843783          	ld	a5,-104(s0)
    c06027ba:	8b89                	andi	a5,a5,2
    c06027bc:	e791                	bnez	a5,c06027c8 <trie_get_or_insert+0x308>
    c06027be:	f9843783          	ld	a5,-104(s0)
    c06027c2:	0407f793          	andi	a5,a5,64
    c06027c6:	c79d                	beqz	a5,c06027f4 <trie_get_or_insert+0x334>
    c06027c8:	fd843783          	ld	a5,-40(s0)
    c06027cc:	6398                	ld	a4,0(a5)
    c06027ce:	00276713          	ori	a4,a4,2
    c06027d2:	e398                	sd	a4,0(a5)
    c06027d4:	fd843783          	ld	a5,-40(s0)
    c06027d8:	639c                	ld	a5,0(a5)
    c06027da:	8385                	srli	a5,a5,0x1
    c06027dc:	8b85                	andi	a5,a5,1
    c06027de:	0ff7f713          	andi	a4,a5,255
    c06027e2:	fd843783          	ld	a5,-40(s0)
    c06027e6:	8b05                	andi	a4,a4,1
    c06027e8:	071a                	slli	a4,a4,0x6
    c06027ea:	6394                	ld	a3,0(a5)
    c06027ec:	fbf6f693          	andi	a3,a3,-65
    c06027f0:	8f55                	or	a4,a4,a3
    c06027f2:	e398                	sd	a4,0(a5)
    c06027f4:	f9843783          	ld	a5,-104(s0)
    c06027f8:	8ba1                	andi	a5,a5,8
    c06027fa:	c799                	beqz	a5,c0602808 <trie_get_or_insert+0x348>
    c06027fc:	fd843783          	ld	a5,-40(s0)
    c0602800:	6398                	ld	a4,0(a5)
    c0602802:	00876713          	ori	a4,a4,8
    c0602806:	e398                	sd	a4,0(a5)
    c0602808:	fd843783          	ld	a5,-40(s0)
    c060280c:	639c                	ld	a5,0(a5)
    c060280e:	853e                	mv	a0,a5
    c0602810:	70a6                	ld	ra,104(sp)
    c0602812:	7406                	ld	s0,96(sp)
    c0602814:	6165                	addi	sp,sp,112
    c0602816:	8082                	ret

00000000c0602818 <page_directory_insert>:
    c0602818:	7139                	addi	sp,sp,-64
    c060281a:	fc06                	sd	ra,56(sp)
    c060281c:	f822                	sd	s0,48(sp)
    c060281e:	0080                	addi	s0,sp,64
    c0602820:	fca43c23          	sd	a0,-40(s0)
    c0602824:	fcb43823          	sd	a1,-48(s0)
    c0602828:	87b2                	mv	a5,a2
    c060282a:	fcd43023          	sd	a3,-64(s0)
    c060282e:	fcf42623          	sw	a5,-52(s0)
    c0602832:	07a000ef          	jal	ra,c06028ac <get_trie_root>
    c0602836:	87aa                	mv	a5,a0
    c0602838:	fef43423          	sd	a5,-24(s0)
    c060283c:	fcc42783          	lw	a5,-52(s0)
    c0602840:	fc043703          	ld	a4,-64(s0)
    c0602844:	86be                	mv	a3,a5
    c0602846:	fd043603          	ld	a2,-48(s0)
    c060284a:	fd843583          	ld	a1,-40(s0)
    c060284e:	fe843503          	ld	a0,-24(s0)
    c0602852:	c6fff0ef          	jal	ra,c06024c0 <trie_get_or_insert>
    c0602856:	fea43023          	sd	a0,-32(s0)
    c060285a:	fe043783          	ld	a5,-32(s0)
    c060285e:	853e                	mv	a0,a5
    c0602860:	70e2                	ld	ra,56(sp)
    c0602862:	7442                	ld	s0,48(sp)
    c0602864:	6121                	addi	sp,sp,64
    c0602866:	8082                	ret

00000000c0602868 <set_page_table_root>:
    c0602868:	1101                	addi	sp,sp,-32
    c060286a:	ec22                	sd	s0,24(sp)
    c060286c:	1000                	addi	s0,sp,32
    c060286e:	fea43423          	sd	a0,-24(s0)
    c0602872:	0000a797          	auipc	a5,0xa
    c0602876:	bbe78793          	addi	a5,a5,-1090 # c060c430 <page_directory_pool>
    c060287a:	fe843703          	ld	a4,-24(s0)
    c060287e:	e398                	sd	a4,0(a5)
    c0602880:	0001                	nop
    c0602882:	6462                	ld	s0,24(sp)
    c0602884:	6105                	addi	sp,sp,32
    c0602886:	8082                	ret

00000000c0602888 <get_page_table_root>:
    c0602888:	1141                	addi	sp,sp,-16
    c060288a:	e406                	sd	ra,8(sp)
    c060288c:	e022                	sd	s0,0(sp)
    c060288e:	0800                	addi	s0,sp,16
    c0602890:	ecaff0ef          	jal	ra,c0601f5a <va_pa_offset>
    c0602894:	872a                	mv	a4,a0
    c0602896:	0000a797          	auipc	a5,0xa
    c060289a:	b9a78793          	addi	a5,a5,-1126 # c060c430 <page_directory_pool>
    c060289e:	639c                	ld	a5,0(a5)
    c06028a0:	97ba                	add	a5,a5,a4
    c06028a2:	853e                	mv	a0,a5
    c06028a4:	60a2                	ld	ra,8(sp)
    c06028a6:	6402                	ld	s0,0(sp)
    c06028a8:	0141                	addi	sp,sp,16
    c06028aa:	8082                	ret

00000000c06028ac <get_trie_root>:
    c06028ac:	1141                	addi	sp,sp,-16
    c06028ae:	e406                	sd	ra,8(sp)
    c06028b0:	e022                	sd	s0,0(sp)
    c06028b2:	0800                	addi	s0,sp,16
    c06028b4:	fd5ff0ef          	jal	ra,c0602888 <get_page_table_root>
    c06028b8:	872a                	mv	a4,a0
    c06028ba:	001007b7          	lui	a5,0x100
    c06028be:	97ba                	add	a5,a5,a4
    c06028c0:	853e                	mv	a0,a5
    c06028c2:	60a2                	ld	ra,8(sp)
    c06028c4:	6402                	ld	s0,0(sp)
    c06028c6:	0141                	addi	sp,sp,16
    c06028c8:	8082                	ret

00000000c06028ca <get_page_table_root_pointer_addr>:
    c06028ca:	1141                	addi	sp,sp,-16
    c06028cc:	e422                	sd	s0,8(sp)
    c06028ce:	0800                	addi	s0,sp,16
    c06028d0:	0000a797          	auipc	a5,0xa
    c06028d4:	b6078793          	addi	a5,a5,-1184 # c060c430 <page_directory_pool>
    c06028d8:	853e                	mv	a0,a5
    c06028da:	6422                	ld	s0,8(sp)
    c06028dc:	0141                	addi	sp,sp,16
    c06028de:	8082                	ret

00000000c06028e0 <flush_page_table_cache_and_tlb>:
    c06028e0:	1101                	addi	sp,sp,-32
    c06028e2:	ec06                	sd	ra,24(sp)
    c06028e4:	e822                	sd	s0,16(sp)
    c06028e6:	1000                	addi	s0,sp,32
    c06028e8:	0000a797          	auipc	a5,0xa
    c06028ec:	b4878793          	addi	a5,a5,-1208 # c060c430 <page_directory_pool>
    c06028f0:	639c                	ld	a5,0(a5)
    c06028f2:	fef43423          	sd	a5,-24(s0)
    c06028f6:	fe843703          	ld	a4,-24(s0)
    c06028fa:	001817b7          	lui	a5,0x181
    c06028fe:	97ba                	add	a5,a5,a4
    c0602900:	85be                	mv	a1,a5
    c0602902:	fe843503          	ld	a0,-24(s0)
    c0602906:	c70ff0ef          	jal	ra,c0601d76 <flush_dcache_range>
    c060290a:	b6dff0ef          	jal	ra,c0602476 <flush_tlb>
    c060290e:	0001                	nop
    c0602910:	60e2                	ld	ra,24(sp)
    c0602912:	6442                	ld	s0,16(sp)
    c0602914:	6105                	addi	sp,sp,32
    c0602916:	8082                	ret

00000000c0602918 <print_pte>:
    c0602918:	711d                	addi	sp,sp,-96
    c060291a:	ec86                	sd	ra,88(sp)
    c060291c:	e8a2                	sd	s0,80(sp)
    c060291e:	1080                	addi	s0,sp,96
    c0602920:	faa43423          	sd	a0,-88(s0)
    c0602924:	fa843783          	ld	a5,-88(s0)
    c0602928:	83f9                	srli	a5,a5,0x1e
    c060292a:	1ff7f793          	andi	a5,a5,511
    c060292e:	fcf43023          	sd	a5,-64(s0)
    c0602932:	fa843783          	ld	a5,-88(s0)
    c0602936:	83d5                	srli	a5,a5,0x15
    c0602938:	1ff7f793          	andi	a5,a5,511
    c060293c:	fcf43423          	sd	a5,-56(s0)
    c0602940:	fa843783          	ld	a5,-88(s0)
    c0602944:	83b1                	srli	a5,a5,0xc
    c0602946:	1ff7f793          	andi	a5,a5,511
    c060294a:	fcf43823          	sd	a5,-48(s0)
    c060294e:	f3bff0ef          	jal	ra,c0602888 <get_page_table_root>
    c0602952:	87aa                	mv	a5,a0
    c0602954:	fef43423          	sd	a5,-24(s0)
    c0602958:	fe042223          	sw	zero,-28(s0)
    c060295c:	fe442783          	lw	a5,-28(s0)
    c0602960:	078e                	slli	a5,a5,0x3
    c0602962:	ff040713          	addi	a4,s0,-16
    c0602966:	97ba                	add	a5,a5,a4
    c0602968:	fd07b783          	ld	a5,-48(a5) # 180fd0 <_start-0xc047f030>
    c060296c:	078e                	slli	a5,a5,0x3
    c060296e:	fe843703          	ld	a4,-24(s0)
    c0602972:	97ba                	add	a5,a5,a4
    c0602974:	639c                	ld	a5,0(a5)
    c0602976:	faf43823          	sd	a5,-80(s0)
    c060297a:	fb043783          	ld	a5,-80(s0)
    c060297e:	8b85                	andi	a5,a5,1
    c0602980:	eb91                	bnez	a5,c0602994 <print_pte+0x7c>
    c0602982:	fa843583          	ld	a1,-88(s0)
    c0602986:	00002517          	auipc	a0,0x2
    c060298a:	5ba50513          	addi	a0,a0,1466 # c0604f40 <_init_data_end+0xf40>
    c060298e:	a7aff0ef          	jal	ra,c0601c08 <printd>
    c0602992:	aa71                	j	c0602b2e <print_pte+0x216>
    c0602994:	fb043783          	ld	a5,-80(s0)
    c0602998:	8385                	srli	a5,a5,0x1
    c060299a:	8b85                	andi	a5,a5,1
    c060299c:	0ff7f713          	andi	a4,a5,255
    c06029a0:	fb043783          	ld	a5,-80(s0)
    c06029a4:	8389                	srli	a5,a5,0x2
    c06029a6:	8b85                	andi	a5,a5,1
    c06029a8:	0ff7f793          	andi	a5,a5,255
    c06029ac:	8fd9                	or	a5,a5,a4
    c06029ae:	0ff7f713          	andi	a4,a5,255
    c06029b2:	fb043783          	ld	a5,-80(s0)
    c06029b6:	838d                	srli	a5,a5,0x3
    c06029b8:	8b85                	andi	a5,a5,1
    c06029ba:	0ff7f793          	andi	a5,a5,255
    c06029be:	8fd9                	or	a5,a5,a4
    c06029c0:	0ff7f793          	andi	a5,a5,255
    c06029c4:	ef95                	bnez	a5,c0602a00 <print_pte+0xe8>
    c06029c6:	fb043783          	ld	a5,-80(s0)
    c06029ca:	83a9                	srli	a5,a5,0xa
    c06029cc:	873e                	mv	a4,a5
    c06029ce:	100007b7          	lui	a5,0x10000
    c06029d2:	17fd                	addi	a5,a5,-1
    c06029d4:	8ff9                	and	a5,a5,a4
    c06029d6:	2781                	sext.w	a5,a5
    c06029d8:	2781                	sext.w	a5,a5
    c06029da:	00c7979b          	slliw	a5,a5,0xc
    c06029de:	2781                	sext.w	a5,a5
    c06029e0:	fcf43c23          	sd	a5,-40(s0)
    c06029e4:	d76ff0ef          	jal	ra,c0601f5a <va_pa_offset>
    c06029e8:	872a                	mv	a4,a0
    c06029ea:	fd843783          	ld	a5,-40(s0)
    c06029ee:	97ba                	add	a5,a5,a4
    c06029f0:	fef43423          	sd	a5,-24(s0)
    c06029f4:	fe442783          	lw	a5,-28(s0)
    c06029f8:	2785                	addiw	a5,a5,1
    c06029fa:	fef42223          	sw	a5,-28(s0)
    c06029fe:	bfb9                	j	c060295c <print_pte+0x44>
    c0602a00:	0001                	nop
    c0602a02:	fa843583          	ld	a1,-88(s0)
    c0602a06:	00002517          	auipc	a0,0x2
    c0602a0a:	56250513          	addi	a0,a0,1378 # c0604f68 <_init_data_end+0xf68>
    c0602a0e:	9faff0ef          	jal	ra,c0601c08 <printd>
    c0602a12:	fe843583          	ld	a1,-24(s0)
    c0602a16:	00002517          	auipc	a0,0x2
    c0602a1a:	57a50513          	addi	a0,a0,1402 # c0604f90 <_init_data_end+0xf90>
    c0602a1e:	9eaff0ef          	jal	ra,c0601c08 <printd>
    c0602a22:	fb043783          	ld	a5,-80(s0)
    c0602a26:	83a9                	srli	a5,a5,0xa
    c0602a28:	873e                	mv	a4,a5
    c0602a2a:	100007b7          	lui	a5,0x10000
    c0602a2e:	17fd                	addi	a5,a5,-1
    c0602a30:	8ff9                	and	a5,a5,a4
    c0602a32:	2781                	sext.w	a5,a5
    c0602a34:	2781                	sext.w	a5,a5
    c0602a36:	85be                	mv	a1,a5
    c0602a38:	00002517          	auipc	a0,0x2
    c0602a3c:	57050513          	addi	a0,a0,1392 # c0604fa8 <_init_data_end+0xfa8>
    c0602a40:	9c8ff0ef          	jal	ra,c0601c08 <printd>
    c0602a44:	fb043783          	ld	a5,-80(s0)
    c0602a48:	8b85                	andi	a5,a5,1
    c0602a4a:	0ff7f793          	andi	a5,a5,255
    c0602a4e:	2781                	sext.w	a5,a5
    c0602a50:	85be                	mv	a1,a5
    c0602a52:	00002517          	auipc	a0,0x2
    c0602a56:	56650513          	addi	a0,a0,1382 # c0604fb8 <_init_data_end+0xfb8>
    c0602a5a:	9aeff0ef          	jal	ra,c0601c08 <printd>
    c0602a5e:	fb043783          	ld	a5,-80(s0)
    c0602a62:	8385                	srli	a5,a5,0x1
    c0602a64:	8b85                	andi	a5,a5,1
    c0602a66:	0ff7f793          	andi	a5,a5,255
    c0602a6a:	2781                	sext.w	a5,a5
    c0602a6c:	85be                	mv	a1,a5
    c0602a6e:	00002517          	auipc	a0,0x2
    c0602a72:	55a50513          	addi	a0,a0,1370 # c0604fc8 <_init_data_end+0xfc8>
    c0602a76:	992ff0ef          	jal	ra,c0601c08 <printd>
    c0602a7a:	fb043783          	ld	a5,-80(s0)
    c0602a7e:	8389                	srli	a5,a5,0x2
    c0602a80:	8b85                	andi	a5,a5,1
    c0602a82:	0ff7f793          	andi	a5,a5,255
    c0602a86:	2781                	sext.w	a5,a5
    c0602a88:	85be                	mv	a1,a5
    c0602a8a:	00002517          	auipc	a0,0x2
    c0602a8e:	54e50513          	addi	a0,a0,1358 # c0604fd8 <_init_data_end+0xfd8>
    c0602a92:	976ff0ef          	jal	ra,c0601c08 <printd>
    c0602a96:	fb043783          	ld	a5,-80(s0)
    c0602a9a:	838d                	srli	a5,a5,0x3
    c0602a9c:	8b85                	andi	a5,a5,1
    c0602a9e:	0ff7f793          	andi	a5,a5,255
    c0602aa2:	2781                	sext.w	a5,a5
    c0602aa4:	85be                	mv	a1,a5
    c0602aa6:	00002517          	auipc	a0,0x2
    c0602aaa:	54250513          	addi	a0,a0,1346 # c0604fe8 <_init_data_end+0xfe8>
    c0602aae:	95aff0ef          	jal	ra,c0601c08 <printd>
    c0602ab2:	fb043783          	ld	a5,-80(s0)
    c0602ab6:	8391                	srli	a5,a5,0x4
    c0602ab8:	8b85                	andi	a5,a5,1
    c0602aba:	0ff7f793          	andi	a5,a5,255
    c0602abe:	2781                	sext.w	a5,a5
    c0602ac0:	85be                	mv	a1,a5
    c0602ac2:	00002517          	auipc	a0,0x2
    c0602ac6:	53650513          	addi	a0,a0,1334 # c0604ff8 <_init_data_end+0xff8>
    c0602aca:	93eff0ef          	jal	ra,c0601c08 <printd>
    c0602ace:	fb043783          	ld	a5,-80(s0)
    c0602ad2:	8395                	srli	a5,a5,0x5
    c0602ad4:	8b85                	andi	a5,a5,1
    c0602ad6:	0ff7f793          	andi	a5,a5,255
    c0602ada:	2781                	sext.w	a5,a5
    c0602adc:	85be                	mv	a1,a5
    c0602ade:	00002517          	auipc	a0,0x2
    c0602ae2:	52a50513          	addi	a0,a0,1322 # c0605008 <_init_data_end+0x1008>
    c0602ae6:	922ff0ef          	jal	ra,c0601c08 <printd>
    c0602aea:	fb043783          	ld	a5,-80(s0)
    c0602aee:	8399                	srli	a5,a5,0x6
    c0602af0:	8b85                	andi	a5,a5,1
    c0602af2:	0ff7f793          	andi	a5,a5,255
    c0602af6:	2781                	sext.w	a5,a5
    c0602af8:	85be                	mv	a1,a5
    c0602afa:	00002517          	auipc	a0,0x2
    c0602afe:	51e50513          	addi	a0,a0,1310 # c0605018 <_init_data_end+0x1018>
    c0602b02:	906ff0ef          	jal	ra,c0601c08 <printd>
    c0602b06:	fb043783          	ld	a5,-80(s0)
    c0602b0a:	839d                	srli	a5,a5,0x7
    c0602b0c:	8b85                	andi	a5,a5,1
    c0602b0e:	0ff7f793          	andi	a5,a5,255
    c0602b12:	2781                	sext.w	a5,a5
    c0602b14:	85be                	mv	a1,a5
    c0602b16:	00002517          	auipc	a0,0x2
    c0602b1a:	51250513          	addi	a0,a0,1298 # c0605028 <_init_data_end+0x1028>
    c0602b1e:	8eaff0ef          	jal	ra,c0601c08 <printd>
    c0602b22:	00002517          	auipc	a0,0x2
    c0602b26:	51650513          	addi	a0,a0,1302 # c0605038 <_init_data_end+0x1038>
    c0602b2a:	8deff0ef          	jal	ra,c0601c08 <printd>
    c0602b2e:	60e6                	ld	ra,88(sp)
    c0602b30:	6446                	ld	s0,80(sp)
    c0602b32:	6125                	addi	sp,sp,96
    c0602b34:	8082                	ret

00000000c0602b36 <get_pa>:
    c0602b36:	711d                	addi	sp,sp,-96
    c0602b38:	ec86                	sd	ra,88(sp)
    c0602b3a:	e8a2                	sd	s0,80(sp)
    c0602b3c:	1080                	addi	s0,sp,96
    c0602b3e:	faa43423          	sd	a0,-88(s0)
    c0602b42:	fa843783          	ld	a5,-88(s0)
    c0602b46:	83f9                	srli	a5,a5,0x1e
    c0602b48:	1ff7f793          	andi	a5,a5,511
    c0602b4c:	fcf43023          	sd	a5,-64(s0)
    c0602b50:	fa843783          	ld	a5,-88(s0)
    c0602b54:	83d5                	srli	a5,a5,0x15
    c0602b56:	1ff7f793          	andi	a5,a5,511
    c0602b5a:	fcf43423          	sd	a5,-56(s0)
    c0602b5e:	fa843783          	ld	a5,-88(s0)
    c0602b62:	83b1                	srli	a5,a5,0xc
    c0602b64:	1ff7f793          	andi	a5,a5,511
    c0602b68:	fcf43823          	sd	a5,-48(s0)
    c0602b6c:	d1dff0ef          	jal	ra,c0602888 <get_page_table_root>
    c0602b70:	87aa                	mv	a5,a0
    c0602b72:	fef43423          	sd	a5,-24(s0)
    c0602b76:	fe042223          	sw	zero,-28(s0)
    c0602b7a:	fe442783          	lw	a5,-28(s0)
    c0602b7e:	078e                	slli	a5,a5,0x3
    c0602b80:	ff040713          	addi	a4,s0,-16
    c0602b84:	97ba                	add	a5,a5,a4
    c0602b86:	fd07b783          	ld	a5,-48(a5) # fffffd0 <_start-0xb0600030>
    c0602b8a:	078e                	slli	a5,a5,0x3
    c0602b8c:	fe843703          	ld	a4,-24(s0)
    c0602b90:	97ba                	add	a5,a5,a4
    c0602b92:	639c                	ld	a5,0(a5)
    c0602b94:	faf43823          	sd	a5,-80(s0)
    c0602b98:	fb043783          	ld	a5,-80(s0)
    c0602b9c:	8b85                	andi	a5,a5,1
    c0602b9e:	eb99                	bnez	a5,c0602bb4 <get_pa+0x7e>
    c0602ba0:	fa843583          	ld	a1,-88(s0)
    c0602ba4:	00002517          	auipc	a0,0x2
    c0602ba8:	39c50513          	addi	a0,a0,924 # c0604f40 <_init_data_end+0xf40>
    c0602bac:	85cff0ef          	jal	ra,c0601c08 <printd>
    c0602bb0:	4781                	li	a5,0
    c0602bb2:	a0ed                	j	c0602c9c <get_pa+0x166>
    c0602bb4:	fb043783          	ld	a5,-80(s0)
    c0602bb8:	8385                	srli	a5,a5,0x1
    c0602bba:	8b85                	andi	a5,a5,1
    c0602bbc:	0ff7f713          	andi	a4,a5,255
    c0602bc0:	fb043783          	ld	a5,-80(s0)
    c0602bc4:	8389                	srli	a5,a5,0x2
    c0602bc6:	8b85                	andi	a5,a5,1
    c0602bc8:	0ff7f793          	andi	a5,a5,255
    c0602bcc:	8fd9                	or	a5,a5,a4
    c0602bce:	0ff7f713          	andi	a4,a5,255
    c0602bd2:	fb043783          	ld	a5,-80(s0)
    c0602bd6:	838d                	srli	a5,a5,0x3
    c0602bd8:	8b85                	andi	a5,a5,1
    c0602bda:	0ff7f793          	andi	a5,a5,255
    c0602bde:	8fd9                	or	a5,a5,a4
    c0602be0:	0ff7f793          	andi	a5,a5,255
    c0602be4:	ef95                	bnez	a5,c0602c20 <get_pa+0xea>
    c0602be6:	fb043783          	ld	a5,-80(s0)
    c0602bea:	83a9                	srli	a5,a5,0xa
    c0602bec:	873e                	mv	a4,a5
    c0602bee:	100007b7          	lui	a5,0x10000
    c0602bf2:	17fd                	addi	a5,a5,-1
    c0602bf4:	8ff9                	and	a5,a5,a4
    c0602bf6:	2781                	sext.w	a5,a5
    c0602bf8:	2781                	sext.w	a5,a5
    c0602bfa:	00c7979b          	slliw	a5,a5,0xc
    c0602bfe:	2781                	sext.w	a5,a5
    c0602c00:	fcf43c23          	sd	a5,-40(s0)
    c0602c04:	b56ff0ef          	jal	ra,c0601f5a <va_pa_offset>
    c0602c08:	872a                	mv	a4,a0
    c0602c0a:	fd843783          	ld	a5,-40(s0)
    c0602c0e:	97ba                	add	a5,a5,a4
    c0602c10:	fef43423          	sd	a5,-24(s0)
    c0602c14:	fe442783          	lw	a5,-28(s0)
    c0602c18:	2785                	addiw	a5,a5,1
    c0602c1a:	fef42223          	sw	a5,-28(s0)
    c0602c1e:	bfb1                	j	c0602b7a <get_pa+0x44>
    c0602c20:	0001                	nop
    c0602c22:	fe442783          	lw	a5,-28(s0)
    c0602c26:	0007871b          	sext.w	a4,a5
    c0602c2a:	4789                	li	a5,2
    c0602c2c:	02f71763          	bne	a4,a5,c0602c5a <get_pa+0x124>
    c0602c30:	fb043783          	ld	a5,-80(s0)
    c0602c34:	83a9                	srli	a5,a5,0xa
    c0602c36:	873e                	mv	a4,a5
    c0602c38:	100007b7          	lui	a5,0x10000
    c0602c3c:	17fd                	addi	a5,a5,-1
    c0602c3e:	8ff9                	and	a5,a5,a4
    c0602c40:	2781                	sext.w	a5,a5
    c0602c42:	2781                	sext.w	a5,a5
    c0602c44:	00c7979b          	slliw	a5,a5,0xc
    c0602c48:	2781                	sext.w	a5,a5
    c0602c4a:	86be                	mv	a3,a5
    c0602c4c:	fa843703          	ld	a4,-88(s0)
    c0602c50:	6785                	lui	a5,0x1
    c0602c52:	17fd                	addi	a5,a5,-1
    c0602c54:	8ff9                	and	a5,a5,a4
    c0602c56:	8fd5                	or	a5,a5,a3
    c0602c58:	a091                	j	c0602c9c <get_pa+0x166>
    c0602c5a:	fe442783          	lw	a5,-28(s0)
    c0602c5e:	0007871b          	sext.w	a4,a5
    c0602c62:	4785                	li	a5,1
    c0602c64:	02f71b63          	bne	a4,a5,c0602c9a <get_pa+0x164>
    c0602c68:	fb043783          	ld	a5,-80(s0)
    c0602c6c:	83a9                	srli	a5,a5,0xa
    c0602c6e:	873e                	mv	a4,a5
    c0602c70:	100007b7          	lui	a5,0x10000
    c0602c74:	17fd                	addi	a5,a5,-1
    c0602c76:	8ff9                	and	a5,a5,a4
    c0602c78:	2781                	sext.w	a5,a5
    c0602c7a:	2781                	sext.w	a5,a5
    c0602c7c:	4097d79b          	sraiw	a5,a5,0x9
    c0602c80:	2781                	sext.w	a5,a5
    c0602c82:	0157979b          	slliw	a5,a5,0x15
    c0602c86:	2781                	sext.w	a5,a5
    c0602c88:	86be                	mv	a3,a5
    c0602c8a:	fa843703          	ld	a4,-88(s0)
    c0602c8e:	002007b7          	lui	a5,0x200
    c0602c92:	17fd                	addi	a5,a5,-1
    c0602c94:	8ff9                	and	a5,a5,a4
    c0602c96:	8fd5                	or	a5,a5,a3
    c0602c98:	a011                	j	c0602c9c <get_pa+0x166>
    c0602c9a:	4781                	li	a5,0
    c0602c9c:	853e                	mv	a0,a5
    c0602c9e:	60e6                	ld	ra,88(sp)
    c0602ca0:	6446                	ld	s0,80(sp)
    c0602ca2:	6125                	addi	sp,sp,96
    c0602ca4:	8082                	ret

00000000c0602ca6 <test_va>:
    c0602ca6:	7139                	addi	sp,sp,-64
    c0602ca8:	fc06                	sd	ra,56(sp)
    c0602caa:	f822                	sd	s0,48(sp)
    c0602cac:	0080                	addi	s0,sp,64
    c0602cae:	fca43423          	sd	a0,-56(s0)
    c0602cb2:	fc843783          	ld	a5,-56(s0)
    c0602cb6:	fef43423          	sd	a5,-24(s0)
    c0602cba:	fc843503          	ld	a0,-56(s0)
    c0602cbe:	e79ff0ef          	jal	ra,c0602b36 <get_pa>
    c0602cc2:	fea43023          	sd	a0,-32(s0)
    c0602cc6:	fe043603          	ld	a2,-32(s0)
    c0602cca:	fc843583          	ld	a1,-56(s0)
    c0602cce:	00002517          	auipc	a0,0x2
    c0602cd2:	39a50513          	addi	a0,a0,922 # c0605068 <_init_data_end+0x1068>
    c0602cd6:	f33fe0ef          	jal	ra,c0601c08 <printd>
    c0602cda:	fc843503          	ld	a0,-56(s0)
    c0602cde:	c3bff0ef          	jal	ra,c0602918 <print_pte>
    c0602ce2:	180027f3          	csrr	a5,satp
    c0602ce6:	fcf43c23          	sd	a5,-40(s0)
    c0602cea:	fd843783          	ld	a5,-40(s0)
    c0602cee:	cb99                	beqz	a5,c0602d04 <test_va+0x5e>
    c0602cf0:	fe843783          	ld	a5,-24(s0)
    c0602cf4:	639c                	ld	a5,0(a5)
    c0602cf6:	85be                	mv	a1,a5
    c0602cf8:	00002517          	auipc	a0,0x2
    c0602cfc:	39850513          	addi	a0,a0,920 # c0605090 <_init_data_end+0x1090>
    c0602d00:	f09fe0ef          	jal	ra,c0601c08 <printd>
    c0602d04:	0001                	nop
    c0602d06:	70e2                	ld	ra,56(sp)
    c0602d08:	7442                	ld	s0,48(sp)
    c0602d0a:	6121                	addi	sp,sp,64
    c0602d0c:	8082                	ret

00000000c0602d0e <map_page>:
    c0602d0e:	715d                	addi	sp,sp,-80
    c0602d10:	e486                	sd	ra,72(sp)
    c0602d12:	e0a2                	sd	s0,64(sp)
    c0602d14:	0880                	addi	s0,sp,80
    c0602d16:	fca43c23          	sd	a0,-40(s0)
    c0602d1a:	fcb43823          	sd	a1,-48(s0)
    c0602d1e:	fcc43423          	sd	a2,-56(s0)
    c0602d22:	fcd43023          	sd	a3,-64(s0)
    c0602d26:	fae43c23          	sd	a4,-72(s0)
    c0602d2a:	fe0407a3          	sb	zero,-17(s0)
    c0602d2e:	fd043703          	ld	a4,-48(s0)
    c0602d32:	001007b7          	lui	a5,0x100
    c0602d36:	00e7e563          	bltu	a5,a4,c0602d40 <map_page+0x32>
    c0602d3a:	4785                	li	a5,1
    c0602d3c:	fef407a3          	sb	a5,-17(s0)
    c0602d40:	fef44783          	lbu	a5,-17(s0)
    c0602d44:	0ff7f793          	andi	a5,a5,255
    c0602d48:	c7b1                	beqz	a5,c0602d94 <map_page+0x86>
    c0602d4a:	fc043783          	ld	a5,-64(s0)
    c0602d4e:	2781                	sext.w	a5,a5
    c0602d50:	863e                	mv	a2,a5
    c0602d52:	fd043583          	ld	a1,-48(s0)
    c0602d56:	fc843503          	ld	a0,-56(s0)
    c0602d5a:	28c000ef          	jal	ra,c0602fe6 <insert_inverse_map>
    c0602d5e:	a81d                	j	c0602d94 <map_page+0x86>
    c0602d60:	fb843683          	ld	a3,-72(s0)
    c0602d64:	460d                	li	a2,3
    c0602d66:	fc843583          	ld	a1,-56(s0)
    c0602d6a:	fd043503          	ld	a0,-48(s0)
    c0602d6e:	aabff0ef          	jal	ra,c0602818 <page_directory_insert>
    c0602d72:	fd043703          	ld	a4,-48(s0)
    c0602d76:	6785                	lui	a5,0x1
    c0602d78:	97ba                	add	a5,a5,a4
    c0602d7a:	fcf43823          	sd	a5,-48(s0)
    c0602d7e:	fc843703          	ld	a4,-56(s0)
    c0602d82:	6785                	lui	a5,0x1
    c0602d84:	97ba                	add	a5,a5,a4
    c0602d86:	fcf43423          	sd	a5,-56(s0)
    c0602d8a:	fc043783          	ld	a5,-64(s0)
    c0602d8e:	17fd                	addi	a5,a5,-1
    c0602d90:	fcf43023          	sd	a5,-64(s0)
    c0602d94:	fc043783          	ld	a5,-64(s0)
    c0602d98:	f7e1                	bnez	a5,c0602d60 <map_page+0x52>
    c0602d9a:	180027f3          	csrr	a5,satp
    c0602d9e:	fef43023          	sd	a5,-32(s0)
    c0602da2:	fe043783          	ld	a5,-32(s0)
    c0602da6:	c399                	beqz	a5,c0602dac <map_page+0x9e>
    c0602da8:	b39ff0ef          	jal	ra,c06028e0 <flush_page_table_cache_and_tlb>
    c0602dac:	0001                	nop
    c0602dae:	60a6                	ld	ra,72(sp)
    c0602db0:	6406                	ld	s0,64(sp)
    c0602db2:	6161                	addi	sp,sp,80
    c0602db4:	8082                	ret

00000000c0602db6 <ioremap>:
    c0602db6:	7139                	addi	sp,sp,-64
    c0602db8:	fc06                	sd	ra,56(sp)
    c0602dba:	f822                	sd	s0,48(sp)
    c0602dbc:	0080                	addi	s0,sp,64
    c0602dbe:	fca43c23          	sd	a0,-40(s0)
    c0602dc2:	fcb43823          	sd	a1,-48(s0)
    c0602dc6:	fcc43423          	sd	a2,-56(s0)
    c0602dca:	abfff0ef          	jal	ra,c0602888 <get_page_table_root>
    c0602dce:	87aa                	mv	a5,a0
    c0602dd0:	85be                	mv	a1,a5
    c0602dd2:	00002517          	auipc	a0,0x2
    c0602dd6:	2de50513          	addi	a0,a0,734 # c06050b0 <_init_data_end+0x10b0>
    c0602dda:	e2ffe0ef          	jal	ra,c0601c08 <printd>
    c0602dde:	fc843703          	ld	a4,-56(s0)
    c0602de2:	6785                	lui	a5,0x1
    c0602de4:	17fd                	addi	a5,a5,-1
    c0602de6:	97ba                	add	a5,a5,a4
    c0602de8:	83b1                	srli	a5,a5,0xc
    c0602dea:	fef43423          	sd	a5,-24(s0)
    c0602dee:	00009797          	auipc	a5,0x9
    c0602df2:	64a78793          	addi	a5,a5,1610 # c060c438 <drv_addr_alloc.0>
    c0602df6:	6398                	ld	a4,0(a5)
    c0602df8:	47b5                	li	a5,13
    c0602dfa:	07f2                	slli	a5,a5,0x1c
    c0602dfc:	97ba                	add	a5,a5,a4
    c0602dfe:	08f00713          	li	a4,143
    c0602e02:	fe843683          	ld	a3,-24(s0)
    c0602e06:	fd043603          	ld	a2,-48(s0)
    c0602e0a:	85be                	mv	a1,a5
    c0602e0c:	4501                	li	a0,0
    c0602e0e:	f01ff0ef          	jal	ra,c0602d0e <map_page>
    c0602e12:	47b5                	li	a5,13
    c0602e14:	07f2                	slli	a5,a5,0x1c
    c0602e16:	fef43023          	sd	a5,-32(s0)
    c0602e1a:	fe843783          	ld	a5,-24(s0)
    c0602e1e:	00c79713          	slli	a4,a5,0xc
    c0602e22:	00009797          	auipc	a5,0x9
    c0602e26:	61678793          	addi	a5,a5,1558 # c060c438 <drv_addr_alloc.0>
    c0602e2a:	639c                	ld	a5,0(a5)
    c0602e2c:	973e                	add	a4,a4,a5
    c0602e2e:	00009797          	auipc	a5,0x9
    c0602e32:	60a78793          	addi	a5,a5,1546 # c060c438 <drv_addr_alloc.0>
    c0602e36:	e398                	sd	a4,0(a5)
    c0602e38:	fe043783          	ld	a5,-32(s0)
    c0602e3c:	853e                	mv	a0,a5
    c0602e3e:	70e2                	ld	ra,56(sp)
    c0602e40:	7442                	ld	s0,48(sp)
    c0602e42:	6121                	addi	sp,sp,64
    c0602e44:	8082                	ret

00000000c0602e46 <alloc_page>:
    c0602e46:	7159                	addi	sp,sp,-112
    c0602e48:	f486                	sd	ra,104(sp)
    c0602e4a:	f0a2                	sd	s0,96(sp)
    c0602e4c:	1880                	addi	s0,sp,112
    c0602e4e:	faa43c23          	sd	a0,-72(s0)
    c0602e52:	fab43823          	sd	a1,-80(s0)
    c0602e56:	fac43423          	sd	a2,-88(s0)
    c0602e5a:	fad43023          	sd	a3,-96(s0)
    c0602e5e:	87ba                	mv	a5,a4
    c0602e60:	f8f40fa3          	sb	a5,-97(s0)
    c0602e64:	fe043023          	sd	zero,-32(s0)
    c0602e68:	fc043823          	sd	zero,-48(s0)
    c0602e6c:	fa843603          	ld	a2,-88(s0)
    c0602e70:	fb043583          	ld	a1,-80(s0)
    c0602e74:	00002517          	auipc	a0,0x2
    c0602e78:	26c50513          	addi	a0,a0,620 # c06050e0 <_init_data_end+0x10e0>
    c0602e7c:	d8dfe0ef          	jal	ra,c0601c08 <printd>
    c0602e80:	a05d                	j	c0602f26 <alloc_page+0xe0>
    c0602e82:	f9f44783          	lbu	a5,-97(s0)
    c0602e86:	853e                	mv	a0,a5
    c0602e88:	bc8ff0ef          	jal	ra,c0602250 <spa_get_pa>
    c0602e8c:	fea43423          	sd	a0,-24(s0)
    c0602e90:	fe043703          	ld	a4,-32(s0)
    c0602e94:	6785                	lui	a5,0x1
    c0602e96:	97ba                	add	a5,a5,a4
    c0602e98:	fe843703          	ld	a4,-24(s0)
    c0602e9c:	02f71563          	bne	a4,a5,c0602ec6 <alloc_page+0x80>
    c0602ea0:	fe843703          	ld	a4,-24(s0)
    c0602ea4:	fe043783          	ld	a5,-32(s0)
    c0602ea8:	8f3d                	xor	a4,a4,a5
    c0602eaa:	ff8007b7          	lui	a5,0xff800
    c0602eae:	8ff9                	and	a5,a5,a4
    c0602eb0:	eb99                	bnez	a5,c0602ec6 <alloc_page+0x80>
    c0602eb2:	fd843783          	ld	a5,-40(s0)
    c0602eb6:	4b9c                	lw	a5,16(a5)
    c0602eb8:	2785                	addiw	a5,a5,1
    c0602eba:	0007871b          	sext.w	a4,a5
    c0602ebe:	fd843783          	ld	a5,-40(s0)
    c0602ec2:	cb98                	sw	a4,16(a5)
    c0602ec4:	a80d                	j	c0602ef6 <alloc_page+0xb0>
    c0602ec6:	4605                	li	a2,1
    c0602ec8:	fb043583          	ld	a1,-80(s0)
    c0602ecc:	fe843503          	ld	a0,-24(s0)
    c0602ed0:	116000ef          	jal	ra,c0602fe6 <insert_inverse_map>
    c0602ed4:	fca43c23          	sd	a0,-40(s0)
    c0602ed8:	fd843783          	ld	a5,-40(s0)
    c0602edc:	eb89                	bnez	a5,c0602eee <alloc_page+0xa8>
    c0602ede:	00002517          	auipc	a0,0x2
    c0602ee2:	22a50513          	addi	a0,a0,554 # c0605108 <_init_data_end+0x1108>
    c0602ee6:	d23fe0ef          	jal	ra,c0601c08 <printd>
    c0602eea:	4781                	li	a5,0
    c0602eec:	a8a9                	j	c0602f46 <alloc_page+0x100>
    c0602eee:	fe843783          	ld	a5,-24(s0)
    c0602ef2:	fcf43823          	sd	a5,-48(s0)
    c0602ef6:	fa043683          	ld	a3,-96(s0)
    c0602efa:	460d                	li	a2,3
    c0602efc:	fe843583          	ld	a1,-24(s0)
    c0602f00:	fb043503          	ld	a0,-80(s0)
    c0602f04:	915ff0ef          	jal	ra,c0602818 <page_directory_insert>
    c0602f08:	fe843783          	ld	a5,-24(s0)
    c0602f0c:	fef43023          	sd	a5,-32(s0)
    c0602f10:	fb043703          	ld	a4,-80(s0)
    c0602f14:	6785                	lui	a5,0x1
    c0602f16:	97ba                	add	a5,a5,a4
    c0602f18:	faf43823          	sd	a5,-80(s0)
    c0602f1c:	fa843783          	ld	a5,-88(s0)
    c0602f20:	17fd                	addi	a5,a5,-1
    c0602f22:	faf43423          	sd	a5,-88(s0)
    c0602f26:	fa843783          	ld	a5,-88(s0)
    c0602f2a:	ffa1                	bnez	a5,c0602e82 <alloc_page+0x3c>
    c0602f2c:	35e000ef          	jal	ra,c060328a <dump_inverse_map>
    c0602f30:	180027f3          	csrr	a5,satp
    c0602f34:	fcf43423          	sd	a5,-56(s0)
    c0602f38:	fc843783          	ld	a5,-56(s0)
    c0602f3c:	c399                	beqz	a5,c0602f42 <alloc_page+0xfc>
    c0602f3e:	9a3ff0ef          	jal	ra,c06028e0 <flush_page_table_cache_and_tlb>
    c0602f42:	fe843783          	ld	a5,-24(s0)
    c0602f46:	853e                	mv	a0,a5
    c0602f48:	70a6                	ld	ra,104(sp)
    c0602f4a:	7406                	ld	s0,96(sp)
    c0602f4c:	6165                	addi	sp,sp,112
    c0602f4e:	8082                	ret

00000000c0602f50 <all_zero>:
    c0602f50:	7179                	addi	sp,sp,-48
    c0602f52:	f406                	sd	ra,40(sp)
    c0602f54:	f022                	sd	s0,32(sp)
    c0602f56:	1800                	addi	s0,sp,48
    c0602f58:	931ff0ef          	jal	ra,c0602888 <get_page_table_root>
    c0602f5c:	87aa                	mv	a5,a0
    c0602f5e:	fef43023          	sd	a5,-32(s0)
    c0602f62:	fe042623          	sw	zero,-20(s0)
    c0602f66:	a095                	j	c0602fca <all_zero+0x7a>
    c0602f68:	fe042423          	sw	zero,-24(s0)
    c0602f6c:	a091                	j	c0602fb0 <all_zero+0x60>
    c0602f6e:	fec42783          	lw	a5,-20(s0)
    c0602f72:	07b2                	slli	a5,a5,0xc
    c0602f74:	fe043703          	ld	a4,-32(s0)
    c0602f78:	973e                	add	a4,a4,a5
    c0602f7a:	fe842783          	lw	a5,-24(s0)
    c0602f7e:	078e                	slli	a5,a5,0x3
    c0602f80:	97ba                	add	a5,a5,a4
    c0602f82:	fcf43c23          	sd	a5,-40(s0)
    c0602f86:	fd843783          	ld	a5,-40(s0)
    c0602f8a:	639c                	ld	a5,0(a5)
    c0602f8c:	cf89                	beqz	a5,c0602fa6 <all_zero+0x56>
    c0602f8e:	fe842703          	lw	a4,-24(s0)
    c0602f92:	fec42783          	lw	a5,-20(s0)
    c0602f96:	863a                	mv	a2,a4
    c0602f98:	85be                	mv	a1,a5
    c0602f9a:	00002517          	auipc	a0,0x2
    c0602f9e:	18e50513          	addi	a0,a0,398 # c0605128 <_init_data_end+0x1128>
    c0602fa2:	c67fe0ef          	jal	ra,c0601c08 <printd>
    c0602fa6:	fe842783          	lw	a5,-24(s0)
    c0602faa:	2785                	addiw	a5,a5,1
    c0602fac:	fef42423          	sw	a5,-24(s0)
    c0602fb0:	fe842783          	lw	a5,-24(s0)
    c0602fb4:	0007871b          	sext.w	a4,a5
    c0602fb8:	1ff00793          	li	a5,511
    c0602fbc:	fae7d9e3          	bge	a5,a4,c0602f6e <all_zero+0x1e>
    c0602fc0:	fec42783          	lw	a5,-20(s0)
    c0602fc4:	2785                	addiw	a5,a5,1
    c0602fc6:	fef42623          	sw	a5,-20(s0)
    c0602fca:	fec42783          	lw	a5,-20(s0)
    c0602fce:	0007871b          	sext.w	a4,a5
    c0602fd2:	03f00793          	li	a5,63
    c0602fd6:	f8e7d9e3          	bge	a5,a4,c0602f68 <all_zero+0x18>
    c0602fda:	0001                	nop
    c0602fdc:	0001                	nop
    c0602fde:	70a2                	ld	ra,40(sp)
    c0602fe0:	7402                	ld	s0,32(sp)
    c0602fe2:	6145                	addi	sp,sp,48
    c0602fe4:	8082                	ret

00000000c0602fe6 <insert_inverse_map>:
    c0602fe6:	7139                	addi	sp,sp,-64
    c0602fe8:	fc06                	sd	ra,56(sp)
    c0602fea:	f822                	sd	s0,48(sp)
    c0602fec:	0080                	addi	s0,sp,64
    c0602fee:	fca43c23          	sd	a0,-40(s0)
    c0602ff2:	fcb43823          	sd	a1,-48(s0)
    c0602ff6:	87b2                	mv	a5,a2
    c0602ff8:	fcf42623          	sw	a5,-52(s0)
    c0602ffc:	fe042623          	sw	zero,-20(s0)
    c0603000:	fcc42783          	lw	a5,-52(s0)
    c0603004:	86be                	mv	a3,a5
    c0603006:	fd043603          	ld	a2,-48(s0)
    c060300a:	fd843583          	ld	a1,-40(s0)
    c060300e:	00002517          	auipc	a0,0x2
    c0603012:	13250513          	addi	a0,a0,306 # c0605140 <_init_data_end+0x1140>
    c0603016:	bf3fe0ef          	jal	ra,c0601c08 <printd>
    c060301a:	a065                	j	c06030c2 <insert_inverse_map+0xdc>
    c060301c:	00003697          	auipc	a3,0x3
    c0603020:	41468693          	addi	a3,a3,1044 # c0606430 <inv_map>
    c0603024:	fec42703          	lw	a4,-20(s0)
    c0603028:	87ba                	mv	a5,a4
    c060302a:	0786                	slli	a5,a5,0x1
    c060302c:	97ba                	add	a5,a5,a4
    c060302e:	078e                	slli	a5,a5,0x3
    c0603030:	97b6                	add	a5,a5,a3
    c0603032:	639c                	ld	a5,0(a5)
    c0603034:	fd843703          	ld	a4,-40(s0)
    c0603038:	08f71063          	bne	a4,a5,c06030b8 <insert_inverse_map+0xd2>
    c060303c:	fcc42783          	lw	a5,-52(s0)
    c0603040:	863e                	mv	a2,a5
    c0603042:	fd043583          	ld	a1,-48(s0)
    c0603046:	00002517          	auipc	a0,0x2
    c060304a:	13250513          	addi	a0,a0,306 # c0605178 <_init_data_end+0x1178>
    c060304e:	bbbfe0ef          	jal	ra,c0601c08 <printd>
    c0603052:	00003697          	auipc	a3,0x3
    c0603056:	3de68693          	addi	a3,a3,990 # c0606430 <inv_map>
    c060305a:	fec42703          	lw	a4,-20(s0)
    c060305e:	87ba                	mv	a5,a4
    c0603060:	0786                	slli	a5,a5,0x1
    c0603062:	97ba                	add	a5,a5,a4
    c0603064:	078e                	slli	a5,a5,0x3
    c0603066:	97b6                	add	a5,a5,a3
    c0603068:	4b98                	lw	a4,16(a5)
    c060306a:	fcc42783          	lw	a5,-52(s0)
    c060306e:	2781                	sext.w	a5,a5
    c0603070:	02e78663          	beq	a5,a4,c060309c <insert_inverse_map+0xb6>
    c0603074:	00003697          	auipc	a3,0x3
    c0603078:	3bc68693          	addi	a3,a3,956 # c0606430 <inv_map>
    c060307c:	fec42703          	lw	a4,-20(s0)
    c0603080:	87ba                	mv	a5,a4
    c0603082:	0786                	slli	a5,a5,0x1
    c0603084:	97ba                	add	a5,a5,a4
    c0603086:	078e                	slli	a5,a5,0x3
    c0603088:	97b6                	add	a5,a5,a3
    c060308a:	4b9c                	lw	a5,16(a5)
    c060308c:	85be                	mv	a1,a5
    c060308e:	00002517          	auipc	a0,0x2
    c0603092:	13a50513          	addi	a0,a0,314 # c06051c8 <_init_data_end+0x11c8>
    c0603096:	b73fe0ef          	jal	ra,c0601c08 <printd>
    c060309a:	a001                	j	c060309a <insert_inverse_map+0xb4>
    c060309c:	00003697          	auipc	a3,0x3
    c06030a0:	39468693          	addi	a3,a3,916 # c0606430 <inv_map>
    c06030a4:	fec42703          	lw	a4,-20(s0)
    c06030a8:	87ba                	mv	a5,a4
    c06030aa:	0786                	slli	a5,a5,0x1
    c06030ac:	97ba                	add	a5,a5,a4
    c06030ae:	078e                	slli	a5,a5,0x3
    c06030b0:	97b6                	add	a5,a5,a3
    c06030b2:	fd043703          	ld	a4,-48(s0)
    c06030b6:	e798                	sd	a4,8(a5)
    c06030b8:	fec42783          	lw	a5,-20(s0)
    c06030bc:	2785                	addiw	a5,a5,1
    c06030be:	fef42623          	sw	a5,-20(s0)
    c06030c2:	00003697          	auipc	a3,0x3
    c06030c6:	36e68693          	addi	a3,a3,878 # c0606430 <inv_map>
    c06030ca:	fec42703          	lw	a4,-20(s0)
    c06030ce:	87ba                	mv	a5,a4
    c06030d0:	0786                	slli	a5,a5,0x1
    c06030d2:	97ba                	add	a5,a5,a4
    c06030d4:	078e                	slli	a5,a5,0x3
    c06030d6:	97b6                	add	a5,a5,a3
    c06030d8:	639c                	ld	a5,0(a5)
    c06030da:	cb89                	beqz	a5,c06030ec <insert_inverse_map+0x106>
    c06030dc:	fec42783          	lw	a5,-20(s0)
    c06030e0:	0007871b          	sext.w	a4,a5
    c06030e4:	3ff00793          	li	a5,1023
    c06030e8:	f2e7dae3          	bge	a5,a4,c060301c <insert_inverse_map+0x36>
    c06030ec:	fec42783          	lw	a5,-20(s0)
    c06030f0:	0007871b          	sext.w	a4,a5
    c06030f4:	40000793          	li	a5,1024
    c06030f8:	00f71a63          	bne	a4,a5,c060310c <insert_inverse_map+0x126>
    c06030fc:	00002517          	auipc	a0,0x2
    c0603100:	11c50513          	addi	a0,a0,284 # c0605218 <_init_data_end+0x1218>
    c0603104:	b05fe0ef          	jal	ra,c0601c08 <printd>
    c0603108:	4781                	li	a5,0
    c060310a:	a8a5                	j	c0603182 <insert_inverse_map+0x19c>
    c060310c:	00003697          	auipc	a3,0x3
    c0603110:	32468693          	addi	a3,a3,804 # c0606430 <inv_map>
    c0603114:	fec42703          	lw	a4,-20(s0)
    c0603118:	87ba                	mv	a5,a4
    c060311a:	0786                	slli	a5,a5,0x1
    c060311c:	97ba                	add	a5,a5,a4
    c060311e:	078e                	slli	a5,a5,0x3
    c0603120:	97b6                	add	a5,a5,a3
    c0603122:	fd843703          	ld	a4,-40(s0)
    c0603126:	e398                	sd	a4,0(a5)
    c0603128:	00003697          	auipc	a3,0x3
    c060312c:	30868693          	addi	a3,a3,776 # c0606430 <inv_map>
    c0603130:	fec42703          	lw	a4,-20(s0)
    c0603134:	87ba                	mv	a5,a4
    c0603136:	0786                	slli	a5,a5,0x1
    c0603138:	97ba                	add	a5,a5,a4
    c060313a:	078e                	slli	a5,a5,0x3
    c060313c:	97b6                	add	a5,a5,a3
    c060313e:	fd043703          	ld	a4,-48(s0)
    c0603142:	e798                	sd	a4,8(a5)
    c0603144:	00003697          	auipc	a3,0x3
    c0603148:	2ec68693          	addi	a3,a3,748 # c0606430 <inv_map>
    c060314c:	fec42703          	lw	a4,-20(s0)
    c0603150:	87ba                	mv	a5,a4
    c0603152:	0786                	slli	a5,a5,0x1
    c0603154:	97ba                	add	a5,a5,a4
    c0603156:	078e                	slli	a5,a5,0x3
    c0603158:	97b6                	add	a5,a5,a3
    c060315a:	fcc42703          	lw	a4,-52(s0)
    c060315e:	cb98                	sw	a4,16(a5)
    c0603160:	00002517          	auipc	a0,0x2
    c0603164:	0e850513          	addi	a0,a0,232 # c0605248 <_init_data_end+0x1248>
    c0603168:	aa1fe0ef          	jal	ra,c0601c08 <printd>
    c060316c:	fec42703          	lw	a4,-20(s0)
    c0603170:	87ba                	mv	a5,a4
    c0603172:	0786                	slli	a5,a5,0x1
    c0603174:	97ba                	add	a5,a5,a4
    c0603176:	078e                	slli	a5,a5,0x3
    c0603178:	00003717          	auipc	a4,0x3
    c060317c:	2b870713          	addi	a4,a4,696 # c0606430 <inv_map>
    c0603180:	97ba                	add	a5,a5,a4
    c0603182:	853e                	mv	a0,a5
    c0603184:	70e2                	ld	ra,56(sp)
    c0603186:	7442                	ld	s0,48(sp)
    c0603188:	6121                	addi	sp,sp,64
    c060318a:	8082                	ret

00000000c060318c <inverse_map_add_count>:
    c060318c:	7179                	addi	sp,sp,-48
    c060318e:	f406                	sd	ra,40(sp)
    c0603190:	f022                	sd	s0,32(sp)
    c0603192:	1800                	addi	s0,sp,48
    c0603194:	fca43c23          	sd	a0,-40(s0)
    c0603198:	fd843783          	ld	a5,-40(s0)
    c060319c:	e799                	bnez	a5,c06031aa <inverse_map_add_count+0x1e>
    c060319e:	00002517          	auipc	a0,0x2
    c06031a2:	0d250513          	addi	a0,a0,210 # c0605270 <_init_data_end+0x1270>
    c06031a6:	a63fe0ef          	jal	ra,c0601c08 <printd>
    c06031aa:	fe042623          	sw	zero,-20(s0)
    c06031ae:	a855                	j	c0603262 <inverse_map_add_count+0xd6>
    c06031b0:	00003697          	auipc	a3,0x3
    c06031b4:	28068693          	addi	a3,a3,640 # c0606430 <inv_map>
    c06031b8:	fec42703          	lw	a4,-20(s0)
    c06031bc:	87ba                	mv	a5,a4
    c06031be:	0786                	slli	a5,a5,0x1
    c06031c0:	97ba                	add	a5,a5,a4
    c06031c2:	078e                	slli	a5,a5,0x3
    c06031c4:	97b6                	add	a5,a5,a3
    c06031c6:	639c                	ld	a5,0(a5)
    c06031c8:	fd843703          	ld	a4,-40(s0)
    c06031cc:	08f71663          	bne	a4,a5,c0603258 <inverse_map_add_count+0xcc>
    c06031d0:	00003697          	auipc	a3,0x3
    c06031d4:	26068693          	addi	a3,a3,608 # c0606430 <inv_map>
    c06031d8:	fec42703          	lw	a4,-20(s0)
    c06031dc:	87ba                	mv	a5,a4
    c06031de:	0786                	slli	a5,a5,0x1
    c06031e0:	97ba                	add	a5,a5,a4
    c06031e2:	078e                	slli	a5,a5,0x3
    c06031e4:	97b6                	add	a5,a5,a3
    c06031e6:	4b9c                	lw	a5,16(a5)
    c06031e8:	2785                	addiw	a5,a5,1
    c06031ea:	0007869b          	sext.w	a3,a5
    c06031ee:	00003617          	auipc	a2,0x3
    c06031f2:	24260613          	addi	a2,a2,578 # c0606430 <inv_map>
    c06031f6:	fec42703          	lw	a4,-20(s0)
    c06031fa:	87ba                	mv	a5,a4
    c06031fc:	0786                	slli	a5,a5,0x1
    c06031fe:	97ba                	add	a5,a5,a4
    c0603200:	078e                	slli	a5,a5,0x3
    c0603202:	97b2                	add	a5,a5,a2
    c0603204:	cb94                	sw	a3,16(a5)
    c0603206:	00003697          	auipc	a3,0x3
    c060320a:	22a68693          	addi	a3,a3,554 # c0606430 <inv_map>
    c060320e:	fec42703          	lw	a4,-20(s0)
    c0603212:	87ba                	mv	a5,a4
    c0603214:	0786                	slli	a5,a5,0x1
    c0603216:	97ba                	add	a5,a5,a4
    c0603218:	078e                	slli	a5,a5,0x3
    c060321a:	97b6                	add	a5,a5,a3
    c060321c:	4b9c                	lw	a5,16(a5)
    c060321e:	873e                	mv	a4,a5
    c0603220:	06400793          	li	a5,100
    c0603224:	02f777bb          	remuw	a5,a4,a5
    c0603228:	2781                	sext.w	a5,a5
    c060322a:	ebb9                	bnez	a5,c0603280 <inverse_map_add_count+0xf4>
    c060322c:	00003697          	auipc	a3,0x3
    c0603230:	20468693          	addi	a3,a3,516 # c0606430 <inv_map>
    c0603234:	fec42703          	lw	a4,-20(s0)
    c0603238:	87ba                	mv	a5,a4
    c060323a:	0786                	slli	a5,a5,0x1
    c060323c:	97ba                	add	a5,a5,a4
    c060323e:	078e                	slli	a5,a5,0x3
    c0603240:	97b6                	add	a5,a5,a3
    c0603242:	4b9c                	lw	a5,16(a5)
    c0603244:	863e                	mv	a2,a5
    c0603246:	fd843583          	ld	a1,-40(s0)
    c060324a:	00002517          	auipc	a0,0x2
    c060324e:	05650513          	addi	a0,a0,86 # c06052a0 <_init_data_end+0x12a0>
    c0603252:	9b7fe0ef          	jal	ra,c0601c08 <printd>
    c0603256:	a02d                	j	c0603280 <inverse_map_add_count+0xf4>
    c0603258:	fec42783          	lw	a5,-20(s0)
    c060325c:	2785                	addiw	a5,a5,1
    c060325e:	fef42623          	sw	a5,-20(s0)
    c0603262:	fec42783          	lw	a5,-20(s0)
    c0603266:	0007871b          	sext.w	a4,a5
    c060326a:	3ff00793          	li	a5,1023
    c060326e:	f4e7d1e3          	bge	a5,a4,c06031b0 <inverse_map_add_count+0x24>
    c0603272:	00002517          	auipc	a0,0x2
    c0603276:	06e50513          	addi	a0,a0,110 # c06052e0 <_init_data_end+0x12e0>
    c060327a:	98ffe0ef          	jal	ra,c0601c08 <printd>
    c060327e:	a011                	j	c0603282 <inverse_map_add_count+0xf6>
    c0603280:	0001                	nop
    c0603282:	70a2                	ld	ra,40(sp)
    c0603284:	7402                	ld	s0,32(sp)
    c0603286:	6145                	addi	sp,sp,48
    c0603288:	8082                	ret

00000000c060328a <dump_inverse_map>:
    c060328a:	1101                	addi	sp,sp,-32
    c060328c:	ec06                	sd	ra,24(sp)
    c060328e:	e822                	sd	s0,16(sp)
    c0603290:	1000                	addi	s0,sp,32
    c0603292:	00002517          	auipc	a0,0x2
    c0603296:	07e50513          	addi	a0,a0,126 # c0605310 <_init_data_end+0x1310>
    c060329a:	96ffe0ef          	jal	ra,c0601c08 <printd>
    c060329e:	fe042623          	sw	zero,-20(s0)
    c06032a2:	a0a5                	j	c060330a <dump_inverse_map+0x80>
    c06032a4:	00003697          	auipc	a3,0x3
    c06032a8:	18c68693          	addi	a3,a3,396 # c0606430 <inv_map>
    c06032ac:	fec42703          	lw	a4,-20(s0)
    c06032b0:	87ba                	mv	a5,a4
    c06032b2:	0786                	slli	a5,a5,0x1
    c06032b4:	97ba                	add	a5,a5,a4
    c06032b6:	078e                	slli	a5,a5,0x3
    c06032b8:	97b6                	add	a5,a5,a3
    c06032ba:	6390                	ld	a2,0(a5)
    c06032bc:	00003697          	auipc	a3,0x3
    c06032c0:	17468693          	addi	a3,a3,372 # c0606430 <inv_map>
    c06032c4:	fec42703          	lw	a4,-20(s0)
    c06032c8:	87ba                	mv	a5,a4
    c06032ca:	0786                	slli	a5,a5,0x1
    c06032cc:	97ba                	add	a5,a5,a4
    c06032ce:	078e                	slli	a5,a5,0x3
    c06032d0:	97b6                	add	a5,a5,a3
    c06032d2:	678c                	ld	a1,8(a5)
    c06032d4:	00003697          	auipc	a3,0x3
    c06032d8:	15c68693          	addi	a3,a3,348 # c0606430 <inv_map>
    c06032dc:	fec42703          	lw	a4,-20(s0)
    c06032e0:	87ba                	mv	a5,a4
    c06032e2:	0786                	slli	a5,a5,0x1
    c06032e4:	97ba                	add	a5,a5,a4
    c06032e6:	078e                	slli	a5,a5,0x3
    c06032e8:	97b6                	add	a5,a5,a3
    c06032ea:	4b98                	lw	a4,16(a5)
    c06032ec:	fec42783          	lw	a5,-20(s0)
    c06032f0:	86ae                	mv	a3,a1
    c06032f2:	85be                	mv	a1,a5
    c06032f4:	00002517          	auipc	a0,0x2
    c06032f8:	05450513          	addi	a0,a0,84 # c0605348 <_init_data_end+0x1348>
    c06032fc:	90dfe0ef          	jal	ra,c0601c08 <printd>
    c0603300:	fec42783          	lw	a5,-20(s0)
    c0603304:	2785                	addiw	a5,a5,1
    c0603306:	fef42623          	sw	a5,-20(s0)
    c060330a:	fec42783          	lw	a5,-20(s0)
    c060330e:	0007871b          	sext.w	a4,a5
    c0603312:	3ff00793          	li	a5,1023
    c0603316:	00e7cf63          	blt	a5,a4,c0603334 <dump_inverse_map+0xaa>
    c060331a:	00003697          	auipc	a3,0x3
    c060331e:	11668693          	addi	a3,a3,278 # c0606430 <inv_map>
    c0603322:	fec42703          	lw	a4,-20(s0)
    c0603326:	87ba                	mv	a5,a4
    c0603328:	0786                	slli	a5,a5,0x1
    c060332a:	97ba                	add	a5,a5,a4
    c060332c:	078e                	slli	a5,a5,0x3
    c060332e:	97b6                	add	a5,a5,a3
    c0603330:	639c                	ld	a5,0(a5)
    c0603332:	fbad                	bnez	a5,c06032a4 <dump_inverse_map+0x1a>
    c0603334:	00002517          	auipc	a0,0x2
    c0603338:	03c50513          	addi	a0,a0,60 # c0605370 <_init_data_end+0x1370>
    c060333c:	8cdfe0ef          	jal	ra,c0601c08 <printd>
    c0603340:	0001                	nop
    c0603342:	60e2                	ld	ra,24(sp)
    c0603344:	6442                	ld	s0,16(sp)
    c0603346:	6105                	addi	sp,sp,32
    c0603348:	8082                	ret
