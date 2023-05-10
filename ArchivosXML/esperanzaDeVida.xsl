<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

    <svg xmlns="http://www.w3.org/2000/svg" width="1600" height="900">


        <xsl:for-each select="data/year">
            <xsl:sort data-type="number" case-order="lower-first" select="Ano"/>

        <xsl:variable name="date" select="date"/>
        <xsl:variable name="women" select="women"/>
        <xsl:variable name="men" select="men"/>
        <xsl:variable name="total" select="total"/>
        <xsl:variable name="porcentajeMujeres"><xsl:value-of select="$women div ($women+number($men))*100"/></xsl:variable>
        <xsl:variable name="porcentajeHombres"><xsl:value-of select="$men div ($women+number($men))*100"/></xsl:variable>
        <xsl:variable name="porcentajePrueba">50</xsl:variable>
        <xsl:variable name="escalado">4</xsl:variable>

            <xsl:variable name="X">
                <xsl:choose>
                    <xsl:when test="position() &gt; 5">
                        <xsl:value-of select="320*(position()-6)+160"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="320*(position()-1)+160"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:variable name="año"><xsl:value-of select="1975+(position()-1)*5"/></xsl:variable>
            <xsl:variable name="Y">
                <xsl:choose>
                    <xsl:when test="position() &gt; 5">600</xsl:when>
                    <xsl:otherwise>200</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>



        <!--Crea el circulo de los hombres y debajo el de las mujeres 5 veces porque son lusto-->
        <!--El numero 31.3 es el de escalado, si se hace X4 el numero 31.3 tambien se hara X4-->
        <xsl:variable name="mujeresAño1" select="number(data/year[date=$año]/women)" />
            <xsl:variable name="hombresAño1" select="number(data/year[date=$año]/men)" />
        <circle r="{40*$escalado}" cx="{$X}" cy="{$Y}" fill="#191FF8" stroke="#191FF8" stroke-width="1" />
        <circle r="{5*$escalado}" cx="{$X}" cy="{$Y}" fill="bisque" stroke="#F835DC" stroke-width="{70*$escalado}"
                    stroke-dasharray="{concat('calc(125.2 * ',string($mujeresAño1 div ($mujeresAño1+number($hombresAño1))*100), '/100) 125.2')}" />


            <xsl:variable name="mujeresAño2" select="number(data/year[date=$año+1]/women)" />
            <xsl:variable name="hombresAño2" select="number(data/year[date=$año+1]/men)" />
        <circle r="{35*$escalado}" cx="{$X}" cy="{$Y}" fill="#3C41FA" stroke="#3C41FA" stroke-width="1" />
        <circle r="{5*$escalado}" cx="{$X}" cy="{$Y}" fill="bisque" stroke="#FD5DE6" stroke-width="{60*$escalado}"
                stroke-dasharray="{concat('calc(125.2 * ',string($mujeresAño2 div ($mujeresAño2+number($hombresAño2))*100), '/100) 125.2')}" />

            <xsl:variable name="mujeresAño3" select="number(data/year[date=$año+2]/women)" />
            <xsl:variable name="hombresAño3" select="number(data/year[date=$año+2]/men)" />
        <circle r="{30*$escalado}" cx="{$X}" cy="{$Y}" fill="#5C60F7" stroke="#5C60F7" stroke-width="1" />
        <circle r="{5*$escalado}" cx="{$X}" cy="{$Y}" fill="bisque" stroke="#FE7FEC" stroke-width="{50*$escalado}"
                stroke-dasharray="{concat('calc(125.2 * ',string($mujeresAño3 div ($mujeresAño3+number($hombresAño3))*100), '/100) 125.2')}" />


            <xsl:variable name="mujeresAño4" select="number(data/year[date=$año+3]/women)" />
            <xsl:variable name="hombresAño4" select="number(data/year[date=$año+3]/men)" />
        <circle r="{25*$escalado}" cx="{$X}" cy="{$Y}" fill="#8386FA" stroke="#8386FA" stroke-width="1" />
        <circle r="{5*$escalado}" cx="{$X}" cy="{$Y}" fill="bisque" stroke="#FCA4F0" stroke-width="{40*$escalado}"
                stroke-dasharray="{concat('calc(125.2 * ',string($mujeresAño4 div ($mujeresAño4+number($hombresAño4))*100), '/100) 125.2')}" />

            <xsl:variable name="mujeresAño5" select="number(data/year[date=$año+4]/women)" />
            <xsl:variable name="hombresAño5" select="number(data/year[date=$año+4]/men)" />
        <circle r="{20*$escalado}" cx="{$X}" cy="{$Y}" fill="#A9ABFC" stroke="#A9ABFC" stroke-width="1" />
        <circle r="{5*$escalado}" cx="{$X}" cy="{$Y}" fill="bisque" stroke="#FECAF7" stroke-width="{30*$escalado}"
                stroke-dasharray="{concat('calc(125.2 * ',string($mujeresAño5 div (number($mujeresAño5)+number($hombresAño5))*100), '/100) 125.2')}" />

        <!--Crea el circuloblanco de el medio-->
        <circle r="{15*$escalado}" cx="{$X}" cy="{$Y}" fill="white" stroke="black" stroke-width="1" />
        <!--Añade el Texto de el año-->
            <text x="{$X}" y="{$Y}" font-size="25" text-anchor="middle">
                <xsl:value-of select="string($año)"/>
            </text>

        </xsl:for-each>


    </svg>








</xsl:template>
</xsl:stylesheet>
