<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <svg width="1600" height="900" xmlns="http://www.w3.org/2000/svg" fill="black" stroke="black" stroke-width="1">
            <rect x="0" y="0" width="1600" height="900" fill="none" stroke="black" stroke-width="2" />


            <xsl:variable name="puntosMujeres">
                <xsl:value-of select="'0,10000 '"/> <!-- Agrega el punto (0, 10000) al principio -->
                <xsl:for-each select="Mortalidad/mortalidad">
                    <xsl:sort data-type="number" case-order="lower-first" select="año"/>
                    <xsl:variable name="posicionX" select="position()"/>
                    <xsl:variable name="muertesMujeres" select="muertesMujeres"/>
                    <xsl:variable name="puntoMujeresX" select="$posicionX*30"/>
                    <xsl:variable name="puntoMujeresY" select="900-$muertesMujeres * 250"/>
                    <xsl:value-of select="concat($puntoMujeresX, ',', $puntoMujeresY, ' ')"/>
                </xsl:for-each>
                <xsl:value-of select="concat(count(Mortalidad/mortalidad)*30, ',10000')"/> <!-- Agrega el punto (20, 10000) al final -->
            </xsl:variable>

            <path d="{concat('M', $puntosMujeres)}" fill="red" stroke="black" stroke-width="2" fill-opacity="0.3"/>


            <xsl:variable name="puntosHombres">
                <xsl:value-of select="'0,10000 '"/> <!-- Agrega el punto (0, 10000) al principio -->
                <xsl:for-each select="Mortalidad/mortalidad">
                    <xsl:sort data-type="number" case-order="lower-first" select="año"/>
                    <xsl:variable name="posicionX" select="position()"/>
                    <xsl:variable name="muertesMujeres" select="muertesMujeres"/>
                    <xsl:variable name="muertesHombres" select="muertesHombres"/>
                    <xsl:variable name="puntoHombresX" select="$posicionX*30"/>
                    <xsl:variable name="puntoHombresY" select="900-$muertesHombres * 250"/>
                    <xsl:value-of select="concat($puntoHombresX, ',', $puntoHombresY, ' ')"/>
                </xsl:for-each>
                <xsl:value-of select="concat(count(Mortalidad/mortalidad)*30, ',10000')"/> <!-- Agrega el punto (20, 10000) al final -->
            </xsl:variable>

            <path d="{concat('M', $puntosHombres)}" fill="blue" stroke="black" stroke-width="2" fill-opacity="0.3"/>



            <xsl:for-each select="Mortalidad/mortalidad">
                <xsl:sort data-type="number" case-order="lower-first" select="año"/>
                <xsl:variable name="posicionX" select="position()"/>
                <xsl:variable name="muertesMujeres" select="muertesMujeres"/>
                <xsl:variable name="muertesHombres" select="muertesHombres"/>
                <xsl:variable name="puntoMujeresX" select="$posicionX*30"/>
                <xsl:variable name="puntoMujeresY" select="900-$muertesMujeres * 250"/>
                <xsl:variable name="puntoHombresX" select="$posicionX*30"/>
                <xsl:variable name="puntoHombresY" select="900-$muertesHombres * 250"/>
                <circle cx="{$puntoMujeresX}" cy="{$puntoMujeresY}" r="10" fill="pink" />
                <circle cx="{$puntoHombresX}" cy="{$puntoHombresY}" r="10" fill="blue" />
            </xsl:for-each>
        </svg>
    </xsl:template>
</xsl:stylesheet>
