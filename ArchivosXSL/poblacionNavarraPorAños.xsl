<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">



            <xsl:variable name="numDatos" select="count(datos)" />
        <svg width="1600" height="900" xmlns="http://www.w3.org/2000/svg" fill="black" stroke="black" stroke-width="1">
            <xsl:for-each select="datos/dato">
                <xsl:sort data-type="number" case-order="lower-first" select="Ano"/>

                <xsl:variable name="Ano" select="Ano"/>
                <xsl:variable name="Mujeres" select="Mujeres"/>
                <xsl:variable name="Hombres" select="Hombres"/>
                <xsl:variable name="Densidad" select="Densidad"/>
                <xsl:variable name="Media" select="($Mujeres + $Hombres) div 2" />

                <rect x="{position()*30}" y="{900 - (($Mujeres - 230000) div 120)}"
                      width="10" height="{($Mujeres - 230000) div 120}"
                      fill="blue" stroke="black" stroke-width="2" opacity="0.8"
                      rx="5" ry="5" />

                <rect x="{position()*30+10}" y="{900 - (($Hombres - 230000) div 120)}"
                      width="10" height="{($Hombres - 230000)div 120}"
                      fill="green" stroke="black" stroke-width="2" opacity="0.8"
                      rx="5" ry="5" />


                <rect x="{position()*30}" y="{900 - (($Media - 230000) div 120)}"
                      width="20" height="{($Media - 230000)div 120}"
                       stroke="black" stroke-width="2"  opacity="1" fill-opacity="0"
                      rx="5" ry="5" />



            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>
