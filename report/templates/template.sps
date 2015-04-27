<?xml version="1.0" encoding="UTF-8"?>
<structure version="10" xsltversion="1" htmlmode="strict" relativeto="*SPS" encodinghtml="UTF-8" encodingrtf="ISO-8859-1" encodingpdf="UTF-8" useimportschema="1" embed-images="1" ShowDesignMarkups="2">
	<parameters/>
	<schemasources>
		<namespaces/>
		<schemasources>
			<xsdschemasource name="XML" main="1" schemafile="\\SRP1VD1\wwwroot\relatorios\base\sps\replace_me.xsd" workingxmlfile="\\SRP1VD1\wwwroot\relatorios\base\sps\replace_me.xml">
				<xmltablesupport/>
				<textstateicons/>
			</xsdschemasource>
		</schemasources>
	</schemasources>
	<modules/>
	<flags>
		<scripts/>
		<globalparts/>
		<designfragments/>
		<pagelayouts/>
	</flags>
	<scripts>
		<script language="javascript"/>
	</scripts>
	<importedxslt/>
	<globalstyles/>
	<mainparts>
		<children>
			<globaltemplate subtype="main" match="/">
				<children>
					<documentsection>
						<properties columncount="1" columngap="0.50in" headerfooterheight="fixed" pagemultiplepages="0" pagenumberingformat="1" pagenumberingstartat="auto" pagestart="next" paperheight="11in" papermarginbottom="0.79in" papermarginfooter="0.30in" papermarginheader="0.30in" papermarginleft="0.60in" papermarginright="0.60in" papermargintop="0.79in" paperwidth="8.50in"/>
					</documentsection>
					<userxmlelem openingtagtext="link href=&quot;{translate(string(concat($XML/SYSMSG/@UrlBaseDir,&amp;apos;css/relatorios.css&amp;apos;)), &apos;&amp;#x5c;&apos;, &apos;/&apos;)}&quot; rel=&quot;stylesheet&quot; type=&quot;text/css&quot;"/>
					<template subtype="source" match="XML">
						<children>
							<newline/>
							<tgrid>
								<properties border="1" class="Table" width="100%"/>
								<styles border-bottom="dashed 1px gray"/>
								<children>
									<tgridbody-cols>
										<children>
											<tgridcol>
												<styles border="none" width="15%"/>
											</tgridcol>
											<tgridcol>
												<styles border="none" width="70%"/>
											</tgridcol>
											<tgridcol>
												<styles border="none" width="15%"/>
											</tgridcol>
										</children>
									</tgridbody-cols>
									<tgridbody-rows>
										<properties valign="bottom"/>
										<children>
											<tgridrow>
												<styles vertical-align="middle"/>
												<children>
													<tgridcell>
														<styles text-align="center" vertical-align="middle"/>
														<children>
															<image>
																<target>
																	<xpath value="$XML/SYSMSG/@UrlBaseDir"/>
																	<fixtext value="img/logotipo.jpg"/>
																</target>
																<imagesource>
																	<xpath value="$XML/SYSMSG/@UrlBaseDir"/>
																	<fixtext value="img/logotipo.jpg"/>
																</imagesource>
															</image>
														</children>
													</tgridcell>
													<tgridcell>
														<properties valign="middle"/>
														<styles text-align="center" vertical-align="middle"/>
														<children>
															<text fixtext="&lt;REPORT HEADER&gt;"/>
															<newline/>
															<text fixtext="&lt;Report Name&gt;"/>
														</children>
													</tgridcell>
													<tgridcell>
														<properties valign="bottom"/>
														<styles text-align="center" vertical-align="middle"/>
													</tgridcell>
												</children>
											</tgridrow>
										</children>
									</tgridbody-rows>
								</children>
							</tgrid>
							<newline/>
							<text fixtext="content here..."/>
							<newline/>
							<newline/>
						</children>
						<variables/>
					</template>
				</children>
			</globaltemplate>
		</children>
	</mainparts>
	<globalparts/>
	<pagelayout>
		<properties paperheight="11.69in" paperwidth="8.27in"/>
	</pagelayout>
	<designfragments/>
</structure>
