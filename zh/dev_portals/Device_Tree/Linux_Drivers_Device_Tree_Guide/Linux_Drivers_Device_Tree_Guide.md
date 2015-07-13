> From: [eLinux.org](http://eLinux.org/Linux_Drivers_Device_Tree_Guide "http://eLinux.org/Linux_Drivers_Device_Tree_Guide")


# Linux Drivers Device Tree Guide





## Contents

-   [1 Support of different hardware versions in a single
    driver](#support-of-different-hardware-versions-in-a-single-driver)
    -   [1.1 Hardware Version in struct
        of\-device\-id.data](#hardware-version-in-struct-of-device-id-data)
    -   [1.2 Function Call Table pointer in struct
        of\-device\-id.data](#function-call-table-pointer-in-struct-of-device-id-data)
    -   [1.3 Hardware Description pointer in struct
        of\-device\-id.data](#hardware-description-pointer-in-struct-of-device-id-data)

## Support of different hardware versions in a single driver

Examples of drivers that match more than one compatible string.

This list is not an endorsement of any particular technique. It is
instead a (partial) list of some existing code in the Linux kernel.

The examples are not meant to capture each method entirely; they are
instead meant to illustrate the basic concept.

### Hardware Version in struct of\_device\_id.data

The hardware version is used throughout the driver to choose alternate
actions.

drivers/iommu/arm-smmu.c:

    static const struct of_device_id arm_smmu_of_match[] = {
            { .compatible = "arm,smmu-v1", .data = (void *)ARM_SMMU_V1 },
            { .compatible = "arm,smmu-v2", .data = (void *)ARM_SMMU_V2 },
            { .compatible = "arm,mmu-400", .data = (void *)ARM_SMMU_V1 },
            { .compatible = "arm,mmu-401", .data = (void *)ARM_SMMU_V1 },
            { .compatible = "arm,mmu-500", .data = (void *)ARM_SMMU_V2 },
            { },
    };
    MODULE_DEVICE_TABLE(of, arm_smmu_of_match);

    static int arm_smmu_device_dt_probe(struct platform_device *pdev)
    {
            const struct of_device_id *of_id;

            of_id = of_match_node(arm_smmu_of_match, dev->of_node);
            smmu->version = (enum arm_smmu_arch_version)of_id->data;

            ...

            if (smmu->version > ARM_SMMU_V1) {
                    ...
            }
    }

    static struct platform_driver arm_smmu_driver = {
           .driver = {
                    .name           = "arm-smmu",
                    .of_match_table = of_match_ptr(arm_smmu_of_match),
            },
            .probe  = arm_smmu_device_dt_probe,
            .remove = arm_smmu_device_remove,
    };

### Function Call Table pointer in struct of\_device\_id.data

The function call table is used throughout the driver to choose
alternate actions.

drivers/iio/adc/xilinx-xadc-core.c:

    static const struct xadc_ops xadc_zynq_ops = {
            .read = xadc_zynq_read_adc_reg,
            .write = xadc_zynq_write_adc_reg,
            .setup = xadc_zynq_setup,
            .get_dclk_rate = xadc_zynq_get_dclk_rate,
            .interrupt_handler = xadc_zynq_interrupt_handler,
            .threaded_interrupt_handler = xadc_zynq_threaded_interrupt_handler,
            .update_alarm = xadc_zynq_update_alarm,
    };

    static const struct of_device_id xadc_of_match_table[] = {
            { .compatible = "xlnx,zynq-xadc-1.00.a", (void *)&xadc_zynq_ops },
            { .compatible = "xlnx,axi-xadc-1.00.a", (void *)&xadc_axi_ops },
            { },
    };
    MODULE_DEVICE_TABLE(of, xadc_of_match_table);

    static int xadc_probe(struct platform_device *pdev)
    {
            const struct of_device_id *id;
            id = of_match_node(xadc_of_match_table, pdev->dev.of_node);
            ...
            indio_dev = devm_iio_device_alloc(&pdev->dev, sizeof(*xadc));
            xadc = iio_priv(indio_dev);
            ...
            xadc->ops = id->data;
            ...
            ret = xadc->ops->setup(pdev, indio_dev, irq);
            ...
    }

    static struct platform_driver xadc_driver = {
            .probe = xadc_probe,
            .remove = xadc_remove,
            .driver = {
                    .name = "xadc",
                    .of_match_table = xadc_of_match_table,
            },
    };
    module_platform_driver(xadc_driver);

### Hardware Description pointer in struct of\_device\_id.data

The hardware description data is used to configure the device.

This struct pointed to by struct of\_device\_id.data in this example
includes a function call table in addition to the hardware description
fields.

drivers/iio/adc/twl6030-gpadc.c:

    static const struct twl6030_gpadc_platform_data twl6030_pdata = {
            .iio_channels = twl6030_gpadc_iio_channels,
            .nchannels = TWL6030_GPADC_USED_CHANNELS,
            .ideal = twl6030_ideal,
            .start_conversion = twl6030_start_conversion,
            .channel_to_reg = twl6030_channel_to_reg,
            .calibrate = twl6030_calibration,
    };

    static const struct of_device_id of_twl6030_match_tbl[] = {
            {
                    .compatible = "ti,twl6030-gpadc",
                    .data = &twl6030_pdata,
            },
            {
                    .compatible = "ti,twl6032-gpadc",
                    .data = &twl6032_pdata,
            },
            { /* end */ }
    };

    static int twl6030_gpadc_probe(struct platform_device *pdev)
    {
            const struct of_device_id *match;
            const struct twl6030_gpadc_platform_data *pdata;

            match = of_match_device(of_twl6030_match_tbl, dev);
            pdata = match->data;
            indio_dev = devm_iio_device_alloc(dev, sizeof(*gpadc));
            gpadc = iio_priv(indio_dev);
            gpadc->pdata = pdata;
            platform_set_drvdata(pdev, indio_dev);
            ...
            ret = pdata->calibrate(gpadc);
            ...
            indio_dev->channels = pdata->iio_channels;
            indio_dev->num_channels = pdata->nchannels;
    }


[Category](http://eLinux.org/Special:Categories "Special:Categories"):

-   [Device
    tree](http://eLinux.org/index.php?title=Category:Device_tree&action=edit&redlink=1 "Category:Device tree (page does not exist)")

